using System.Web;
using CSharpLib.Common;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 异步数据请求应答处理（同步链路）类
    /// </summary>
    public class SyncContext : ServiceContext
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="context"></param>
        public SyncContext(HttpContext context)
            : base(context)
        { 
        }

        /// <summary>
        /// 开始处理请求
        /// </summary>
        public override void BeginExecute()
        {
            "[SyncService - BeginProcess] Command : {0} -- UserId: {1} -- DeviceId: {2} -- Channel: {3}".Info(Command, UserId, DeviceId, ReqChannel);
            Context.RewritePath(Constants.SyncContextRedirectUrl);
        }

        /// <summary>
        /// 处理请求
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(IContext context)
        {
            IExecute<SyncContext> instance = string.Format(Constants.CmdProviderName, Command).CreateInstance<IExecute<SyncContext>>();
            if (null != instance)
                instance.Execute(context as SyncContext);
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
            "[SyncService - EndProcess] Command : {0} -- UserId: {1} -- DeviceId: {2} -- Channel: {3}   [{4}] {5}ms".Info(Command, UserId, DeviceId, ReqChannel, status, watchTime);
        }
    }
}