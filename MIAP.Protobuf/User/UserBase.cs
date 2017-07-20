using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户基本信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"UserBase")]
    public partial class UserBase : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 用户编号
        /// </summary>
        private int m_UserId = default(int);

        /// <summary>
        /// 用户账户名称
        /// </summary>
        private string m_UserName = "";

        /// <summary>
        /// 用户昵称
        /// </summary>
        private string m_NickName = "";

        /// <summary>
        /// 用户头像图片文件路径
        /// </summary>
        private string m_HeadIcon = "";

        /// <summary>
        /// 用户个性签名
        /// </summary>
        private string m_Signature = "";

        /// <summary>
        /// 用户角色
        /// </summary>
        private UserRole m_UserRole = UserRole.Normal;

        /// <summary>
        /// 用户所属学校编号
        /// </summary>
        private int m_SchoolId = default(int);

        /// <summary>
        /// 用户经验值等级
        /// </summary>
        private ExpLevel m_ExpLevel = null;

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
        /// 用户基本信息
        /// </summary>
        public UserBase()
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
        /// 获取或设置用户名
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"UserName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string UserName
        {
            get { return m_UserName; }
            set { m_UserName = value; }
        }

        /// <summary>
        /// 获取或设置用户昵称
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"NickName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string NickName
        {
            get { return m_NickName; }
            set { m_NickName = value; }
        }

        /// <summary>
        /// 获取或设置用户图像图片文件路径
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"HeadIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string HeadIcon
        {
            get { return m_HeadIcon; }
            set { m_HeadIcon = value; }
        }

        /// <summary>
        /// 获取或设置用户个人签名
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Signature", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Signature
        {
            get { return m_Signature; }
            set { m_Signature = value; }
        }

        /// <summary>
        /// 获取或设置用户角色
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"UserRole", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(UserRole.Normal)]
        public UserRole UserRole
        {
            get { return m_UserRole; }
            set { m_UserRole = value; }
        }

        /// <summary>
        /// 获取或设置用户所属学校编号
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"SchoolId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int SchoolId
        {
            get { return m_SchoolId; }
            set { m_SchoolId = value; }
        }

        /// <summary>
        /// 获取或设置用户经验值等级信息
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"ExpLevel", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ExpLevel ExpLevel
        {
            get { return m_ExpLevel; }
            set { m_ExpLevel = value; }
        }
    }
}