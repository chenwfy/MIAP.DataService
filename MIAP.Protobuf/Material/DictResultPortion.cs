using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典翻译结果内容块信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictResultPortion")]
    public partial class DictResultPortion : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 内容块名称
        /// </summary>
        private string m_Title = "";

        /// <summary>
        /// 内容块内容条列表
        /// </summary>
        private List<DictResultItem> m_Items = new List<DictResultItem>(0);

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
        public DictResultPortion()
        {
        }

        /// <summary>
        /// 获取或设置内容块名称
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Title", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        /// <summary>
        /// 获取或设置内容块内容条数据列表
        /// </summary>
        [ProtoMember(2, Name = @"Items", DataFormat = DataFormat.Default)]
        public List<DictResultItem> Items
        {
            get { return m_Items; }
            set { m_Items = value; }
        }
    }
}