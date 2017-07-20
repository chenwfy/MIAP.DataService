using System;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Collections.Generic;
using MIAP.Entities;
using MIAP.Entities.Bbs;
using MIAP.Entities.User;
using MIAP.Protobuf.Bbs;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;
using MIAP.Utility;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 帖子信息转换
    /// </summary>
    internal static class TopicInfoConvert
    {
        /// <summary>
        /// 从 TopicInfo 提取 TopicBasic
        /// </summary>
        /// <param name="topicInfo"></param>
        /// <returns></returns>
        internal static TopicBasic ToTopicBasic(this TopicInfo topicInfo)
        {
            TopicBasic topic = new TopicBasic
            {
                Id = topicInfo.TopicId,
                Title = topicInfo.Title,
                Icon = topicInfo.Icon.ImageUrlFixed(100, 100),
                Owner = UserBiz.ReadUserCacheInfo(topicInfo.UserId).ToUserBase(),
                IsRefined = topicInfo.IsRefined,
                TopicType = topicInfo.Reward > 0 ? TopicType.Reward : (topicInfo.IsQuestion ? TopicType.Questions : TopicType.Normal),
                RewardCount = topicInfo.Reward,
                HasBestAnswer = topicInfo.BestAnswerId > 0,
                FavouredCount = topicInfo.FavouredCount,
                RepliedCount = topicInfo.RepliedCount,
                PublishTime = topicInfo.CreateDate.ToString("yyyy-MM-dd HH:mm:ss"),
                //Voice = new VoiceContent { },
                Intro = topicInfo.Intro,
                IsAllowReply = topicInfo.IsAllowReply
            };
            
            if (!string.IsNullOrEmpty(topicInfo.Voice) && topicInfo.Voice.StartsWith("<Voice "))
            {
                VoiceContent voiceContent = null;
                try
                {
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(topicInfo.Voice.Trim());
                    XmlNode node = xmlDoc.SelectSingleNode("Voice");
                    voiceContent = node.GetVoiceContent();
                }
                catch (Exception ex)
                {
                    ex.Error();
                    voiceContent = null;
                }
                finally
                {
                    topic.Voice = voiceContent;
                }
            }

            return topic;
        }

        /// <summary>
        /// 从 TopicInfo 提取 TopicDetail
        /// </summary>
        /// <param name="topicInfo"></param>
        /// <param name="userId">当前用户编号，用于判断当前用户是否为帖子的发布者</param>
        /// <returns></returns>
        internal static TopicDetail ToTopicDetail(this TopicInfo topicInfo, int userId)
        {
            TopicDetail topic = new TopicDetail
            {
                Id = topicInfo.TopicId,
                Title = topicInfo.Title,
                Owner = UserBiz.ReadUserCacheInfo(topicInfo.UserId).ToUserBase(),
                IsRefined = topicInfo.IsRefined,
                TopicType = topicInfo.Reward > 0 ? TopicType.Reward : (topicInfo.IsQuestion ? TopicType.Questions : TopicType.Normal),
                RewardCount = topicInfo.Reward,
                HasBestAnswer = topicInfo.BestAnswerId > 0,
                FavouredCount = topicInfo.FavouredCount,
                RepliedCount = topicInfo.RepliedCount,
                PublishTime = topicInfo.CreateDate.ToString("yyyy-MM-dd HH:mm:ss"),
                AttachContent = topicInfo.AttachContent,
                AttrChangedMark = topicInfo.AttrChangedMark,
                ExpChanged = topicInfo.ExpChanged,
                VirtualCoinChanged = topicInfo.VirtualCoinChanged,
                IFavoured = true,
                BestReply = null,
                Content = topicInfo.Content.GetTopicContentList(),
                IsAllowReply = topicInfo.IsAllowReply
            };

            if (userId != topicInfo.UserId)
            {
                topic.IFavoured = BbsBiz.UserFavouredTopic(userId, topicInfo.TopicId);
            }

            if (topic.HasBestAnswer)
            {
                PostInfo post = BbsBiz.GetPostInfoById(topicInfo.BestAnswerId);
                if (null != post)
                    topic.BestReply = post.ToReplyDetail(userId);
            }

            return topic;
        }

        /// <summary>
        /// 从PageResult&lt;TopicInfo&gt;提取TopicList
        /// </summary>
        /// <param name="pageTopic"></param>
        /// <returns></returns>
        internal static TopicList ToTopicList(this PageResult<TopicInfo> pageTopic)
        {
            return new TopicList
            {
                RecordCount = pageTopic.RecordCount,
                IndexCount = pageTopic.PageCount,
                QueryIndex = pageTopic.PageIndex,
                QuerySize = pageTopic.PageSize,
                DataList = pageTopic.Data.Select(t => t.ToTopicBasic()).ToList()
            };
        }

        /// <summary>
        /// 从 PostInfo 中提取 ReplyDetail
        /// </summary>
        /// <param name="postInfo"></param>
        /// <param name="userId">当前用户编号，用于判断当前用户是否为帖子的发布者</param>
        /// <returns></returns>
        internal static ReplyDetail ToReplyDetail(this PostInfo postInfo, int userId)
        {
            ReplyDetail reply = new ReplyDetail
            {
                Id = postInfo.PostId,
                Owner = UserBiz.ReadUserCacheInfo(postInfo.UserId).ToUserBase(),
                Content = postInfo.Content.GetTopicContentList(),
                IsBestAnswer = postInfo.IsBestReply,
                FavouredCount = postInfo.FavouredCount,
                PublishTime = postInfo.CreateDate.ToString("yyyy-MM-dd HH:mm:ss"),
                ExpChanged = postInfo.ExpChanged,
                VirtualCoinChanged = postInfo.VirtualCoinChanged,
                IFavoured = true,
                SetBestDate = "",
                TargetUser = null
            };

            if (userId != postInfo.UserId)
            {
                reply.IFavoured = BbsBiz.UserFavouredPost(userId, postInfo.PostId);
            }

            if (postInfo.IsBestReply)
            {
                reply.SetBestDate = postInfo.SetBestDate.ToString("yyyy-MM-dd HH:mm:ss");
            }

            /*
            if (postInfo.ReplyForUserId > 0)
            {
                reply.TargetUser = UserBiz.ReadUserCacheInfo(postInfo.ReplyForUserId).ToUserBase();
            }
            */

            return reply;
        }

        /// <summary>
        /// 从PageResult&lt;PostInfo&gt;提取ReplyList
        /// </summary>
        /// <param name="pagePost"></param>
        /// <param name="userId">当前用户编号，用于判断当前用户是否为帖子的发布者</param>
        /// <returns></returns>
        internal static ReplyList ToReplyList(this PageResult<PostInfo> pagePost, int userId)
        {
            return new ReplyList
            {
                RecordCount = pagePost.RecordCount,
                IndexCount = pagePost.PageCount,
                QueryIndex = pagePost.PageIndex,
                QuerySize = pagePost.PageSize,
                DataList = pagePost.Data.Select(p => p.ToReplyDetail(userId)).ToList()
            };
        }

        /// <summary>
        /// 获取帖子内容块列表
        /// </summary>
        /// <param name="sourceTopicContent"></param>
        /// <returns></returns>
        private static List<TopicContent> GetTopicContentList(this string sourceTopicContent)
        {
            List<TopicContent> contentList = new List<TopicContent>(0);
            if (!string.IsNullOrEmpty(sourceTopicContent) && sourceTopicContent.StartsWith("<TopicContent>") && sourceTopicContent.EndsWith("</TopicContent>"))
            {
                try
                {
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(sourceTopicContent.Trim());
                    XmlNode rootNode = xmlDoc.SelectSingleNode("TopicContent");
                    if (null != rootNode && rootNode.HasChildNodes)
                    {
                        foreach (XmlNode node in rootNode.ChildNodes)
                        {
                            if (node.NodeType == XmlNodeType.Element)
                            {
                                //ContentType ct = (ContentType)Enum.Parse(typeof(ContentType), node.Name, true);
                                ContentType ct = GetTopicContentType(node.Name);
                                byte[] data = null;
                                switch (ct)
                                {
                                    case ContentType.Image:
                                        ImageContent imageContent = node.GetImageContent();
                                        if (null != imageContent)
                                            data = imageContent.ProtoBufSerialize<ImageContent>();
                                        break;
                                    case ContentType.Voice:
                                        VoiceContent voiceContent = node.GetVoiceContent();
                                        if (null != voiceContent)
                                            data = voiceContent.ProtoBufSerialize<VoiceContent>();
                                        break;
                                    case ContentType.Video:
                                        VideoContent videoContent = node.GetVideoContent();
                                        if (null != videoContent)
                                            data = videoContent.ProtoBufSerialize<VideoContent>();
                                        break;
                                    case ContentType.Address:
                                        AddressContent addressContent = node.GetAddressContent();
                                        if (null != addressContent)
                                            data = addressContent.ProtoBufSerialize<AddressContent>();
                                        break;
                                    case ContentType.Telphone:
                                        TelphoneContent telphoneContent = node.GetTelphoneContent();
                                        if (null != telphoneContent)
                                            data = telphoneContent.ProtoBufSerialize<TelphoneContent>();
                                        break;
                                    case ContentType.Contact:
                                        ContactContent contactContent = node.GetContactContent();
                                        if (null != contactContent)
                                            data = contactContent.ProtoBufSerialize<ContactContent>();
                                        break;
                                    case ContentType.Text:
                                    default:
                                        TextContent textContent = node.GetTextContent();
                                        if (null != textContent)
                                            data = textContent.ProtoBufSerialize<TextContent>();
                                        break;
                                }

                                TopicContent content = new TopicContent { ContentType = ct, Data = data };
                                contentList.Add(content);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ex.Error();
                }
            }
            return contentList;
        }

        /// <summary>
        /// 帖子内容块数据类型枚举字典
        /// </summary>
        private static readonly Dictionary<string, ContentType> ctDict = new Dictionary<string, ContentType>(7)
        {
            { "Text", ContentType.Text },
            { "Image", ContentType.Image },
            { "Voice", ContentType.Voice },
            { "Video", ContentType.Video },
            { "Address", ContentType.Address },
            { "Telphone", ContentType.Telphone },
            { "Contact", ContentType.Contact }
        };

        /// <summary>
        /// 获取内容块数据类型
        /// </summary>
        /// <param name="nodeName"></param>
        /// <returns></returns>
        private static ContentType GetTopicContentType(this string nodeName)
        {
            if (ctDict.ContainsKey(nodeName))
                return ctDict[nodeName];
            return ContentType.Text;
        }

        /// <summary>
        /// 提取文字内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static TextContent GetTextContent(this XmlNode node)
        {
            return new TextContent { Text = node.InnerText };
        }

        /// <summary>
        /// 提取图片内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static ImageContent GetImageContent(this XmlNode node)
        {
            string nw = node.Attributes["Width"] == null ? "0" : node.Attributes["Width"].Value;
            string nh = node.Attributes["Height"] == null ? "0" : node.Attributes["Height"].Value;
            int width = 0, height = 0;
            int.TryParse(nw, out width);
            int.TryParse(nh, out height);

            ImageContent content = new ImageContent
            {
                ThumbUrl = node.Attributes["ThumbUrl"] == null ? string.Empty : node.Attributes["ThumbUrl"].Value,
                ImageUrl = node.Attributes["ImageUrl"] == null ? string.Empty : node.Attributes["ImageUrl"].Value,
                Width = width,
                Height = height
            };

            if (!string.IsNullOrEmpty(content.ThumbUrl))
                content.ThumbUrl = content.ThumbUrl.ImageUrlFixed(100, 100);
            if (!string.IsNullOrEmpty(content.ImageUrl))
            {
                if (width == 0 || height == 0)
                {
                    Tuple<int, int> imageSize = content.ImageUrl.GetImageSize();
                    if (imageSize.Item1 > 0 && imageSize.Item2 > 0)
                    {
                        width = imageSize.Item1;
                        height = imageSize.Item2;                    
                    }
                }

                if (width > 480)
                {
                    height = (int)((double)height * (double)((double)width / (double)480));
                    width = 480;
                }

                content.ImageUrl = content.ImageUrl.ImageUrlFixed((uint)width, (uint)height);
                content.Width = width;
                content.Height = height;
            }

            return content;
        }

        /// <summary>
        /// 提取声音内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static VoiceContent GetVoiceContent(this XmlNode node)
        {
            string time = node.Attributes["Duration"] == null ? "0" : node.Attributes["Duration"].Value;
            int duration = 0;
            int.TryParse(time, out duration);

            return new VoiceContent
            {
                Url = node.Attributes["Url"] == null ? string.Empty : node.Attributes["Url"].Value,
                Duration = duration
            };
        }

        /// <summary>
        /// 提取视频内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static VideoContent GetVideoContent(this XmlNode node)
        {
            string nw = node.Attributes["Width"] == null ? "0" : node.Attributes["Width"].Value;
            string nh = node.Attributes["Height"] == null ? "0" : node.Attributes["Height"].Value;
            string time = node.Attributes["Duration"] == null ? "0" : node.Attributes["Duration"].Value;
            int width = 0, height = 0, duration = 0;
            int.TryParse(nw, out width);
            int.TryParse(nh, out height);
            int.TryParse(time, out duration);

            VideoContent content = new VideoContent
            {
                Url = node.Attributes["Url"] == null ? string.Empty : node.Attributes["Url"].Value,
                Duration = duration,
                ThumbUrl = node.Attributes["ThumbUrl"] == null ? string.Empty : node.Attributes["ThumbUrl"].Value,
                Width = width,
                Height = height
            };

            if (!string.IsNullOrEmpty(content.Url))
                content.Url = content.Url.ImageUrlFixed();

            if (!string.IsNullOrEmpty(content.ThumbUrl))
                content.ThumbUrl = content.ThumbUrl.ImageUrlFixed();

            return content;
        }

        /// <summary>
        /// 提取地址内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static AddressContent GetAddressContent(this XmlNode node)
        {
            string lng = node.Attributes["Longitude"] == null ? "0" : node.Attributes["Longitude"].Value;
            string lat = node.Attributes["Latitudes"] == null ? "0" : node.Attributes["Latitudes"].Value;
            double longitude = 0, latitudes = 0;
            double.TryParse(lng, out longitude);
            double.TryParse(lat, out latitudes);

            return new AddressContent
            {
                ShowText = node.InnerText.Trim(),
                Address = node.Attributes["Address"] == null ? string.Empty : node.Attributes["Address"].Value,
                Longitude = longitude,
                Latitudes = latitudes
            };
        }

        /// <summary>
        /// 提取电话号码内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static TelphoneContent GetTelphoneContent(this XmlNode node)
        {
            return new TelphoneContent
            {
                ShowText = node.InnerText.Trim(),
                TelNumber = node.Attributes["TelNumber"] == null ? string.Empty : node.Attributes["TelNumber"].Value
            };
        }

        /// <summary>
        /// 提取联系人内容
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static ContactContent GetContactContent(this XmlNode node)
        {
            ContactContent content = new ContactContent { ShowText = node.InnerText.Trim() };
            string user = node.Attributes["User"] == null ? "0" : node.Attributes["User"].Value;
            int userId = 0;
            if (int.TryParse(user, out userId) && userId > 0)
            {
                UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
                if (userCache != null)
                    content.UserData = userCache.ToUserBase();
            }
            return content;
        }
    }
}