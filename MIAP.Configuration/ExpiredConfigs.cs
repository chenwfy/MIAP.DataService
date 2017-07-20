using System;
using System.Collections.Generic;
using System.Linq;
using CSharpLib.Common;
using CSharpLib.Common.Cache;
using CSharpLib.Common.NoSql;
using MongoDB;

namespace MIAP.Configuration
{
    /// <summary>
    /// 应用会话超时配置信息辅助类
    /// </summary>
    public static class ExpiredConfigs
    {
        private const string CacheKey = "ExpiredConfigs";

        /// <summary>
        /// 
        /// </summary>
        static ExpiredConfigs()
        {
        }

        /// <summary>
        /// 获取会话状态维持时长，单位：分钟
        /// </summary>
        /// <returns>会话状态维持时长</returns>
        public static int GetSessionExpired()
        {
            ExpiredConfig config = GetExpiredConfigCache();
            if (null != config)
                return config.SessionExpired;
            return 0;
        }

        /// <summary>
        /// 获取会话心跳有效时长，单位：秒
        /// </summary>
        /// <returns></returns>
        public static int GetPipeExpired()
        {
            ExpiredConfig config = GetExpiredConfigCache();
            if (null != config)
                return config.PipeExpired;
            return 60;
        }

        /// <summary>
        /// 会话超时配置信息写入存储
        /// </summary>
        /// <param name="config"></param>
        public static void ExpiredConfigsStorage(this ExpiredConfig config)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<ExpiredConfig>().Count() > 0)
                {
                    ExpiredConfig orgConfig = mc.Collection<ExpiredConfig>().Linq().First();
                    mc.Collection<ExpiredConfig>().Update(config, orgConfig);
                }
                else
                    mc.Collection<ExpiredConfig>().Insert(config);
            }
        }

        /// <summary>
        /// 从存储中读取会话超时配置信息
        /// </summary>
        /// <returns></returns>
        public static ExpiredConfig GetExpiredConfigsFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<ExpiredConfig>().Count() > 0)
                    return mc.Collection<ExpiredConfig>().Linq().First();
            }
            return null;
        }

        /// <summary>
        /// 从缓存中读取会话超时配置信息
        /// </summary>
        /// <returns></returns>
        private static ExpiredConfig GetExpiredConfigCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal)
                return (ExpiredConfig)cacheVal;

            ExpiredConfig config = GetExpiredConfigsFromStorage();
            if (null != config)
                Const.CoreCacheName.SetCache(CacheKey, config);
            return config;
        }
    }

    /// <summary>
    /// 应用相关会话超时配置信息
    /// </summary>
    public sealed class ExpiredConfig
    {
        /// <summary>
        /// 用户登录会话有效期时长，单位：分钟
        /// </summary>
        public int SessionExpired { get; set; }

        /// <summary>
        /// 同步链路通道过期时长，单位：秒
        /// </summary>
        public int PipeExpired { get; set; }
    }
}