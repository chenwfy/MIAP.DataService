using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Entities.Bbs;
using MIAP.DataProvider;
using MIAP.Configuration;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 论坛模块命令请求业务逻辑处理类
    /// </summary>
    public sealed class BbsBiz
    {
        #region 版块

        /// <summary>
        /// 获取指定的论坛版块详情
        /// </summary>
        /// <param name="forumId"></param>
        /// <param name="schoolId"></param>
        /// <returns></returns>
        public static ForumInfo GetForumInfoById(int forumId, int schoolId)
        {
            return BbsData.GetForumInfoById(forumId, schoolId);
        }

        /// <summary>
        /// 获取更新的论坛版块信息列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="deviceId"></param>
        /// <returns></returns>
        public static IEnumerable<ForumInfo> GetUpdatedForumsList(int userId, int deviceId)
        {
            int schoolId = UserBiz.ReadUserCacheInfo(userId).UserSite;
            return BbsData.GetUpdatedForumsList(userId, deviceId, schoolId);
        }

        /// <summary>
        /// 获取论坛版块新帖数量列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="deviceId"></param>
        /// <returns></returns>
        public static IEnumerable<ForumTopicCount> GetForumsNewTopicCountList(int userId, int deviceId)
        {
            int schoolId = UserBiz.ReadUserCacheInfo(userId).UserSite;
            return BbsData.GetForumsNewTopicCountList(userId, deviceId, schoolId);
        }

        #endregion

        #region 帖子

        /// <summary>
        /// 创建帖子
        /// </summary>
        /// <param name="topic"></param>
        public static void CreateTopic(TopicFullInfo topic)
        {
            BbsConfig config = BbsConfigs.GetBbsConfigCache();
            topic.Status = config.TopicIsAudited ? 1 : 0;
            BbsData.CreateTopic(topic);

            //发布成功，并且为即时显示的（如果默认未审核，则以下操作需要在管理后台进行第一次通过审核操作时执行）
            if (topic.TopicId > 0 && topic.Status == 1)
            {
                if (config.CreateTopicExpChanged != 0)
                    UserBiz.UpdateUserExp(topic.UserId, config.CreateTopicExpChanged, "发布帖子");

                if (config.CreateTopicCoinChanged != 0)
                    UserBiz.UpdateUserCoin(topic.UserId, config.CreateTopicCoinChanged, "发布帖子");

                //发布悬赏帖，先扣除发布人悬赏的虚拟币额度
                if (topic.Reward > 0)
                    UserBiz.UpdateUserCoin(topic.UserId, -topic.Reward, "发布悬赏帖扣除");

                UserBiz.SetUserCacheInfo(topic.UserId);
            }
        }

        /// <summary>
        /// 更新帖子内容等
        /// </summary>
        /// <param name="topic"></param>
        public static void UpdateTopicContent(TopicFullInfo topic)
        {
            BbsData.UpdateTopicContent(topic);
        }

        /// <summary>
        /// 查询符合指定条件的帖子信息分页列表
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<TopicInfo> GetPageTopicList(TopicQueryConditions condition, int pageIndex, int pageSize)
        {
            PageResult<TopicInfo> pageResult = new PageResult<TopicInfo>
            {
                RecordCount = BbsData.GetTopicCount(condition),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageResult.Data = BbsData.GetTopicInfoList(condition, pageResult.PageIndex, pageResult.PageSize);
            return pageResult;
        }

        /// <summary>
        /// 获取指定用户回复过的帖子信息分页列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<TopicInfo> GetUserRepliedTopicPageList(int userId, int pageIndex, int pageSize)
        {
            PageResult<TopicInfo> pageResult = new PageResult<TopicInfo>
            {
                RecordCount = BbsData.GetUserRepliedTopicCount(userId),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageResult.Data = BbsData.GetUserRepliedTopicList(userId, pageResult.PageIndex, pageResult.PageSize);
            return pageResult;
        }

        /// <summary>
        /// 获取指定的帖子详情
        /// </summary>
        /// <param name="topicId"></param>
        /// <param name="updateTopic">是否同步更新帖子浏览次数和未读跟帖信息</param>
        /// <returns></returns>
        public static TopicInfo GetTopicInfoById(int topicId, bool updateTopic = false)
        {
            //TopicInfo topicInfo = BbsData.GetTopicInfoById(topicId);
            //if (null != topicInfo)
            //{
            //    BbsData.UpdateTopicViewCount(topicId);
            //}
            return BbsData.GetTopicInfoById(topicId, updateTopic);
        }

        /// <summary>
        /// 指定用户对指定的帖子是否已点赞
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="topicId"></param>
        /// <returns></returns>
        public static bool UserFavouredTopic(int userId, int topicId)
        {
            return BbsData.UserFavouredCount(userId, topicId, 1) > 0;
        }

        /// <summary>
        /// 用户对帖子点赞
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="topicId"></param>
        public static void FavouredTopic(int userId, int topicId)
        {
            BbsData.CreateUserFavoured(userId, topicId, 1);
        }

        #endregion

        #region 跟帖

        /// <summary>
        /// 创建跟帖信息
        /// </summary>
        /// <param name="postInfo"></param>
        public static void CreateReply(PostFullInfo postInfo)
        {
            BbsConfig config = BbsConfigs.GetBbsConfigCache();
            postInfo.Status = config.PostIsAudited ? 1 : 0;
            BbsData.CreateReply(postInfo);

            //发布成功，并且为即时显示的（如果默认未审核，则以下操作需要在管理后台进行第一次通过审核操作时执行）
            if (postInfo.PostId > 0 && postInfo.Status == 1)
            {
                if (config.CreatePostExpChanged != 0)
                    UserBiz.UpdateUserExp(postInfo.UserId, config.CreatePostExpChanged, "发布跟帖");

                if (config.CreatePostCoinChanged != 0)
                    UserBiz.UpdateUserCoin(postInfo.UserId, config.CreatePostCoinChanged, "发布跟帖");

                UserBiz.SetUserCacheInfo(postInfo.UserId);

                //如果被回复的目标用户关注了跟帖发布人，并且接收提醒消息，此处应该PUSH消息给被回复的目标用户
                if (postInfo.UserId != postInfo.ReplyForUserId && postInfo.ReplyForUserId > 0)
                {
                    UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(postInfo.ReplyForUserId);
                    if (userCache.RemindTopicBeReply && SocialBiz.AlreadyBeFollowed(postInfo.ReplyForUserId, postInfo.UserId))
                    {
                        //Todo  postInfo.ReplyForUserId
                    }
                }
            }
        }

        /// <summary>
        /// 更新跟帖内容
        /// </summary>
        /// <param name="postInfo"></param>
        public static void UpdatePostContent(PostFullInfo postInfo)
        {
            BbsData.UpdatePostContent(postInfo);
        }

        /// <summary>
        /// 获取指定的跟帖信息
        /// </summary>
        /// <param name="postId"></param>
        /// <returns></returns>
        public static PostInfo GetPostInfoById(int postId)
        {
            return BbsData.GetPostInfoById(postId);
        }

        /// <summary>
        /// 指定用户对指定的回复是否已点赞
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="postId"></param>
        /// <returns></returns>
        public static bool UserFavouredPost(int userId, int postId)
        {
            return BbsData.UserFavouredCount(userId, postId, 2) > 0;
        }

        /// <summary>
        /// 获取指定帖子的跟帖信息分页列表
        /// </summary>
        /// <param name="topicId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<PostInfo> GetPageReplyList(int topicId, int pageIndex, int pageSize)
        {
            PageResult<PostInfo> result = new PageResult<PostInfo>
            {
                RecordCount = BbsData.GetTopicReplyCount(topicId),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            result.Data = BbsData.GetTopicReplyList(topicId, result.PageIndex, result.PageSize);
            return result;
        }

        /// <summary>
        /// 设置指定帖子的最佳回复
        /// </summary>
        /// <param name="topic"></param>
        /// <param name="reply"></param>
        public static void SetTopicBestReply(TopicInfo topic, PostInfo reply)
        {
            topic.BestAnswerId = reply.PostId;

            BbsConfig config = BbsConfigs.GetBbsConfigCache();
            reply.IsBestReply = true;
            reply.SetBestDate = DateTime.Now;
            reply.ExpChanged = config.PostBeBestAnswerExpChanged;
            reply.VirtualCoinChanged = topic.Reward > 0 ? topic.Reward : config.PostBeBestAnswerCoinChanged;

            //更新帖子和回复
            BbsData.SetTopicBestReply(topic, reply);

            if (reply.ExpChanged != 0)
                UserBiz.UpdateUserExp(reply.UserId, reply.ExpChanged, "跟帖被设定为最佳回复");

            if (reply.VirtualCoinChanged != 0)
                UserBiz.UpdateUserCoin(reply.UserId, reply.VirtualCoinChanged, "跟帖被设定为最佳回复");

            UserBiz.SetUserCacheInfo(reply.UserId);
        }

        /// <summary>
        /// 用户对跟帖点赞
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="postId"></param>
        public static void FavouredPost(int userId, int postId)
        {
            BbsData.CreateUserFavoured(userId, postId, 1);
        }

        #endregion
    }
}