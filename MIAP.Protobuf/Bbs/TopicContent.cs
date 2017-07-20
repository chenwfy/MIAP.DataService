using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子内容块类型枚举
    /// </summary>
    [ProtoContract(Name = @"ContentType")]
    public enum ContentType
    {
        /// <summary>
        /// 文字内容
        /// </summary>
        [ProtoEnum(Name = @"Text", Value = 0)]
        Text = 0,

        /// <summary>
        /// 图像内容
        /// </summary>
        [ProtoEnum(Name = @"Image", Value = 1)]
        Image = 1,

        /// <summary>
        /// 声音内容
        /// </summary>
        [ProtoEnum(Name = @"Voice", Value = 2)]
        Voice = 2,

        /// <summary>
        /// 视频内容
        /// </summary>
        [ProtoEnum(Name = @"Video", Value = 3)]
        Video = 3,

        /// <summary>
        /// 地址内容
        /// </summary>
        [ProtoEnum(Name = @"Address", Value = 4)]
        Address = 4,

        /// <summary>
        /// 电话号码内容
        /// </summary>
        [ProtoEnum(Name = @"Telphone", Value = 5)]
        Telphone = 5,

        /// <summary>
        /// 联系人内容
        /// </summary>
        [ProtoEnum(Name = @"Contact", Value = 6)]
        Contact = 6
    }

    /// <summary>
    /// 帖子内容块信息结构描述类（Generated From Bbs.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ReplyDetail")]
    public partial class TopicContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 内容块类型
        /// </summary>
        private ContentType m_ContentType = ContentType.Text;

        /// <summary>
        /// 内容块数据
        /// </summary>
        private byte[] m_Data = null;

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
        /// 帖子内容块信息结构
        /// </summary>
        public TopicContent()
        {
        }

        /// <summary>
        /// 获取或设置帖子内容块数据类型
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ContentType", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ContentType.Text)]
        public ContentType ContentType
        {
            get { return m_ContentType; }
            set { m_ContentType = value; }
        }

        /// <summary>
        /// 获取或设置帖子内容块数据
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }
    }

    /// <summary>
    /// 文字类型内容块信息结构描述
    /// </summary>
    [Serializable, ProtoContract(Name = @"TextContent")]
    public partial class TextContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 文字内容
        /// </summary>
        private string m_Text = "";

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
        /// 文字类型内容块信息结构
        /// </summary>
        public TextContent()
        {
        }

        /// <summary>
        /// 获取或设置文字类型内容块内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Text", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Text
        {
            get { return m_Text; }
            set { m_Text = value; }
        }
    }

    /// <summary>
    /// 图片内容块数据信息结构描述
    /// </summary>
    [Serializable, ProtoContract(Name = @"ImageContent")]
    public partial class ImageContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 缩略图URL
        /// </summary>
        private string m_ThumbUrl = "";

        /// <summary>
        /// 原图URL
        /// </summary>
        private string m_ImageUrl = "";

        /// <summary>
        /// 原图宽度
        /// </summary>
        private int m_Width = default(int);

        /// <summary>
        /// 原图高度
        /// </summary>
        private int m_Height = default(int);

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
        /// 图片内容块数据信息结构
        /// </summary>
        public ImageContent()
        {
        }

        /// <summary>
        /// 获取或设置图片内容缩略图URL
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ThumbUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ThumbUrl
        {
            get { return m_ThumbUrl; }
            set { m_ThumbUrl = value; }
        }

        /// <summary>
        /// 获取或设置图片内容原图URL
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ImageUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ImageUrl
        {
            get { return m_ImageUrl; }
            set { m_ImageUrl = value; }
        }

        /// <summary>
        /// 获取或设置图片内容原图宽度
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Width", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Width
        {
            get { return m_Width; }
            set { m_Width = value; }
        }

        /// <summary>
        /// 获取或设置图片内容原图高度
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Height", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Height
        {
            get { return m_Height; }
            set { m_Height = value; }
        }
    }

    /// <summary>
    /// 声音内容块信息结构描述
    /// </summary>
    [Serializable, ProtoContract(Name = @"VoiceContent")]
    public partial class VoiceContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 文件URL
        /// </summary>
        private string m_Url = "";

        /// <summary>
        /// 文件播放时长
        /// </summary>
        private int m_Duration = default(int);

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
        /// 声音内容块信息结构
        /// </summary>
        public VoiceContent()
        {
        }

        /// <summary>
        /// 获取或设置声音文件URL
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Url", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Url
        {
            get { return m_Url; }
            set { m_Url = value; }
        }

        /// <summary>
        /// 获取或设置声音文件播放时长
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Duration", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue("")]
        public int Duration
        {
            get { return m_Duration; }
            set { m_Duration = value; }
        }
    }

    /// <summary>
    /// 视频内容块信息结构描述
    /// </summary>
    [Serializable, ProtoContract(Name = @"VideoContent")]
    public partial class VideoContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 文件URL
        /// </summary>
        private string m_Url = "";

        /// <summary>
        /// 文件播放时长
        /// </summary>
        private int m_Duration = default(int);

        /// <summary>
        /// 视频文件缩略图URL
        /// </summary>
        private string m_ThumbUrl = "";

        /// <summary>
        /// 视频文件宽度
        /// </summary>
        private int m_Width = default(int);

        /// <summary>
        /// 视频文件高度
        /// </summary>
        private int m_Height = default(int);

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
        /// 视频内容块信息结构
        /// </summary>
        public VideoContent()
        {
        }

        /// <summary>
        /// 获取或设置视频文件URL
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Url", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Url
        {
            get { return m_Url; }
            set { m_Url = value; }
        }

        /// <summary>
        /// 获取或设置视频文件播放时长
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Duration", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue("")]
        public int Duration
        {
            get { return m_Duration; }
            set { m_Duration = value; }
        }

        /// <summary>
        /// 获取或设置视频文件缩略图URL
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"ThumbUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ThumbUrl
        {
            get { return m_ThumbUrl; }
            set { m_ThumbUrl = value; }
        }
        
        /// <summary>
        /// 获取或设置视频内容宽度
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Width", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Width
        {
            get { return m_Width; }
            set { m_Width = value; }
        }

        /// <summary>
        /// 获取或设置视频片内容高度
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Height", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Height
        {
            get { return m_Height; }
            set { m_Height = value; }
        }
    }

    /// <summary>
    /// 地址信息内容块数据结构描述类
    /// </summary>
    [Serializable, ProtoContract(Name = @"AddressContent")]
    public partial class AddressContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 实际地址内容
        /// </summary>
        private string m_Address = "";

        /// <summary>
        /// 实际地址对应的经纬度 - 经度
        /// </summary>
        private double m_Longitude = default(double);

        /// <summary>
        /// 实际地址对应的经纬度 - 纬度
        /// </summary>
        private double m_Latitudes = default(double);

        /// <summary>
        /// 供界面显示的文字内容
        /// </summary>
        private string m_ShowText = "";

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
        /// 地址信息内容块数据结构
        /// </summary>
        public AddressContent()
        {
        }

        /// <summary>
        /// 获取或设置实际地址内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Address", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Address
        {
            get { return m_Address; }
            set { m_Address = value; }
        }

        /// <summary>
        /// 获取或设置实际地址位置坐标之经度
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Longitude", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(double))]
        public double Longitude
        {
            get { return m_Longitude; }
            set { m_Longitude = value; }
        }

        /// <summary>
        /// 获取或设置实际地址位置坐标之纬度
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Latitudes", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(double))]
        public double Latitudes
        {
            get { return m_Latitudes; }
            set { m_Latitudes = value; }
        }

        /// <summary>
        /// 获取或设置供界面显示的文字内容
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"ShowText", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ShowText
        {
            get { return m_ShowText; }
            set { m_ShowText = value; }
        }
    }

    /// <summary>
    /// 电话号码类型内容块信息结构描述类
    /// </summary>
    [Serializable, ProtoContract(Name = @"TelphoneContent")]
    public partial class TelphoneContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 可供拨打的电话号码
        /// </summary>
        private string m_TelNumber = "";

        /// <summary>
        /// 供界面显示的文字内容
        /// </summary>
        private string m_ShowText = "";

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
        /// 电话号码类型内容块信息结构
        /// </summary>
        public TelphoneContent()
        {
        }

        /// <summary>
        /// 获取或设置实际可供拨打的电话号码内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"TelNumber", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string TelNumber
        {
            get { return m_TelNumber; }
            set { m_TelNumber = value; }
        }

        /// <summary>
        /// 获取或设置供界面显示的文字内容
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ShowText", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ShowText
        {
            get { return m_ShowText; }
            set { m_ShowText = value; }
        }
    }

    /// <summary>
    /// 联系人类型内容块信息结构描述类
    /// </summary>
    [Serializable, ProtoContract(Name = @"ContactContent")]
    public partial class ContactContent : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 供界面显示的文字内容
        /// </summary>
        private string m_ShowText = "";

        /// <summary>
        /// 联系人用户基本信息
        /// </summary>
        private UserBase m_UserData = null;

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
        /// 联系人类型内容块信息结构
        /// </summary>
        public ContactContent()
        {
        }

        /// <summary>
        /// 获取或设置供界面显示的文字内容
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ShowText", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ShowText
        {
            get { return m_ShowText; }
            set { m_ShowText = value; }
        }

        /// <summary>
        /// 获取或设置联系人用户基本信息
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"UserData", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public UserBase UserData
        {
            get { return m_UserData; }
            set { m_UserData = value; }
        }
    }
}