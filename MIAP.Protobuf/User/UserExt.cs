using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户扩展信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"UserExt")]
    public partial class UserExt : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 用户编号
        /// </summary>
        private int m_UserId = default(int);

        /// <summary>
        /// 用户名
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
        /// 用户个人签名
        /// </summary>
        private string m_Signature = "";

        /// <summary>
        /// 用户角色
        /// </summary>
        private UserRole m_UserRole = UserRole.Normal;

        /// <summary>
        /// 用户性别
        /// </summary>
        private Gender m_Gender = Gender.Secrecy;

        /// <summary>
        /// 用户年龄
        /// </summary>
        private int m_UserAge = default(int);

        /// <summary>
        /// 用户经验值及等级
        /// </summary>
        private ExpLevel m_ExpLevel = null;

        /// <summary>
        /// 用户金币账户余额
        /// </summary>
        private int m_CoinCount = default(int);

        /// <summary>
        /// 用户“粉丝”总数
        /// </summary>
        private int m_FansCount = default(int);

        /// <summary>
        /// 用户“关注”总数
        /// </summary>
        private int m_FollowedCount = default(int);

        /// <summary>
        /// 用户发帖总数
        /// </summary>
        private int m_TopicCount = default(int);

        /// <summary>
        /// 用户回帖总数
        /// </summary>
        private int m_ReviewCount = default(int);

        /// <summary>
        /// 学号等学校相关信息
        /// </summary>
        private UserInSchool m_InfoInSchool = null;

        /// <summary>
        /// 个人信息背景图片文件路径
        /// </summary>
        private string m_BackIcon = "";

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
        /// 用户扩展信息
        /// </summary>
        public UserExt()
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
        /// 获取或设置用户头像图片文件路径
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"HeadIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string HeadIcon
        {
            get { return m_HeadIcon; }
            set { m_HeadIcon = value; }
        }

        /// <summary>
        /// 获取或设置用户个人签名内容
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
        /// 获取或设置用户性别
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"Gender", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(Gender.Secrecy)]
        public Gender Gender
        {
            get { return m_Gender; }
            set { m_Gender = value; }
        }

        /// <summary>
        /// 获取或设置用户年龄
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"UserAge", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int UserAge
        {
            get { return m_UserAge; }
            set { m_UserAge = value; }
        }

        /// <summary>
        /// 获取或设置用户经验值及等级
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"ExpLevel", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ExpLevel ExpLevel
        {
            get { return m_ExpLevel; }
            set { m_ExpLevel = value; }
        }

        /// <summary>
        /// 获取或设置用户虚拟币账户余额
        /// </summary>
        [ProtoMember(10, IsRequired = false, Name = @"CoinCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int CoinCount
        {
            get { return m_CoinCount; }
            set { m_CoinCount = value; }
        }

        /// <summary>
        /// 获取或设置用户“粉丝”总数
        /// </summary>
        [ProtoMember(11, IsRequired = false, Name = @"FansCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int FansCount
        {
            get { return m_FansCount; }
            set { m_FansCount = value; }
        }

        /// <summary>
        /// 获取或设置用户“关注”总数
        /// </summary>
        [ProtoMember(12, IsRequired = false, Name = @"FollowedCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int FollowedCount
        {
            get { return m_FollowedCount; }
            set { m_FollowedCount = value; }
        }

        /// <summary>
        /// 获取或设置用户发帖总数
        /// </summary>
        [ProtoMember(13, IsRequired = false, Name = @"TopicCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TopicCount
        {
            get { return m_TopicCount; }
            set { m_TopicCount = value; }
        }

        /// <summary>
        /// 获取或设置用户回帖总数
        /// </summary>
        [ProtoMember(14, IsRequired = false, Name = @"ReviewCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ReviewCount
        {
            get { return m_ReviewCount; }
            set { m_ReviewCount = value; }
        }

        /// <summary>
        /// 获取或设置学校用户信息（如学号、班级等信息）
        /// </summary>
        [ProtoMember(15, IsRequired = false, Name = @"InfoInSchool", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserInSchool InfoInSchool
        {
            get { return m_InfoInSchool; }
            set { m_InfoInSchool = value; }
        }

        /// <summary>
        /// 获取或设置用户个人信息背景图片文件路径
        /// </summary>
        [ProtoMember(16, IsRequired = false, Name = @"BackIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string BackIcon
        {
            get { return m_BackIcon; }
            set { m_BackIcon = value; }
        }

        /// <summary>
        /// 获取或设置用户所在城市信息
        /// </summary>
        [ProtoMember(17, IsRequired = false, Name = @"City", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv City
        {
            get { return m_City; }
            set { m_City = value; }
        }

        /// <summary>
        /// 获取或设置用户个人兴趣
        /// </summary>
        [ProtoMember(18, IsRequired = false, Name = @"Interest", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv Interest
        {
            get { return m_Interest; }
            set { m_Interest = value; }
        }
    }
}