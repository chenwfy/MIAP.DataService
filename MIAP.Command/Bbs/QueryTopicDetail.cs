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
    /// 查询帖子详情命令请求执行类
    /// </summary>
    public class QueryTopicDetail : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length != 4)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            int topicId = BitConverter.ToInt32(cmdData.Reverse(), 0);
            if (Compiled.Debug)
            {
                cmdData.Debug("=== Bbs.QueryTopicDetail 上行数据 ===");
                topicId.Debug("=== Bbs.QueryTopicDetail 上行数据 ===");
            }

            TopicInfo topicInfo = BbsBiz.GetTopicInfoById(topicId, true);
            if (null != topicInfo)
                context.Flush<TopicDetail>(topicInfo.ToTopicDetail(context.UserId));
            else
                context.Flush(RespondCode.DataInvalid);
        }
    }
}