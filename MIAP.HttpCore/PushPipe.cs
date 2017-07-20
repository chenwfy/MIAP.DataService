using System;
using System.Web;
using System.Threading;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 自定义表示异步操作的状态
    /// </summary>
    public class PushPipe : IAsyncResult
    {
        #region 实现IAsyncResult接口

        /// <summary>
        /// 获取用户定义的对象，它限定或包含关于异步操作的信息。
        /// </summary>
        public object AsyncState { get; private set; }

        /// <summary>
        /// 获取用于等待异步操作完成的 System.Threading.WaitHandle。
        /// </summary>
        public WaitHandle AsyncWaitHandle { get; private set; }

        /// <summary>
        /// 获取一个值，该值指示异步操作是否同步完成。
        /// </summary>
        public bool CompletedSynchronously { get; private set; }

        /// <summary>
        /// 获取一个值，该值指示异步操作是否已完成。
        /// </summary>
        public bool IsCompleted { get; private set; }

        #endregion

        /// <summary>
        /// 引用在相应异步操作完成时调用的方法。
        /// </summary>
        public AsyncCallback Callback { get; private set; }

        /// <summary>
        /// 当前HTTP请求实例
        /// </summary>
        public HttpContext HttpContext { get; private set; }

        /// <summary>
        /// 附加数据
        /// </summary>
        public SyncContext Context { get; private set; }

        /// <summary>
        /// 需要PUSH的数据
        /// </summary>
        public byte[] Data { get; set; }

        /// <summary>
        /// 同步链路异步操作状态
        /// </summary>
        /// <param name="httpContext"></param>
        /// <param name="callback"></param>
        /// <param name="context"></param>
        public PushPipe(HttpContext httpContext, AsyncCallback callback, SyncContext context)
        {
            this.HttpContext = httpContext;
            this.Callback = callback;
            this.Context = context;
            this.IsCompleted = true;
        }

        /// <summary>
        /// PUSH
        /// </summary>
        public void Push()
        {
            if (this.IsCompleted && this.Callback != null)
                this.Callback(this);
        }
    }
}