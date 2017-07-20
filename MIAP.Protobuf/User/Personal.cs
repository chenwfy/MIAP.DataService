using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户个人信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Personal")]
    public partial class Personal : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 昵称
        /// </summary>
        private string m_NickName = "";

        /// <summary>
        /// 签名
        /// </summary>
        private string m_Signature = "";

        /// <summary>
        /// 性别
        /// </summary>
        private Gender m_Gender = Gender.Secrecy;

        /// <summary>
        /// 出生年月日
        /// </summary>
        private string m_BirthDay = "";

        /// <summary>
        /// 所在城市
        /// </summary>
        private ParentSubKv m_City = null;

        /// <summary>
        /// 个人兴趣
        /// </summary>
        private ParentSubKv m_Interest = null;

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
        /// 用户个人信息
        /// </summary>
        public Personal()
        {
        }

        /// <summary>
        /// 获取或设置用户昵称
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"NickName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string NickName
        {
            get { return m_NickName; }
            set { m_NickName = value; }
        }

        /// <summary>
        /// 获取或设置用户个人签名
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Signature", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Signature
        {
            get { return m_Signature; }
            set { m_Signature = value; }
        }

        /// <summary>
        /// 获取或设置用户性别
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Gender", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(Gender.Secrecy)]
        public Gender Gender
        {
            get { return m_Gender; }
            set { m_Gender = value; }
        }

        /// <summary>
        /// 获取或设置用户生日
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"BirthDay", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string BirthDay
        {
            get { return m_BirthDay; }
            set { m_BirthDay = value; }
        }

        /// <summary>
        /// 获取或设置用户所在城市
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"City", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv City
        {
            get { return m_City; }
            set { m_City = value; }
        }

        /// <summary>
        /// 获取或设置用户个人兴趣
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"Interest", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv Interest
        {
            get { return m_Interest; }
            set { m_Interest = value; }
        }
    }
}