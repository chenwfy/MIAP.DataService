using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Entities.School;
using MIAP.DataProvider;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 学校模块相关命令请求逻辑处理类
    /// </summary>
    public sealed class SchoolBiz
    {
        #region 学校信息

        /// <summary>
        /// 获取指定的学校信息
        /// </summary>
        /// <param name="schoolId">学校编号</param>
        /// <returns>学校信息</returns>
        public static SchoolBase GetSchoolBaseInfo(int schoolId)
        {
            return SchoolData.GetSchoolBaseInfo(schoolId);
        }

        /// <summary>
        /// 获取指定学校的课程信息列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<CourseBase> GetSchoolCoursePageList(int schoolId, int pageIndex, int pageSize)
        {
            List<CourseBase> courseList = SchoolData.GetSchoolCourses(schoolId).ToList();
            PageResult<CourseBase> pageData = new PageResult<CourseBase>
            {
                RecordCount = courseList.Count,
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageData.Data = courseList.SkipTake<CourseBase>(pageData.PageSize, pageData.PageIndex);
            return pageData;
        }

        #endregion

        #region 学校客服

        /// <summary>
        /// 获取指定学校、指定角色类型的用户编号列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="userRole"></param>
        /// <returns></returns>
        public static IEnumerable<int> GetSchoolUserIds(int schoolId, int userRole)
        {
            return SchoolData.GetSchoolUserIds(schoolId, userRole);
        }

        #endregion

        #region 课表

        /// <summary>
        /// 获取指定用户的所有课时信息列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static IEnumerable<LessonInfo> GetUserLessions(int schoolId, int userId)
        {
            return SchoolData.GetUserLessions(schoolId, userId);
        }

        #endregion
    }
}