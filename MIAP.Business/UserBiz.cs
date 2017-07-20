using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities.User;
using MIAP.Entities.Logs;
using MIAP.Cache;
using MIAP.Configuration;
using MIAP.DataProvider;
using MIAP.Utility;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 用户模块部分命令请求逻辑处理类
    /// </summary>
    public sealed class UserBiz
    {
        #region 用户账号相关

        /// <summary>
        /// 创建用户密码
        /// </summary>
        /// <param name="passwordText"></param>
        /// <param name="passwordSalt"></param>
        /// <returns></returns>
        public static string CreatePassword(string passwordText, string passwordSalt)
        {
            return string.Format("MIAP_{0}_{1}_GW", passwordText, passwordSalt).CreateMD5Encrypt();
        }

        /// <summary>
        /// 检测用户名是否已存在
        /// </summary>
        /// <param name="userName">待检测的用户名</param>
        /// <param name="userAccess">用户对应的登录权限</param>
        /// <returns>用户名是否已存在</returns>
        public static bool UserNameIsExists(string userName, UserAccess userAccess = UserAccess.App)
        {
            return UserData.UserNameIsExists(userName, userAccess);
        }

        /// <summary>
        /// 注册用户账号
        /// </summary>
        /// <param name="uAccount">用户账户信息</param>
        /// <param name="uInfo">用户个人信息</param>
        /// <param name="extInfo">用户扩展信息</param>
        public static void CreateUser(UserAccount uAccount, UserInfo uInfo, UserExtInfo extInfo)
        {
            UserConfig userConfig = UserConfigs.GetUserConfigCache();
            DateTime dtNow = DateTime.Now;

            #region UserAccount

            uAccount.UserId = 0;
            uAccount.PasswordSalt = EncryptHelper.CreateSalt(16);
            uAccount.Password = CreatePassword(uAccount.Password, uAccount.PasswordSalt); 
            uAccount.LastPasswordChangedDate = dtNow;
            uAccount.IsApproved = true;
            uAccount.ApprovedDate = dtNow;
            uAccount.IsLocked = false;
            uAccount.LastLockedoutDate = dtNow;
            uAccount.CreateDate = dtNow;
            uAccount.LoginCount = 0;
            uAccount.LastLoginDate = dtNow;

            #endregion

            #region UserInfo

            uInfo.RealName = string.Empty;
            uInfo.BackIcon = userConfig == null ? string.Empty : (userConfig.DefaultBackIcon ?? string.Empty);
            uInfo.HeadIcon = userConfig == null ? string.Empty : (userConfig.DefaultHeadIcon ?? string.Empty);
            uInfo.Signature = string.Empty;
            uInfo.Comment = string.Empty;
            uInfo.Gender = 0;
            uInfo.Birthday = dtNow.AddYears(-18);
            //uInfo.UserAge = 0;
            uInfo.IDCardNo = string.Empty;
            uInfo.Area = string.Empty;
            uInfo.Address = string.Empty;
            uInfo.PostCode = string.Empty;
            uInfo.Industry = string.Empty;
            uInfo.Company = string.Empty;
            uInfo.JobPosition = string.Empty;
            uInfo.Interests = string.Empty;
            uInfo.WebSite = string.Empty;
            uInfo.Email = string.Empty;
            uInfo.Mobile = string.Empty;
            uInfo.Telphone = string.Empty;
            uInfo.QQ = string.Empty;
            uInfo.MSN = string.Empty;
            uInfo.OtherInfo = string.Empty;
            uInfo.LastChangeDate = dtNow;

            #endregion

            #region UserExtInfo

            extInfo.UserSite = 0;
            extInfo.UserRole = 0;
            extInfo.UserAccess = UserAccess.App | UserAccess.Web;
            extInfo.CreateDeviceId = extInfo.CreateDeviceId;
            extInfo.CreateAPPChannel = extInfo.CreateAPPChannel;
            extInfo.CreateAccountChannel = extInfo.CreateAccountChannel;
            extInfo.LastLoginDeviceId = extInfo.CreateDeviceId;
            extInfo.LastLoginAPPChannel = extInfo.CreateAPPChannel;
            extInfo.LastLoginAccountChannel = extInfo.CreateAccountChannel;
            extInfo.ExpScore = 0;
            extInfo.ExpLevel = 0;
            extInfo.GradeName = string.Empty;
            extInfo.GradeIcon = string.Empty;
            extInfo.VirtualCoinCount = 0;
            extInfo.FansCount = 0;
            extInfo.FollowedCount = 0;
            extInfo.TopicCount = 0;
            extInfo.ReplyCount = 0;

            #endregion

            #region UserCoords

            UserCoords userCoords = new UserCoords
            {
                Longitude = 0,
                Latitudes = 0,
                LastChangeTime = dtNow
            };

            #endregion

            #region UserOptions

            UserOptions userOptions = new UserOptions
            {
                RemindPrivateMessage = true,
                RemindGroupMessage = true,
                RemindBeFollowed = false,
                RemindTopicBeReply = false,
                LastChangeDate = dtNow
            };

            #endregion

            #region UserWithSchool

            UserWithSchool userInSchool = new UserWithSchool
            {
                SchoolId = 0,
                IsTrial = false,
                TrialedSource = string.Empty,
                IsActivated = false,
                ActivatedDate = dtNow,
                IsExpired = false,
                ExpiredDate = dtNow,
                StudNo = string.Empty,
                ClassInfo = string.Empty,
                Status = 0,
                Comment = string.Empty,
                SyncForBbs = false
            };

            #endregion

            UserData.CreateUser(uAccount, uInfo, extInfo, userCoords, userOptions, userInSchool);

            if (uAccount.UserId > 0)
            {
                //初始经验值
                if (userConfig.InitExp != 0)
                    UpdateUserExp(uAccount.UserId, userConfig.InitExp, "注册");

                //初始虚拟币
                if (userConfig.InitCoin != 0)
                    UpdateUserCoin(uAccount.UserId, userConfig.InitCoin, "注册");
            }
        }

        /// <summary>
        /// 更新游客用户的用户名和昵称信息（异步）
        /// </summary>
        /// <param name="uAccount">用户账户信息</param>
        /// <param name="uInfo">用户个人信息</param>
        public static async void UpdateGuestUserInfo(UserAccount uAccount, UserInfo uInfo)
        {
            await Task.Run(() =>
            {
                UserData.UpdateGuestUserInfo(uAccount, uInfo);
            });
        }

        /// <summary>
        /// 获取用户验证信息
        /// </summary>
        /// <param name="uAccount">用户账户信息（用户名和密码）</param>
        /// <param name="userAccess">用户对应的登录权限</param>
        /// <returns>用户验证信息</returns>
        public static UserVaildInfo GetUserVaildInfo(UserAccount uAccount, UserAccess userAccess = UserAccess.App)
        {
            UserVaildInfo uVaildInfo = UserData.GetUserVaildInfo(uAccount.UserName, userAccess);

            #region 密码

            uAccount.Password = string.Format("MIAP_{0}_{1}_GW", uAccount.Password, uVaildInfo.PasswordSalt).CreateMD5Encrypt();
            if (!uAccount.Password.Equals(uVaildInfo.Password))
            {
                uVaildInfo.UserId = 0;
                return uVaildInfo;
            }

            #endregion

            #region 账户是否通过验证

            if (!uVaildInfo.IsApproved)
            {
                uVaildInfo.UserId = -1;
                return uVaildInfo;
            }

            #endregion

            #region 是否被锁定

            if (uVaildInfo.IsLocked)
            {
                if (DateTime.Now < uVaildInfo.LastLockedoutDate)
                {
                    uVaildInfo.UserId = -2;
                    return uVaildInfo;
                }

                //锁定时间到期，解锁
                UserData.SetUsesUnLocked(uVaildInfo.UserId);
                //记录状态变更日志
                UserStatusChangedLog log = new UserStatusChangedLog
                {
                    UserId = uVaildInfo.UserId,
                    Action = 1,
                    Comment = "锁定时间到期，自动解锁！",
                    CreateDate = DateTime.Now
                };
                LogsBiz.CreateLogs<UserStatusChangedLog>(log);
            }

            #endregion

            #region 是否为试用账号，如果是，试用账号状态

            if (uVaildInfo.UserSite > 0)
            {
                UserWithSchool uWithSchool = UserData.GetUserWithSchool(uVaildInfo.UserId);
                UserWithSchool tempUserWithSchoolInfo;
                //试用账号
                if (uWithSchool.IsTrial)
                {
                    if (!uWithSchool.IsActivated)
                    {
                        //激活试用账号
                        UserConfig userConfig = UserConfigs.GetUserConfigCache();
                        tempUserWithSchoolInfo = new UserWithSchool
                        {
                            UserId = uWithSchool.UserId,
                            IsActivated = true,
                            ActivatedDate = DateTime.Now,
                            IsExpired = false,
                            ExpiredDate = userConfig.TrialAccountExpiredDay > 0 ? DateTime.Now.AddDays(userConfig.TrialAccountExpiredDay) : DateTime.MaxValue
                        };
                        UserData.SchoolTrialUserStatusChanged(tempUserWithSchoolInfo);
                    }
                    else
                    {
                        //超时时间已过，将试用账号设为过期
                        if (!uWithSchool.IsExpired && DateTime.Now >= uWithSchool.ExpiredDate)
                        {
                            tempUserWithSchoolInfo = new UserWithSchool
                            {
                                UserId = uWithSchool.UserId,
                                IsActivated = uWithSchool.IsActivated,
                                ActivatedDate = uWithSchool.ActivatedDate,
                                IsExpired = true,
                                ExpiredDate = uWithSchool.ExpiredDate
                            };
                            UserData.SchoolTrialUserStatusChanged(tempUserWithSchoolInfo, 1);

                            uWithSchool.IsExpired = true;
                        }

                        //试用账号已过期
                        if (uWithSchool.IsExpired)
                        {
                            uVaildInfo.UserId = -3;
                            return uVaildInfo;
                        }
                    }
                }
            }

            #endregion

            return uVaildInfo;
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="extInfo">用户扩展信息</param>
        public static void UserSignIn(UserExtInfo extInfo)
        {
            UserData.UpdateUserWhenSignIn(extInfo);

            UserConfig userConfig = UserConfigs.GetUserConfigCache();
            //登录增加经验值
            if (userConfig.LoginExpChanged != 0)
                UpdateUserExp(extInfo.UserId, userConfig.LoginExpChanged, "登录");

            //登录增加虚拟币
            if (userConfig.LoginCoinChanged != 0)
                UpdateUserCoin(extInfo.UserId, userConfig.LoginCoinChanged, "登录");
        }

        /// <summary>
        /// 获取用户基本账户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static UserAccount GetUserAccount(int userId)
        {
            UserCacheInfo userCache = ReadUserCacheInfo(userId);
            UserVaildInfo uVaildInfo = UserData.GetUserVaildInfo(userCache.UserName, UserAccess.App);
            return new UserAccount
            {
                UserId = userId,
                Password = uVaildInfo.Password,
                PasswordSalt = uVaildInfo.PasswordSalt
            };
        }

        /// <summary>
        /// 用户更改密码
        /// </summary>
        /// <param name="uAccount"></param>
        public static void UserChangedPassword(UserAccount uAccount)
        {
            UserData.ChangeUserPassword(uAccount);

            UserPasswordChanagedLog log = new UserPasswordChanagedLog
            {
                UserId = uAccount.UserId,
                MethodType = 0,
                Comment = "用户自行修改密码",
                CreateDate = DateTime.Now
            };
            LogsBiz.CreateLogs<UserPasswordChanagedLog>(log);
        }

        #endregion

        #region 用户经验值和虚拟币账户变更更新及日志记录

        /// <summary>
        /// 用户经验值变更及日志记录（异步）
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="expChanged">经验值变更值</param>
        /// <param name="actionName">引起变更的操作名称</param>
        public static async void UpdateUserExp(int userId, int expChanged, string actionName)
        {
            await Task.Run(() =>
            {
                UserData.UserExpChanged(userId, expChanged);

                UserExpChangedLog log = new UserExpChangedLog
                {
                    UserId = userId,
                    ExpChanged = expChanged,
                    Comment = string.Format("用户 {0} 操作，经验值变化：{1}", actionName, expChanged),
                    CreateDate = DateTime.Now
                };
                LogsBiz.CreateLogs<UserExpChangedLog>(log);
            });
        }

        /// <summary>
        /// 用户虚拟币账户余额变更及日志记录（异步）
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="coinChanged">虚拟币账户余额变更值</param>
        /// <param name="actionName">引起变更的操作名称</param>
        public static async void UpdateUserCoin(int userId, int coinChanged, string actionName)
        {
            await Task.Run(() =>
            {
                UserData.UserCoinChanged(userId, coinChanged);

                UserVirtualCoinChangedLog log = new UserVirtualCoinChangedLog
                {
                    UserId = userId,
                    VirtualCoinChanged = coinChanged,
                    Comment = string.Format("用户 {0} 操作，虚拟币变化：{1}", actionName, coinChanged),
                    CreateDate = DateTime.Now
                };
                LogsBiz.CreateLogs<UserVirtualCoinChangedLog>(log);
            });
        }

        #endregion

        #region 用户个人信息相关

        /// <summary>
        /// 设置用户头像
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="iconData">头像图片文件数据</param>
        /// <param name="fileExtName">图片扩展名</param>
        /// <returns>头像图片文件访问的HTTP路径</returns>
        public static string SetUserHeadIcon(int userId, byte[] iconData, string fileExtName)
        {
            string iconUrl = iconData.SaveMediaFile(FileTarget.User, userId, MediaType.Image, fileExtName);
            if (!string.IsNullOrEmpty(iconUrl))
            {
                //更新用户头像信息
                UserData.UpdateUserIcon(userId, iconUrl, 0);
                
                //第一次更新个人头像
                UserInfoUpdateLog log = new UserInfoUpdateLog { UserId = userId, InfoType = 1 };
                bool isFirst = LogsBiz.IsFirstUpdateSelfInfoByUser(log);
                if (isFirst)
                {
                    UserConfig userConfig = UserConfigs.GetUserConfigCache();
                    if (userConfig.SetHeadIconExpChanged != 0)
                        UpdateUserExp(userId, userConfig.SetHeadIconExpChanged, "设置头像");

                    if (userConfig.SetHeadIconCoinChanged != 0)
                        UpdateUserCoin(userId, userConfig.SetHeadIconCoinChanged, "设置头像");
                }
                
                //记录头像更新日志
                log.Comment = "更新头像";
                log.CreateDate = DateTime.Now;
                LogsBiz.CreateLogs<UserInfoUpdateLog>(log);

                //重置用户缓存
                SetUserCacheInfo(userId);

                //返回补全的头像HTTP路径
                return iconUrl.ImageUrlFixed(96, 96);
            }
            return iconUrl;
        }

        /// <summary>
        /// 设置用户个人信息背景图片
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="iconData">背景图片文件数据</param>
        /// <param name="fileExtName">图片扩展名</param>
        /// <returns>头像图片文件访问的HTTP路径</returns>
        public static string SetUserBackIcon(int userId, byte[] iconData, string fileExtName)
        {
            string iconUrl = iconData.SaveMediaFile(FileTarget.User, userId, MediaType.Image, fileExtName);
            if (!string.IsNullOrEmpty(iconUrl))
            {
                //更新用户背景图片
                UserData.UpdateUserIcon(userId, iconUrl, 1);

                //第一次更新背景图片
                UserInfoUpdateLog log = new UserInfoUpdateLog { UserId = userId, InfoType = 0 };
                bool isFirst = LogsBiz.IsFirstUpdateSelfInfoByUser(log);
                if (isFirst)
                {
                    UserConfig userConfig = UserConfigs.GetUserConfigCache();
                    if (userConfig.SetBackIconExpChanged != 0)
                        UpdateUserExp(userId, userConfig.SetBackIconExpChanged, "设置背景图片");

                    if (userConfig.SetBackIconCoinChanged != 0)
                        UpdateUserCoin(userId, userConfig.SetBackIconCoinChanged, "设置背景图片");
                }

                //记录背景图片更新日志
                log.Comment = "更新背景图片";
                log.CreateDate = DateTime.Now;
                LogsBiz.CreateLogs<UserInfoUpdateLog>(log);

                //重置用户缓存
                SetUserCacheInfo(userId);

                //返回补全的背景图片HTTP路径
                return iconUrl.ImageUrlFixed(480, 240);
            }
            return iconUrl;
        }

        /// <summary>
        /// 更新用户个人信息
        /// </summary>
        /// <param name="userInfo">用户个人信息</param>
        public static void UpdateUserInfo(UserInfo userInfo)
        {
            //更新个人信息
            UserData.UpdateUserInfo(userInfo);

            //第一次更新个人信息
            UserInfoUpdateLog log = new UserInfoUpdateLog { UserId = userInfo.UserId, InfoType = 2 };
            bool isFirst = LogsBiz.IsFirstUpdateSelfInfoByUser(log);
            if (isFirst)
            {
                UserConfig userConfig = UserConfigs.GetUserConfigCache();
                if (userConfig.SetPersonalExpChanged != 0)
                    UpdateUserExp(userInfo.UserId, userConfig.SetPersonalExpChanged, "设置个人信息");

                if (userConfig.SetPersonalCoinChanged != 0)
                    UpdateUserCoin(userInfo.UserId, userConfig.SetPersonalCoinChanged, "设置个人信息");
            }

            //记录个人信息更新日志
            log.Comment = "更新个人信息";
            log.CreateDate = DateTime.Now;
            LogsBiz.CreateLogs<UserInfoUpdateLog>(log);

            //重置用户缓存
            SetUserCacheInfo(userInfo.UserId);
        }

        /// <summary>
        /// 用户“今日”是否已签到
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static bool UserCheckedInToday(int userId)
        {
            UserCheckedInLog log = new UserCheckedInLog { UserId = userId, CreateDate = DateTime.Now };
            return UserData.UserCheckedInCountWithDay(log) > 0;
        }

        /// <summary>
        /// 用户“今日”签到
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="appChannel"></param>
        /// <returns></returns>
        public static string UserCheckInToday(int userId, string appChannel)
        {
            UserCheckedInLog log = new UserCheckedInLog { UserId = userId, AppChannel = appChannel, CreateDate = DateTime.Now };
            int checkResultCode = UserData.UserCheckInToday(log);
            if (1 == checkResultCode)
            {
                //获取用户10天以内的签到记录:如果一直连续签到，则应得到11条记录
                List<UserCheckedInLog> logList = UserData.GetUserCheckedInLogInDays(userId, 10).OrderByDescending(l => l.CreateDate).ToList();
                int c = -1;
                for (int i = 0; i < logList.Count; i++)
                {
                    if ((int)DateTime.Now.Date.Subtract(logList[i].CreateDate.Date).TotalDays != i)
                        break;
                    c++;
                }
                
                //此处c最小应该等于0，最大为10，因为当前签到应该有效。所以对应签到序号应该为0-10；
                //其中0-9分表表示连续签到1-10天，10表示连续签到超过10天以上

                string descText = c < 10 ? string.Format("连续签到 {0} 天", c + 1) : "连续签到10天以上";
                UserConfig userConfig = UserConfigs.GetUserConfigCache();
                bool isNeedReCache = false;
                string showText = string.Empty;
                if (userConfig.ContinuousCheckedInExpChanged != null && userConfig.ContinuousCheckedInExpChanged.Count == 11)
                {
                    if (userConfig.ContinuousCheckedInExpChanged[c] != 0)
                    {
                        UpdateUserExp(userId, userConfig.ContinuousCheckedInExpChanged[c], descText);
                        isNeedReCache = true;
                    }  
                }

                if (userConfig.ContinuousCheckedInCoinChanged != null && userConfig.ContinuousCheckedInCoinChanged.Count == 11)
                {
                    if (userConfig.ContinuousCheckedInCoinChanged[c] != 0)
                    {
                        UpdateUserCoin(userId, userConfig.ContinuousCheckedInCoinChanged[c], descText);
                        isNeedReCache = true;
                        showText = descText + "，金币加 " + userConfig.ContinuousCheckedInCoinChanged[c] + " !";
                    }
                }

                if (isNeedReCache)
                    SetUserCacheInfo(userId);

                return showText;
            }
            return string.Empty;
        }

        /// <summary>
        /// 更新用户应用设置
        /// </summary>
        /// <param name="userOptions"></param>
        public static void SetUserAppOptions(UserOptions userOptions)
        {
            UserData.UpdateUserAppOptions(userOptions);
            UserCacheInfo userCache = ReadUserCacheInfo(userOptions.UserId);
            userCache.RemindPrivateMessage = userOptions.RemindPrivateMessage;
            userCache.RemindGroupMessage = userOptions.RemindGroupMessage;
            userCache.RemindBeFollowed = userOptions.RemindBeFollowed;
            userCache.RemindTopicBeReply = userOptions.RemindTopicBeReply;
            SetUserCacheInfo(userOptions.UserId, userCache);
        }

        #endregion

        #region 用户缓存信息

        /// <summary>
        /// 从数据库读取用于缓存的用户信息
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <returns>用于缓存的用户信息</returns>
        public static UserCacheInfo ReadUserCacheInfoFromDb(int userId)
        {
            return UserData.GetUserInfoForCache(userId);
        }

        /// <summary>
        /// 从缓存中读取用户缓存信息
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <returns>用户缓存信息</returns>
        public static UserCacheInfo ReadUserCacheInfo(int userId)
        {
            UserCacheData cacheData = userId.GetUserCacheFromStorage();
            if (null != cacheData && null != cacheData.CacheData && cacheData.CacheData.Length > 0)
                return cacheData.CacheData.ProtoBufDeserialize<UserCacheInfo>();

            UserCacheInfo cacheInfo = ReadUserCacheInfoFromDb(userId);
            if (null == cacheInfo)
                return cacheInfo;

            cacheData = new UserCacheData { UserId = cacheInfo.UserId, CacheData = cacheInfo.ProtoBufSerialize<UserCacheInfo>() };
            cacheData.UserCacheStorage();
            return cacheInfo;
        }

        /// <summary>
        /// 将用户缓存信息写入缓存（异步）
        /// </summary>
        /// <param name="userId">目标用户编号</param>
        /// <param name="userCache">缓存数据</param>
        public static async void SetUserCacheInfo(int userId, UserCacheInfo userCache = null)
        {
            await Task.Run(() =>
            {
                UserCacheInfo cacheInfo = userCache == null ? ReadUserCacheInfoFromDb(userId) : userCache;
                if (null != cacheInfo)
                    new UserCacheData { UserId = cacheInfo.UserId, CacheData = cacheInfo.ProtoBufSerialize<UserCacheInfo>() }.UserCacheStorage();
            });
        }

        #endregion
    }
}