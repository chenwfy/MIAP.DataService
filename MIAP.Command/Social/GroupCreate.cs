using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Social;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Social;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 创建群组命令请求执行类
    /// </summary>
    public class GroupCreate : ExecuteBase<DataContext>
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

            GroupForm form = cmdData.ProtoBufDeserialize<GroupForm>();
            if (Compiled.Debug)
                form.Debug("=== Social.GroupMembers 上行数据===");

            string groupName = form.GroupName ?? "未命名圈子";
            string interest = string.Empty;
            if (form.Interest != null)
                interest = form.Interest.ToString();
            byte[] iconData = null;
            string iconExt = ".jpg";
            if (null != form.GroupIcon)
            {
                iconData = form.GroupIcon.Data;
                iconExt = form.GroupIcon.Name ?? ".jpg";
            }

            GroupInfo groupInfo = SocialBiz.CreateGroup(context.UserId, groupName, interest, iconData, iconExt);
            if (null != groupInfo)
                context.Flush<GroupBase>(groupInfo.ToGroupBase());
            else
                context.Flush(RespondCode.ExecError);
        }
    }
}