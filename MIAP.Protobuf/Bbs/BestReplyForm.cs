using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 设为最佳回复贴表单信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"BestReplyForm")]
    public partial class BestReplyForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 帖子编号
        /// </summary>
        private int m_TopicId = default(int);

        /// <summary>
        /// 回帖编号
        /// </summary>
        private int m_ReplyId = default(int);
        
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
        /// 表示一个提交最佳回帖信息的表单数据构成
        /// </summary>
        public BestReplyForm() 
        { 
        }
        
        /// <summary>
        /// 获取或设置目标帖子编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"TopicId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TopicId
        {
            get { return m_TopicId; }
            set { m_TopicId = value; }
        }
        
        /// <summary>
        /// 获取或设置目标回帖编号
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ReplyId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ReplyId
        {
            get { return m_ReplyId; }
            set { m_ReplyId = value; }
        }
    }
}