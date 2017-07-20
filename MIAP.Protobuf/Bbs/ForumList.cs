using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 论坛版块列表信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ForumList")]
    public partial class ForumList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 版块列表
        /// </summary>
        private List<Forum> m_DataList = new List<Forum>(0);

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
        /// 表示一个论坛版块信息的数据集合
        /// </summary>
        public ForumList()
        {
        }

        /// <summary>
        /// 获取或设置论坛版块列表数据
        /// </summary>
        [ProtoMember(1, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<Forum> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}