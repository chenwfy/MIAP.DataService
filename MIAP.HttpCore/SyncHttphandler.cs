using System;
using System.Web;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 定义 HTTP 异步处理程序对象必须实现的协定。
    /// </summary>
    public class SyncHttphandler : IHttpAsyncHandler
    {
        /// <summary>
        /// 启动对 HTTP 处理程序的异步调用。
        /// </summary>
        /// <param name="httpContext">一个 System.Web.HttpContext 对象，该对象提供对用于向 HTTP 请求提供服务的内部服务器对象（如 Request、Response、Session 和 Server）的引用。</param>
        /// <param name="callback">异步方法调用完成时要调用的 System.AsyncCallback。如果 cb 为 null，则不调用委托。</param>
        /// <param name="extraData">处理该请求所需的所有额外数据。</param>
        /// <returns>包含有关进程状态信息的 System.IAsyncResult。</returns>
        public IAsyncResult BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, object extraData)
        {
            IContext context = httpContext.Items[Constants.ContextKey] as IContext;
            if (context != null && context is SyncContext)
            {
                SyncContext syncContext = context as SyncContext;

                PushPipe pipe = new PushPipe(httpContext, callback, syncContext);
                pipe.SetPipe(syncContext.UserId);
                //
                syncContext.Execute(syncContext);
                //
                return pipe;
            }
            httpContext.Response.Close();
            return null;
        }

        /// <summary>
        /// 进程结束时提供异步处理 End 方法。
        /// </summary>
        /// <param name="result">包含有关进程状态信息的 System.IAsyncResult。</param>
        public void EndProcessRequest(IAsyncResult result)
        {
            PushPipe pipe = result as PushPipe;
            if (pipe != null && pipe.Context != null)
            {
                pipe.Context.Flush(pipe.Data);
            }
        }

        /// <summary>
        /// 处理请求
        /// </summary>
        /// <param name="httpContext"></param>
        public void ProcessRequest(HttpContext httpContext)
        {
        }

        /// <summary>
        /// 获取一个值，该值指示其他请求是否可以使用 System.Web.IHttpHandler 实例。
        /// </summary>
        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}
