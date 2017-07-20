using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Protobuf.User;
using MIAP.Protobuf.School;
using CSharpLib.Common;

namespace MIAP.Command.School
{
    /// <summary>
    /// 请求学校客服列表命令执行类
    /// </summary>
    public class QueryCustomerService : ExecuteBase<DataContext>
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
                var scUserIds = SchoolBiz.GetSchoolUserIds(userCache.UserSite, (int)UserRole.CustomerService);
                CustomerServiceList csList = new CustomerServiceList { DataList = scUserIds.Select(id => UserBiz.ReadUserCacheInfo(id).ToUserBase()).ToList() };
                context.Flush<CustomerServiceList>(csList);
                return;
            }
            context.Flush(RespondCode.DataInvalid);
        }
    }
}