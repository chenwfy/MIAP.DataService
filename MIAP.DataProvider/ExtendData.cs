using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.Extend;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 辅助扩充内容部分数据库操作类
    /// </summary>
    public sealed class ExtendData
    {
        /// <summary>
        /// 获取符合条件的前N条广告信息
        /// </summary>
        /// <param name="appChannel">应用渠道标识码</param>
        /// <param name="schoolId">学校编号</param>
        /// <param name="topCount">获取的最大广告数量</param>
        /// <returns>符合条件的前N条广告信息</returns>
        public static IEnumerable<AdvertDetail> GetTopAdverts(string appChannel, int schoolId, int topCount)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Extend_GetTopAdverts", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("SchoolId, Size, ChannelCode, Date", schoolId, topCount, appChannel, DateTime.Now);
                List<AdvertDetail> resultData = new List<AdvertDetail>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new AdvertDetail
                        {
                            AdvertId = (int)reader["AdvertId"],
                            AdName = (string)reader["AdName"],
                            SmallerIcon = (string)reader["SmallerIcon"],
                            AdUrl = (string)reader["AdUrl"],
                            AdType = (int)reader["AdType"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 提交报名信息
        /// </summary>
        /// <param name="apply"></param>
        public static void SubmitApply(ApplyInfo apply)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Extend_SubmitUserApply", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "UserId, UserName, Telphone, AreaCity, SchoolId, CourseId, SourceAd, CreateDate, Comment",
                    apply.UserId, apply.UserName, apply.Telphone, apply.AreaCity, apply.SchoolId, apply.CourseId, apply.SourceAd, apply.CreateDate, apply.Comment
                );
                apply.Id = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}