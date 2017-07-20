using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 论坛版块新帖数量列表信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ForumNewTopicCountList")]
    public partial class ForumNewTopicCountList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 版块编号列表
        /// </summary>
        private List<int> m_ForumIdList = new List<int>(0);

        /// <summary>
        /// 新帖数量列表
        /// </summary>
        private List<int> m_NewTopicCountList = new List<int>(0);

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
        /// 由2个整数集合构成的数据集合体，表示论坛版块及其对应的新帖数量
        /// </summary>
        public ForumNewTopicCountList()
        {
        }

        /// <summary>
        /// 获取或设置论坛版块编号列表
        /// </summary>
        [ProtoMember(1, Name = @"ForumIdList", DataFormat = DataFormat.TwosComplement)]
        public List<int> ForumIdList
        {
            get { return m_ForumIdList; }
            set { m_ForumIdList = value; }
        }

        /// <summary>
        /// 获取或设置论坛版块新帖数量列表（与版块编号一一对应）
        /// </summary>
        [ProtoMember(2, Name = @"NewTopicCountList", DataFormat = DataFormat.TwosComplement)]
        public List<int> NewTopicCountList
        {
            get { return m_NewTopicCountList; }
            set { m_NewTopicCountList = value; }
        }
    }
}