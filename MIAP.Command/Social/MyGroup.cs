using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Protobuf.Social;
using CSharpLib.Common;

namespace MIAP.Command.Social
{
    /// <summary>
    /// 获取“我的”群组命令执行类
    /// </summary>
    public class MyGroup : ExecuteBase<DataContext>
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
                query.Debug("=== Social.MyGroup 上行数据===");

            PageResult<int> pageResult = SocialBiz.GetGroupsByUser(context.UserId, query.QueryIndex, query.QuerySize);
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