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
    /// 应用渠道缓存辅助类
    /// </summary>
    public static class ChannelsHelper
    {
        private const string CacheKey = "Channels";

        /// <summary>
        /// 
        /// </summary>
        static ChannelsHelper()
        {
        }

        /// <summary>
        /// 判断渠道编码是否存在
        /// </summary>
        /// <param name="channelCode"></param>
        /// <returns></returns>
        public static bool ChannelCodeExists(this string channelCode)
        {
            return GetChannelCache().ContainsKey(channelCode);
        }

        /// <summary>
        /// 获取渠道编码对应的校验码
        /// </summary>
        /// <param name="channelCode"></param>
        /// <returns></returns>
        public static string GetChannelKey(this string channelCode)
        {
            if (!channelCode.ChannelCodeExists())
                return string.Empty;
            return GetChannelCache()[channelCode];
        }

        /// <summary>
        /// 存储渠道信息
        /// </summary>
        /// <param name="channels"></param>
        public static void ChannelsStorage(this IEnumerable<ChannelCodeKeyPair> channels)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.ConfigsMongoDbConn))
            {
                if (mc.Collection<ChannelCodeKeyPair>().Count() > 0)
                {
                    mc.Collection<ChannelCodeKeyPair>().Remove(new Document());
                }                    

                foreach (var item in channels)
                {
                    mc.Collection<ChannelCodeKeyPair>().Insert(item);
                }
            }
        }

        /// <summary>
        /// 从存储中读取渠道信息
        /// </summary>
        /// <returns></returns>
        private static IEnumerable<ChannelCodeKeyPair> GetChannelsFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.ConfigsMongoDbConn))
            {
                if (mc.Collection<ChannelCodeKeyPair>().Count() > 0)
                    return mc.Collection<ChannelCodeKeyPair>().Linq().ToList();
                return null;
            }
        }

        /// <summary>
        /// 从缓存中读取渠道信息
        /// </summary>
        /// <returns></returns>
        private static Dictionary<string, string> GetChannelCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal && cacheVal is Dictionary<string, string>)
                return (Dictionary<string, string>)cacheVal;

            Dictionary<string, string> channelDict = new Dictionary<string, string>(0);
            var channels = GetChannelsFromStorage();
            if (null != channels && channels.Count() > 0)
            {
                channelDict = channels.ToDictionary(c => c.Code, c => c.Key);
                Const.CoreCacheName.SetCache(CacheKey, channelDict);
            }
            return channelDict;
        }
    }

    #region

    /// <summary>
    /// 渠道编码和校验码值对信息
    /// </summary>
    public sealed class ChannelCodeKeyPair
    {
        /// <summary>
        /// 渠道编码
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 渠道编码对应的校验码
        /// </summary>
        public string Key { get; set; }
    }

    #endregion
}