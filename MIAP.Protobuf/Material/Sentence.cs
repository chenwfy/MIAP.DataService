using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资料-“每日一句”信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Sentence")]
    public partial class Sentence : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 句子英文内容
        /// </summary>
        private string m_TextEn = "";

        /// <summary>
        /// 句子中文内容
        /// </summary>
        private string m_TextCn = "";

        /// <summary>
        /// 句子图片文件路径
        /// </summary>
        private string m_ImageUrl = "";

        /// <summary>
        /// 句子朗读发音文件路径
        /// </summary>
        private string m_AudioUrl = "";

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
        /// “每日一句”信息类0参构造函数
        /// </summary>
        public Sentence()
        {
        }

        /// <summary>
        /// 获取或设置句子英文内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"TextEn", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string TextEn
        {
            get { return m_TextEn; }
            set { m_TextEn = value; }
        }

        /// <summary>
        /// 获取或设置句子中文内容
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"TextCn", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string TextCn
        {
            get { return m_TextCn; }
            set { m_TextCn = value; }
        }

        /// <summary>
        /// 获取或设置句子图片文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"ImageUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ImageUrl
        {
            get { return m_ImageUrl; }
            set { m_ImageUrl = value; }
        }

        /// <summary>
        /// 获取或设置句子朗读发音文件路径
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"AudioUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AudioUrl
        {
            get { return m_AudioUrl; }
            set { m_AudioUrl = value; }
        }
    }
}