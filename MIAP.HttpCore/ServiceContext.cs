using System;
using System.Web;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using MIAP.Protobuf.Base;
using MIAP.Configuration;
using MIAP.Cache;
using CSharpLib.Common;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 面向移动终端请求应答处理基类
    /// </summary>
    public abstract class ServiceContext : IContext
    {
        #region 私有成员

        /// <summary>
        /// 请求上行数据长度
        /// </summary>
        private int ReqBodyLength;

        /// <summary>
        /// 请求上行内容处理类型
        /// </summary>
        private ContentType ReqContentType;

        /// <summary>
        /// 请求上行真实数据长度
        /// </summary>
        private int ReqContentLength;

        /// <summary>
        /// 请求上行数据校验码
        /// </summary>
        private string ReqHeaderSig;

        /// <summary>
        /// 请求响应数据
        /// </summary>
        private RespondBase Respond;

        #endregion

        #region 公开成员

        /// <summary>
        /// 请求上行的应用渠道标示内容
        /// </summary>
        public string ReqChannel { get; private set; }

        /// <summary>
        /// 经过WAP网关代理请求上行所附带的手机号码
        /// </summary>
        public string Msid { get; private set; }

        /// <summary>
        /// 当前请求的设备编号
        /// </summary>
        public int DeviceId { get; private set; }

        /// <summary>
        /// 当前请求的用户编号
        /// </summary>
        public int UserId { get; private set; }

        /// <summary>
        /// 当前请求的会话状态标示码
        /// </summary>
        public string SessionId { get; private set; }

        /// <summary>
        /// 当前请求的命令
        /// </summary>
        public string Command { get; private set; }

        /// <summary>
        /// 当前请求的数据
        /// </summary>
        public byte[] CmdData { get; private set; }

        #endregion

        #region IContext接口实现

        /// <summary>
        /// 获取当前请求是否发生意外错误
        /// </summary>
        public bool HasError { get; private set; }

        /// <summary>
        /// 获取WEB应用程序上下文应答对象
        /// </summary>
        public HttpContext Context { get; private set; }

        /// <summary>
        /// 解析并构建请求数据
        /// </summary>
        /// <returns></returns>
        public virtual bool Build()
        {
            NameValueCollection nvCollection = this.Context.Request.Headers;
            ReqChannel = nvCollection["CN"] ?? string.Empty;
            ReqContentType = (ContentType)(nvCollection["CT"] ?? "0").Parse<int>();
            ReqBodyLength = (nvCollection["BL"] ?? "0").Parse<int>();
            ReqHeaderSig = nvCollection["HS"] ?? string.Empty;
            Msid = nvCollection["x-up-calling-line-id"] ?? string.Empty;      //通过WAP代理网关获取手机号，基本已失效
            ReqContentLength = this.Context.Request.ContentLength;

            if (Compiled.Debug)
            {
                string.Format("CN:{0} | CT:{1} | BL:{2} | HS:{3} | CL:{4}", ReqChannel, ReqContentType, ReqBodyLength, ReqHeaderSig, ReqContentLength).Debug("=== 请求上行HEADER ===");
            }

            //基本判断
            if (ReqBodyLength != ReqContentLength || ReqContentLength < 4 || !ReqChannel.ChannelCodeExists() || ReqHeaderSig.Length != 16)
            {
                new Exception("=== 请求上行HEADER基本信息错误 ===").Error();
                return false;
            }

            //HEADER层数据校验码确认
            if (!string.Format("{0}{1}{2}{3}", ReqChannel, (int)ReqContentType, ReqBodyLength, ReqChannel.GetChannelKey()).CreateMD5EncryptShort().Equals(ReqHeaderSig))
            {
                new Exception("=== 请求上行HEADER:[HS]校验码错误 ===").Error();
                return false;
            }

            //BODY层数据解析及校验
            Stream inputStream = this.Context.Request.InputStream;
            if ((int)inputStream.Length != ReqBodyLength)
            {
                new Exception("=== 请求上行数据长度验码错误 ===").Error();
                return false;
            }

            BinaryReader reader = new BinaryReader(inputStream);
            StreamContext streamContext = new StreamContext(reader, Encoding.UTF8);
            uint adlerSum = streamContext.ReadUInt32();
            byte[] buffer = streamContext.ReadBytes(ReqContentLength - 4);
            streamContext.Dispose();
            reader.Close();
            reader.Dispose();
            inputStream.Close();
            inputStream.Dispose();

            uint adlChkNum = (uint)buffer.Adler32CheckSum();
            //BODY数据校验
            if (adlChkNum != adlerSum)
            {
                new Exception("=== 请求上行BODY数据验码错误 ===").Error();
                return false;
            }

            //请求上行基类
            RequestBase reqBase = buffer.ProtoBufDeserialize<RequestBase>();
            if (Compiled.Debug)
                reqBase.Debug("=== 请求上行基类 ： RequestBase ===");

            UserId = reqBase.UserId;
            DeviceId = reqBase.DeviceId;
            Command = reqBase.Command ?? string.Empty;
            CmdData = reqBase.Data ?? new byte[0];
            SessionId = reqBase.SessionId ?? string.Empty;
            Respond = new RespondBase { Command = Command, Status = Status.Succeed, Code = RespondCode.Success, Attach = reqBase.Attach, Data = null };

            //命令号不存在
            if (!Command.CmdExists())
            {
                Flush(RespondCode.CmdInvalid);
                return false;
            }

            //当前命令必须设置DeviceId
            if (!Command.CmdIsExcepted(1) && DeviceId < 100000)
            {
                Flush(RespondCode.DeviceInvalid);
                return false;
            }

            //登录SESSIONID
            if (!this.Command.CmdIsExcepted() && !SessionId.SessionIsValid(UserId, ExpiredConfigs.GetSessionExpired()))
            {
                Flush(RespondCode.SessionInvalid);
                return false;
            }

            return true;
        }

        /// <summary>
        /// 开始处理请求
        /// </summary>
        public virtual void BeginExecute()
        {
        }

        /// <summary>
        /// 处理请求
        /// </summary>
        /// <param name="context"></param>
        public virtual void Execute(IContext context)
        {
        }

        /// <summary>
        /// 请求处理结束
        /// </summary>
        /// <param name="context"></param>
        /// <param name="status"></param>
        /// <param name="watchTime"></param>
        public virtual void EndExecute(IContext context, string status, long watchTime)
        {
        }

        /// <summary>
        /// 释放资源
        /// </summary>
        public virtual void Dispose()
        {
        }

        /// <summary>
        /// 关闭连接
        /// </summary>
        public virtual void Close()
        {
            this.Context.Response.Close();
        }

        #endregion

        #region 自有方法

        /// <summary>
        /// 构造应用请求上下文应答类
        /// </summary>
        public ServiceContext(HttpContext context)
        {
            Context = context;
            HasError = true;
        }

        /// <summary>
        /// 立即刷新服务器输出流数据
        /// </summary>
        /// <typeparam name="T">输出的数据对象类型</typeparam>
        /// <param name="responseData">输出的数据</param>
        public virtual void Flush<T>(T responseData)
        {
            if (Compiled.Debug)
                responseData.Debug(string.Format("=== {0} 下行数据 ===", Command));

            Flush(responseData.ProtoBufSerialize<T>());
        }

        /// <summary>
        /// 立即刷新服务器输出流数据
        /// </summary>
        /// <param name="responseData">输出的数据</param>
        public virtual void Flush(byte[] responseData)
        {
            if (Compiled.Debug)
                responseData.Debug(string.Format("=== {0} 下行数据 ===", Command));

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
        public virtual void Flush(string code, string message)
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
        public virtual void Flush(bool hasError = false)
        {
            HasError = hasError;

            int respondContentType = (int)ReqContentType;
            byte[] respondData = Respond.ProtoBufSerialize<RespondBase>();
            int respondDataLength = respondData.Length;
            string respondHeaderSig = string.Format("{0}{1}{2}", respondContentType, respondDataLength + 4, ReqChannel.GetChannelKey()).CreateMD5EncryptShort();

            Context.Response.Headers["CT"] = respondContentType.ToString();
            Context.Response.Headers["BL"] = (respondDataLength + 4).ToString();
            Context.Response.Headers["HS"] = respondHeaderSig;

            uint adlChkNum = (uint)respondData.Adler32CheckSum();

            Context.Response.BinaryWrite(BitConverter.GetBytes(adlChkNum).Reverse());
            Context.Response.BinaryWrite(respondData);
            Context.Response.End();

            //打印日志
            if (Compiled.Debug)
                Respond.Debug(string.Format("=== {0} 下行结构 ===", Command));
        }

        #endregion
    }
}