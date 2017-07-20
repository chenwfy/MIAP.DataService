using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Entities.Logs;
using MIAP.Business;
using MIAP.Cache;
using MIAP.Configuration;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 用户登录命令请求执行类
    /// </summary>
    public class SignIn : ExecuteBase<DataContext>
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

            Account acount = cmdData.ProtoBufDeserialize<Account>();
            if (Compiled.Debug)
                acount.Debug("=== User.SignIn 上行数据===");

            switch (acount.AccountChannel)
            {
                case AccountChannel.SchoolAccount:
                case AccountChannel.Owner:
                    FullAccountSignIn(context, acount);
                    break;
                case AccountChannel.Weibo:
                case AccountChannel.WeiXin:
                    SdkAccountSignIn(context, acount);
                    break;
                case AccountChannel.Guest:
                default:
                    GuestAccountSignIn(context, acount);
                    break;
            }
        }

        /// <summary>
        /// 完整型账户登录（自己输入登录账号、密码等内容进行登录）
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        private static void FullAccountSignIn(DataContext context, Account acount)
        {
            if (string.IsNullOrEmpty(acount.UserName) || string.IsNullOrEmpty(acount.Password))
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (!UserBiz.UserNameIsExists(acount.UserName))
            {
                context.Flush(RespondCode.ShowError, "用户名不存在！");
                return;
            }

            UserAccount uAccount = new UserAccount { UserName = acount.UserName, Password = acount.Password };
            UserSignIn(context, acount, uAccount);
        }

        /// <summary>
        /// 第三方SDK账户登录
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        private static void SdkAccountSignIn(DataContext context, Account acount)
        {
            if (string.IsNullOrEmpty(acount.UserName) || null == acount.UserBase)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            string userName = string.Format("{0}_{1}", acount.UserName, (int)acount.AccountChannel);
            if (UserBiz.UserNameIsExists(userName))
            {
                UserAccount uAccount = new UserAccount { UserName = userName, Password = userName };
                UserSignIn(context, acount, uAccount);
                return;
            }

            //不存在的第三方账号，则直接走注册流程
            SignUp.SdkAccountSignUp(context, acount);
        }

        /// <summary>
        /// 游客账户登录
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        private static void GuestAccountSignIn(DataContext context, Account acount)
        {
            if (!string.IsNullOrEmpty(acount.UserName) && acount.UserName.StartsWith(SignUp.GuestUserNamePreFix) && UserBiz.UserNameIsExists(acount.UserName))
            {
                UserAccount uAccount = new UserAccount { UserName = acount.UserName, Password = SignUp.GuestUserPass };
                UserSignIn(context, acount, uAccount);
                return;
            }

            //不存在的游客账号，则走注册流程
            SignUp.GuestAccountSignUp(context, acount);
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        /// <param name="uAccount">用户账户信息</param>
        private static void UserSignIn(DataContext context, Account acount, UserAccount uAccount)
        {
            UserVaildInfo vaildInfo = UserBiz.GetUserVaildInfo(uAccount);
            string[] errMessages = new string[] { "密码错误！", "您的账号尚未通过验证！", "您的账号已被锁定，暂时无法登录！", "试用账号已过期！请更换其它账号登录！" };
            if (vaildInfo.UserId <= 0)
            {
                context.Flush(RespondCode.ShowError, errMessages[Math.Abs(vaildInfo.UserId)]);
                return;
            }

            //更新登录信息
            UserExtInfo extInfo = new UserExtInfo
            {
                UserId = vaildInfo.UserId,
                LastLoginDeviceId = context.DeviceId,
                LastLoginAPPChannel = context.ReqChannel,
                LastLoginAccountChannel = (int)acount.AccountChannel
            };
            UserBiz.UserSignIn(extInfo);

            //创建登录日志
            CreateSignInLog(context, acount, vaildInfo);

            //返回登录结果
            FlushResult(context, vaildInfo);
        }

        /// <summary>
        /// 创建登录日志
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        /// <param name="uVaildInfo">用户账户信息</param>
        private static void CreateSignInLog(DataContext context, Account acount, UserVaildInfo uVaildInfo)
        {
            UserLoginLog log = new UserLoginLog
            {
                UserId = uVaildInfo.UserId,
                LogType = 2,
                NetworkType = (int)acount.NetworkType,
                AccountChannel = (int)acount.AccountChannel,
                AppChannel = context.ReqChannel,
                AppVersion = acount.Version,
                DeviceId = context.DeviceId,
                LoginAccount = uVaildInfo.UserName,
                CreateDate = DateTime.Now
            };

            LogsBiz.CreateLogs<UserLoginLog>(log);
        }

        /// <summary>
        /// 输出登录结果
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="uVaildInfo">用户验证信息</param>
        internal static void FlushResult(DataContext context, UserVaildInfo uVaildInfo)
        {
            UserCacheInfo userCacheInfo = UserBiz.ReadUserCacheInfoFromDb(uVaildInfo.UserId);
            AuthResult authResult = new AuthResult
            {
                UserId = uVaildInfo.UserId,
                DeviceChanged = context.DeviceId == uVaildInfo.LastLoginDeviceId,
                SessionId = uVaildInfo.UserId.GetSessionId(),
                UserBase = userCacheInfo.ToUserBase()
            };
            
            //缓存用户会话状态
            authResult.SessionId.SetSession(uVaildInfo.UserId, ExpiredConfigs.GetSessionExpired());
            
            //缓存用户信息
            UserBiz.SetUserCacheInfo(uVaildInfo.UserId, userCacheInfo);

            //用户登录事件
            SignInEvents(authResult, uVaildInfo);

            //输出请求响应
            context.Flush<AuthResult>(authResult);
        }

        /// <summary>
        /// 用户登录事件（异步）
        /// </summary>
        /// <param name="auth"></param>
        /// <param name="uVaildInfo"></param>
        private static async void SignInEvents(AuthResult auth, UserVaildInfo uVaildInfo)
        {
            await Task.Run(() =>
            {
                //首次登录
                if (uVaildInfo.LoginCount < 1)
                {
                    // ToDo
                }
                else
                {
                    //更换设备登录
                    if (auth.DeviceChanged)
                    {
                        // ToDo
                    }
                }

                //每日第一次登录
                if (DateTime.Now.Date.Subtract(uVaildInfo.LastLoginDate.Date).TotalDays >= 1d)
                {
                    // ToDo
                }

                //每次登录
                // ToDo
            });
        }
    }
}