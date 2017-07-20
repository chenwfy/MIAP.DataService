using System;
using System.Collections.Generic;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// “我的资源”数据列表信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResInfoForMeList")]
    public partial class ResInfoForMeList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源数据列表
        /// </summary>
        private List<ResInfoForMe> m_DataList = new List<ResInfoForMe>(0);

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
        /// 表示一个用户所拥有的资源数据集合
        /// </summary>
        public ResInfoForMeList()
        {
        }

        /// <summary>
        /// 获取或设置资源数据列表
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<ResInfoForMe> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}