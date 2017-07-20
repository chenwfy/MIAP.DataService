using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Social;
using MIAP.Entities;
using MIAP.Entities.Social;
using MIAP.Entities.User;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 查找群组命令请求执行类
    /// </summary>
    public class GroupFind : ExecuteBase<DataContext>
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

            GroupQuery query = cmdData.ProtoBufDeserialize<GroupQuery>();
            if (Compiled.Debug)
                query.Debug("=== Social.GroupFind 上行数据===");

            string keyword = query.Keyword ?? string.Empty;
            string interest = null == query.Interest ? string.Empty : query.Interest.ToString();

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            PageResult<int> pageResult = SocialBiz.GroupFind(keyword, interest, query.OnlyLessMax, context.UserId, userCache.UserSite, query.QueryIndex, query.QuerySize);
            GroupList result = new GroupList
            {
                RecordCount = pageResult.RecordCount,
                QueryIndex = pageResult.PageIndex,
                QuerySize = pageResult.PageSize,
                IndexCount = pageResult.PageCount,
                DataList = pageResult.Data.Select(id => SocialBiz.ReadGroupCacheInfo(id).ToGroupBase()).ToList()
            };

            context.Flush<GroupList>(result);
        }
    }
}