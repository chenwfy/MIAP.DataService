using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 学校客服列表信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CustomerServiceList")]
    public partial class CustomerServiceList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 列表数据
        /// </summary>
        private List<UserBase> m_DataList = new List<UserBase>(0);

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
        /// 学校客服用户信息集合
        /// </summary>
        public CustomerServiceList()
        {
        }

        /// <summary>
        /// 获取或设置列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<UserBase> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}