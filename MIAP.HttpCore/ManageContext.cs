using System;
using System.IO;
using System.Web;
using MIAP.Protobuf.Base;
using CSharpLib.Common;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 面向管理平台请求的应答处理类
    /// </summary>
    public class ManageContext : IContext
    {
        #region 成员
        /// <summary>
        /// 获取WEB应用程序上下文应答对象
        /// </summary>
        public HttpContext Context { get; private set; }

        /// <summary>
        /// 获取请求命令
        /// </summary>
        public string Command { get; private set; }

        /// <summary>
        /// 请求数据
        /// </summary>
        public byte[] CmdData { get; private set; }

        /// <summary>
        /// 获取响应数据
        /// </summary>
        private RespondBase Respond;

        #endregion

        #region 接口实现

        /// <summary>
        /// 是否发生意外错误
        /// </summary>
        public bool HasError { get; private set; }

        /// <summary>
        /// 请求数据初始化
        /// </summary>
        /// <returns></returns>
        public bool Build()
        {
            try
            {
                using (Stream inputStream = Context.Request.InputStream)
                {
                    RequestBase request = inputStream.ProtoBufDeserialize<RequestBase>();
                    Command = request.Command;
                    CmdData = request.Data;
                    Respond = new RespondBase { Command = Command, Status = Status.Succeed, Code = RespondCode.Success };

                    return true;
                }
            }
            catch (Exception ex)
            {
                ex.Error();
                return false;
            }
        }

        /// <summary>
        /// 开始处理请求
        /// </summary>
        public void BeginExecute()
        {
            "[Manage - BeginProcess] Command : {0}".Info(Command);
             Context.RewritePath(Constants.DataContextRedirectUrl);
        }

        /// <summary>
        /// 执行请求
        /// </summary>
        /// <param name="context"></param>
        public void Execute(IContext context)
        {
            IExecute<ManageContext> instance = string.Format(Constants.CmdProviderName, Command).CreateInstance<IExecute<ManageContext>>();
            if (null != instance)
                instance.Execute(context as ManageContext);
            else
                Flush(RespondCode.CmdInvalid);
        }

        /// <summary>
        /// 请求处理结束
        /// </summary>
        /// <param name="context"></param>
        /// <param name="status"></param>
        /// <param name="watchTime"></param>
        public void EndExecute(IContext context, string status, long watchTime)
        {
            "[Manage - EndProcess] Command : {0} - [{1}] - {2}ms".Info(Command, status, watchTime);
        }

        /// <summary>
        /// 关闭连接
        /// </summary>
        public void Close()
        {
            Context.Response.Close();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 构造应用请求上下文应答类
        /// </summary>
        public ManageContext(HttpContext context)
        {
            Context = context;
            HasError = true;
        }

        /// <summary>
        /// 立即刷新服务器输出流数据
        /// </summary>
        /// <typeparam name="T">输出的数据对象类型</typeparam>
        /// <param name="responseData">输出的数据</param>
        public void Flush<T>(T responseData)
        {
            HasError = false;
            Flush(responseData.ProtoBufSerialize<T>());
        }

        /// <summary>
        /// 立即刷新服务器输出流数据
        /// </summary>
        /// <param name="responseData">输出的数据</param>
        public void Flush(byte[] responseData)
        {
            Respond.Data = responseData;
            Flush();
        }

        /// <summary>
        /// 刷新请求错误信息
        /// </summary>
        /// <param name="code">状态码</param>
        public virtual void Flush(string code)
        {
            Respond.Code = code;
            Respond.Status = Status.Failed;
            Respond.Data = null;
            Flush(true);
        }

        /// <summary>
        /// 刷新请求错误信息
        /// </summary>
        /// <param name="code">状态码</param>
        /// <param name="message">输出消息</param>
        public void Flush(string code, string message)
        {
            Respond.Code = code;
            Respond.Message = message;
            Respond.Status = Status.Failed;
            Respond.Data = null;
            Flush(true);
        }

        /// <summary>
        /// 立即刷新服务器输出流数据
        /// </summary>
        public void Flush(bool hasError = false)
        {
            HasError = hasError;
            Context.Response.BinaryWrite(this.Respond.ProtoBufSerialize<RespondBase>());
            Context.Response.End();
        }

        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
        }

        #endregion
    }
}