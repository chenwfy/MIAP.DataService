using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Entities.Logs;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 获取用户扩展信息命令请求执行类
    /// </summary>
    public class QueryUserExt : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            int userId = context.UserId;
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 4)
                userId = BitConverter.ToInt32(cmdData.Reverse(), 0);

            if (Compiled.Debug)
            {
                cmdData.Debug("=== User.QueryUserExt 上行数据===");
                userId.Debug("=== User.QueryUserExt 上行数据===");
            }

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
            if (null != userCache)
            {
                if (userId != context.UserId)
                {
                    UserPagePvLog log = new UserPagePvLog { UserId = userId, VisitorId = context.UserId, CreateDate = DateTime.Now };
                    LogsBiz.CreateLogs<UserPagePvLog>(log);
                }

                context.Flush<UserExt>(userCache.ToUserExt());
            }                
            else
                context.Flush(RespondCode.DataInvalid);
        }
    }
}