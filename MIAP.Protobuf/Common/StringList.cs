using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用字符串列表数据结构类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"StringList")]
    public partial class StringList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 列表数据
        /// </summary>
        private List<string> m_DataList = new List<string>(0);

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
        /// 表示一个字符串集合
        /// </summary>
        public StringList()
        {
        }

        /// <summary>
        /// 获取或设置字符串列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<string> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}