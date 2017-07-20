using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 回帖列表查询信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ReplyQuery")]
    public partial class ReplyQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 帖子编号
        /// </summary>
        private int m_TopicId = default(int);

        /// <summary>
        /// 查询结果列表排序类型
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
        /// 表示一个发起回帖查询的数据构成
        /// </summary>
        public ReplyQuery()
        {
        }

        /// <summary>
        /// 获取或设置查询目标帖子编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"TopicId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TopicId
        {
            get { return m_TopicId; }
            set { m_TopicId = value; }
        }

        /// <summary>
        /// 获取或设置查询结果排序方式
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"OrderType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(OrderType.Default)]
        public OrderType OrderType
        {
            get { return m_OrderType; }
            set { m_OrderType = value; }
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置查询次数序号（当前第几次查询）
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }
    }
}