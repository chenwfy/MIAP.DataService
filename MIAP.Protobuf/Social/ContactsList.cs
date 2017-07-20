using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;

namespace MIAP.Protobuf.Social
{
    /// <summary>
    /// 关系人列表信息类（Generated From Social.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ContactsList")]
    public partial class ContactsList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 查询序号（第几次查询）
        /// </summary>
        private int m_QueryIndex = default(int);

        /// <summary>
        /// 记录总数
        /// </summary>
        private int m_RecordCount = default(int);

        /// <summary>
        /// 可查询总次数
        /// </summary>
        private int m_IndexCount = default(int);

        /// <summary>
        /// 查询结果数据列表
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
        /// 关系人列表信息
        /// </summary>
        public ContactsList()
        {
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置当前查询序号（第几次查询）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }

        /// <summary>
        /// 获取或设置查询结果记录总数
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"RecordCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RecordCount
        {
            get { return m_RecordCount; }
            set { m_RecordCount = value; }
        }

        /// <summary>
        /// 获取或设置可分次查询的总次数
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"IndexCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int IndexCount
        {
            get { return m_IndexCount; }
            set { m_IndexCount = value; }
        }

        /// <summary>
        /// 获取或设置查询结果数据列表
        /// </summary>
        [ProtoMember(5, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<UserBase> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}