using System;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.Social;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 退出群组命令请求执行类
    /// </summary>
    public class GroupQuit : ExecuteBase<DataContext>
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

            int groupId = BitConverter.ToInt32(cmdData.Reverse(), 0);
            if (Compiled.Debug)
                groupId.Debug("=== Social.GroupQuit 上行数据===");

            SocialBiz.QuitFromGroup(context.UserId, groupId);
            context.Flush();
        }
    }
}