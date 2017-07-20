using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 回帖列表信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ReplyList")]
    public partial class ReplyList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 查询序号（第几次查询）
        /// </summary>
        private int m_QueryIndex = default(int);

        /// <summary>
        /// 记录总数
        /// </summary>
        private int m_RecordCount = default(int);

        /// <summary>
        /// 可查询总次数
        /// </summary>
        private int m_IndexCount = default(int);

        /// <summary>
        /// 回帖基本信息列表
        /// </summary>
        private List<ReplyDetail> m_DataList = new List<ReplyDetail>(0);

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
        /// 表示一个回帖信息集合
        /// </summary>
        public ReplyList()
        {
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置查询序号（当前第几次查询）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }

        /// <summary>
        /// 获取或设置记录总数
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"RecordCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RecordCount
        {
            get { return m_RecordCount; }
            set { m_RecordCount = value; }
        }

        /// <summary>
        /// 获取或设置可查询总次数
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"IndexCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int IndexCount
        {
            get { return m_IndexCount; }
            set { m_IndexCount = value; }
        }

        /// <summary>
        /// 获取或设置回帖列表数据
        /// </summary>
        [ProtoMember(5, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<ReplyDetail> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}