using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子详细信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"TopicDetail")]
    public partial class TopicDetail : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 帖子编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 帖子发布人基本信息
        /// </summary>
        private UserBase m_Owner = null;

        /// <summary>
        /// 帖子附加来源内容
        /// </summary>
        private string m_AttachContent = "";

        /// <summary>
        /// 帖子标题
        /// </summary>
        private string m_Title = "";

        /// <summary>
        /// 帖子内容组成集合
        /// </summary>
        private List<TopicContent> m_Content = new List<TopicContent>(0);

        /// <summary>
        /// 帖子属性变更记录
        /// </summary>
        private string m_AttrChangedMark = "";

        /// <summary>
        /// 是否为精华帖
        /// </summary>
        private bool m_IsRefined = default(bool);

        /// <summary>
        /// 帖子类型
        /// </summary>
        private TopicType m_TopicType = TopicType.Normal;

        /// <summary>
        /// 帖子悬赏虚拟币额度（仅针对悬赏贴）
        /// </summary>
        private int m_RewardCount = default(int);

        /// <summary>
        /// 帖子是否已有最佳回复（仅针对悬赏贴和提问帖）
        /// </summary>
        private bool m_HasBestAnswer = default(bool);

        /// <summary>
        /// 帖子被点“赞”次数
        /// </summary>
        private int m_FavouredCount = default(int);

        /// <summary>
        /// 帖子被回帖总数
        /// </summary>
        private int m_RepliedCount = default(int);

        /// <summary>
        /// 帖子发布时间（yyyy-MM-dd HH:mm:ss 格式）
        /// </summary>
        private string m_PublishTime = "";

        /// <summary>
        /// “我”是否已对该帖点“赞”
        /// </summary>
        private bool m_IFavoured = default(bool);

        /// <summary>
        /// 帖子引发发布人经验值变化额度
        /// </summary>
        private int m_ExpChanged = default(int);

        /// <summary>
        /// 帖子引发发布人虚拟币账户变化额度
        /// </summary>
        private int m_VirtualCoinChanged = default(int);

        /// <summary>
        /// 帖子最佳回复信息
        /// </summary>
        private ReplyDetail m_BestReply = null;

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
        /// 表示一条帖子详细信息的数据构成
        /// </summary>
        public TopicDetail()
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
        /// 获取或设置帖子发布人基本信息
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Owner", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase Owner
        {
            get { return m_Owner; }
            set { m_Owner = value; }
        }

        /// <summary>
        /// 获取或设置帖子附加内容（出现在帖子标题之前）
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"AttachContent", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AttachContent
        {
            get { return m_AttachContent; }
            set { m_AttachContent = value; }
        }

        /// <summary>
        /// 获取或设置帖子标题
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Title", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        /// <summary>
        /// 获取或设置帖子内容组成集合
        /// </summary>
        [ProtoMember(5, Name = @"Content", DataFormat = DataFormat.Default)]
        public List<TopicContent> Content
        {
            get { return m_Content; }
            set { m_Content = value; }
        }

        /// <summary>
        /// 获取或设置帖子属性值变化记录内容
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"AttrChangedMark", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AttrChangedMark
        {
            get { return m_AttrChangedMark; }
            set { m_AttrChangedMark = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示帖子是否被评定为精华帖
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"IsRefined", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsRefined
        {
            get { return m_IsRefined; }
            set { m_IsRefined = value; }
        }

        /// <summary>
        /// 获取或设置帖子类型
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"TopicType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(TopicType.Normal)]
        public TopicType TopicType
        {
            get { return m_TopicType; }
            set { m_TopicType = value; }
        }

        /// <summary>
        /// 获取或设置帖子悬赏的虚拟币额度（仅针对悬赏贴）
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"RewardCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RewardCount
        {
            get { return m_RewardCount; }
            set { m_RewardCount = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示帖子是否已存在最佳回复（仅针对悬赏贴和提问帖）
        /// </summary>
        [ProtoMember(10, IsRequired = false, Name = @"HasBestAnswer", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool HasBestAnswer
        {
            get { return m_HasBestAnswer; }
            set { m_HasBestAnswer = value; }
        }

        /// <summary>
        /// 获取或设置帖子被点“赞”总数
        /// </summary>
        [ProtoMember(11, IsRequired = false, Name = @"FavouredCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int FavouredCount
        {
            get { return m_FavouredCount; }
            set { m_FavouredCount = value; }
        }

        /// <summary>
        /// 获取或设置帖子被回复总数
        /// </summary>
        [ProtoMember(12, IsRequired = false, Name = @"RepliedCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RepliedCount
        {
            get { return m_RepliedCount; }
            set { m_RepliedCount = value; }
        }

        /// <summary>
        /// 获取或设置帖子发布时间（格式：yyyy-MM-dd HH:mm:ss）
        /// </summary>
        [ProtoMember(13, IsRequired = false, Name = @"PublishTime", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PublishTime
        {
            get { return m_PublishTime; }
            set { m_PublishTime = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示“我”是否已对该帖子点“赞”
        /// </summary>
        [ProtoMember(14, IsRequired = false, Name = @"IFavoured", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IFavoured
        {
            get { return m_IFavoured; }
            set { m_IFavoured = value; }
        }

        /// <summary>
        /// 获取或设置帖子引发的发布人经验值变化额度
        /// </summary>
        [ProtoMember(15, IsRequired = false, Name = @"ExpChanged", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ExpChanged
        {
            get { return m_ExpChanged; }
            set { m_ExpChanged = value; }
        }

        /// <summary>
        /// 获取或设置帖子引发的发布人虚拟币账户变化额度
        /// </summary>
        [ProtoMember(16, IsRequired = false, Name = @"VirtualCoinChanged", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int VirtualCoinChanged
        {
            get { return m_VirtualCoinChanged; }
            set { m_VirtualCoinChanged = value; }
        }

        /// <summary>
        /// 获取或设置帖子最佳回复信息
        /// </summary>
        [ProtoMember(17, IsRequired = false, Name = @"BestReply", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ReplyDetail BestReply
        {
            get { return m_BestReply; }
            set { m_BestReply = value; }
        }

        /// <summary>
        /// 获取或设置一个值指示帖子是否允许回复
        /// </summary>
        [ProtoMember(18, IsRequired = false, Name = @"IsAllowReply", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsAllowReply
        {
            get { return m_IsAllowReply; }
            set { m_IsAllowReply = value; }
        }
    }
}