using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.Bbs;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 论坛模块数据库操作类
    /// </summary>
    public sealed class BbsData
    {
        #region 版块

        /// <summary>
        /// 获取指定的论坛版块详情
        /// </summary>
        /// <param name="forumId"></param>
        /// <param name="schoolId"></param>
        /// <returns></returns>
        public static ForumInfo GetForumInfoById(int forumId, int schoolId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetForumById", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("ForumId, SchoolId", forumId, schoolId);
                ForumInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new ForumInfo
                        {
                            ForumId = (int)reader["ForumId"],
                            ForumName = (string)reader["ForumName"],
                            ForumIcon = (string)reader["ForumIcon"],
                            AllowPost = (int)reader["AllowPost"],
                            AllowPostType = (int)reader["AllowPostType"],
                            LinkType = (int)reader["LinkType"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取更新的论坛版块信息列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="deviceId"></param>
        /// <param name="schoolId"></param>
        /// <returns></returns>
        public static IEnumerable<ForumInfo> GetUpdatedForumsList(int userId, int deviceId, int schoolId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_GetForumUpdated", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, DeviceId, SchoolId, Date", userId, deviceId, schoolId, DateTime.Now);
                List<ForumInfo> resultData = new List<ForumInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new ForumInfo
                        {
                            ForumId = (int)reader["ForumId"],
                            ForumName = (string)reader["ForumName"],
                            ForumIcon = (string)reader["ForumIcon"],
                            AllowPost = (int)reader["AllowPost"],
                            AllowPostType = (int)reader["AllowPostType"],
                            LinkType = (int)reader["LinkType"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取论坛版块新帖数量列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="deviceId"></param>
        /// <param name="schoolId"></param>
        /// <returns></returns>
        public static IEnumerable<ForumTopicCount> GetForumsNewTopicCountList(int userId, int deviceId, int schoolId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_GetForumTopicCountUpdated", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, DeviceId, SchoolId, Date", userId, deviceId, schoolId, DateTime.Now);
                List<ForumTopicCount> resultData = new List<ForumTopicCount>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new ForumTopicCount
                        {
                            ForumId = (int)reader["ForumId"],
                            TopicCount = Convert.ToInt32(reader["TopicCount"])
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        #endregion

        #region 帖子

        /// <summary>
        /// 创建帖子
        /// </summary>
        /// <param name="topic"></param>
        public static void CreateTopic(TopicFullInfo topic)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_CreateTopic", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "ForumId, SchoolId, UserId, AttachContent, Title, Content, Intro, Icon, Voice, Reward, IsQuestion, IsAllowReply, Status, CreateDate",
                    topic.ForumId, topic.SchoolId, topic.UserId, topic.AttachContent, topic.Title, topic.Content, topic.Intro, topic.Icon, topic.Voice, topic.Reward, topic.IsQuestion, topic.IsAllowReply, topic.Status, topic.CreateDate
                );
                topic.TopicId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 更新帖子内容等
        /// </summary>
        /// <param name="topic"></param>
        public static void UpdateTopicContent(TopicFullInfo topic)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_UpdateTopicContent", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("TopicId, Content, Icon, Voice", topic.TopicId, topic.Content, topic.Icon, topic.Voice);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// <para>根据查询条件，获取查询语句补充块，返回结果：Tuple&lt;string, string, List&lt;string&gt;, List&lt;object&gt;&gt; </para> 
        /// <para>Item1：查询WHERE语句部分</para> 
        /// <para>Item2：查询ORDER BY 语句部分</para> 
        /// <para>Item3：查询参数集合</para> 
        /// <para>Item4：查询参数值集合</para> 
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        private static Tuple<string, string, List<string>, List<object>> CreateSqlPartionByCondition(TopicQueryConditions condition)
        {
            string sqlWhere = "SchoolId = @SchoolId";
            List<string> pNameList = new List<string> { "SchoolId" };
            List<object> pValueList = new List<object> { condition.SchoolId };

            if (condition.Status >= 0)
            {
                sqlWhere += " AND [Status] = @Status ";
                pNameList.Add("Status");
                pValueList.Add(condition.Status);
            }

            if (condition.ForumId > 0)
            {
                sqlWhere += " AND ForumId = @ForumId ";
                pNameList.Add("ForumId");
                pValueList.Add(condition.ForumId);
            }

            if (condition.OwnerId > 0)
            {
                sqlWhere += " AND UserId = @OwnerId ";
                pNameList.Add("OwnerId");
                pValueList.Add(condition.OwnerId);
            }

            if (!string.IsNullOrEmpty(condition.AttachContent))
            {
                sqlWhere += " AND AttachContent = @AttachContent ";
                pNameList.Add("AttachContent");
                pValueList.Add(condition.AttachContent);
            }

            if (!condition.HasBestAnswer)
            {
                sqlWhere += " AND BestAnswerId = 0 ";
            }

            if (!string.IsNullOrEmpty(condition.Keyword))
            {
                sqlWhere += " AND ( AttachContent LIKE @Keyword OR Title LIKE @Keyword OR Intro LIKE @Keyword ) ";
                pNameList.Add("Keyword");
                pValueList.Add(string.Format("%{0}%", condition.Keyword));
            }

            string[] orders = new string[4] 
            { 
                " ORDER BY CreateDate DESC, TopicId DESC ", 
                " ORDER BY CreateDate DESC, TopicId DESC ",
                " ORDER BY RepliedCount DESC, CreateDate DESC, TopicId DESC ",
                " ORDER BY FavouredCount DESC, CreateDate DESC, TopicId DESC "
            };
            string sqlOrder = orders[condition.Sort];

            return new Tuple<string, string, List<string>, List<object>>(sqlWhere, sqlOrder, pNameList, pValueList);
        }

        /// <summary>
        /// 获取符合查询条件的帖子总数
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        public static int GetTopicCount(TopicQueryConditions condition)
        {
            Tuple<string, string, List<string>, List<object>> tuples = CreateSqlPartionByCondition(condition);
            string querySql = string.Format("SELECT COUNT(0) FROM Forum_Topics WHERE {0}", tuples.Item1);
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql))
            {
                cmd.AddInputParameters(string.Join(",", tuples.Item3), tuples.Item4.ToArray());
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取符合查询条件的帖子信息列表
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static IEnumerable<TopicInfo> GetTopicInfoList(TopicQueryConditions condition, int pageIndex, int pageSize)
        {
            Tuple<string, string, List<string>, List<object>> tuples = CreateSqlPartionByCondition(condition);
            string querySql = @"SET ROWCOUNT @PageSize
                                SELECT  *
                                FROM    ( SELECT    TopicId ,
                                                    UserId ,
                                                    AttachContent ,
                                                    Title ,
                                                    Intro ,
                                                    Icon ,
                                                    Voice ,
                                                    Remark ,
                                                    Reward ,
                                                    IsQuestion ,
                                                    IsAllowReply ,
                                                    IsStick ,
                                                    IsRefined ,
                                                    AttrChangedMark ,
                                                    ExpChanged ,
                                                    VirtualCoinChanged ,
                                                    BestAnswerId ,
                                                    FavouredCount ,
                                                    RepliedCount ,
                                                    ViewCount ,
                                                    FavoritedCount ,
                                                    CreateDate ,
                                                    ROW_NUMBER() OVER ( {1} ) AS RowNum
                                          FROM      Forum_Topics
                                          WHERE     {0}
                                        ) AS List
                                WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
                                {1}";
            querySql = string.Format(querySql, tuples.Item1, tuples.Item2);
            tuples.Item3.AddRange(new List<string>(2) { "PageSize", "PageIndex" });
            tuples.Item4.AddRange(new List<object>(2) { pageSize, pageIndex });
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql))
            {
                cmd.AddInputParameters(string.Join(",", tuples.Item3), tuples.Item4.ToArray());
                List<TopicInfo> resultData = new List<TopicInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new TopicInfo
                        {
                            TopicId = (int)reader["TopicId"],
                            UserId = (int)reader["UserId"],
                            AttachContent = (string)reader["AttachContent"],
                            Title = (string)reader["Title"],
                            Intro = (string)reader["Intro"],
                            Icon = (string)reader["Icon"],
                            Voice = (string)reader["Voice"],
                            Remark = (string)reader["Remark"],
                            Reward = (int)reader["Reward"],
                            IsQuestion = (bool)reader["IsQuestion"],
                            IsAllowReply = (bool)reader["IsAllowReply"],
                            IsStick = (bool)reader["IsStick"],
                            IsRefined = (bool)reader["IsRefined"],
                            AttrChangedMark = (string)reader["AttrChangedMark"],
                            ExpChanged = (int)reader["ExpChanged"],
                            VirtualCoinChanged = (int)reader["VirtualCoinChanged"],
                            BestAnswerId = (int)reader["BestAnswerId"],
                            FavouredCount = (int)reader["FavouredCount"],
                            RepliedCount = (int)reader["RepliedCount"],
                            ViewCount = (int)reader["ViewCount"],
                            FavoritedCount = (int)reader["FavoritedCount"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定用户回复过的帖子总数
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static int GetUserRepliedTopicCount(int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetUserRepliedTopicCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId", userId);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取指定用户回复过的帖子信息分页列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static IEnumerable<TopicInfo> GetUserRepliedTopicList(int userId, int pageIndex, int pageSize)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetUserRepliedTopicList", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, PageSize, PageIndex", userId, pageSize, pageIndex);
                List<TopicInfo> resultData = new List<TopicInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new TopicInfo
                        {
                            TopicId = (int)reader["TopicId"],
                            UserId = (int)reader["UserId"],
                            AttachContent = (string)reader["AttachContent"],
                            Title = (string)reader["Title"],
                            Intro = (string)reader["Intro"],
                            Icon = (string)reader["Icon"],
                            Voice = (string)reader["Voice"],
                            Remark = (string)reader["Remark"],
                            Reward = (int)reader["Reward"],
                            IsQuestion = (bool)reader["IsQuestion"],
                            IsAllowReply = (bool)reader["IsAllowReply"],
                            IsStick = (bool)reader["IsStick"],
                            IsRefined = (bool)reader["IsRefined"],
                            AttrChangedMark = (string)reader["AttrChangedMark"],
                            ExpChanged = (int)reader["ExpChanged"],
                            VirtualCoinChanged = (int)reader["VirtualCoinChanged"],
                            BestAnswerId = (int)reader["BestAnswerId"],
                            FavouredCount = (int)reader["FavouredCount"],
                            RepliedCount = (int)reader["RepliedCount"],
                            ViewCount = (int)reader["ViewCount"],
                            FavoritedCount = (int)reader["FavoritedCount"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定的帖子详情
        /// </summary>
        /// <param name="topicId"></param>
        /// <param name="updateTopic">是否同步更新帖子浏览次数和未读跟帖信息</param>
        /// <returns></returns>
        public static TopicInfo GetTopicInfoById(int topicId, bool updateTopic)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_GetTopicById", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("TopicId, UpdateTopic", topicId, updateTopic);
                TopicInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new TopicInfo
                        {
                            TopicId = (int)reader["TopicId"],
                            UserId = (int)reader["UserId"],
                            ForumId = (int)reader["ForumId"],
                            AttachContent = (string)reader["AttachContent"],
                            Title = (string)reader["Title"],
                            Remark = (string)reader["Remark"],
                            Reward = (int)reader["Reward"],
                            IsQuestion = (bool)reader["IsQuestion"],
                            IsAllowReply = (bool)reader["IsAllowReply"],
                            IsStick = (bool)reader["IsStick"],
                            IsRefined = (bool)reader["IsRefined"],
                            AttrChangedMark = (string)reader["AttrChangedMark"],
                            ExpChanged = (int)reader["ExpChanged"],
                            VirtualCoinChanged = (int)reader["VirtualCoinChanged"],
                            BestAnswerId = (int)reader["BestAnswerId"],
                            FavouredCount = (int)reader["FavouredCount"],
                            RepliedCount = (int)reader["RepliedCount"],
                            ViewCount = (int)reader["ViewCount"],
                            FavoritedCount = (int)reader["FavoritedCount"],
                            CreateDate = (DateTime)reader["CreateDate"],
                            Content = (string)reader["Content"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 更新帖子浏览次数
        /// </summary>
        /// <param name="topicId"></param>
        public static void UpdateTopicViewCount(int topicId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_AddTopicViewCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("TopicId", topicId);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 查询指定用户对指定的目标数据“点赞”次数
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="targetId">目标数据编号</param>
        /// <param name="t">类型：1-帖子，2-回复</param>
        /// <returns></returns>
        public static int UserFavouredCount(int userId, int targetId, byte t)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetUserFavouredCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, TargetId, T", userId, targetId, t);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 用户对指定的目标数据“点赞”
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="targetId">目标数据编号</param>
        /// <param name="t">类型：1-帖子，2-回复</param>
        public static void CreateUserFavoured(int userId, int targetId, byte t)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_CreateUserFavoured", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, DataId, T, Date", userId, targetId, t, DateTime.Now);
                cmd.ExecuteNonQuery();
            }
        }

        #endregion

        #region 跟帖

        /// <summary>
        /// 创建跟帖信息
        /// </summary>
        /// <param name="postInfo"></param>
        public static void CreateReply(PostFullInfo postInfo)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_CreateTopicReply", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "TopicId, ForumId, SchoolId, UserId, Content, ReplyForUserId, Status, CreateDate",
                    postInfo.TopicId, postInfo.ForumId, postInfo.SchoolId, postInfo.UserId, postInfo.Content, postInfo.ReplyForUserId, postInfo.Status, postInfo.CreateDate
                );
                postInfo.PostId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 更新跟帖内容
        /// </summary>
        /// <param name="postInfo"></param>
        public static void UpdatePostContent(PostFullInfo postInfo)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_UpdateReplyContent", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("PostId, Content", postInfo.PostId, postInfo.Content);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 获取指定的帖子跟帖总数
        /// </summary>
        /// <param name="topicId"></param>
        /// <returns></returns>
        public static int GetTopicReplyCount(int topicId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetTopicPostCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("TopicId", topicId);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取指定的帖子跟帖信息分页列表
        /// </summary>
        /// <param name="topicId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static IEnumerable<PostInfo> GetTopicReplyList(int topicId, int pageIndex, int pageSize)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetTopicPostList", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("PostId, PageIndex, PageSize", topicId, pageIndex, pageSize);
                List<PostInfo> resultData = new List<PostInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new PostInfo
                        {
                            TopicId = (int)reader["TopicId"],
                            PostId = (int)reader["PostId"],
                            UserId = (int)reader["UserId"],
                            ExpChanged = (int)reader["ExpChanged"],
                            VirtualCoinChanged = (int)reader["VirtualCoinChanged"],
                            FavouredCount = (int)reader["FavouredCount"],
                            CreateDate = (DateTime)reader["CreateDate"],
                            Content = (string)reader["Content"],
                            IsBestReply = (bool)reader["IsBestReply"],
                            SetBestDate = (DateTime)reader["SetBestDate"],
                            ReplyForUserId = (int)reader["ReplyForUserId"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定的帖子回复信息
        /// </summary>
        /// <param name="postId"></param>
        /// <returns></returns>
        public static PostInfo GetPostInfoById(int postId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Bbs_GetPostById", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("PostId", postId);
                PostInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new PostInfo
                        {
                            TopicId = (int)reader["TopicId"],
                            PostId = (int)reader["PostId"],
                            UserId = (int)reader["UserId"],
                            ExpChanged = (int)reader["ExpChanged"],
                            VirtualCoinChanged = (int)reader["VirtualCoinChanged"],
                            FavouredCount = (int)reader["FavouredCount"],
                            CreateDate = (DateTime)reader["CreateDate"],
                            Content = (string)reader["Content"],
                            IsBestReply = (bool)reader["IsBestReply"],
                            SetBestDate = (DateTime)reader["SetBestDate"],
                            ReplyForUserId = (int)reader["ReplyForUserId"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 设置指定帖子的最佳回复
        /// </summary>
        /// <param name="topic"></param>
        /// <param name="reply"></param>
        public static void SetTopicBestReply(TopicInfo topic, PostInfo reply)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Bbs_SetBestReply", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "TopicId, PostId, Date, ExpChanged, VirtualCoinChanged",
                    topic.TopicId, reply.PostId, reply.SetBestDate, reply.ExpChanged, reply.VirtualCoinChanged
                );
                cmd.ExecuteNonQuery();
            }
        }

        #endregion
    }
}