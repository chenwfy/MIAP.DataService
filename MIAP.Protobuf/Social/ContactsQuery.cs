using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Social
{
    /// <summary>
    /// 关系人查询信息类（Generated From Social.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ContactsQuery")]
    public partial class ContactsQuery : IExtensible
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
        /// 查询对象编号
        /// </summary>
        private int m_TargetId = default(int);

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
        /// 关系人查询信息
        /// </summary>
        public ContactsQuery()
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
        /// 获取或设置查询目标编号（如目标用户编号-查询目标用户的关系人列表、群组编号-查询群组成员列表等）
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"TargetId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TargetId
        {
            get { return m_TargetId; }
            set { m_TargetId = value; }
        }
    }
}