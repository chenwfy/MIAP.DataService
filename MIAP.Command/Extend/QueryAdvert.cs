using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.User;
using MIAP.Protobuf.Extend;
using CSharpLib.Common;

namespace MIAP.Command.Extend
{
    /// <summary>
    /// 获取广告列表命令请求处理类
    /// </summary>
    public class QueryAdvert : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            int userSite = userCache.UserSite;
            string appChannel = context.ReqChannel;

            var ads = ExtendBiz.GetTopAdverts(appChannel, userSite, 5);
            AdvertList adList = new AdvertList{ DataList = ads.Select(a=>a.ToAdvert()).ToList() };
            context.Flush<AdvertList>(adList);
        }
    }
}