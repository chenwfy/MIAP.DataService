using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.User;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 用户模块部分数据库操作类
    /// </summary>
    public sealed class UserData
    {
        /// <summary>
        /// 检测用户名是否已存在
        /// </summary>
        /// <param name="userName">待检测的用户名</param>
        /// <param name="userAccess">用户对应的登录权限</param>
        /// <returns>用户名是否已存在</returns>
        public static bool UserNameIsExists(string userName, UserAccess userAccess)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_UserNameCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserName, UserAccess", userName, userAccess);
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        /// <summary>
        /// 创建用户记录
        /// </summary>
        /// <param name="uAccount">用户账号信息</param>
        /// <param name="uInfo">用户个人信息</param>
        /// <param name="extInfo">用户扩展信息</param>
        /// <param name="userCoords">用户当前位置坐标信息</param>
        /// <param name="userOptions">用户个人应用设置信息</param>
        /// <param name="userInSchool">学校用户信息</param>
        public static void CreateUser(UserAccount uAccount, UserInfo uInfo, UserExtInfo extInfo, UserCoords userCoords, UserOptions userOptions, UserWithSchool userInSchool)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UserAccountCreate", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    @"UserId, UserName, Password, PasswordFormat, PasswordSalt, LoginCount, CreateDate, NickName, RealName, BackIcon, HeadIcon, Signature, Comment, Gender, Birthday, IDCardNo, Area, Address, PostCode, Industry, Company, JobPosition, Interests, WebSite, Email, Mobile, Telphone, QQ, MSN, OtherInfo, UserSite, UserRole, UserAccess, CreateDeviceId, CreateAPPChannel, CreateAccountChannel, Longitude, Latitudes, RemindPrivateMessage, RemindGroupMessage, RemindBeFollowed, RemindTopicBeReply, SchoolId, IsTrial, TrialedSource, IsActivated, IsExpired, StudNo, ClassInfo, SchoolComment, SyncForBbs, Status",
                    uAccount.UserId,
                    uAccount.UserName,
                    uAccount.Password,
                    uAccount.PasswordFormat,
                    uAccount.PasswordSalt,
                    uAccount.LoginCount,
                    uAccount.CreateDate,
                    uInfo.NickName,
                    uInfo.RealName,
                    uInfo.BackIcon,
                    uInfo.HeadIcon,
                    uInfo.Signature,
                    uInfo.Comment,
                    uInfo.Gender,
                    uInfo.Birthday,
                    uInfo.IDCardNo,
                    uInfo.Area,
                    uInfo.Address,
                    uInfo.PostCode,
                    uInfo.Industry,
                    uInfo.Company,
                    uInfo.JobPosition,
                    uInfo.Interests,
                    uInfo.WebSite,
                    uInfo.Email,
                    uInfo.Mobile,
                    uInfo.Telphone,
                    uInfo.QQ,
                    uInfo.MSN,
                    uInfo.OtherInfo,
                    extInfo.UserSite,
                    extInfo.UserRole,
                    extInfo.UserAccess,
                    extInfo.CreateDeviceId,
                    extInfo.CreateAPPChannel,
                    extInfo.CreateAccountChannel,
                    userCoords.Longitude,
                    userCoords.Latitudes,
                    userOptions.RemindPrivateMessage,
                    userOptions.RemindGroupMessage,
                    userOptions.RemindBeFollowed,
                    userOptions.RemindTopicBeReply,
                    userInSchool.SchoolId,
                    userInSchool.IsTrial,
                    userInSchool.TrialedSource,
                    userInSchool.IsActivated,
                    userInSchool.IsExpired,
                    userInSchool.StudNo,
                    userInSchool.ClassInfo,
                    userInSchool.Comment,
                    userInSchool.SyncForBbs,
                    userInSchool.Status
                 );
                uAccount.UserId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 修改用户密码
        /// </summary>
        /// <param name="uAccount"></param>
        public static void ChangeUserPassword(UserAccount uAccount)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_ChangeUserPassword", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, Password, LastPasswordChangedDate", uAccount.UserId, uAccount.Password, uAccount.LastPasswordChangedDate);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 更新游客账号用户名和昵称
        /// </summary>
        /// <param name="uAccount"></param>
        /// <param name="uInfo"></param>
        public static void UpdateGuestUserInfo(UserAccount uAccount, UserInfo uInfo)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UpdateGuestAccount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, UserName, NickName", uAccount.UserId, uAccount.UserName, uInfo.NickName);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 将指定的用户设定为非锁定状态
        /// </summary>
        /// <param name="userId"></param>
        public static void SetUsesUnLocked(int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UnLockUserAccount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId", userId);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 获取用户验证信息
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="userAccess">用户对应的登录权限</param>
        /// <returns>用户验证信息</returns>
        public static UserVaildInfo GetUserVaildInfo(string userName, UserAccess userAccess)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_GetUserVaildInfo", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserName, UserAccess", userName, userAccess);
                UserVaildInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new UserVaildInfo
                        {
                            UserId = (int)reader["UserId"],
                            UserName = (string)reader["UserName"],
                            Password = (string)reader["Password"],
                            PasswordSalt = (string)reader["PasswordSalt"],
                            IsApproved = (bool)reader["IsApproved"],
                            IsLocked = (bool)reader["IsLocked"],
                            LastLockedoutDate = (DateTime)reader["LastLockedoutDate"],
                            LoginCount = (int)reader["LoginCount"],
                            LastLoginDate = (DateTime)reader["LastLoginDate"],
                            UserSite = (int)reader["UserSite"],
                            UserRole = (int)reader["UserRole"],
                            UserAccess = (UserAccess)(int)reader["UserAccess"],
                            LastLoginDeviceId = (int)reader["LastLoginDeviceId"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取用户与学校相关的信息
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <returns>用户与学校相关的信息</returns>
        public static UserWithSchool GetUserWithSchool(int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_GetUserWithSchool", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId", userId);
                UserWithSchool resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new UserWithSchool
                        {
                            UserId = (int)reader["UserId"],
                            SchoolId = (int)reader["UserId"],
                            IsTrial = (bool)reader["IsTrial"],
                            TrialedSource = (string)reader["TrialedSource"],
                            IsActivated = (bool)reader["IsActivated"],
                            ActivatedDate = (DateTime)reader["ActivatedDate"],
                            IsExpired = (bool)reader["IsExpired"],
                            ExpiredDate = (DateTime)reader["ExpiredDate"],
                            StudNo = (string)reader["StudNo"],
                            ClassInfo = (string)reader["ClassInfo"],
                            Comment = (string)reader["Comment"],
                            SyncForBbs = (bool)reader["SyncForBbs"],
                            Status = (int)reader["Status"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 更改学校试用用户账号状态信息
        /// </summary>
        /// <param name="userWithSchool">用户相关信息</param>
        /// <param name="action">更改状态：0-激活，1-过期</param>
        public static void SchoolTrialUserStatusChanged(UserWithSchool userWithSchool, int action = 0)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_SchoolTrialUserStatusChanged", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, IsActivated, ActivatedDate, IsExpired, ExpiredDate, Action", userWithSchool.UserId, userWithSchool.IsActivated, userWithSchool.ActivatedDate, userWithSchool.IsExpired, userWithSchool.ExpiredDate, action);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 更新用户登录成功相关信息
        /// </summary>
        /// <param name="uExtInfo"></param>
        public static void UpdateUserWhenSignIn(UserExtInfo uExtInfo)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UpdateUserWhenSignIn", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, LastLoginDeviceId, LastLoginAPPChannel, LastLoginAccountChannel, LastLoginDate", uExtInfo.UserId, uExtInfo.LastLoginDeviceId, uExtInfo.LastLoginAPPChannel, uExtInfo.LastLoginAccountChannel, DateTime.Now);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 用户经验值变更
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <param name="expChanged">经验值变化数量</param>
        public static void UserExpChanged(int userId, int expChanged)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UserExpChanged", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, ExpChanged", userId, expChanged);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 用户虚拟币账户余额变更
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <param name="coinChanged">虚拟币账户余额变化数量</param>
        public static void UserCoinChanged(int userId, int coinChanged)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UserVirtualCoinChanged", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, CoinChanged", userId, coinChanged);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 更新用户头像、背景图片信息
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="userIcon">用户图标路径</param>
        /// <param name="iconType">更新类型：0-头像， 1-个人信息背景图片</param>
        public static void UpdateUserIcon(int userId, string userIcon, byte iconType = 0)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UpdateUserIcon", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, IconUrl, Datetime, T", userId, userIcon, DateTime.Now, iconType);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 更新用户个人信息
        /// </summary>
        /// <param name="userInfo">用户个人信息</param>
        public static void UpdateUserInfo(UserInfo userInfo)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UpdateUserInfo", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "UserId, NickName, Signature, Gender, Birthday, Area, Interests", 
                    userInfo.UserId, userInfo.NickName, userInfo.Signature, userInfo.Gender, userInfo.Birthday, userInfo.Area, userInfo.Interests
                );
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 更新用户应用设置
        /// </summary>
        /// <param name="userOptions"></param>
        public static void UpdateUserAppOptions(UserOptions userOptions)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UpdateUserOptions", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "UserId, RemindPrivateMessage, RemindGroupMessage, RemindBeFollowed, RemindTopicBeReply, LastChangeDate",
                   userOptions.UserId, 
                   userOptions.RemindPrivateMessage, 
                   userOptions.RemindGroupMessage, 
                   userOptions.RemindBeFollowed, 
                   userOptions.RemindTopicBeReply, 
                   userOptions.LastChangeDate
                );
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 获取指定用户，指定日期内签到次数
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static int UserCheckedInCountWithDay(UserCheckedInLog log)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_GetUserCheckedInCountWithDay", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, Date", log.UserId, log.CreateDate);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 指定用户，指定日期内进行签到。返回签到状态：0-重复签到，1-签到成功
        /// </summary>
        /// <param name="log"></param>
        /// <returns>返回签到状态：0-重复签到，1-签到成功</returns>
        public static int UserCheckInToday(UserCheckedInLog log)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Users_UserCheckedIn", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, AppChannel, Date", log.UserId, log.AppChannel, log.CreateDate);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 获取指定用户在指定的天数内的签到记录列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="days"></param>
        /// <returns></returns>
        public static IEnumerable<UserCheckedInLog> GetUserCheckedInLogInDays(int userId, int days)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_GetUserCheckedInLogs", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, Days, Date", userId, days, DateTime.Now);
                List<UserCheckedInLog> resultData = new List<UserCheckedInLog>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new UserCheckedInLog
                        {
                            UserId = (int)reader["UserId"],
                            AppChannel = (string)reader["AppChannel"],
                            CreateDate = (DateTime)reader["CreateDate"]
                        });                    
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 从数据库读取用于缓存的用户信息
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <returns>用于缓存的用户信息</returns>
        public static UserCacheInfo GetUserInfoForCache(int userId)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Users_GetUserInfoForCache", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId", userId);
                UserCacheInfo resultData = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultData = new UserCacheInfo
                        {
                            UserId = (int)reader["UserId"],
                            UserName = (string)reader["UserName"],
                            NickName = (string)reader["NickName"],
                            RealName = (string)reader["RealName"],
                            BackIcon = (string)reader["BackIcon"],
                            HeadIcon = (string)reader["HeadIcon"],
                            Signature = (string)reader["Signature"],
                            Gender = (int)reader["Gender"],
                            Area = (string)reader["Area"],
                            Birthday = (DateTime)reader["Birthday"],
                            UserAge = (int)reader["UserAge"],
                            Interests = (string)reader["Interests"],
                            UserSite = (int)reader["UserSite"],
                            UserRole = (int)reader["UserRole"],
                            UserAccess = (int)reader["UserAccess"],
                            ExpScore = (int)reader["ExpScore"],
                            ExpLevel = (int)reader["ExpLevel"],
                            GradeName = (string)reader["GradeName"],
                            GradeIcon = (string)reader["GradeIcon"],
                            VirtualCoinCount = (int)reader["VirtualCoinCount"],
                            FansCount = (int)reader["FansCount"],
                            FollowedCount = (int)reader["FollowedCount"],
                            TopicCount = (int)reader["TopicCount"],
                            ReplyCount = (int)reader["ReplyCount"],
                            RemindPrivateMessage = (bool)reader["RemindPrivateMessage"],
                            RemindGroupMessage = (bool)reader["RemindGroupMessage"],
                            RemindBeFollowed = (bool)reader["RemindBeFollowed"],
                            RemindTopicBeReply = (bool)reader["RemindTopicBeReply"],
                            OSPlatform = (int)reader["Platform"],
                            DeviceToken = (string)reader["Token"],
                            StudNo = (string)reader["StudNo"],
                            ClassInfo = (string)reader["ClassInfo"],
                            Comment = (string)reader["Comment"],
                            IsTrial = (bool)reader["IsTrial"]
                        };
                    }
                    reader.Close();
                }
                return resultData;
            }
        }
    }
}