using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Bbs;
using MIAP.Entities.User;
using MIAP.Protobuf.Bbs;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;
using MIAP.Cache;
using MIAP.Utility;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 发布帖子跟帖命令请求执行类
    /// </summary>
    public class ReplyCreate : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 0)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            ReplyForm replyForm = cmdData.ProtoBufDeserialize<ReplyForm>();
            if (Compiled.Debug)
                replyForm.Debug("=== Bbs.ReplyCreate 上行数据 ===");

            CreateReply(replyForm, context);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="replyForm"></param>
        /// <param name="context"></param>
        private static void CreateReply(ReplyForm replyForm, DataContext context)
        {
            int userId = context.UserId;
            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
            int schoolId = userCache.UserSite;

            #region 基本校验

            TopicInfo topicInfo = BbsBiz.GetTopicInfoById(replyForm.TopicId);
            if (null == topicInfo)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (!topicInfo.IsAllowReply)
            {
                context.Flush(RespondCode.ShowError, "该帖子不允许回复！");
                return;
            }

            //是否带有声音、图片文件
            bool hasVoice = replyForm.Voices != null && replyForm.Voices.Count > 0;
            bool hasImage = replyForm.Image != null && replyForm.Image.Count > 0;
            bool hasMediaFiles = hasVoice || hasImage;

            //敏感关键词
            List<string> filters = FilterHelper.GetSensitiveWords().ToList();

            //内容
            string content = (replyForm.Content ?? string.Empty).Trim();
            if (!string.IsNullOrEmpty(content))
            {
                if (filters.Count > 0)
                    content = content.ReplaceSensitiveWord(filters);

                if (!hasMediaFiles)
                    content = string.Format("<TopicContent><Text>{0}</Text></TopicContent>", content);
            }

            #endregion

            #region 数据组装

            DateTime dtNow = DateTime.Now;
            PostFullInfo postInfo = new PostFullInfo
            {
                TopicId = replyForm.TopicId,
                ForumId = topicInfo.ForumId,
                SchoolId = schoolId,
                UserId = userId,
                Content = content,
                FavouredCount = 0,
                ReplyForUserId = replyForm.TargetId,
                IsBestReply = false,
                SetBestDate = dtNow,
                ExpChanged = 0,
                VirtualCoinChanged = 0,
                Status = 0,
                Remark = "",
                CreateDate = dtNow,
                ManageMark = "",
                LastManageDate = dtNow
            };

            #endregion

            //创建跟帖
            BbsBiz.CreateReply(postInfo);
            if (postInfo.PostId > 0)
            {
                #region 处理声音、图片等文件，并更新帖子内容

                if (hasMediaFiles)
                {
                    List<string> voiceNodeList = new List<string>(0);
                    string extName, url;
                    if (hasVoice)
                    {
                        int voiceTime;
                        foreach (MediaDetail voice in replyForm.Voices)
                        {
                            if (voice.Data != null && voice.Data.Length > 0)
                            {
                                extName = (voice.Name ?? ".mp3").Trim().ToLower();
                                voiceTime = 0;
                                int.TryParse(voice.Attr ?? "0", out voiceTime);

                                url = voice.Data.SaveMediaFile(FileTarget.Post, postInfo.PostId, Utility.MediaType.Audio, extName);
                                if (!string.IsNullOrEmpty(url))
                                    voiceNodeList.Add(string.Format("<Voice Url=\"{0}\" Duration=\"{1}\"></Voice>", url, voiceTime));
                            }
                        }
                    }

                    List<string> imageNodeList = new List<string>(0);
                    if (hasImage)
                    {
                        foreach (MediaDetail image in replyForm.Image)
                        {
                            if (image.Data != null && image.Data.Length > 0)
                            {
                                extName = (image.Name ?? ".jpg").Trim().ToLower();
                                url = image.Data.SaveMediaFile(FileTarget.Post, postInfo.PostId, Utility.MediaType.Image, extName);
                                if (!string.IsNullOrEmpty(url))
                                {
                                    Tuple<int, int> imageSize = url.GetImageSize();
                                    int w = imageSize.Item1, h = imageSize.Item2;
                                    if (w > 0 && h > 0)
                                    {
                                        if (w > 480)
                                        {
                                            h = (int)((double)h * (double)((double)w / (double)480));
                                            w = 480;
                                        }

                                        imageNodeList.Add(string.Format("<Image ThumbUrl=\"{0}\" ImageUrl=\"{1}\" Width=\"{2}\" Height=\"{3}\"></Image>", url, url, w, h));
                                    }
                                }
                            }
                        }
                    }

                    string voiceContent = string.Empty;
                    if (voiceNodeList.Count > 0)
                        voiceContent = string.Join(string.Empty, voiceNodeList);

                    string textContent = string.Empty;
                    if (!string.IsNullOrEmpty(content))
                        textContent = string.Format("<Text>{0}</Text>", content);

                    string imageContent = string.Empty;
                    if (imageNodeList.Count > 0)
                        imageContent = string.Join(string.Empty, imageNodeList);

                    postInfo.Content = string.Format("<TopicContent>{0}{1}{2}</TopicContent>", voiceContent, textContent, imageContent);                    

                    //更新帖子内容
                    BbsBiz.UpdatePostContent(postInfo);
                }

                #endregion

                context.Flush(BitConverter.GetBytes(postInfo.PostId).Reverse());
            }
            else
                context.Flush(RespondCode.ExecError);
        }
    }
}