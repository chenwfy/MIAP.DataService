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
    /// 帖子点“赞”命令请求执行类
    /// </summary>
    public class FavouredTopic : ExecuteBase<DataContext>
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
                cmdData.Debug("=== Bbs.FavouredTopic 上行数据 ===");
                topicId.Debug("=== Bbs.FavouredTopic 上行数据 ===");
            }

            int userId = context.UserId;
            TopicInfo topicInfo = BbsBiz.GetTopicInfoById(topicId);
            if (null == topicInfo)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (topicInfo.UserId == userId)
            {
                context.Flush(RespondCode.ShowError, "不能给自己点赞！");
                return;
            }

            if (BbsBiz.UserFavouredTopic(userId, topicId))
            {
                context.Flush(RespondCode.ShowError, "请勿重复点赞！");
                return;
            }

            BbsBiz.FavouredTopic(userId, topicId);
            context.Flush();
        }
    }
}