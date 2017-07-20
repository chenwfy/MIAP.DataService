using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Extend
{
    /// <summary>
    /// 广告列表信息类（Generated From Extend.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"AdvertList")]
    public partial class AdvertList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 广告列表数据
        /// </summary>
        private List<Advert> m_DataList = new List<Advert>(0);

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
        /// 表示一个广告数据集合
        /// </summary>
        public AdvertList()
        {
        }

        /// <summary>
        /// 获取或设置广告列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<Advert> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}