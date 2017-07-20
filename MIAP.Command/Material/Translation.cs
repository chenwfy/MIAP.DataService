using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Material;
using MIAP.Protobuf.Material;
using MIAP.Utility;
using CSharpLib.Common;

namespace MIAP.Command.Material
{
    /// <summary>
    /// 词典查词 命令请求处理类
    /// </summary>
    public class Translation : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 0)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            DictQuery query = cmdData.ProtoBufDeserialize<DictQuery>();
            if (Compiled.Debug)
                query.Debug("=== Material.Translation 请求数据 ===");

            string word = (query.Text ?? string.Empty).Trim();
            DictQuery.ResultPart resultPart = query.QueryPart;
            bool extendQuery = query.ExtendResult;
            if (string.IsNullOrEmpty(word))
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            //检测待查询的内容是中文还是英文
            Regex regex = new Regex("[\u4e00-\u9fa5]");
            bool isChinese = regex.IsMatch(word);

            Query(context, word, isChinese, resultPart, extendQuery);
        }

        /// <summary>
        /// 查询单词翻译结果
        /// </summary>
        /// <param name="context"></param>
        /// <param name="word"></param>
        /// <param name="isChinese"></param>
        /// <param name="part"></param>
        /// <param name="extendQuery"></param>
        private static void Query(DataContext context, string word, bool isChinese, DictQuery.ResultPart part, bool extendQuery)
        {
            DictRecord dictRecord = MaterialBiz.GetDictRecord(word, isChinese);

            #region 查询有结果

            if (null != dictRecord)
            {
                DictResultBasic resultBase = new DictResultBasic
                {
                    Text = dictRecord.Word.Trim(),
                    PhonicsEn = dictRecord.PhonicsEn.Trim(),
                    PhonicsUs = dictRecord.PhonicsUs.Trim(),
                    AudioEn = dictRecord.AudioEn.Trim().ImageUrlFixed(),
                    AudioUs = dictRecord.AudioUs.Trim().ImageUrlFixed(),
                    Meaning = new List<DictResultPackage>(0),
                    Explication = new List<DictResultPackage>(0),
                    Example = new List<DictResultPackage>(0)
                };

                if ((part == DictQuery.ResultPart.All || part == DictQuery.ResultPart.Meaning) && dictRecord.TransBase != null && dictRecord.TransBase.Length > 0)
                    resultBase.Meaning = dictRecord.TransBase.ProtoBufDeserialize<List<DictResultPackage>>();

                if ((part == DictQuery.ResultPart.All || part == DictQuery.ResultPart.Explication) && dictRecord.Explication != null && dictRecord.Explication.Length > 0)
                    resultBase.Explication = dictRecord.Explication.ProtoBufDeserialize<List<DictResultPackage>>();

                if ((part == DictQuery.ResultPart.All || part == DictQuery.ResultPart.Example) && dictRecord.Example != null && dictRecord.Example.Length > 0)
                    resultBase.Example = dictRecord.Example.ProtoBufDeserialize<List<DictResultPackage>>();

                DictResult result = new DictResult { Basic = resultBase };
                context.Flush<DictResult>(result);
                return;
            }

            #endregion

            #region  查询无结果，需要联想查询

            if (extendQuery)
            {
                if (isChinese)
                {
                    #region 中文查询

                    //分词
                    List<string> wordList = word.Participle(isChinese).ToList();
                    if (wordList.Count > 0)
                    {
                        List<DictRecord> extendWords = MaterialBiz.DictC2eExtendQuery(wordList, 20).ToList();
                        DictResult extendResult = GetExtendDictResult(extendWords);
                        if (null != extendResult)
                        {
                            context.Flush<DictResult>(extendResult);
                            return;
                        }
                    }

                    #endregion
                }
                else
                {
                    #region 英文查询

                    List<string> wordList = new List<string>(0);
                    if (!word.IsFullEnglish())
                        wordList = word.Participle(isChinese).ToList();
                    else
                        wordList = new List<string> { word };

                    if (wordList.Count > 0)
                    {
                        List<DictRecord> extendWords = MaterialBiz.DictE2cExtendQueryWithWords(wordList, 20).ToList();

                        if (extendWords.Count > 0)
                        {
                            DictResult extendResult = GetExtendDictResult(extendWords);
                            if (null != extendResult)
                            {
                                context.Flush<DictResult>(extendResult);
                                return;
                            }
                        }
                    }

                    #endregion
                }
            }

            #endregion

            #region 查询无结果，并且无需联想查询

            context.Flush();
            return;

            #endregion
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="extendRecords"></param>
        /// <returns></returns>
        private static DictResult GetExtendDictResult(List<DictRecord> extendRecords)
        {
            if (extendRecords.Count > 0)
            {
                List<DictResultItem> resultItemList = new List<DictResultItem>(0);
                int idx = 1;
                foreach (var extend in extendRecords)
                {
                    if (extend.TransBase != null && extend.TransBase.Length > 0)
                    {
                        List<DictResultPackage> packageList = extend.TransBase.ProtoBufDeserialize<List<DictResultPackage>>();
                        if (packageList.Count > 0)
                        {
                            DictResultPackage package = packageList[0];
                            if (package.PackageData != null && package.PackageData.Count > 0)
                            {
                                DictResultPortion tmpPortion = package.PackageData[0];
                                if (tmpPortion.Items != null && tmpPortion.Items.Count > 0)
                                {
                                    string enWords = string.Join("; ", tmpPortion.Items.Select(i => i.Item1).Take(3));
                                    DictResultItem item = new DictResultItem
                                    {
                                        Item1 = extend.Word,
                                        Item2 = enWords,
                                        IsQueryEnabled = true,
                                        PreFixed = string.Format("{0}.", idx),
                                        AudioUrl = "",
                                        AudioSize = ""
                                    };
                                    idx++;
                                    resultItemList.Add(item);
                                }
                            }
                        }
                    }
                }

                if (resultItemList.Count > 0)
                    return new DictResult { Extend = new DictResultPortion { Title = "您要查找的是不是：", Items = resultItemList } };
            }
            return null;
        }
    }
}