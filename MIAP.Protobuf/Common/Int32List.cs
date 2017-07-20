using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用int32列表数据信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Int32List")]
    public partial class Int32List : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 列表数据
        /// </summary>
        private List<int> m_DataList = new List<int>(0);

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
        /// 一个int32整数集合
        /// </summary>
        public Int32List()
        {
        }

        /// <summary>
        /// 获取或设置列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.TwosComplement)]
        public List<int> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}