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
    /// 设置最佳回复命令请求执行类
    /// </summary>
    public class SetBestReply : ExecuteBase<DataContext>
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

            BestReplyForm form = cmdData.ProtoBufDeserialize<BestReplyForm>();
            if (Compiled.Debug)
                form.Debug("=== Bbs.SetBestReply 上行数据 ===");

            int userId = context.UserId;
            int topicId = form.TopicId;
            int replyId = form.ReplyId;
            TopicInfo topicInfo = BbsBiz.GetTopicInfoById(topicId);
            PostInfo postInfo = BbsBiz.GetPostInfoById(replyId);

            if (topicInfo == null || postInfo == null)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (postInfo.TopicId != topicId)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (!topicInfo.IsQuestion && topicInfo.Reward == 0)
            {
                context.Flush(RespondCode.ShowError, "该帖子不能设置最佳回复！");
                return;
            }

            //能设置最佳回复的，帖子一定是当前用户自己发，而被设置的跟帖一定不是当前用户发的。
            if (topicInfo.UserId != userId || postInfo.UserId == userId)
            {
                context.Flush(RespondCode.ShowError, "只能在自己发布的帖子中将非自己发布的跟帖设置为最佳回复！");
                return;
            }

            if (topicInfo.BestAnswerId > 0)
            {
                context.Flush(RespondCode.ShowError, "该帖子已有最佳回复！");
                return;
            }

            BbsBiz.SetTopicBestReply(topicInfo, postInfo);
            context.Flush();
        }
    }
}