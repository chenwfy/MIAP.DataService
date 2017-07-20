using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子发布表单信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"TopicForm")]
    public partial class TopicForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 发布目标版块编号
        /// </summary>
        private int m_ForumId = default(int);

        /// <summary>
        /// 待发布帖子附加内容
        /// </summary>
        private string m_AttachContent = "";

        /// <summary>
        /// 帖子标题
        /// </summary>
        private string m_Title = "";

        /// <summary>
        /// 帖子图片内容列表
        /// </summary>
        private List<MediaDetail> m_Voices = new List<MediaDetail>(0);

        /// <summary>
        /// 帖子文字内容
        /// </summary>
        private string m_Content = "";

        /// <summary>
        /// 帖子音频内容列表
        /// </summary>
        private List<MediaDetail> m_Image = new List<MediaDetail>(0);

        /// <summary>
        /// 帖子类型
        /// </summary>
        private TopicType m_TopicType = TopicType.Normal;

        /// <summary>
        /// 帖子悬赏虚拟币额度（仅针对悬赏贴）
        /// </summary>
        private int m_RewardCount = default(int);

        /// <summary>
        /// 帖子编号
        /// </summary>
        private int m_TopicId = default(int);

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
        /// 表示一个发布帖子的表单数据构成
        /// </summary>
        public TopicForm()
        {
        }

        /// <summary>
        /// 获取或设置目标版块编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ForumId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ForumId
        {
            get { return m_ForumId; }
            set { m_ForumId = value; }
        }

        /// <summary>
        /// 获取或设置帖子附加内容
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"AttachContent", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string AttachContent
        {
            get { return m_AttachContent; }
            set { m_AttachContent = value; }
        }

        /// <summary>
        /// 获取或设置帖子标题
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Title", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        /// <summary>
        /// 获取或设置帖子音频内容列表
        /// </summary>
        [ProtoMember(4, Name = @"Voices", DataFormat = DataFormat.Default)]
        public List<MediaDetail> Voices
        {
            get { return m_Voices; }
            set { m_Voices = value; }
        }

        /// <summary>
        /// 获取或设置帖子文字内容
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Content", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Content
        {
            get { return m_Content; }
            set { m_Content = value; }
        }

        /// <summary>
        /// 获取或设置帖子图片内容
        /// </summary>
        [ProtoMember(6, Name = @"Image", DataFormat = DataFormat.Default)]
        public List<MediaDetail> Image
        {
            get { return m_Image; }
            set { m_Image = value; }
        }

        /// <summary>
        /// 获取或设置帖子类型
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"TopicType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(TopicType.Normal)]
        public TopicType TopicType
        {
            get { return m_TopicType; }
            set { m_TopicType = value; }
        }

        /// <summary>
        /// 获取或设置帖子悬赏虚拟币额度（仅针对悬赏帖）
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"RewardCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int RewardCount
        {
            get { return m_RewardCount; }
            set { m_RewardCount = value; }
        }

        /// <summary>
        /// 获取或设置帖子编号
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"TopicId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TopicId
        {
            get { return m_TopicId; }
            set { m_TopicId = value; }
        }
    }
}