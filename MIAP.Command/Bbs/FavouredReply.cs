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
    /// 跟帖点赞命令请求执行类
    /// </summary>
    public class FavouredReply : ExecuteBase<DataContext>
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

            int postId = BitConverter.ToInt32(cmdData.Reverse(), 0);
            if (Compiled.Debug)
            {
                cmdData.Debug("=== Bbs.FavouredReply 上行数据 ===");
                postId.Debug("=== Bbs.FavouredReply 上行数据 ===");
            }

            int userId = context.UserId;
            PostInfo postInfo = BbsBiz.GetPostInfoById(postId);
            if (null == postInfo)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (postInfo.UserId == userId)
            {
                context.Flush(RespondCode.ShowError, "不能给自己点赞！");
                return;
            }

            if (BbsBiz.UserFavouredPost(userId, postId))
            {
                context.Flush(RespondCode.ShowError, "请勿重复点赞！");
                return;
            }

            BbsBiz.FavouredPost(userId, postId);
            context.Flush();
        }
    }
}