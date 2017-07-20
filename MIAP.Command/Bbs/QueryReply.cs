using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Bbs;
using MIAP.Protobuf.Bbs;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 查询帖子跟帖列表命令请求执行类
    /// </summary>
    public class QueryReply : ExecuteBase<DataContext>
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

            ReplyQuery query = cmdData.ProtoBufDeserialize<ReplyQuery>();
            if (Compiled.Debug)
                query.Debug("=== Bbs.QueryReply 上行数据 ===");

            int topicId = query.TopicId;
            PageResult<PostInfo> pageResult = BbsBiz.GetPageReplyList(topicId, query.QueryIndex, query.QuerySize);
            context.Flush<ReplyList>(pageResult.ToReplyList(context.UserId));
        }
    }
}