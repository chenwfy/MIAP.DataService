using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用两级键值对数据结构信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ParentSubKv")]
    public partial class ParentSubKv : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 父级键值对内容
        /// </summary>
        private KvPair m_ParentData = null;

        /// <summary>
        /// 子级键值对内容
        /// </summary>
        private KvPair m_SubData = null;

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
        /// 表示由一个父级键值对信息和一个子级键值对信息构成的数据结构
        /// </summary>
        public ParentSubKv()
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
        /// 获取或设置子级键值对数据
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"SubData", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public KvPair SubData
        {
            get { return m_SubData; }
            set { m_SubData = value; }
        }
    }
}