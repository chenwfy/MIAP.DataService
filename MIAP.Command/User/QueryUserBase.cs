using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 获取用户基本信息命令请求执行类
    /// </summary>
    public class QueryUserBase : ExecuteBase<DataContext>
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
                cmdData.Debug("=== User.QueryUserBase 上行数据===");
                userId.Debug("=== User.QueryUserBase 上行数据===");
            }                

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
            if (null != userCache)
                context.Flush<UserBase>(userCache.ToUserBase());
            else
                context.Flush(RespondCode.DataInvalid);            
        }
    }
}