using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典翻译结果信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictResultBasic")]
    public partial class DictResultBasic : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 查询的词语原文
        /// </summary>
        private string m_Text = "";

        /// <summary>
        /// 英式音标
        /// </summary>
        private string m_PhonicsEn = "";

        /// <summary>
        /// 英式发音文件路径
        /// </summary>
        private string m_AudioEn = "";

        /// <summary>
        /// 美式音标
        /// </summary>
        private string m_PhonicsUs = "";

        /// <summary>
        /// 美式发音文件路径
        /// </summary>
        private string m_AudioUs = "";

        /// <summary>
        /// 基本释义
        /// </summary>
        private List<DictResultPackage> m_Meaning = new List<DictResultPackage>(0);

        /// <summary>
        /// 使用例句
        /// </summary>
        private List<DictResultPackage> m_Example = new List<DictResultPackage>(0);

        /// <summary>
        /// 详细释义
        /// </summary>
        private List<DictResultPackage> m_Explication = new List<DictResultPackage>(0);

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
        public DictResultBasic()
        {
        }

        /// <summary>
        /// 获取或设置查询词语原文
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Text", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Text
        {
            get { return m_Text; }
            set { m_Text = value; }
        }

        /// <summary>
        /// 获取或设置查询词语的英式音标
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"PhonicsEN", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PhonicsEn
        {
            get { return m_PhonicsEn; }
            set { m_PhonicsEn = value; }
        }

        /// <summary>
        /// 获取或设置查询词语的英式发音文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"AudioEN", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AudioEn
        {
            get { return m_AudioEn; }
            set { m_AudioEn = value; }
        }

        /// <summary>
        /// 获取或设置查询词语的美式音标
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"PhonicsUS", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PhonicsUs
        {
            get { return m_PhonicsUs; }
            set { m_PhonicsUs = value; }
        }

        /// <summary>
        /// 获取或设置查询词语的美式发音文件路径
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"AudioUS", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AudioUs
        {
            get { return m_AudioUs; }
            set { m_AudioUs = value; }
        }

        /// <summary>
        /// 获取或设置查询结果-基本释义部分
        /// </summary>
        [ProtoMember(6, Name = @"Meaning", DataFormat = DataFormat.Default)]
        public List<DictResultPackage> Meaning
        {
            get { return m_Meaning; }
            set { m_Meaning = value; }
        }

        /// <summary>
        /// 获取或设置查询结果-使用例句部分
        /// </summary>
        [ProtoMember(7, Name = @"Example", DataFormat = DataFormat.Default)]
        public List<DictResultPackage> Example
        {
            get { return m_Example; }
            set { m_Example = value; }
        }

        /// <summary>
        /// 获取或设置查询结果-详细释义部分
        /// </summary>
        [ProtoMember(8, Name = @"Explication", DataFormat = DataFormat.Default)]
        public List<DictResultPackage> Explication
        {
            get { return m_Explication; }
            set { m_Explication = value; }
        }
    }
}