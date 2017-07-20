using System;
using MIAP.HttpCore;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 用户加入群组命令请求执行类
    /// </summary>
    public class GroupJoin : ExecuteBase<DataContext>
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
                groupId.Debug("=== Social.GroupJoin 上行数据===");

            int resultCode = SocialBiz.UserJoinToGroup(context.UserId, groupId);
            if (-2 == resultCode)
                context.Flush(RespondCode.ShowError, "圈子不存在！");
            else if (-1 == resultCode || 0 == resultCode)
                context.Flush(RespondCode.ShowError, "圈子成员已满！");
            else
                context.Flush();
        }
    }
}