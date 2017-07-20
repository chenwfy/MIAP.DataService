using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Social;
using MIAP.Entities;
using MIAP.Entities.Social;
using MIAP.Entities.User;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 获取“我关注的”用户列表命令请求执行类
    /// </summary>
    public class QueryFollowed : ExecuteBase<DataContext>
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
                query.Debug("=== Social.QueryFollowed 上行数据===");

            int userId = query.TargetId == 0 ? context.UserId : query.TargetId;
            PageResult<UserFollowed> pageResult = SocialBiz.GetUserFollowedPageData(userId, query.QueryIndex, query.QuerySize);
            ContactsList result = new ContactsList
            {
                RecordCount = pageResult.RecordCount,
                QueryIndex = pageResult.PageIndex,
                QuerySize = pageResult.PageSize,
                IndexCount = pageResult.PageCount,
                DataList = pageResult.Data.Select(f => UserBiz.ReadUserCacheInfo(f.FollowedUserId).ToUserBase()).ToList()
            };

            context.Flush<ContactsList>(result);
        }
    }
}