using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用键值对结构列表数据信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"KvPairList")]
    public partial class KvPairList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 数据列表
        /// </summary>
        private List<KvPair> m_DataList = new List<KvPair>(0);

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
        /// 表示一个键值对数据集合
        /// </summary>
        public KvPairList()
        {
        }

        /// <summary>
        /// 获取或设置通用键值对列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<KvPair> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}