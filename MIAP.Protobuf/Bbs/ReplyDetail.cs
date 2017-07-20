using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 回帖详情信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ReplyDetail")]
    public partial class ReplyDetail : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 回帖编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 回帖发布人基本信息
        /// </summary>
        private UserBase m_Owner = null;

        /// <summary>
        /// 回帖内容块集合
        /// </summary>
        private List<TopicContent> m_Content = new List<TopicContent>(0);

        /// <summary>
        /// 是否为最佳回复
        /// </summary>
        private bool m_IsBestAnswer = default(bool);

        /// <summary>
        /// 回帖被点“赞”次数
        /// </summary>
        private int m_FavouredCount = default(int);

        /// <summary>
        /// 回帖发布时间（格式：yyyy-MM-dd HH:mm:ss）
        /// </summary>
        private string m_PublishTime = "";

        /// <summary>
        /// “我”是否已为该回复点“赞”
        /// </summary>
        private bool m_IFavoured = default(bool);

        /// <summary>
        /// 被设定为最佳回复的时间（格式：yyyy-MM-dd HH:mm:ss）
        /// </summary>
        private string m_SetBestDate = "";

        /// <summary>
        /// 回复引发的回复人经验值变化额度
        /// </summary>
        private int m_ExpChanged = default(int);

        /// <summary>
        /// 回复引发的回复人虚拟币账户变化额度
        /// </summary>
        private int m_VirtualCoinChanged = default(int);

        /// <summary>
        /// 回复目标用户基本信息
        /// </summary>
        private UserBase m_TargetUser = null;

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
        /// 表示一条回帖详细信息的数据构成
        /// </summary>
        public ReplyDetail()
        {
        }

        /// <summary>
        /// 获取或设置回帖编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置回帖发布人基本信息
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Owner", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase Owner
        {
            get { return m_Owner; }
            set { m_Owner = value; }
        }

        /// <summary>
        /// 获取或设置回帖内容块数据集合
        /// </summary>
        [ProtoMember(3, Name = @"Content", DataFormat = DataFormat.Default)]
        public List<TopicContent> Content
        {
            get { return m_Content; }
            set { m_Content = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示该回复是否被指定为最佳回复（仅针对提问题和悬赏帖）
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"IsBestAnswer", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsBestAnswer
        {
            get { return m_IsBestAnswer; }
            set { m_IsBestAnswer = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示该回复被点“赞”次数
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"FavouredCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int FavouredCount
        {
            get { return m_FavouredCount; }
            set { m_FavouredCount = value; }
        }

        /// <summary>
        /// 获取或设置回帖发布时间（yyyy-MM-dd HH:mm:ss 格式）
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"PublishTime", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PublishTime
        {
            get { return m_PublishTime; }
            set { m_PublishTime = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示“我”是否已对该回帖点“赞”
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"IFavoured", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IFavoured
        {
            get { return m_IFavoured; }
            set { m_IFavoured = value; }
        }

        /// <summary>
        /// 获取或设置回帖被设定为最佳回复时间（yyyy-MM-dd HH:mm:ss 格式）
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"SetBestDate", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string SetBestDate
        {
            get { return m_SetBestDate; }
            set { m_SetBestDate = value; }
        }

        /// <summary>
        /// 获取或设置回帖引发的发布人经验值变化额度
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"ExpChanged", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ExpChanged
        {
            get { return m_ExpChanged; }
            set { m_ExpChanged = value; }
        }

        /// <summary>
        /// 获取或设置回帖引发的发布人虚拟币账户变化额度
        /// </summary>
        [ProtoMember(10, IsRequired = false, Name = @"VirtualCoinChanged", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int VirtualCoinChanged
        {
            get { return m_VirtualCoinChanged; }
            set { m_VirtualCoinChanged = value; }
        }

        /// <summary>
        /// 获取或设置回帖针对的目标用户基本信息
        /// </summary>
        [ProtoMember(11, IsRequired = false, Name = @"TargetUser", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase TargetUser
        {
            get { return m_TargetUser; }
            set { m_TargetUser = value; }
        }
    }
}