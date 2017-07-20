using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities;
using MIAP.Entities.Material;
using MIAP.DataProvider;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 学习教程、资源部分命令请求逻辑处理类
    /// </summary>
    public sealed class MaterialBiz
    {
        #region 词、句、新闻信息

        /// <summary>
        /// 获取“每日一句”内容
        /// </summary>
        /// <returns></returns>
        public static WsnContent GetTodaySentence()
        {
            int idx = (int)DateTime.Now.Date.Subtract(new DateTime(2015, 1, 1).Date).TotalDays;
            return GetWsnContentList(idx, 1, 1, 0).Data.First();
        }

        /// <summary>
        /// 获取“每日新闻”信息列表
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<WsnContent> GetTodayNewsList(int pageIndex, int pageSize)
        {
            return GetWsnContentList(pageIndex, pageSize, 2, 1);
        }

        /// <summary>
        /// 获取词、句、新闻信息分页列表数据
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="target">目标数据类型：0-词 1-句 2-新闻</param>
        /// <param name="sort">排序方式：0-升序，1-降序</param>
        /// <returns></returns>
        private static PageResult<WsnContent> GetWsnContentList(int pageIndex, int pageSize, int target, int sort)
        {
            PageResult<WsnContent> pageResult = new PageResult<WsnContent>
            {
                RecordCount = MaterialData.GetWsnContentCount(target),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageResult.Data = MaterialData.GetWsnContentList(pageResult.PageIndex, pageResult.PageSize, target, sort);
            return pageResult;
        }

        #endregion

        #region 词典

        /// <summary>
        /// 从数据库查询词语翻译结果
        /// </summary>
        /// <param name="word"></param>
        /// <param name="isChinese"></param>
        /// <returns></returns>
        public static DictRecord GetDictRecord(string word, bool isChinese)
        {
            if (isChinese)
                return MaterialData.QueryC2EDict(word);
            return MaterialData.QueryE2CDict(word);
        }

        /// <summary>
        /// 汉译英联想查询
        /// </summary>
        /// <param name="words">分词得到的关键词组</param>
        /// <param name="querySize">最大查询联想结果数量</param>
        /// <returns></returns>
        public static IEnumerable<DictRecord> DictC2eExtendQuery(IEnumerable<string> words, int querySize)
        {
            return MaterialData.DictC2eExtendQuery(words, querySize);
        }

        /// <summary>
        /// 英译汉联想查询
        /// </summary>
        /// <param name="words">分词得到的关键词组</param>
        /// <param name="querySize">最大查询联想结果数量</param>
        /// <returns></returns>
        public static IEnumerable<DictRecord> DictE2cExtendQueryWithWords(IEnumerable<string> words, int querySize)
        {
            List<string> sourceWordList = words.ToList();
            if (sourceWordList.Count == 1)
            {
                string word = sourceWordList[0];
                return MaterialData.DictE2cExtendQueryWithSingleWords(word, word[0].ToString(), querySize);
            }

            return MaterialData.DictE2cExtendQueryWithWords(words, querySize);
        }

        #endregion
    }
}