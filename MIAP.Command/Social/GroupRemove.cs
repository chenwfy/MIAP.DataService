using System;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.Social;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 群组创建者解散群组命令请求执行类
    /// </summary>
    public class GroupRemove : ExecuteBase<DataContext>
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
                groupId.Debug("=== Social.GroupRemove 上行数据===");

            GroupInfo groupInfo = SocialBiz.ReadGroupCacheInfo(groupId);
            if (null != groupInfo && groupInfo.CreatorId != context.UserId)
            {
                context.Flush(RespondCode.ShowError, "你不是圈子的创建者！");
                return;
            }

            SocialBiz.QuitFromGroup(context.UserId, groupId);
            context.Flush();
        }
    }
}