using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户账户信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Account")]
    public partial class Account : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 用户名
        /// </summary>
        private string m_UserName = "";

        /// <summary>
        /// 用户密码
        /// </summary>
        private string m_Password = "";

        /// <summary>
        /// 用户账号类型
        /// </summary>
        private AccountChannel m_AccountChannel = AccountChannel.Guest;

        /// <summary>
        /// 版本号
        /// </summary>
        private string m_Version = "";

        /// <summary>
        /// 网络类型
        /// </summary>
        private NetworkType m_NetworkType = NetworkType.Unknow;

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
        /// 用户账户信息
        /// </summary>
        public Account()
        {
        }

        /// <summary>
        /// 获取或设置用户名（登录或注册的账户名）
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"UserName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string UserName
        {
            get { return m_UserName; }
            set { m_UserName = value; }
        }

        /// <summary>
        /// 获取或设置用户密码（登录或注册的账户密码）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Password", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Password
        {
            get { return m_Password; }
            set { m_Password = value; }
        }

        /// <summary>
        /// 获取或设置账户类型
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"AccountChannel", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(AccountChannel.Guest)]
        public AccountChannel AccountChannel
        {
            get { return m_AccountChannel; }
            set { m_AccountChannel = value; }
        }

        /// <summary>
        /// 获取或设置版本号
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Version", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Version
        {
            get { return m_Version; }
            set { m_Version = value; }
        }

        /// <summary>
        /// 获取或设置网络类型
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"NetworkType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(NetworkType.Unknow)]
        public NetworkType NetworkType
        {
            get { return m_NetworkType; }
            set { m_NetworkType = value; }
        }

        /// <summary>
        /// 获取或设置用户基本信息
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"UserBase", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase UserBase
        {
            get { return m_UserBase; }
            set { m_UserBase = value; }
        }
    }
}