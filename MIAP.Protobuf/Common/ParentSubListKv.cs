using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用两级（父级：单一键值对内容；子级：键值对结构列表）键值对数据结构信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ParentSubListKv")]
    public partial class ParentSubListKv : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 父级数据
        /// </summary>
        private KvPair m_ParentData = null;

        /// <summary>
        /// 子级数据
        /// </summary>
        private List<KvPair> m_SubList = new List<KvPair>(0);

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
        /// 表示一个由单个父级键值对信息和多个子级键值对信息构成的数据结构
        /// </summary>
        public ParentSubListKv()
        {
        }

        /// <summary>
        /// 获取或设置父级键值对数据
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ParentData", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public KvPair ParentData
        {
            get { return m_ParentData; }
            set { m_ParentData = value; }
        }

        /// <summary>
        /// 获取或设置子级键值对列表数据
        /// </summary>
        [ProtoMember(2, Name = @"SubList", DataFormat = DataFormat.Default)]
        public List<KvPair> SubList
        {
            get { return m_SubList; }
            set { m_SubList = value; }
        }
    }
}