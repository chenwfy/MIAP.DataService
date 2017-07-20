using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Social
{
    /// <summary>
    /// 创建群表单信息类（Generated From Social.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"GroupForm")]
    public partial class GroupForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 群名称
        /// </summary>
        private string m_GroupName = "";

        /// <summary>
        /// 群图标
        /// </summary>
        private MediaDetail m_GroupIcon = null;

        /// <summary>
        /// 群所属兴趣组
        /// </summary>
        private ParentSubKv m_Interest = null;

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
        /// 创建群表单信息
        /// </summary>
        public GroupForm()
        {
        }

        /// <summary>
        /// 获取或设置群名称
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"GroupName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string GroupName
        {
            get { return m_GroupName; }
            set { m_GroupName = value; }
        }

        /// <summary>
        /// 获取或设置群图标数据
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"GroupIcon", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public MediaDetail GroupIcon
        {
            get { return m_GroupIcon; }
            set { m_GroupIcon = value; }
        }

        /// <summary>
        /// 获取或设置群兴趣组
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Interest", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ParentSubKv Interest
        {
            get { return m_Interest; }
            set { m_Interest = value; }
        }
    }
}