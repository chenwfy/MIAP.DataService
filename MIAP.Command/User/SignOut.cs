using System;
using MIAP.HttpCore;
using MIAP.Cache;

namespace MIAP.Command.User
{
    /// <summary>
    /// 退出登录命请求令执行类
    /// </summary>
    public class SignOut : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            context.SessionId.RemoveSession();
            context.Flush();
        }
    }
}