using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典翻译查询信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictQuery")]
    public partial class DictQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 待查询的词语内容
        /// </summary>
        private string m_Text = "";

        /// <summary>
        /// 查询结果内容类型
        /// </summary>
        private ResultPart m_QueryPart = ResultPart.Meaning;

        /// <summary>
        /// 是否联想查询
        /// </summary>
        private bool m_ExtendResult = default(bool);

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
        public DictQuery()
        {
        }

        /// <summary>
        /// 获取或设置待查询的词语内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Text", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Text
        {
            get { return m_Text; }
            set { m_Text = value; }
        }

        /// <summary>
        /// 获取或设置待查询的结果内容类型
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"QueryPart", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResultPart.Meaning)]
        public ResultPart QueryPart
        {
            get { return m_QueryPart; }
            set { m_QueryPart = value; }
        }

        /// <summary>
        /// 获取或设置一个表示如果查无结果是，是否进行联想查询
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"ExtendResult", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool ExtendResult
        {
            get { return m_ExtendResult; }
            set { m_ExtendResult = value; }
        }

        /// <summary>
        /// 查询结果内容块枚举（Generated From Material.Proto）
        /// </summary>
        [ProtoContract(Name = @"ResultPart")]
        public enum ResultPart
        {
            /// <summary>
            /// 全部内容
            /// </summary>
            [ProtoEnum(Name = @"All", Value = 0)]
            All = 0,

            /// <summary>
            /// 基本释义
            /// </summary>
            [ProtoEnum(Name = @"Meaning", Value = 1)]
            Meaning = 1,

            /// <summary>
            /// 详细解释
            /// </summary>
            [ProtoEnum(Name = @"Explication", Value = 2)]
            Explication = 2,

            /// <summary>
            /// 例句说明
            /// </summary>
            [ProtoEnum(Name = @"Example", Value = 3)]
            Example = 3
        }
    }
}