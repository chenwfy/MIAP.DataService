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
    /// 论坛版块帖子列表查询命令请求执行类
    /// </summary>
    public class QueryTopic : ExecuteBase<DataContext>
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
                query.Debug("=== Bbs.QueryTopic 上行数据 ===");

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            TopicQueryConditions condition = new TopicQueryConditions(userCache.UserSite, query, 1);
            PageResult<TopicInfo> pageResult = BbsBiz.GetPageTopicList(condition, query.QueryIndex, query.QuerySize);
            
            //TopicList topicList = pageResult.ToTopicList();
            context.Flush<TopicList>(pageResult.ToTopicList());
        }
    }
}