using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.User;
using MIAP.Entities.School;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 学校模块部分数据库操作类
    /// </summary>
    public sealed class SchoolData
    {
        /// <summary>
        /// 获取指定的学校信息
        /// </summary>
        /// <param name="schoolId">学校编号</param>
        /// <returns>学校信息</returns>
        public static SchoolBase GetSchoolBaseInfo(int schoolId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_School_GetDetail", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("SchoolId", schoolId);
                SchoolBase resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new SchoolBase
                        {
                            SchoolId = (int)reader["SchoolId"],
                            FullName = (string)reader["FullName"],
                            ShortName = (string)reader["ShortName"],
                            EnglishName = (string)reader["EnglishName"],
                            LargerLogo = (string)reader["LargerLogo"],
                            SmallerLogo = (string)reader["SmallerLogo"],
                            SceneryLogo = (string)reader["SceneryLogo"],
                            AreaCity = (string)reader["AreaCity"],
                            AreaAddress = (string)reader["AreaAddress"],
                            Contacter = (string)reader["Contacter"],
                            Telphone = (string)reader["Telphone"],
                            Email = (string)reader["Email"],
                            WebSite = (string)reader["WebSite"],
                            Introduce = (string)reader["Introduce"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定学校的课程信息列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <returns></returns>
        public static IEnumerable<CourseBase> GetSchoolCourses(int schoolId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_School_GetCourses", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("SchoolId", schoolId);
                List<CourseBase> resultData = new List<CourseBase>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new CourseBase
                        {
                            CourseId = (int)reader["CourseId"],
                            CategoryId = (int)reader["CategoryId"],
                            SchoolId = (int)reader["SchoolId"],
                            CourseName = (string)reader["CourseName"],
                            CourseCode = (string)reader["CourseCode"],
                            CourseIcon = (string)reader["CourseIcon"],
                            Intro = (string)reader["Intro"],
                            Comment = (string)reader["Comment"],
                            PriceName = (string)reader["PriceName"],
                            SalePriceName = (string)reader["SalePriceName"],
                            Sort = (int)reader["Sort"],
                            IsEnabled = (bool)reader["IsEnabled"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定学校、指定角色类型的用户编号列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="userRole"></param>
        /// <returns></returns>
        public static IEnumerable<int> GetSchoolUserIds(int schoolId, int userRole)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_School_GetCsUsers", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("SchoolId, UserRole", schoolId, userRole);
                return cmd.ExecuteDataTable().AsEnumerable().Select(dr => dr.Field<int>("UserId"));
            }
        }

        /// <summary>
        /// 获取指定用户的所有课时信息列表
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static IEnumerable<LessonInfo> GetUserLessions(int schoolId, int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_School_GetUserLessons", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("SchoolId", schoolId);
                List<LessonInfo> resultData = new List<LessonInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new LessonInfo
                        {
                            CourseId = (int)reader["CourseId"],
                            LessonId = (int)reader["LessonId"],
                            ClassId = (int)reader["ClassId"],
                            LessonDate = (DateTime)reader["LessonDate"],
                            LessonStartTime = (DateTime)reader["LessonStartTime"],
                            LessonEndTime = (DateTime)reader["LessonEndTime"],
                            CreateDate = (DateTime)reader["CreateDate"],
                            ClassName = (string)reader["ClassName"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }
    }
}