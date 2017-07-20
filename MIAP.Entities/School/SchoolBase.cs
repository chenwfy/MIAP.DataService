using System;
using MIAP.Protobuf.School;
using MIAP.Utility;

namespace MIAP.Entities.School
{
    /// <summary>
    /// 学校基本信息 - 对应数据库 School_SchoolBase 表结构
    /// </summary>
    public sealed class SchoolBase
    {
        /// <summary>
        /// 获取或设置学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置学校全称
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// 获取或设置学校简称
        /// </summary>
        public string ShortName { get; set; }

        /// <summary>
        /// 获取或设置学校英文名
        /// </summary>
        public string EnglishName { get; set; }

        /// <summary>
        /// 获取或设置用于学校管理平台的LOGO图标文件路径
        /// </summary>
        public string LargerLogo { get; set; }

        /// <summary>
        /// 获取或设置用于应用终端的LOGO图标文件路径
        /// </summary>
        public string SmallerLogo { get; set; }

        /// <summary>
        /// 获取或设置学校剪影图片文件路径（可用于学校用户默认个人信息背景图片）
        /// </summary>
        public string SceneryLogo { get; set; }

        /// <summary>
        /// 获取或设置学校所在城市
        /// </summary>
        public string AreaCity { get; set; }

        /// <summary>
        /// 获取或设置学校所在详细地址
        /// </summary>
        public string AreaAddress { get; set; }

        /// <summary>
        /// 获取或设置学校联系人
        /// </summary>
        public string Contacter { get; set; }

        /// <summary>
        /// 获取或设置学校联系电话
        /// </summary>
        public string Telphone { get; set; }

        /// <summary>
        /// 获取或设置学校联系电子邮件
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 获取或设置学校网站URL
        /// </summary>
        public string WebSite { get; set; }

        /// <summary>
        /// 获取或设置学校简介
        /// </summary>
        public string Introduce { get; set; }

        /// <summary>
        /// 获取或设置学校记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 提取SchoolInfo信息
        /// </summary>
        /// <returns></returns>
        public SchoolInfo ToSchoolInfo()
        {
            return new SchoolInfo
            {
                Id = this.SchoolId,
                Name = this.FullName,
                ShortName = this.ShortName,
                EnglishName = this.EnglishName,
                Logo = this.SmallerLogo.ImageUrlFixed(120, 60)
            };
        }
    }
}