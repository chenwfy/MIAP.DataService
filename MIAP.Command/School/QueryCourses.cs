using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Entities.School;
using MIAP.Protobuf.School;
using CSharpLib.Common;

namespace MIAP.Command.School
{
    /// <summary>
    /// 请求学校课程列表命令执行类
    /// </summary>
    public class QueryCourses : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 0)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            CourseQuery query = cmdData.ProtoBufDeserialize<CourseQuery>();
            if (Compiled.Debug)
                query.Debug("=== School.QueryCourses 请求数据 ===");

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            if (userCache.UserSite > 0)
            {
                PageResult<CourseBase> pageResult = SchoolBiz.GetSchoolCoursePageList(userCache.UserSite, query.QueryIndex, query.QuerySize);
                CourseList result = new CourseList
                {
                    RecordCount = pageResult.RecordCount,
                    QueryIndex = pageResult.PageIndex,
                    QuerySize = pageResult.PageSize,
                    IndexCount = pageResult.PageCount,
                    DataList = pageResult.Data.Select(c => c.ToCourseInfo()).ToList()
                };
                context.Flush<CourseList>(result);
                return;
            }

            context.Flush(RespondCode.DataInvalid);
        }
    }
}