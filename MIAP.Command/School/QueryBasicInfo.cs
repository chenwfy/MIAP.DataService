using System;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.User;
using MIAP.Entities.School;
using MIAP.Protobuf.School;
using CSharpLib.Common;

namespace MIAP.Command.School
{
    /// <summary>
    /// 查询学校基本信息命令请求执行类
    /// </summary>
    public class QueryBasicInfo : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            if (userCache.UserSite > 0)
            {
                SchoolBase schoolBaseInfo = SchoolBiz.GetSchoolBaseInfo(userCache.UserSite);
                if (null != schoolBaseInfo)
                {
                    context.Flush<SchoolInfo>(schoolBaseInfo.ToSchoolInfo());
                    return;
                }
            }

            context.Flush(RespondCode.DataInvalid);
        }
    }
}