using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Linq;
using CSharpLib.Common;
using PanGu;
using PanGu.Dict;

namespace MIAP.Utility
{
    /// <summary>
    /// 词典翻译查询部分辅助类
    /// </summary>
    public static class DictHelper
    {
        private static string PanguConfigPath = "";

        /// <summary>
        /// 
        /// </summary>
        static DictHelper()
        {
            PanguConfigPath = "MIAP.PanguConfigPath".GetAppSetting().MapPath();
        }

        /// <summary>
        /// 分词
        /// </summary>
        /// <param name="sourceText"></param>
        /// <param name="hasChinese"></param>
        /// <returns></returns>
        public static IEnumerable<string> Participle(this string sourceText, bool hasChinese)
        {
            PanGu.Segment.Init(PanguConfigPath);
            Segment segment = new Segment();
            ICollection<WordInfo> sourceWords = segment.DoSegment(sourceText);
            IEnumerable<string> words = sourceWords.Select(w => w.Word.Trim()).Distinct();
            if (hasChinese)
                return words.Where(w => w.IsFullChinese());
            return words.Where(w => w.IsFullEnglish());
        }

        /// <summary>
        /// 判断字符串是否为全中文
        /// </summary>
        /// <param name="sourceText"></param>
        /// <returns></returns>
        public static bool IsFullChinese(this string sourceText)
        {
            Regex regex = new Regex("[\u4e00-\u9fa5]");
            return regex.Replace(sourceText, "").Equals(string.Empty);
        }

        /// <summary>
        /// 判断字符换是否全英文
        /// </summary>
        /// <param name="sourceText"></param>
        /// <returns></returns>
        public static bool IsFullEnglish(this string sourceText)
        {
            Regex regex = new Regex("[A-Za-z]");
            return regex.Replace(sourceText, "").Equals(string.Empty);
        }

        /// <summary>
        /// 获取英文单词中不重复的字母集合
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetEnglishWordChars(this string word)
        {
            Regex regex = new Regex(@"[^a-z]");
            word = regex.Replace(word.ToLower().Trim(), "");
            return word.ToCharArray().Distinct().Select(c => c.ToString());
        }

        /// <summary>
        /// 过滤指定字符串中的非字母字符
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        public static string GetOnlyEnglishWord(this string word)
        {
            Regex regex = new Regex(@"[^a-z]");
            return regex.Replace(word.ToLower().Trim(), "");
        }
    }
}