using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用单个字符串数据结构类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"StringSingle")]
    public partial class StringSingle : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 字符串数据
        /// </summary>
        private string m_Data = "";

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
        /// 表示一个由单个字符串字段构成的数据结构
        /// </summary>
        public StringSingle()
        {
        }

        /// <summary>
        /// 获取或设置字符串数据
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }
    }
}