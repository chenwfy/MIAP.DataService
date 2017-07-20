using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 课程信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CourseInfo")]
    public partial class CourseInfo : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 课程编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 课程名称
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 课程图标文件路径
        /// </summary>
        private string m_Icon = "";

        /// <summary>
        /// 课程简介
        /// </summary>
        private string m_Intro = "";

        /// <summary>
        /// 课程价格
        /// </summary>
        private string m_Price = "";

        /// <summary>
        /// 课程优惠价
        /// </summary>
        private string m_SalePrice = "";

        /// <summary>
        /// 详情信息链接WEB页面URL
        /// </summary>
        private string m_WebUrl = "";

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
        /// 课程信息
        /// </summary>
        public CourseInfo()
        {
        }

        /// <summary>
        /// 获取或设置课程编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置课程名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置课程图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Icon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Icon
        {
            get { return m_Icon; }
            set { m_Icon = value; }
        }

        /// <summary>
        /// 获取或设置课程简介
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Intro", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Intro
        {
            get { return m_Intro; }
            set { m_Intro = value; }
        }

        /// <summary>
        /// 获取或设置课程价格
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Price", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Price
        {
            get { return m_Price; }
            set { m_Price = value; }
        }

        /// <summary>
        /// 获取或设置课程优惠价
        /// </summary>
        [ProtoMember(6, IsRequired = false, Name = @"SalePrice", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string SalePrice
        {
            get { return m_SalePrice; }
            set { m_SalePrice = value; }
        }

        /// <summary>
        /// 获取或设置课程详情信息WEB页面URL
        /// </summary>
        [ProtoMember(7, IsRequired = false, Name = @"WebUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string WebUrl
        {
            get { return m_WebUrl; }
            set { m_WebUrl = value; }
        }
    }
}