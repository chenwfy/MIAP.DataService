using System;
using System.Text.RegularExpressions;
using System.Linq;
using System.Collections.Generic;

namespace MIAP.Utility
{
    /// <summary>
    /// 文字处理相关方法辅助类
    /// </summary>
    public static class TextHelper
    {
        /// <summary>
        /// 获取6位随机码
        /// </summary>
        /// <returns></returns>
        public static string GetRandCode()
        {
            return Guid.NewGuid().ToString("N").Substring(0, 6);
        }

        /// <summary>
        /// 校验电子邮件地址是否正确
        /// </summary>
        /// <param name="email">待校验的原始电子邮件地址</param>
        /// <returns>验证结果</returns>
        public static bool VerifyEMail(this string email)
        {
            Regex regex = new Regex(@"^[a-z]([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$", RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }

        /// <summary>
        /// 简单替换EMIAL地址中名称部分内容
        /// </summary>
        /// <param name="email">待处理的原始EMAIL地址</param>
        /// <returns>处理后的EMAIL，如：abce***@xxx.com</returns>
        public static string SimpleReplaceEMail(this string email)
        {
            string[] emailArray = email.Split('@');
            string partName = emailArray[0];
            int nameLen = partName.Length;
            int saveLen = 1;
            if (nameLen >= 2)
                saveLen = nameLen / 2;
            return string.Format("{0}{1}@{2}", partName.Substring(0, saveLen), new String('*', nameLen - saveLen), emailArray[1]);
        }

        /// <summary>
        /// 校验手机号码是否正确
        /// </summary>
        /// <param name="mobile">待校验的原始手机号码</param>
        /// <returns>验证结果</returns>
        public static bool VerifyMobile(this string mobile)
        {
            Regex regex = new Regex(@"^(130|131|132|133|134|135|136|137|138|139|145|147|150|151|152|153|155|156|157|158|159|180|182|185|186|187|188|189)\d{8}$");
            return regex.IsMatch(mobile);
        }

        /// <summary>
        /// 简单替换手机号码中间四位数字为星号（4-7位）
        /// </summary>
        /// <param name="mobile"></param>
        /// <returns></returns>
        public static string SimpleReplaceMobile(this string mobile)
        {
            return string.Format("{0}{1}{2}", mobile.Substring(0, 3), new String('*', 4), mobile.Substring(7, 4));
        }

        /// <summary>
        /// 过滤指定字符串内容中的敏感关键词
        /// </summary>
        /// <param name="source">待处理的原始字符串内容</param>
        /// <param name="sensitiveWords">需要过虑的敏感关键词列表</param>
        /// <returns>过滤之后的内容</returns>
        public static string ReplaceSensitiveWord(this string source, IEnumerable<string> sensitiveWords)
        {
            if (string.IsNullOrEmpty(source))
                return source;
            foreach (var word in sensitiveWords)
            {
                if (source.Contains(word))
                    source = Microsoft.VisualBasic.Strings.Replace(source, word, "*", 1, -1, Microsoft.VisualBasic.CompareMethod.Text);
            }
            return source;
        }

        /// <summary>
        /// 给定一个字符串和一个字符集合，查找字符串中包含了字符集合中字符的集合
        /// </summary>
        /// <param name="source">待处理的原始字符串内容</param>
        /// <param name="targetWords">一个字符集合</param>
        /// <returns>查找到被包含的字符集合</returns>
        public static IEnumerable<string> FindContainsWords(this string source, IEnumerable<string> targetWords)
        {
            List<string> containsWordList = new List<string>(0);
            if (!string.IsNullOrEmpty(source))
            {
                foreach (var word in targetWords)
                {
                    if (source.Contains(word))
                        containsWordList.Add(word);
                }
            }
            return containsWordList.Distinct();
        }
    }
}