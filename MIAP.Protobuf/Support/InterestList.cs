using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Support
{
    /// <summary>
    /// 兴趣组列表数据结构信息类（Generated From Support.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"InterestList")]
    public partial class InterestList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 兴趣组列表数据
        /// </summary>
        private List<ParentSubListKv> m_DataList = new List<ParentSubListKv>(0);

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
        /// 兴趣组列表数据结构信息
        /// </summary>
        public InterestList()
        {
        }

        /// <summary>
        /// 获取或设置兴趣组列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<ParentSubListKv> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}