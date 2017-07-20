using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Protobuf.Social;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 获取群组成员列表命令请求执行类
    /// </summary>
    public class GroupMembers : ExecuteBase<DataContext>
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

            ContactsQuery query = cmdData.ProtoBufDeserialize<ContactsQuery>();
            if (Compiled.Debug)
                query.Debug("=== Social.GroupMembers 上行数据===");

            PageResult<UserCacheInfo> pageResult = SocialBiz.GetGroupMembers(query.TargetId, query.QueryIndex, query.QuerySize);
            ContactsList result = new ContactsList
            {
                RecordCount = pageResult.RecordCount,
                QueryIndex = pageResult.PageIndex,
                QuerySize = pageResult.PageSize,
                IndexCount = pageResult.PageCount,
                DataList = pageResult.Data.Select(u => u.ToUserBase()).ToList()
            };

            context.Flush<ContactsList>(result);
        }
    }
}