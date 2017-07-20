using System;
using System.Collections.Generic;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// “我的”资源内容条列表信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResItemForMeList")]
    public partial class ResItemForMeList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源内容条数据列表
        /// </summary>
        private List<ResItemForMe> m_DataList = new List<ResItemForMe>(0);

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
        /// 表示一个和用户相关联的资源内容条数据集合
        /// </summary>
        public ResItemForMeList()
        {
        }

        /// <summary>
        /// 获取或设置资源内容条数据列表
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<ResItemForMe> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}