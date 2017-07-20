using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子查询信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"TopicQuery")]
    public partial class TopicQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 版块编号
        /// </summary>
        private int m_ForumId = default(int);

        /// <summary>
        /// 发布人用户编号
        /// </summary>
        private int m_OwnerId = default(int);

        /// <summary>
        /// 帖子附加内容
        /// </summary>
        private string m_AttachContent = "";

        /// <summary>
        /// 是否已有最佳回复
        /// </summary>
        private bool m_HasBestAnswer = default(bool);

        /// <summary>
        /// 匹配关键词
        /// </summary>
        private string m_Keyword = "";

        /// <summary>
        /// 查询结果排序方式
        /// </summary>
        private OrderType m_OrderType = OrderType.Default;

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 当前查询序号（当前第几次查询）
        /// </summary>
        private int m_QueryIndex = default(int);

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
        /// 表示一个发起帖子查询的数据构成
        /// </summary>
        public TopicQuery()
        {
        }

        /// <summary>
        /// 获取或设置指定查询的版块编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ForumId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ForumId
        {
            get { return m_ForumId; }
            set { m_ForumId = value; }
        }

        /// <summary>
        /// 获取或设置指定查询的发布人用户编号
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"OwnerId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int OwnerId
        {
            get { return m_OwnerId; }
            set { m_OwnerId = value; }
        }

        /// <summary>
        /// 获取或设置指定查询的帖子附加内容
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"AttachContent", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AttachContent
        {
            get { return m_AttachContent; }
            set { m_AttachContent = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示查询是否已有最佳回复的帖子
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"HasBestAnswer", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool HasBestAnswer
        {
            get { return m_HasBestAnswer; }
            set { m_HasBestAnswer = value; }
        }

        /// <summary>
        /// 获取或设置查询匹配的关键词
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Keyword", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Keyword
        {
            get { return m_Keyword; }
            set { m_Keyword = value; }
        }

        /// <summary>
        /// 获取或设置查询结果列表排序方式
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"OrderType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(OrderType.Default)]
        public OrderType OrderType
        {
            get { return m_OrderType; }
            set { m_OrderType = value; }
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置当前查询序号（当前第几次查询）
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }
    }
}