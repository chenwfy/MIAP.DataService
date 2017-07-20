using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用键值对数据结构类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"KvPair")]
    public partial class KvPair : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 键
        /// </summary>
        private string m_Key = "";

        /// <summary>
        /// 值
        /// </summary>
        private string m_Value = "";

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
        /// 表示一个键值对数据结构
        /// </summary>
        public KvPair()
        {
        }

        /// <summary>
        /// 获取或设置键值对结构的“键”内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Key", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Key
        {
            get { return m_Key; }
            set { m_Key = value; }
        }

        /// <summary>
        /// 获取或设置键值对结构的“值”内容
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Value", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Value
        {
            get { return m_Value; }
            set { m_Value = value; }
        }
    }
}