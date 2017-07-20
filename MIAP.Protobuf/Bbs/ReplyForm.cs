using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 回贴表单信息类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ReplyForm")]
    public partial class ReplyForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 回帖编号
        /// </summary>
        private int m_ReplyId = default(int);

        /// <summary>
        /// 回帖针对的用户编号
        /// </summary>
        private int m_TargetId = default(int);

        /// <summary>
        /// 回帖音频内容
        /// </summary>
        private List<MediaDetail> m_Voices = new List<MediaDetail>();

        /// <summary>
        /// 回帖内容
        /// </summary>
        private string m_Content = "";

        /// <summary>
        /// 回帖图片内容
        /// </summary>
        private List<MediaDetail> m_Image = new List<MediaDetail>();

        /// <summary>
        /// 回帖目标帖子编号
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
        /// 表示一个发布回帖信息的表单数据构成
        /// </summary>
        public ReplyForm()
        {
        }

        /// <summary>
        /// 获取或设置回帖编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ReplyId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ReplyId
        {
            get { return m_ReplyId; }
            set { m_ReplyId = value; }
        }

        /// <summary>
        /// 获取或设置回帖针对的用户编号
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"TargetId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TargetId
        {
            get { return m_TargetId; }
            set { m_TargetId = value; }
        }

        /// <summary>
        /// 获取或设置回帖的音频内容
        /// </summary>
        [ProtoMember(3, Name = @"Voices", DataFormat = DataFormat.Default)]
        public List<MediaDetail> Voices
        {
            get { return m_Voices; }
            set { m_Voices = value; }
        }

        /// <summary>
        /// 获取或设置回帖的文字内容
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Content", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Content
        {
            get { return m_Content; }
            set { m_Content = value; }
        }

        /// <summary>
        /// 获取或设置回帖的图片内容
        /// </summary>
        [ProtoMember(5, Name = @"Image", DataFormat = DataFormat.Default)]
        public List<MediaDetail> Image
        {
            get { return m_Image; }
            set { m_Image = value; }
        }

        /// <summary>
        /// 获取或设置回帖的目标帖子编号
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"TopicId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TopicId
        {
            get { return m_TopicId; }
            set { m_TopicId = value; }
        }
    }
}