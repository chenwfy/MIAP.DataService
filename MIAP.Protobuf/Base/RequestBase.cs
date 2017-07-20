using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Base
{
    /// <summary>
    /// 所有命令请求上行基类（Generated From Base.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"RequestBase")]
    public partial class RequestBase : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 设备编号
        /// </summary>
        private int m_DeviceId = default(int);

        /// <summary>
        /// 用户编号
        /// </summary>
        private int m_UserId = default(int);

        /// <summary>
        /// 登录状态标示码
        /// </summary>
        private string m_SessionId = "";

        /// <summary>
        /// 命令内容
        /// </summary>
        private string m_Command = "";

        /// <summary>
        /// 参数数据
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
        /// 表示每个命令请求上行数据结构的基本构成
        /// </summary>
        public RequestBase()
        {
        }

        /// <summary>
        /// 获取或设置当期请求的设备编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"DeviceId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int DeviceId
        {
            get { return m_DeviceId; }
            set { m_DeviceId = value; }
        }

        /// <summary>
        /// 获取或设置当前请求用户的用户编号
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"UserId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }

        /// <summary>
        /// 获取或设置当前请求用户的登录状态标示码
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"SessionId", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string SessionId
        {
            get { return m_SessionId; }
            set { m_SessionId = value; }
        }

        /// <summary>
        /// 获取或设置当前请求的命令内容
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Command", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Command
        {
            get { return m_Command; }
            set { m_Command = value; }
        }

        /// <summary>
        /// 获取或设置当前请求的参数数据
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }

        /// <summary>
        /// 获取或设置当前请求的附加参数
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