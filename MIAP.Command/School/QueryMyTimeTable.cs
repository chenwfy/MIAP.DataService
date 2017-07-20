using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Entities.School;
using MIAP.Protobuf.User;
using MIAP.Protobuf.School;
using CSharpLib.Common;

namespace MIAP.Command.School
{
    /// <summary>
    /// 查询用户课表命令请求处理类
    /// </summary>
    public class QueryMyTimeTable : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            int days = 0;
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 4)
                days = BitConverter.ToInt32(cmdData.Reverse(), 0);

            if (days < 0)
                days = 0;

            if (Compiled.Debug)
                cmdData.Debug("=== School.QueryMyTimeTable 请求数据 ===");

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            if (userCache.UserSite > 0)
            {
                TimeTableList result = new TimeTableList();
                if (userCache.IsTrial)
                {
                    result.Message = "抱歉，您尚未报名成为正式学员，暂无课表！";    //可更换为约定的状态码，客户端可根据该状态码动态绘制界面功能，比如提示报名等
                    context.Flush<TimeTableList>(result);
                    return;
                }

                List<CoursesOneDay> lessonList = GetLessonList(context.UserId, userCache.UserSite, days);
                if (lessonList.Count == 0)
                {
                    //可更换为约定的状态码，客户端可根据该状态码动态绘制界面功能，比如提示咨询客服等
                    result.Message = days == 0 ? "抱歉，您的课表尚未排出！" : string.Format("抱歉，{0}天内您暂无上课安排！");   
                    context.Flush<TimeTableList>(result);
                    return;
                }

                result.CoursesOneDay = lessonList;
                context.Flush<TimeTableList>(result);
            }
            else
                context.Flush(RespondCode.DataInvalid);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="schoolId"></param>
        /// <param name="days"></param>
        /// <returns></returns>
        private static List<CoursesOneDay> GetLessonList(int userId, int schoolId, int days)
        {
            List<LessonInfo> allLessionList = SchoolBiz.GetUserLessions(schoolId, userId).ToList();
            DateTime dtNow = DateTime.Now.Date;
            if (days > 0)
                allLessionList.Where(l => l.LessonDate.Date.Subtract(dtNow).TotalDays >= 0 && l.LessonDate.Date.Subtract(dtNow).TotalDays <= days).ToList();

            List<CoursesOneDay> dayLessonsList = new List<CoursesOneDay>(0);
            if (allLessionList.Count > 0)
            {
                var daysList = allLessionList.Select(l => l.LessonDate.Date).Distinct().OrderBy(d => d);
                foreach (var item in daysList)
                {
                    var dayLessons = allLessionList.Where(l => l.LessonDate.Date == item);
                    var dayClassIds = dayLessons.Select(l => l.ClassId).Distinct();

                    List<CourseTime> ctList = new List<CourseTime>(0);
                    foreach (var cId in dayClassIds)
                    {
                        var dls = dayLessons.Where(l => l.ClassId == cId);
                        CourseTime ct = new CourseTime { Course = new CourseInfo { Name = dls.First().ClassName } };
                        foreach (var time in dls.OrderBy(t=>t.LessonStartTime))
                        {
                            ct.TimePart.Add(time.LessonStartTime.ToString("HH:mm") + " - " + time.LessonEndTime.ToString("HH:mm"));
                        }

                        ctList.Add(ct);
                    }

                    CoursesOneDay oneDay = new CoursesOneDay
                    {
                        Date = item.ToString("yyyy-MM-dd"),
                        CourseTime = ctList
                    };

                    dayLessonsList.Add(oneDay);
                }
            }
            return dayLessonsList;
        }
    }
}