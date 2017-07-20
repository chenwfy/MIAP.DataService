using System;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Protobuf.Common;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 当前用户是否已“关注”目标用户命令请求执行类
    /// </summary>
    public class Followed : ExecuteBase<DataContext>
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
                targetUserId.Debug("=== Social.Followed 上行数据===");
                cmdData.Debug("=== Social.Followed 上行数据===");
            }

            if (targetUserId == context.UserId)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            bool beFollowed = SocialBiz.AlreadyBeFollowed(context.UserId, targetUserId);
            context.Flush<BoolSingle>(new BoolSingle { Data = beFollowed });
        }
    }
}