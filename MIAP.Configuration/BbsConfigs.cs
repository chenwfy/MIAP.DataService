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
    /// 论坛相关配置信息辅助类
    /// </summary>
    public static class BbsConfigs
    {
        private const string CacheKey = "BbsConfigs";

        /// <summary>
        /// 
        /// </summary>
        static BbsConfigs()
        {
        }

        /// <summary>
        /// 论坛相关配置信息写入存储
        /// </summary>
        /// <param name="config"></param>
        public static void BbsConfigStorage(this BbsConfig config)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<BbsConfig>().Count() > 0)
                {
                    BbsConfig orgConfig = mc.Collection<BbsConfig>().Linq().First();
                    mc.Collection<BbsConfig>().Update(config, orgConfig);
                }
                else
                    mc.Collection<BbsConfig>().Insert(config);
            }
        }

        /// <summary>
        /// 从存储中读取论坛相关配置信息
        /// </summary>
        /// <returns></returns>
        public static BbsConfig GetBbsConfigFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<BbsConfig>().Count() > 0)
                    return mc.Collection<BbsConfig>().Linq().First();
            }
            return null;
        }

        /// <summary>
        /// 从缓存读取论坛相关配置信息
        /// </summary>
        /// <returns></returns>
        public static BbsConfig GetBbsConfigCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal)
                return (BbsConfig)cacheVal;

            BbsConfig config = GetBbsConfigFromStorage();
            if (null != config)
                Const.CoreCacheName.SetCache(CacheKey, config);
            return config;
        }
    }

    /// <summary>
    /// 论坛相关配置信息
    /// </summary>
    public sealed class BbsConfig
    {
        /// <summary>
        /// 帖子自动过期天数
        /// </summary>
        public int TopicExpiredDays { get; set; }

        /// <summary>
        /// 默认发帖是否通过审核
        /// </summary>
        public bool TopicIsAudited { get; set; }

        /// <summary>
        /// 默认回帖是否通过审核
        /// </summary>
        public bool PostIsAudited { get; set; }

        /// <summary>
        /// 论坛发布帖子增加经验值
        /// </summary>
        public int CreateTopicExpChanged { get; set; }

        /// <summary>
        /// 论坛发布帖子增加虚拟币数量
        /// </summary>
        public int CreateTopicCoinChanged { get; set; }

        /// <summary>
        /// 发布的帖子被置顶增加经验值
        /// </summary>
        public int TopicBeStickedExpChanged { get; set; }

        /// <summary>
        /// 发布的帖子被置顶增加虚拟币数量
        /// </summary>
        public int TopicBeStickedCoinChanged { get; set; }

        /// <summary>
        /// 发布的帖子被设为精华增加经验值
        /// </summary>
        public int TopicBeRefinedExpChanged { get; set; }

        /// <summary>
        /// 发布的帖子被设为精华增加虚拟币数量
        /// </summary>
        public int TopicBeRefinedCoinChanged { get; set; }

        /// <summary>
        /// 发布回帖增加经验值
        /// </summary>
        public int CreatePostExpChanged { get; set; }

        /// <summary>
        /// 发布回帖增加虚拟币数量
        /// </summary>
        public int CreatePostCoinChanged { get; set; }

        /// <summary>
        /// 回帖被设为最佳回复增加经验值
        /// </summary>
        public int PostBeBestAnswerExpChanged { get; set; }

        /// <summary>
        /// 回帖被设为最佳回复增加虚拟币数量（悬赏贴除外）
        /// </summary>
        public int PostBeBestAnswerCoinChanged { get; set; }
    }
}