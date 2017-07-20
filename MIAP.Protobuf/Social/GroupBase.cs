using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Social
{
    /// <summary>
    /// 群组基本信息类（Generated From Social.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"GroupBase")]
    public partial class GroupBase : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 群编号
        /// </summary>
        private int m_GroupId = default(int);

        /// <summary>
        /// 群名称
        /// </summary>
        private string m_GroupName = "";

        /// <summary>
        /// 群图标
        /// </summary>
        private string m_GroupIcon = "";

        /// <summary>
        /// 群说明
        /// </summary>
        private string m_Comment = "";

        /// <summary>
        /// 群所属兴趣组
        /// </summary>
        private ParentSubKv m_Interest = null;

        /// <summary>
        /// 成员数
        /// </summary>
        private int m_MemberCount = default(int);

        /// <summary>
        /// 允许的最大成员数
        /// </summary>
        private int m_MaxMemberCount = default(int);

        /// <summary>
        /// 快速加入码
        /// </summary>
        private string m_QuickJoinCode = "";

        /// <summary>
        /// 群创建者编号
        /// </summary>
        private int m_CreatorId = default(int);

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
        /// 群组基本信息
        /// </summary>
        public GroupBase()
        {
        }

        /// <summary>
        /// 获取或设置群编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"GroupId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int GroupId
        {
            get { return m_GroupId; }
            set { m_GroupId = value; }
        }

        /// <summary>
        /// 获取或设置群名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"GroupName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string GroupName
        {
            get { return m_GroupName; }
            set { m_GroupName = value; }
        }

        /// <summary>
        /// 获取或设置群图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"GroupIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string GroupIcon
        {
            get { return m_GroupIcon; }
            set { m_GroupIcon = value; }
        }

        /// <summary>
        /// 获取或设置群描述
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Comment", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Comment
        {
            get { return m_Comment; }
            set { m_Comment = value; }
        }

        /// <summary>
        /// 获取或设置群所属的兴趣组
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Interest", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv Interest
        {
            get { return m_Interest; }
            set { m_Interest = value; }
        }

        /// <summary>
        /// 获取或设置群现有成员数
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"MemberCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int MemberCount
        {
            get { return m_MemberCount; }
            set { m_MemberCount = value; }
        }

        /// <summary>
        /// 获取或设置群所允许的最大成员总数
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"MaxMemberCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int MaxMemberCount
        {
            get { return m_MaxMemberCount; }
            set { m_MaxMemberCount = value; }
        }

        /// <summary>
        /// 获取或设置群快速加入码
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"QuickJoinCode", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string QuickJoinCode
        {
            get { return m_QuickJoinCode; }
            set { m_QuickJoinCode = value; }
        }
        

        /// <summary>
        /// 获取或设置群创建者用户编号
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"CreatorId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int CreatorId
        {
            get { return m_CreatorId; }
            set { m_CreatorId = value; }
        }
    }
}