using System;

namespace MIAP.Entities.School
{
    /// <summary>
    /// 课表信息，对应数据库 Course_ClassLessons 表结构
    /// </summary>
    public sealed class LessonInfo
    {
        /// <summary>
        /// 获取或设置课时编号
        /// </summary>
        public int LessonId { get; set; }

        /// <summary>
        /// 获取或设置课时对应的课程编号
        /// </summary>
        public int CourseId { get; set; }

        /// <summary>
        /// 获取或设置课时对应的班级编号
        /// </summary>
        public int ClassId { get; set; }

        /// <summary>
        /// 班级编号对应的班级名称
        /// </summary>
        public string ClassName { get; set; }

        /// <summary>
        /// 获取或设置课时上课日期
        /// </summary>
        public DateTime LessonDate { get; set; }

        /// <summary>
        /// 获取或设置课时上课时间
        /// </summary>
        public DateTime LessonStartTime { get; set; }

        /// <summary>
        /// 获取或设置课时下课时间
        /// </summary>
        public DateTime LessonEndTime { get; set; }

        /// <summary>
        /// 获取或设置课时记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}