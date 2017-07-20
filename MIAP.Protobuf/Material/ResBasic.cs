using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源基本信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResBasic")]
    public partial class ResBasic : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源编号
        /// </summary>
        private int m_ResId = default(int);

        /// <summary>
        /// 资源名称
        /// </summary>
        private string m_ResName = "";

        /// <summary>
        /// 资源内容难度级别
        /// </summary>
        private ResLevel m_ResLevel = ResLevel.Low;

        /// <summary>
        /// 资源内容类型
        /// </summary>
        private ResRange m_ResRange = ResRange.Spoken;

        /// <summary>
        /// 资源学习方式
        /// </summary>
        private ResMode m_ResMode = ResMode.Listening;

        /// <summary>
        /// 资源图标文件路径
        /// </summary>
        private string m_ResIconUrl = "";

        /// <summary>
        /// 资源简介
        /// </summary>
        private string m_Intro = "";

        /// <summary>
        /// 资源价格（以虚拟币计费，所以为整数型）
        /// </summary>
        private int m_Price = default(int);

        /// <summary>
        /// 价格描述
        /// </summary>
        private string m_PriceName = "";

        /// <summary>
        /// 优惠价格描述
        /// </summary>
        private string m_SalePriceName = "";

        /// <summary>
        /// 资源来源（出处）描述
        /// </summary>
        private string m_Source = "";

        /// <summary>
        /// 被下载总次数
        /// </summary>
        private int m_DownloadCount = default(int);

        /// <summary>
        /// 是否为精品资源
        /// </summary>
        private bool m_IsRefined = default(bool);

        /// <summary>
        /// 资源数据上架时间
        /// </summary>
        private string m_PutTime = "";

        /// <summary>
        /// 资源内容分块总数
        /// </summary>
        private int m_ItemCount = default(int);

        /// <summary>
        /// 是否仅校内可见
        /// </summary>
        private bool m_OnlyInSchool = default(bool);

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
        /// 表示一条资源数据信息的基本构成结构
        /// </summary>
        public ResBasic()
        {
        }

        /// <summary>
        /// 获取或设置资源数据编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ResId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ResId
        {
            get { return m_ResId; }
            set { m_ResId = value; }
        }

        /// <summary>
        /// 获取或设置资源数据名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ResName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ResName
        {
            get { return m_ResName; }
            set { m_ResName = value; }
        }

        /// <summary>
        /// 获取或设置资源内容难度级别
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"ResLevel", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResLevel.Low)]
        public ResLevel ResLevel
        {
            get { return m_ResLevel; }
            set { m_ResLevel = value; }
        }

        /// <summary>
        /// 获取或设置资源内容类型
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"ResRange", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResRange.Spoken)]
        public ResRange ResRange
        {
            get { return m_ResRange; }
            set { m_ResRange = value; }
        }

        /// <summary>
        /// 获取或设置资源内容学习方式
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"ResMode", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResMode.Listening)]
        public ResMode ResMode
        {
            get { return m_ResMode; }
            set { m_ResMode = value; }
        }

        /// <summary>
        /// 获取或设置资源图标文件路径
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"ResIconUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ResIconUrl
        {
            get { return m_ResIconUrl; }
            set { m_ResIconUrl = value; }
        }

        /// <summary>
        /// 获取或设置资源简介
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"Intro", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Intro
        {
            get { return m_Intro; }
            set { m_Intro = value; }
        }

        /// <summary>
        /// 获取或设置资源价格
        /// </summary>
        [ProtoMember(8, IsRequired = false, Name = @"Price", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Price
        {
            get { return m_Price; }
            set { m_Price = value; }
        }

        /// <summary>
        /// 获取或设置资源价格显示内容（和优惠价格显示内容 只有一个字段会赋值，区别在于显示的颜色不同）
        /// </summary>
        [ProtoMember(9, IsRequired = false, Name = @"PriceName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PriceName
        {
            get { return m_PriceName; }
            set { m_PriceName = value; }
        }

        /// <summary>
        /// 获取或设置资源优惠价格显示内容（和价格显示内容 只有一个字段会赋值，区别在于显示的颜色不同）
        /// </summary>
        [ProtoMember(10, IsRequired = false, Name = @"SalePriceName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string SalePriceName
        {
            get { return m_SalePriceName; }
            set { m_SalePriceName = value; }
        }

        /// <summary>
        /// 获取或设置资源出处描述
        /// </summary>
        [ProtoMember(11, IsRequired = false, Name = @"Source", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Source
        {
            get { return m_Source; }
            set { m_Source = value; }
        }

        /// <summary>
        /// 获取或设置资源被下载次数
        /// </summary>
        [ProtoMember(12, IsRequired = false, Name = @"DownloadCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int DownloadCount
        {
            get { return m_DownloadCount; }
            set { m_DownloadCount = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示是否为精品资源
        /// </summary>
        [ProtoMember(13, IsRequired = false, Name = @"IsRefined", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsRefined
        {
            get { return m_IsRefined; }
            set { m_IsRefined = value; }
        }

        /// <summary>
        /// 获取或设置资源上架时间（格式：yyyy-MM-dd HH:mm:ss）
        /// </summary>
        [ProtoMember(14, IsRequired = false, Name = @"PutTime", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PutTime
        {
            get { return m_PutTime; }
            set { m_PutTime = value; }
        }

        /// <summary>
        /// 获取或设置资源内容条总数
        /// </summary>
        [ProtoMember(15, IsRequired = false, Name = @"ItemCount", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ItemCount
        {
            get { return m_ItemCount; }
            set { m_ItemCount = value; }
        }

        /// <summary>
        /// 获取或设置一个值表示该资源是否仅校内可见
        /// </summary>
        [ProtoMember(16, IsRequired = false, Name = @"OnlyInSchool", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool OnlyInSchool
        {
            get { return m_OnlyInSchool; }
            set { m_OnlyInSchool = value; }
        }
    }
}