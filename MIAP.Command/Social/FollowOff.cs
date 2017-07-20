using System;
using MIAP.HttpCore;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 取消“关注”命令请求执行类
    /// </summary>
    public class FollowOff : ExecuteBase<DataContext>
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

            int targetUserId = BitConverter.ToInt32(cmdData.Reverse(), 0);
            if (Compiled.Debug)
            {
                targetUserId.Debug("=== Social.FollowOff 上行数据===");
                cmdData.Debug("=== Social.FollowOff 上行数据===");
            }

            if (targetUserId == context.UserId)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            SocialBiz.RemoveFollowedByTargetUser(context.UserId, targetUserId);
            context.Flush();
        }
    }
}