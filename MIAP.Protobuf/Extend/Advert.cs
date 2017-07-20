using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Extend
{
    /// <summary>
    /// 广告信息类（Generated From Extend.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Advert")]
    public partial class Advert : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 广告编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 广告标题
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 广告图标文件路径
        /// </summary>
        private string m_Icon = "";

        /// <summary>
        /// 广告详情WEB页面URL
        /// </summary>
        private string m_Url = "";

        /// <summary>
        /// 广告详情WEB页面URL打开方式
        /// </summary>
        private AdUrlOpen m_UrlOpen = AdUrlOpen.WebView;

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
        /// 表示一条广告信息数据构成
        /// </summary>
        public Advert()
        {
        }

        /// <summary>
        /// 获取或设置广告编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置广告标题
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置广告图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Icon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Icon
        {
            get { return m_Icon; }
            set { m_Icon = value; }
        }

        /// <summary>
        /// 获取或设置广告内容页面URL
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Url", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Url
        {
            get { return m_Url; }
            set { m_Url = value; }
        }

        /// <summary>
        /// 获取或设置广告内容页面URL打开方式
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"UrlOpen", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(AdUrlOpen.WebView)]
        public AdUrlOpen UrlOpen
        {
            get { return m_UrlOpen; }
            set { m_UrlOpen = value; }
        }

        /// <summary>
        /// 广告URL打开方式枚举
        /// </summary>
        [ProtoContract(Name = @"AdUrlOpen")]
        public enum AdUrlOpen
        {
            /// <summary>
            /// 调用外部浏览器打开
            /// </summary>
            [ProtoEnum(Name = @"Web", Value = 0)]
            Web = 0,

            /// <summary>
            /// 调用浏览器控件打开
            /// </summary>
            [ProtoEnum(Name = @"WebView", Value = 1)]
            WebView = 1
        }
    }
}