using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 论坛版块信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Forum")]
    public partial class Forum : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 版块编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 版块名称
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 版块图标文件路径
        /// </summary>
        private string m_Icon = "";

        /// <summary>
        /// 版块功能类型
        /// </summary>
        private ForumType m_ForumType = ForumType.ForTopic;

        /// <summary>
        /// 版块发帖权限
        /// </summary>
        private PostRole m_PostRole = PostRole.Always;

        /// <summary>
        /// 版块允许发布的帖子类型
        /// </summary>
        private TopicType m_AllowTopicType = TopicType.Normal;

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
        /// 表示一条论坛版块信息的数据构成
        /// </summary>
        public Forum()
        {
        }

        /// <summary>
        /// 获取或设置版块编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置版块名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置版块的图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Icon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Icon
        {
            get { return m_Icon; }
            set { m_Icon = value; }
        }

        /// <summary>
        /// 获取或设置版块的功能类型
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"ForumType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ForumType.ForTopic)]
        public ForumType ForumType
        {
            get { return m_ForumType; }
            set { m_ForumType = value; }
        }

        /// <summary>
        /// 获取或设置版块的发帖权限
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"PostRole", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(PostRole.Always)]
        public PostRole PostRole
        {
            get { return m_PostRole; }
            set { m_PostRole = value; }
        }

        /// <summary>
        /// 获取或设置版块允许的发帖类型
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"AllowTopicType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(TopicType.Normal)]
        public TopicType AllowTopicType
        {
            get { return m_AllowTopicType; }
            set { m_AllowTopicType = value; }
        }
    }
}