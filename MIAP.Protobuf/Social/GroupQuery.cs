using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Social
{
    /// <summary>
    /// 群查询信息类（Generated From Social.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"GroupQuery")]
    public partial class GroupQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 搜索关键词
        /// </summary>
        private string m_Keyword = "";

        /// <summary>
        /// 兴趣组
        /// </summary>
        private ParentSubKv m_Interest = null;

        /// <summary>
        /// 是否仅查询未满员的群
        /// </summary>
        private bool m_OnlyLessMax = default(bool);

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 获取或设置当前查询序号（第几次查询）
        /// </summary>
        private int m_QueryIndex = default(int);

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
        /// 群查询信息
        /// </summary>
        public GroupQuery()
        {
        }

        /// <summary>
        /// 获取或设置查询关键词
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Keyword", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Keyword
        {
            get { return m_Keyword; }
            set { m_Keyword = value; }
        }

        /// <summary>
        /// 获取或设置查询兴趣组
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Interest", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv Interest
        {
            get { return m_Interest; }
            set { m_Interest = value; }
        }

        /// <summary>
        /// 获取或设置一个值指示是否仅查询未满员的群
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"OnlyLessMax", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool OnlyLessMax
        {
            get { return m_OnlyLessMax; }
            set { m_OnlyLessMax = value; }
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置查询序号（当前第几次查询）
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }
    }
}