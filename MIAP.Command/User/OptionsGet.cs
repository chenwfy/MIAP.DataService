using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 获取用户应用设置命令请求执行类
    /// </summary>
    public class OptionsGet : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            context.Flush<AppOptions>(userCache.ToAppOptions());
        }
    }
}