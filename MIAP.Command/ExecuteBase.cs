using System;
using MIAP.Entities.Logs;
using MIAP.Configuration;
using MIAP.HttpCore;
using MIAP.Business;

namespace MIAP.Command
{
    /// <summary>
    /// 命令执行基类
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class ExecuteBase<T> : IExecute<T> where T : IContext
    {
        /// <summary>
        /// 命令执行方法
        /// </summary>
        /// <param name="context"></param>
        public virtual void Execute(T context)
        {
        }

        /// <summary>
        /// 记录命令请求日志
        /// </summary>
        /// <param name="context">应用请求上下文应答实例</param>
        public virtual void CreateCmdLogs(T context)
        {
            //写入日志记录
            if (CmdConfigs.CreateCmdQueryLogs() && context is ServiceContext)
            {
                ServiceContext sc = context as ServiceContext;
                CmdQueryLog log = new CmdQueryLog
                {
                    UserId = sc.UserId,
                    Command = sc.Command,
                    AppChannel = sc.ReqChannel,
                    Comment = sc.HasError ? "异常" : "正常",
                    CreateDate = DateTime.Now
                };
                LogsBiz.CreateLogs<CmdQueryLog>(log);
            }
        }
    }
}