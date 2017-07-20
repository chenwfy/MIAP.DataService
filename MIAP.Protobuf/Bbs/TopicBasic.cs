using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子基本信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"TopicBasic")]
    public partial class TopicBasic : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 帖子编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 帖子标题
        /// </summary>
        private string m_Title = "";

        /// <summary>
        /// 帖子图标路径
        /// </summary>
        private string m_Icon = "";

        /// <summary>
        /// 帖子发布人信息
        /// </summary>
        private UserBase m_Owner = null;

        /// <summary>
        /// 是否为精华帖
        /// </summary>
        private bool m_IsRefined = default(bool);

        /// <summary>
        /// 帖子类型
        /// </summary>
        private TopicType m_TopicType = TopicType.Normal;

        /// <summary>
        /// 帖子悬赏虚拟币数量（仅针对悬赏贴）
        /// </summary>
        private int m_RewardCount = default(int);

        /// <summary>
        /// 是否已有最佳答复（仅针对悬赏贴和提问帖）
        /// </summary>
        private bool m_HasBestAnswer = default(bool);

        /// <summary>
        /// 帖子被“赞”总数
        /// </summary>
        private int m_FavouredCount = default(int);

        /// <summary>
        /// 帖子回复总数
        /// </summary>
        private int m_RepliedCount = default(int);

        /// <summary>
        /// 帖子发布时间
        /// </summary>
        private string m_PublishTime = "";

        /// <summary>
        /// 帖子第一个音频内容信息
        /// </summary>
        private VoiceContent m_Voice = null;

        /// <summary>
        /// 帖子简短文字内容
        /// </summary>
        private string m_Intro = "";

        /// <summary>
        /// 是否允许回复
        /// </summary>
        private bool m_IsAllowReply = default(bool);

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
        /// 表示一条帖子基本信息的数据构成
        /// </summary>
        public TopicBasic()
        {
        }

        /// <summary>
        /// 获取或设置帖子编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置帖子标题
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Title", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        /// <summary>
        /// 获取或设置帖子图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Icon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Icon
        {
            get { return m_Icon; }
            set { m_Icon = value; }
        }

        /// <summary>
        /// 获取或设置帖子发布人基本信息
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Owner", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase Owner
        {
            get { return m_Owner; }
            set { m_Owner = value; }
        }

        /// <summary>
        /// 获取或设置一个值指示帖子是否为精华帖
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"IsRefined", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsRefined
        {
            get { return m_IsRefined; }
            set { m_IsRefined = value; }
        }

        /// <summary>
        /// 获取或设置帖子类型
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"TopicType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(TopicType.Normal)]
        public TopicType TopicType
        {
            get { return m_TopicType; }
            set { m_TopicType = value; }
        }

        /// <summary>
        /// 获取或设置帖子悬赏的虚拟币额度（仅针对悬赏贴）
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"RewardCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RewardCount
        {
            get { return m_RewardCount; }
            set { m_RewardCount = value; }
        }

        /// <summary>
        /// 获取或设置一个值指示帖子是否已有最佳回复（仅针对悬赏贴和提问帖）
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"HasBestAnswer", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool HasBestAnswer
        {
            get { return m_HasBestAnswer; }
            set { m_HasBestAnswer = value; }
        }

        /// <summary>
        /// 获取或设置帖子被点“赞”次数
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"FavouredCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int FavouredCount
        {
            get { return m_FavouredCount; }
            set { m_FavouredCount = value; }
        }

        /// <summary>
        /// 获取或设置帖子被回复次数
        /// </summary>
        [ProtoMember(10, IsRequired = false, Name = @"RepliedCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RepliedCount
        {
            get { return m_RepliedCount; }
            set { m_RepliedCount = value; }
        }

        /// <summary>
        /// 获取或设置帖子发布时间（yyyy-MM-dd HH:mm:ss格式）
        /// </summary>
        [ProtoMember(11, IsRequired = false, Name = @"PublishTime", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PublishTime
        {
            get { return m_PublishTime; }
            set { m_PublishTime = value; }
        }

        /// <summary>
        /// 获取或设置帖子第一个音频内容数据
        /// </summary>
        [ProtoMember(12, IsRequired = false, Name = @"Voices", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public VoiceContent Voice
        {
            get { return m_Voice; }
            set { m_Voice = value; }
        }

        /// <summary>
        /// 获取或设置帖子简短文字内容
        /// </summary>
        [ProtoMember(13, IsRequired = false, Name = @"Intro", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Intro
        {
            get { return m_Intro; }
            set { m_Intro = value; }
        }

        /// <summary>
        /// 获取或设置一个值指示帖子是否允许回复
        /// </summary>
        [ProtoMember(14, IsRequired = false, Name = @"IsAllowReply", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsAllowReply
        {
            get { return m_IsAllowReply; }
            set { m_IsAllowReply = value; }
        }
    }
}