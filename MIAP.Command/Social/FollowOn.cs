using System;
using MIAP.HttpCore;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// “关注”目标用户命令请求执行类
    /// </summary>
    public class FollowOn : ExecuteBase<DataContext>
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
                targetUserId.Debug("=== Social.FollowOn 上行数据===");
                cmdData.Debug("=== Social.FollowOn 上行数据===");
            }

            if (targetUserId == context.UserId)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            SocialBiz.FollowedTargetUser(context.UserId, targetUserId);
            context.Flush();
        }
    }
}