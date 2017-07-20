using System;
using System.Web;
using CSharpLib.Common;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 同步数据请求应答处理（数据链路）类
    /// </summary>
    public class DataContext : ServiceContext
    {
        /// <summary>
        /// 
        /// </summary>
        private IExecute<DataContext> instance;

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="context"></param>
        public DataContext(HttpContext context)
            : base(context)
        {
        }

        #region override

        /// <summary>
        /// 开始处理请求
        /// </summary>
        public override void BeginExecute()
        {
            "[DataService - BeginProcess] Command : {0} -- UserId: {1} -- DeviceId: {2} -- Channel: {3}".Info(Command, UserId, DeviceId, ReqChannel);
            Context.RewritePath(Constants.DataContextRedirectUrl);
        }

        /// <summary>
        /// 处理请求
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(IContext context)
        {
            instance = string.Format(Constants.CmdProviderName, Command).CreateInstance<IExecute<DataContext>>();
            if (null != instance)
                instance.Execute(context as DataContext);
            else
                Flush(RespondCode.CmdInvalid);
        }

        /// <summary>
        /// 请求处理结束
        /// </summary>
        /// <param name="context"></param>
        /// <param name="status"></param>
        /// <param name="watchTime"></param>
        public override void EndExecute(IContext context, string status, long watchTime)
        {
            "[DataService - EndProcess] Command : {0} -- UserId: {1} -- DeviceId: {2} -- Channel: {3}   [{4}] {5}ms".Info(Command, UserId, DeviceId, ReqChannel, status, watchTime);
            if (null != instance)
                instance.CreateCmdLogs(context as DataContext);
        }

        #endregion
    }
}