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
    /// 发布帖子命令请求执行类
    /// </summary>
    public class TopicCreate : ExecuteBase<DataContext>
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

            TopicForm topicForm = cmdData.ProtoBufDeserialize<TopicForm>();
            if (Compiled.Debug)
                topicForm.Debug("=== Bbs.TopicCreate 上行数据 ===");

            CreateTopic(topicForm, context);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="topicForm"></param>
        /// <param name="context"></param>
        private static void CreateTopic(TopicForm topicForm, DataContext context)
        {
            int userId = context.UserId;
            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
            int schoolId = userCache.UserSite;
            UserRole userRole = (UserRole)userCache.UserRole;

            #region 基本校验

            ForumInfo forumInfo = BbsBiz.GetForumInfoById(topicForm.ForumId, schoolId);
            if (null == forumInfo)
            {
                context.Flush(RespondCode.ShowError, "版块不存在！");
                return;
            }

            Forum forum = forumInfo.ToForum();
            if (forum.PostRole == PostRole.Forbidden)
            {
                context.Flush(RespondCode.ShowError, "版块不允许发帖！");
                return;
            }

            if (forum.PostRole == PostRole.NotStudent && userRole != UserRole.Teacher && userRole != UserRole.CustomerService)
            {
                context.Flush(RespondCode.ShowError, "版块没有发帖权限！");
                return;
            }

            if ((forum.AllowTopicType & topicForm.TopicType) != topicForm.TopicType)
            {
                context.Flush(RespondCode.ShowError, "发帖类型不被允许！");
                return;
            }

            //悬赏
            int reward = 0;
            if (topicForm.TopicType == TopicType.Reward && topicForm.RewardCount > 0)
            {
                if (userCache.VirtualCoinCount < reward)
                    reward = userCache.VirtualCoinCount;
            }                

            //是否带有声音、图片文件
            bool hasVoice = topicForm.Voices != null && topicForm.Voices.Count > 0;
            bool hasImage = topicForm.Image != null && topicForm.Image.Count > 0;
            bool hasMediaFiles = hasVoice || hasImage;

            //敏感关键词
            List<string> filters = FilterHelper.GetSensitiveWords().ToList();

            //标题
            string title = (topicForm.Title ?? string.Empty).Trim();
            if (string.IsNullOrEmpty(title))
            {
                title = "无题";
            }
            else
            {
                if (filters.Count > 0)
                    title = title.ReplaceSensitiveWord(filters);
            }

            //内容
            string content = (topicForm.Content ?? string.Empty).Trim();
            string intro = "";
            if (!string.IsNullOrEmpty(content))
            {
                if (filters.Count > 0)
                    content = content.ReplaceSensitiveWord(filters);

                intro = content.Length > 200 ? (content.Substring(0, 200) + "...") : content;

                if (!hasMediaFiles)
                    content = string.Format("<TopicContent><Text>{0}</Text></TopicContent>", content);
            }

            #endregion

            #region 数据组装

            DateTime dtNow = DateTime.Now;
            TopicFullInfo topicInfo = new TopicFullInfo
            {
                ForumId = topicForm.ForumId,
                SchoolId = schoolId,
                UserId = userId,
                AttachContent = (topicForm.AttachContent ?? string.Empty).Trim(),
                Title = title,
                Content = content,
                Intro = intro,
                Icon = "",
                Voice = "",
                Remark = "",
                Reward = reward,
                IsQuestion = topicForm.TopicType == TopicType.Questions,
                IsAllowReply = true,
                IsStick = false,
                IsRefined = false,
                AttrChangedMark = "",
                ExpChanged = 0,
                VirtualCoinChanged = 0,
                BestAnswerId = 0,
                FavouredCount = 0,
                RepliedCount = 0,
                RepliedUserIds = "",
                LastRepliedDate = dtNow,
                ViewCount = 0,
                FavoritedCount = 0,
                Status = 0,
                CreateDate = dtNow,
                ManageMark = "",
                LastManageDate = dtNow
            };         

            #endregion

            //创建帖子
            BbsBiz.CreateTopic(topicInfo);
            if (topicInfo.TopicId > 0)
            {
                #region 处理声音、图片等文件，并更新帖子内容

                if (hasMediaFiles)
                { 
                    List<string> voiceNodeList = new List<string>(0);
                    string extName, url;
                    if (hasVoice)
                    {
                        int voiceTime;
                        foreach (MediaDetail voice in topicForm.Voices)
                        {
                            if (voice.Data != null && voice.Data.Length > 0)
                            {
                                extName = (voice.Name ?? ".mp3").Trim().ToLower();
                                voiceTime = 0;
                                int.TryParse(voice.Attr ?? "0", out voiceTime);

                                url = voice.Data.SaveMediaFile(FileTarget.Topic, topicInfo.TopicId, Utility.MediaType.Audio, extName);
                                if (!string.IsNullOrEmpty(url))
                                    voiceNodeList.Add(string.Format("<Voice Url=\"{0}\" Duration=\"{1}\"></Voice>", url, voiceTime));
                            }
                        }
                    }

                    List<string> imageNodeList = new List<string>(0);
                    List<string> imageUrlList = new List<string>(0);
                    if (hasImage)
                    {
                        foreach (MediaDetail image in topicForm.Image)
                        {
                            if (image.Data != null && image.Data.Length > 0)
                            {
                                extName = (image.Name ?? ".jpg").Trim().ToLower();
                                url = image.Data.SaveMediaFile(FileTarget.Topic, topicInfo.TopicId, Utility.MediaType.Image, extName);
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

                                        imageUrlList.Add(url);
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
                    if (imageNodeList.Count >0)
                        imageContent = string.Join(string.Empty, imageNodeList);

                    topicInfo.Content = string.Format("<TopicContent>{0}{1}{2}</TopicContent>", voiceContent, textContent, imageContent);
                    if (voiceNodeList.Count > 0)
                        topicInfo.Voice = voiceNodeList[0];
                    if (imageUrlList.Count > 0)
                        topicInfo.Icon = imageUrlList[0];

                    //更新帖子内容
                    BbsBiz.UpdateTopicContent(topicInfo);
                }

                #endregion

                context.Flush(BitConverter.GetBytes(topicInfo.TopicId).Reverse());
            }
            else
                context.Flush(RespondCode.ExecError);
        }
    }
}