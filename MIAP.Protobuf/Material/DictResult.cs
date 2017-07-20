using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典查询结果信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictResult")]
    public partial class DictResult : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 查询翻译结果
        /// </summary>
        private DictResultBasic m_Basic = null;

        /// <summary>
        /// 查询备选结果
        /// </summary>
        private DictResultPortion m_Extend = null;

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
        /// 
        /// </summary>
        public DictResult()
        {
        }

        /// <summary>
        /// 获取或设置词语翻译结果内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Basic", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public DictResultBasic Basic
        {
            get { return m_Basic; }
            set { m_Basic = value; }
        }

        /// <summary>
        /// 获取或设置词语相似联想结果内容（当查询无结果时，该字段才会赋值）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Extend", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public DictResultPortion Extend
        {
            get { return m_Extend; }
            set { m_Extend = value; }
        }
    }
}