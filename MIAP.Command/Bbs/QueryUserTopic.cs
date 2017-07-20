using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Bbs;
using MIAP.Entities.User;
using MIAP.Protobuf.Bbs;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 查看指定用户的帖子列表命令请求执行类
    /// </summary>
    public class QueryUserTopic : ExecuteBase<DataContext>
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

            TopicQuery query = cmdData.ProtoBufDeserialize<TopicQuery>();
            if (Compiled.Debug)
                query.Debug("=== Bbs.QueryUserTopic 上行数据 ===");

            if (query.OwnerId == 0 || query.OwnerId == context.UserId)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }
            query.AttachContent = string.Empty;
            query.ForumId = 0;
            query.HasBestAnswer = true;
            query.Keyword = string.Empty;
            query.OrderType = OrderType.Default;

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            TopicQueryConditions condition = new TopicQueryConditions(userCache.UserSite, query, 1);
            PageResult<TopicInfo> pageResult = BbsBiz.GetPageTopicList(condition, query.QueryIndex, query.QuerySize);

            //TopicList topicList = pageResult.ToTopicList();
            context.Flush<TopicList>(pageResult.ToTopicList());
        }
    }
}