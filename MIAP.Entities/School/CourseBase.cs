using System;
using MIAP.Protobuf.School;
using MIAP.Utility;

namespace MIAP.Entities.School
{
    /// <summary>
    /// 课程基本信息，对应数据库 Course_Courses 表结构
    /// </summary>
    public sealed class CourseBase
    {
        /// <summary>
        /// 获取或设置课程编号
        /// </summary>
        public int CourseId { get; set; }

        /// <summary>
        /// 获取或设置课程所属分类编号
        /// </summary>
        public int CategoryId { get; set; }

        /// <summary>
        /// 获取或设置课程所属学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置课程名称
        /// </summary>
        public string CourseName { get; set; }

        /// <summary>
        /// 获取或设置课程标识码
        /// </summary>
        public string CourseCode { get; set; }

        /// <summary>
        /// 获取或设置课程图标文件路径
        /// </summary>
        public string CourseIcon { get; set; }

        /// <summary>
        /// 获取或设置课程简介
        /// </summary>
        public string Intro { get; set; }

        /// <summary>
        /// 获取或设置课程详细描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置课程价格
        /// </summary>
        public string PriceName { get; set; }

        /// <summary>
        /// 获取或设置课程优惠价格
        /// </summary>
        public string SalePriceName { get; set; }

        /// <summary>
        /// 获取或设置课程排序
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示该课程数据是否可用
        /// </summary>
        public bool IsEnabled { get; set; }

        /// <summary>
        /// 获取或设置课程数据记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 提取CourseInfo信息
        /// </summary>
        /// <returns></returns>
        public CourseInfo ToCourseInfo()
        {
            return new CourseInfo
            {
                Id = this.CourseId,
                Name = this.CourseName,
                Intro = this.Intro,
                Icon = this.CourseIcon.ImageUrlFixed(120, 120),
                Price = this.PriceName,
                SalePrice =this.SalePriceName,
                WebUrl = this.CourseId.GetCourseWebUrl()
            };
        }
    }
}