using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典翻译结果内容条信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictResultItem")]
    public partial class DictResultItem : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 内容1（如英文原句）
        /// </summary>
        private string m_Item1 = "";

        /// <summary>
        /// 内容2（如翻译结果）
        /// </summary>
        private string m_Item2 = "";

        /// <summary>
        /// 内容1是否可进行二次查询
        /// </summary>
        private bool m_IsQueryEnabled = default(bool);

        /// <summary>
        /// 内容条显示前缀（如1.、2.、3. 等）
        /// </summary>
        private string m_PreFixed = "";

        /// <summary>
        /// 内容条发音文件路径
        /// </summary>
        private string m_AudioUrl = "";

        /// <summary>
        /// 内容条声音文件大小
        /// </summary>
        private string m_AudioSize = "";

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
        /// 表示一个词典翻译结果的内容条信息，为翻译结果中的最基本构成单位
        /// </summary>
        public DictResultItem()
        {
        }

        /// <summary>
        /// 获取或设置内容条中第一段内容文字（如英文原句）
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Item1", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Item1
        {
            get { return m_Item1; }
            set { m_Item1 = value; }
        }

        /// <summary>
        /// 获取或设置内容条中第二段内容文字（如翻译结果）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Item2", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Item2
        {
            get { return m_Item2; }
            set { m_Item2 = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示内容条中第一段内容是否可以进行二次查询
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"IsQueryEnabled", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsQueryEnabled
        {
            get { return m_IsQueryEnabled; }
            set { m_IsQueryEnabled = value; }
        }

        /// <summary>
        /// 获取或设置内容条文字显示前缀（如1.、2.、3. 或A.、B.、C. 等）
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"PreFixed", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PreFixed
        {
            get { return m_PreFixed; }
            set { m_PreFixed = value; }
        }

        /// <summary>
        /// 获取或设置内容条文字对应的发音文件路径
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"AudioUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AudioUrl
        {
            get { return m_AudioUrl; }
            set { m_AudioUrl = value; }
        }

        /// <summary>
        /// 获取或设置内容条文字对应的发音文件大小
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"AudioSize", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AudioSize
        {
            get { return m_AudioSize; }
            set { m_AudioSize = value; }
        }
    }
}