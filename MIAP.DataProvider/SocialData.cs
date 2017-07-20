using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.User;
using MIAP.Entities.Social;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 社交模块数据库操作类
    /// </summary>
    public sealed class SocialData
    {
        #region 用户“关注”关系部分

        /// <summary>
        /// 获取和指定的目标用户之间是否已存在单向“关注”关系记录
        /// </summary>
        /// <param name="uFollowed">关注关系数据</param>
        /// <returns></returns>
        public static bool BeFollowedWithTargetUser(UserFollowed uFollowed)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Social_BeFollowedWithTargetUser", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, FollowedUserId", uFollowed.UserId, uFollowed.FollowedUserId);
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 改变和指定用户的单向“关注”关系，改变结果：成功或失败
        /// </summary>
        /// <param name="uFollowed">关注关系数据</param>
        /// <param name="action">改变类型：1-增加，0-移除</param>
        /// <returns>改变结果：成功或失败</returns>
        public static bool ChangedFollowedWithTargetUser(UserFollowed uFollowed, byte action)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Social_ChangedFollowedWithTargetUser", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, FollowedUserId, CreateDate, Action", uFollowed.UserId, uFollowed.FollowedUserId, uFollowed.CreateDate, action);
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取用户之间单向“关注”关系数据列表
        /// </summary>
        /// <param name="userId">指定的用户</param>
        /// <param name="action">查询类型：0-用户关注的，1-关注用户的</param>
        /// <returns>用户之间单向“关注”关系数据列表</returns>
        public static IEnumerable<UserFollowed> GetUsersFollowedList(int userId, byte action)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Social_GetUsersFollowedList", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, Action", userId, action);
                List<UserFollowed> resultData = new List<UserFollowed>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new UserFollowed
                        {
                            UserId = (int)reader["UserId"],
                            FollowedUserId = (int)reader["FollowedUserId"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 创建群组
        /// </summary>
        /// <param name="group"></param>
        /// <param name="site"></param>
        public static void CreateGroup(GroupInfo group, int site)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Social_CreateGroup", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "GroupName, GroupIcon, Comment, MaxMemberCount, MemberCount, GroupType, CreatorId, InterestCode, QuickJoinCode, CreateDate, IsCreator, SchoolId, ClassId",
                    group.GroupName, group.GroupIcon, group.Comment, group.MaxMemberCount, group.MemberCount, group.GroupType, group.CreatorId, group.InterestCode, group.QuickJoinCode, group.CreateDate, true, site, 0
                );
                group.GroupId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 更新群组信息（快速加入码和图标文件路径）
        /// </summary>
        /// <param name="group"></param>
        public static void UpdateGroupInfo(GroupInfo group)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Social_UpdateGroupInfo", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("GroupId, GroupIcon, QuickJoinCode", group.GroupId, group.GroupIcon, group.QuickJoinCode);
                cmd.ExecuteNonQuery();
            }
        }

        #endregion

        #region 群组部分

        /// <summary>
        /// 根据群编号或者快速加入码获取群组信息
        /// </summary>
        /// <param name="groupId">群组编号</param>
        /// <param name="quickJoinCode">快速加入码</param>
        /// <returns>群组信息</returns>
        public static GroupInfo GetGroupInfo(int groupId, string quickJoinCode)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Social_GetGroupDetail", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("GroupId, QuickJoinCode", groupId, quickJoinCode);
                GroupInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new GroupInfo
                        {
                            GroupId = (int)reader["GroupId"],
                            GroupName = (string)reader["GroupName"],
                            GroupIcon = (string)reader["GroupIcon"],
                            Comment = (string)reader["Comment"],
                            MaxMemberCount = (int)reader["MaxMemberCount"],
                            MemberCount = (int)reader["MemberCount"],
                            GroupType = (int)reader["GroupType"],
                            CreatorId = (int)reader["CreatorId"],
                            InterestCode = (string)reader["InterestCode"],
                            QuickJoinCode = (string)reader["QuickJoinCode"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取指定群组成员列表
        /// </summary>
        /// <param name="groupId">群组编号</param>
        /// <returns>群组成员列表</returns>
        public static IEnumerable<GroupMember> GetGroupMemebers(int groupId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Social_GetGroupMembers", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("GroupId", groupId);
                List<GroupMember> resultData = new List<GroupMember>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new GroupMember
                        {
                            GroupId = (int)reader["GroupId"],
                            UserId = (int)reader["UserId"],
                            IsCreator = (bool)reader["IsCreator"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取群组查询语句组合
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="interest"></param>
        /// <param name="onlyLess"></param>
        /// <param name="site"></param>
        /// <returns></returns>
        private static Tuple<string, string, List<string>, List<object>> CreateGroupFindSqlPart(string keyword, string interest, bool onlyLess, int site)
        {
            string sql_InnerJoin = string.Empty, sql_Where = string.Empty;
            List<string> sql_ParamNameList = new List<string>(0);
            List<object> sql_ParamValueList = new List<object>(0);

            if (!string.IsNullOrEmpty(keyword))
            {
                sql_Where += " AND ( G.GroupName LIKE @Keyword OR G.Comment LIKE @Keyword ) ";
                sql_ParamNameList.Add("Keyword");
                sql_ParamValueList.Add(string.Format("%{0}%", keyword));
            }

            if (!string.IsNullOrEmpty(interest))
            {
                sql_Where += " AND G.InterestCode = @InterestCode ";
                sql_ParamNameList.Add("InterestCode");
                sql_ParamValueList.Add(interest);
            }
            
            if (onlyLess)
                sql_Where += " AND G.MemberCount < G.MaxMemberCount ";

            if (site > 0)
            {
                sql_InnerJoin = " INNER JOIN Chat_Group_SchoolAndClass C ON C.GroupId = G.GroupId AND C.SchoolId = @SchoolId ";
                sql_ParamNameList.Add("SchoolId");
                sql_ParamValueList.Add(site);
            }
            else
            {
                sql_Where += " AND NOT EXISTS(SELECT 1 FROM Chat_Group_SchoolAndClass C WHERE C.GroupId = G.GroupId) ";
            }

            return new Tuple<string, string, List<string>, List<object>>(sql_InnerJoin, sql_Where, sql_ParamNameList, sql_ParamValueList);
        }

        /// <summary>
        /// 查询符合条件的群组信息总数
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="interest"></param>
        /// <param name="onlyLess"></param>
        /// <param name="userId"></param>
        /// <param name="site"></param>
        /// <returns></returns>
        public static int GroupFindCount(string keyword, string interest, bool onlyLess, int userId, int site)
        {
            Tuple<string, string, List<string>, List<object>> sqlPart = CreateGroupFindSqlPart(keyword, interest, onlyLess, site);
            string querySql = string.Format("SELECT COUNT(0) FROM Chat_Groups G {0} WHERE NOT EXISTS( SELECT 1 FROM  Chat_GroupMembers WHERE UserId = @UserId AND GroupId = G.GroupId ) {1}", sqlPart.Item1, sqlPart.Item2);
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql, CommandType.Text))
            {
                sqlPart.Item3.Add("UserId");
                sqlPart.Item4.Add(userId);
                cmd.AddInputParameters(string.Join(",", sqlPart.Item3), sqlPart.Item4.ToArray());
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 查询符合条件的群组信息分页列表
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="interest"></param>
        /// <param name="onlyLess"></param>
        /// <param name="userId"></param>
        /// <param name="site"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static IEnumerable<int> GroupFindList(string keyword, string interest, bool onlyLess, int userId, int site, int pageIndex, int pageSize)
        {
            Tuple<string, string, List<string>, List<object>> sqlPart = CreateGroupFindSqlPart(keyword, interest, onlyLess, site);
            string querySql = @"SET ROWCOUNT @PageSize
                                SELECT  *
                                FROM    ( SELECT    G.GroupId ,                                                    
                                                    ROW_NUMBER() OVER ( ORDER BY G.CreateDate DESC, G..GroupId DESC ) AS RowNum
                                          FROM      Chat_Groups G
                                                    {0}
                                          WHERE     NOT EXISTS( SELECT 1 FROM  Chat_GroupMembers WHERE UserId = @UserId AND GroupId = G.GroupId )
                                                    {1}
                                        ) AS List
                                WHERE   List.RowNum > ( @PageIndex - 1 ) * @PageSize
                                ORDER BY List.CreateDate DESC ,
                                        List.GroupId DESC";
            
            querySql = string.Format(querySql, sqlPart.Item1, sqlPart.Item2);
            sqlPart.Item3.AddRange(new List<string>(2) { "PageSize", "PageIndex", "UserId" });
            sqlPart.Item4.AddRange(new List<object>(2) { pageSize, pageIndex, userId });

            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, querySql, CommandType.Text))
            {
                cmd.AddInputParameters(string.Join(",", sqlPart.Item3), sqlPart.Item4.ToArray());
                List<int> resultData = new List<int>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add((int)reader["GroupId"]);
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 用户加入群组，返回状态码：0-目标群组已满员，1-加入成功， 2-用户已是群组成员
        /// </summary>
        /// <param name="groupMember">用户与群组关系数据信息</param>
        /// <returns>状态码：0-目标群组已满员，1-加入成功， 2-用户已是群组成员</returns>
        public static int UserJoinToGroup(GroupMember groupMember)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Social_JoinToGroup", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("GroupId, UserId, IsCreator, CreateDate", groupMember.GroupId, groupMember.UserId, groupMember.IsCreator, groupMember.CreateDate);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 用户退出群组
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public static int UserQuitFromGroup(int userId, int groupId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Social_QuitFromGroup", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("GroupId, UserId", groupId, userId);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取指定用户所参与群组列表
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static IEnumerable<int> GetGroupsByUser(int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Social_GetUserGroups", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId", userId);
                return cmd.ExecuteDataTable().AsEnumerable().Select(dr => dr.Field<int>("GroupId"));
            }
        }

        #endregion
    }
}