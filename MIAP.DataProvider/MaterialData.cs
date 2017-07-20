using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.Material;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 学习教程、资源部分数据库操作类
    /// </summary>
    public sealed class MaterialData
    {
        #region 词、句、新闻信息

        /// <summary>
        /// 获取词、句、新闻信息总数
        /// </summary>
        /// <param name="target"></param>
        /// <returns></returns>
        public static int GetWsnContentCount(int target)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Material_Wsn_GetNewsCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("Target", target);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取词、句、新闻信息分页列表数据
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="target">目标数据类型：0-词 1-句 2-新闻</param>
        /// <param name="sort">排序方式：0-升序，1-降序</param>
        /// <returns></returns>
        public static IEnumerable<WsnContent> GetWsnContentList(int pageIndex, int pageSize, int target, int sort)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Material_Wsn_GetNewsList", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("Target, PageIndex, PageSize, Sort", target, pageIndex, pageSize, sort);
                return cmd.ExecuteDataTable().AsEnumerable().Select(dr => new WsnContent
                {
                    NewsId = dr.Field<int>("NewsId"),
                    Title = dr.Field<string>("Title"),
                    SubTitle = dr.Field<string>("SubTitle"),
                    CategoryName = dr.Field<string>("CategoryName"),
                    ImagePath = dr.Field<string>("ImagePath"),
                    AudioPath = dr.Field<string>("AudioPath")
                }).ToList();
            }
        }

        #endregion

        #region 词典

        /// <summary>
        /// 汉译英词典查询
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        public static DictRecord QueryC2EDict(string word)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Material_Dict_QueryC2E", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("Word", word);
                DictRecord resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new DictRecord
                        {
                            Word = (string)reader["Word"],
                            TransBase = (byte[])reader["Translation"],
                            AudioEn = "",
                            AudioUs = "",
                            PhonicsEn = "",
                            PhonicsUs = "",
                            Example = new byte[0],
                            Explication = new byte[0]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 汉译英联想查询
        /// </summary>
        /// <param name="words">分词得到的关键词组</param>
        /// <param name="querySize">最大查询联想结果数量</param>
        /// <returns></returns>
        public static IEnumerable<DictRecord> DictC2eExtendQuery(IEnumerable<string> words, int querySize)
        {
            List<string> pNameList = new List<string> { "Size" };
            List<object> pValueList = new List<object> { querySize };
            List<string> sqlWhere = new List<string>(0);
            int idx = 0;
            foreach (var word in words)
            {
                string p = string.Format("@E{0}", idx), p1 = string.Format("@L{0}", idx);

                sqlWhere.Add(string.Format(" Word = {0} ", p));
                pNameList.Add(p);
                pValueList.Add(word);

                sqlWhere.Add(string.Format(" Word LIKE {0} ", p1));
                pNameList.Add(p1);
                pValueList.Add(string.Format("%{0}%", word));

                idx++;
            }

            string querySql = @"SET ROWCOUNT @Size
                                SELECT  Word ,
                                        Translation
                                FROM    Material_Dict_CE
                                WHERE   {0}
                                ORDER BY Word";
            querySql = string.Format(querySql, string.Join(" OR ", sqlWhere));
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql))
            {
                cmd.AddInputParameters(string.Join(",", pNameList), pValueList.ToArray());
                List<DictRecord> resultData = new List<DictRecord>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new DictRecord
                        {
                            Word = (string)reader["Word"],
                            TransBase = (byte[])reader["Translation"],
                            AudioEn = "",
                            AudioUs = "",
                            PhonicsEn = "",
                            PhonicsUs = "",
                            Example = new byte[0],
                            Explication = new byte[0]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 英译汉词典查询
        /// </summary>
        /// <param name="word"></param>
        /// <returns></returns>
        public static DictRecord QueryE2CDict(string word)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Material_Dict_QueryE2C", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("Word", word);
                DictRecord resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new DictRecord
                        {
                            Word = (string)reader["Word"],
                            PhonicsEn = (string)reader["PhonicsEn"],
                            PhonicsUs = (string)reader["PhonicsUs"],
                            AudioEn = (string)reader["AudioEn"],
                            AudioUs = (string)reader["AudioUs"],
                            Explication = (byte[])reader["Explication"],
                            Example = (byte[])reader["Example"],
                            TransBase = (byte[])reader["TransBase"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 英译汉联想查询(单个单词)
        /// </summary>
        /// <param name="word">单词</param>
        /// <param name="firstChar">第一个字母</param>
        /// <param name="querySize">最大查询联想结果数量</param>
        /// <returns></returns>
        public static IEnumerable<DictRecord> DictE2cExtendQueryWithSingleWords(string word, string firstChar, int querySize)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Material_Dict_ExtendQueryBySingleWord", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("Word, WordLike, FirstChar, Size", word, string.Format("{0}%", word), string.Format("{0}%", firstChar), querySize);
                List<DictRecord> resultData = new List<DictRecord>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new DictRecord
                        {
                            Word = (string)reader["Word"],
                            PhonicsEn = (string)reader["PhonicsEn"],
                            PhonicsUs = (string)reader["PhonicsUs"],
                            AudioEn = (string)reader["AudioEn"],
                            AudioUs = (string)reader["AudioUs"],
                            Explication = (byte[])reader["Explication"],
                            Example = (byte[])reader["Example"],
                            TransBase = (byte[])reader["TransBase"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 英译汉联想查询(词组)
        /// </summary>
        /// <param name="words">分词得到的关键词组</param>
        /// <param name="querySize">最大查询联想结果数量</param>
        /// <returns></returns>
        public static IEnumerable<DictRecord> DictE2cExtendQueryWithWords(IEnumerable<string> words, int querySize)
        {
            List<string> pNameList = new List<string> { "Size" };
            List<object> pValueList = new List<object> { querySize };
            List<string> sqlWhere = new List<string>(0);
            int idx = 0;
            foreach (var word in words)
            {
                string p = string.Format("@W{0}", idx);

                sqlWhere.Add(string.Format(" Word LIKE {0} ", p));
                pNameList.Add(p);
                pValueList.Add(string.Format("%{0}%", word));

                idx++;
            }

            string querySql = @"SET ROWCOUNT @Size
                                SELECT  Word ,
                                        PhonicsEn ,
                                        PhonicsUs ,
                                        AudioEn ,
                                        AudioUs ,
                                        TransBase ,
                                        Explication ,
                                        Example ,
                                        IsPureWord  
                                FROM    Material_Dict_EC
                                WHERE   {0}
                                ORDER BY Word";
            querySql = string.Format(querySql, string.Join(" AND ", sqlWhere));
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql))
            {
                cmd.AddInputParameters(string.Join(",", pNameList), pValueList.ToArray());
                List<DictRecord> resultData = new List<DictRecord>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new DictRecord
                        {
                            Word = (string)reader["Word"],
                            PhonicsEn = (string)reader["PhonicsEn"],
                            PhonicsUs = (string)reader["PhonicsUs"],
                            AudioEn = (string)reader["AudioEn"],
                            AudioUs = (string)reader["AudioUs"],
                            Explication = (byte[])reader["Explication"],
                            Example = (byte[])reader["Example"],
                            TransBase = (byte[])reader["TransBase"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        #endregion
    }
}