using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.Bbs;
using MIAP.Protobuf.Bbs;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 用户查询贴吧版块新帖数量列表命令请求执行类
    /// </summary>
    public class QueryForumNewTopicCount : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            ForumNewTopicCountList topicCountList = new ForumNewTopicCountList { ForumIdList = new List<int>(0), NewTopicCountList = new List<int>(0) };
            
            List<ForumTopicCount> forumsUpdated = BbsBiz.GetForumsNewTopicCountList(context.UserId, context.DeviceId).ToList();
            foreach (var item in forumsUpdated)
            {
                if (item.TopicCount > 0)
                {
                    topicCountList.ForumIdList.Add(item.ForumId);
                    topicCountList.NewTopicCountList.Add(item.TopicCount);
                }
            }

            if (topicCountList.ForumIdList.Count > 0)
                context.Flush<ForumNewTopicCountList>(topicCountList);
            else
                context.Flush();
        }
    }
}