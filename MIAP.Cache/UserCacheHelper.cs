using System;
using System.Collections.Generic;
using System.Linq;
using CSharpLib.Common;
using CSharpLib.Common.Cache;
using CSharpLib.Common.NoSql;
using MongoDB;

namespace MIAP.Cache
{
    /// <summary>
    /// 用户信息缓存辅助类
    /// </summary>
    public static class UserCacheHelper
    {
        /// <summary>
        /// 
        /// </summary>
        static UserCacheHelper()
        {
            /*
            //创建索引
            using (MongoDbContext mc = new MongoDbContext(Const.UsersMongoDbConn))
            {
                mc.Collection<UserCacheData>().Metadata.CreateIndex(new Document { { "UserId", 1 } }, false);
            }
            */
        }

        /// <summary>
        /// 将用户缓存信息写入存储
        /// </summary>
        /// <param name="cacheData">用户缓存信息数据</param>
        public static void UserCacheStorage(this UserCacheData cacheData)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.UsersMongoDbConn))
            {
                Func<UserCacheData, bool> func = u => u.UserId == cacheData.UserId;
                if (mc.Collection<UserCacheData>().Count(func) > 0)
                    mc.Collection<UserCacheData>().Update(cacheData, func);
                else
                    mc.Collection<UserCacheData>().Insert(cacheData);
            }
        }

        /// <summary>
        /// 从存储中读取用户缓存信息
        /// </summary>
        /// <param name="userId">待读取的目标用户编号</param>
        /// <returns></returns>
        public static UserCacheData GetUserCacheFromStorage(this int userId)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.UsersMongoDbConn))
            {
                Func<UserCacheData, bool> func = u => u.UserId == userId;
                if (mc.Collection<UserCacheData>().Count(func) > 0)
                    return mc.Collection<UserCacheData>().FindOne(func);
                return null;
            }
        }
    }

    /// <summary>
    /// 用户缓存信息
    /// </summary>
    public sealed class UserCacheData
    {
        /// <summary>
        /// 用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 用户缓存信息经Protobuf序列化后的数据
        /// </summary>
        public byte[] CacheData { get; set; }
    }
}