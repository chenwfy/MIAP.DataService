using System;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Protobuf.Common;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 快速加入群组命令执行类
    /// </summary>
    public class GroupQuickJoin : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 4)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            StringSingle stringSingle = cmdData.ProtoBufDeserialize<StringSingle>();
            if (Compiled.Debug)
                stringSingle.Debug("=== Social.GroupQuickJoin 上行数据===");

            string quickJoinCode = stringSingle.Data ?? string.Empty;
            if (string.IsNullOrEmpty(quickJoinCode))
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            int resultCode = SocialBiz.UserJoinToGroup(context.UserId, 0, quickJoinCode);
            if (-2 == resultCode)
                context.Flush(RespondCode.ShowError, "圈子不存在！");
            else if (-1 == resultCode || 0 == resultCode)
                context.Flush(RespondCode.ShowError, "圈子成员已满！");
            else
                context.Flush();
        }
    }
}