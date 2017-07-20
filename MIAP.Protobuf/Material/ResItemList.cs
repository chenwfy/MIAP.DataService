using System;
using System.Collections.Generic;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源内容条列表信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResItemList")]
    public partial class ResItemList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源内容条数据列表
        /// </summary>
        private List<ResItem> m_DataList = new List<ResItem>(0);

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
        /// 表示一个资源内容条数据集合
        /// </summary>
        public ResItemList()
        {
        }

        /// <summary>
        /// 获取或设置资源内容条数据列表
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<ResItem> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}