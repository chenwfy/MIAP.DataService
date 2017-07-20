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
    /// 敏感关键词缓存辅助类
    /// </summary>
    public static class FilterHelper
    {
        private const string CacheKey = "SensitiveWords";

        /// <summary>
        /// 
        /// </summary>
        static FilterHelper()
        { 
        }

        /// <summary>
        /// 获取关键词列表
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<string> GetSensitiveWords()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal && cacheVal is FilterWords)
                return ((FilterWords)cacheVal).Words;

            FilterWords words = GetSensitiveWordsFromStorage();
            if (null == words)
                return new List<string>(0);

            Const.CoreCacheName.SetCache(CacheKey, words);
            return words.Words;
        }

        /// <summary>
        /// 将关键词列表写入存储
        /// </summary>
        /// <param name="filterWords"></param>
        public static void SensitiveWordsStorage(this FilterWords filterWords)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.ConfigsMongoDbConn))
            {
                FilterWords orgWords = mc.Collection<FilterWords>().Linq().FirstOrDefault();
                if (null == orgWords)
                    mc.Collection<FilterWords>().Insert(filterWords);
                else
                    mc.Collection<FilterWords>().Update(filterWords, orgWords);
            }
        }

        /// <summary>
        /// 从存储中读取关键词列表
        /// </summary>
        /// <returns></returns>
        private static FilterWords GetSensitiveWordsFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.ConfigsMongoDbConn))
            {
                return mc.Collection<FilterWords>().Linq().FirstOrDefault();
            }
        }
    }

    #region

    /// <summary>
    /// 敏感关键词列表
    /// </summary>
    public sealed class FilterWords
    {
        /// <summary>
        /// 获取或设置关键词列表
        /// </summary>
        public IEnumerable<string> Words { get; set; }
    }

    #endregion
}