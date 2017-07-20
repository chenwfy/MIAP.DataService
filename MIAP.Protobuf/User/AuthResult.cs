using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户认证结果信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"AuthResult")]
    public partial class AuthResult : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 用户编号
        /// </summary>
        private int m_UserId = default(int);

        /// <summary>
        /// 用户登录状态码
        /// </summary>
        private string m_SessionId = "";

        /// <summary>
        /// 是否更换设备
        /// </summary>
        private bool m_DeviceChanged = default(bool);

        /// <summary>
        /// 用户基本信息
        /// </summary>
        private UserBase m_UserBase = null;

        /// <summary>
        /// 
        /// </summary>
        private IExtension extensionObject;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="createIfMissing"></param>
        /// <returns></returns>
        IExtension IExtensible.GetExtensionObject(bool createIfMissing)
        {
            return Extensible.GetExtensionObject(ref extensionObject, createIfMissing);
        }

        #endregion

        /// <summary>
        /// 用户认证结果信息
        /// </summary>
        public AuthResult()
        {
        }

        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"UserId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }

        /// <summary>
        /// 获取或设置用户登录会话标示码
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"SessionId", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string SessionId
        {
            get { return m_SessionId; }
            set { m_SessionId = value; }
        }

        /// <summary>
        /// 获取或设置用户是否更换设备
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"DeviceChanged", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool DeviceChanged
        {
            get { return m_DeviceChanged; }
            set { m_DeviceChanged = value; }
        }

        /// <summary>
        /// 获取或设置用户基本信息
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"UserBase", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase UserBase
        {
            get { return m_UserBase; }
            set { m_UserBase = value; }
        }
    }
}