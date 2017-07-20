using System;

namespace MIAP.Entities.Material
{
    /// <summary>
    /// 词典数据记录信息（对应数据库 Material_Dict_CE 和 Material_Dict_EC 表结构）
    /// </summary>
    public sealed class DictRecord
    {
        /// <summary>
        /// 获取或设置单词内容
        /// </summary>
        public string Word { get; set; }

        /// <summary>
        /// 获取或设置单词音标内容（英音）
        /// </summary>
        public string PhonicsEn { get; set; }

        /// <summary>
        /// 获取或设置单词音标内容（美音）
        /// </summary>
        public string PhonicsUs { get; set; }

        /// <summary>
        /// 获取或设置单词发音声音文件URL（英音）
        /// </summary>
        public string AudioEn { get; set; }

        /// <summary>
        /// 获取或设置单词发音声音文件URL（美音）
        /// </summary>
        public string AudioUs { get; set; }

        /// <summary>
        /// 获取或设置单词翻译结果（包含 基本释义、英英释义、详尽释义等）
        /// </summary>
        public byte[] TransBase { get; set; }

        /// <summary>
        /// 获取或设置单词用法详解
        /// </summary>
        public byte[] Explication { get; set; }

        /// <summary>
        /// 获取或设置单词上使用例句
        /// </summary>
        public byte[] Example { get; set; }
    }
}