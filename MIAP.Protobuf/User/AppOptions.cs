using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 应用设置信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"AppOptions")]
    public partial class AppOptions : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 是否接受私信提醒
        /// </summary>
        private bool m_RemindPrivateMessage = default(bool);

        /// <summary>
        /// 是否接受群消息提醒
        /// </summary>
        private bool m_RemindGroupMessage = default(bool);

        /// <summary>
        /// 是否接受被“关注”提醒
        /// </summary>
        private bool m_RemindBeFollowed = default(bool);

        /// <summary>
        /// 是否接受发帖被回复提醒
        /// </summary>
        private bool m_RemindTopicBeReply = default(bool);

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
        /// 应用设置信息
        /// </summary>
        public AppOptions()
        {
        }

        /// <summary>
        /// 获取或设置一个值，表示是否接受私信提醒
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"RemindPrivateMessage", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool RemindPrivateMessage
        {
            get { return m_RemindPrivateMessage; }
            set { m_RemindPrivateMessage = value; }
        }

        /// <summary>
        /// 获取或设置一个值，表示是否接受群消息提醒
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"RemindGroupMessage", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool RemindGroupMessage
        {
            get { return m_RemindGroupMessage; }
            set { m_RemindGroupMessage = value; }
        }

        /// <summary>
        /// 获取或设置一个值，表示是否接受被关注提醒
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"RemindBeFollowed", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool RemindBeFollowed
        {
            get { return m_RemindBeFollowed; }
            set { m_RemindBeFollowed = value; }
        }

        /// <summary>
        /// 获取或设置一个值，表示是否接受帖子被回复提醒
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"RemindTopicBeReply", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool RemindTopicBeReply
        {
            get { return m_RemindTopicBeReply; }
            set { m_RemindTopicBeReply = value; }
        }
    }
}