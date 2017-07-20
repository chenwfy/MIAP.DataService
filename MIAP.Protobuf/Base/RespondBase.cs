using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Base
{
    /// <summary>
    /// 所有命令请求响应下行基类（Generated From Base.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"RespondBase")]
    public partial class RespondBase : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 响应状态
        /// </summary>
        private Status m_Status = Status.Succeed;

        /// <summary>
        /// 状态码
        /// </summary>
        private string m_Code = "";

        /// <summary>
        /// 状态描述
        /// </summary>
        private string m_Message = "";

        /// <summary>
        /// 响应命令
        /// </summary>
        private string m_Command = "";

        /// <summary>
        /// 响应数据
        /// </summary>
        private byte[] m_Data = null;

        /// <summary>
        /// 附加参数
        /// </summary>
        private byte[] m_Attach = null;

        /// <summary>
        /// 
        /// </summary>
        private IExtension extensionObject;

        /// <summary>
        /// 
        /// </summary>
        IExtension IExtensible.GetExtensionObject(bool createIfMissing)
        {
            return Extensible.GetExtensionObject(ref extensionObject, createIfMissing);
        }

        #endregion

        /// <summary>
        /// 表示每个命令响应下行数据结构的基本构成
        /// </summary>
        public RespondBase()
        {
        }

        /// <summary>
        /// 获取或设置请求响应状态
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Status", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(Status.Succeed)]
        public Status Status
        {
            get { return m_Status; }
            set { m_Status = value; }
        }

        /// <summary>
        /// 获取或设置请求响应状态码
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Code", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Code
        {
            get { return m_Code; }
            set { m_Code = value; }
        }

        /// <summary>
        /// 获取或设置请求响应状态描述
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Message", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Message
        {
            get { return m_Message; }
            set { m_Message = value; }
        }

        /// <summary>
        /// 获取或设置请求响应命令（请求上行命令原样返回）
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Command", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Command
        {
            get { return m_Command; }
            set { m_Command = value; }
        }

        /// <summary>
        /// 获取或设置请求响应数据
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }

        /// <summary>
        /// 获取或设置请求响应附加参数
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"Attach", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] Attach
        {
            get { return m_Attach; }
            set { m_Attach = value; }
        }
    }
}