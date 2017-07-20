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
    /// 社交部分相关配置信息辅助类
    /// </summary>
    public static class SocialConfigs
    {
        private const string CacheKey = "SocialConfigs";

        /// <summary>
        /// 
        /// </summary>
        static SocialConfigs()
        {
        }

        /// <summary>
        /// 社交模块相关配置信息写入存储
        /// </summary>
        /// <param name="config"></param>
        public static void SocialConfigStorage(this SocialConfig config)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<SocialConfig>().Count() > 0)
                {
                    SocialConfig orgConfig = mc.Collection<SocialConfig>().Linq().First();
                    mc.Collection<SocialConfig>().Update(config, orgConfig);
                }
                else
                    mc.Collection<SocialConfig>().Insert(config);
            }
        }

        /// <summary>
        /// 从存储中读取社交模块相关配置信息
        /// </summary>
        /// <returns></returns>
        public static SocialConfig GetSocialConfigFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<SocialConfig>().Count() > 0)
                    return mc.Collection<SocialConfig>().Linq().First();
            }
            return null;
        }

        /// <summary>
        /// 从缓存读取社交模块相关配置信息
        /// </summary>
        /// <returns></returns>
        public static SocialConfig GetSocialConfigCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal)
                return (SocialConfig)cacheVal;

            SocialConfig config = GetSocialConfigFromStorage();
            if (null != config)
                Const.CoreCacheName.SetCache(CacheKey, config);
            return config;
        }
    }

    /// <summary>
    /// 社交模块相关配置信息
    /// </summary>
    public sealed class SocialConfig
    {
        /// <summary>
        /// 群组默认图标路径
        /// </summary>
        public string DefaultGroupIcon { get; set; }

        /// <summary>
        /// 群组最大成员数
        /// </summary>
        public int GroupMaxMemberCount { get; set; }

        /// <summary>
        /// 被关注增加经验值
        /// </summary>
        public int BeFollowedExpChanged { get; set; }

        /// <summary>
        /// 被关注增加虚拟币数量
        /// </summary>
        public int BeFollowedCoinChanged { get; set; }
    }
}