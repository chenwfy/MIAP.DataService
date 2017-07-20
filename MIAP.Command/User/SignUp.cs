using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Entities.Logs;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 用户账户注册命令请求执行类
    /// </summary>
    public class SignUp : ExecuteBase<DataContext>
    {
        internal const string GuestUserNamePreFix = "GUEST_";
        internal const string GuestUserPass = "GUEST";

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
                acount.Debug("=== User.SignUp 上行数据===");

            switch (acount.AccountChannel)
            {
                case AccountChannel.SchoolAccount:
                    context.Flush(RespondCode.ShowError, "不能通过此处注册学校用户账号！");
                    break;
                case AccountChannel.Owner:
                    FullAccountSignUp(context, acount);
                    break;
                case AccountChannel.Weibo:
                case AccountChannel.WeiXin:
                    SdkAccountSignUp(context, acount);
                    break;
                case AccountChannel.Guest:
                default:
                    GuestAccountSignUp(context, acount);
                    break;
            }
        }

        /// <summary>
        /// 完整型账号注册（自己输入用户名、密码等内容进行注册）
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        private static void FullAccountSignUp(DataContext context, Account acount)
        {
            if (string.IsNullOrEmpty(acount.UserName) || string.IsNullOrEmpty(acount.Password) || null == acount.UserBase )
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            if (UserBiz.UserNameIsExists(acount.UserName))
            {
                context.Flush(RespondCode.ShowError, "用户名已存在！");
                return;
            }

            UserAccount uAccount = new UserAccount { UserName = acount.UserName, Password = acount.Password };
            UserInfo uInfo = new UserInfo { NickName = acount.UserBase.NickName };
            UserSignUp(context, acount, uAccount, uInfo);
        }

        /// <summary>
        /// 第三方SDK账号注册
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        internal static void SdkAccountSignUp(DataContext context, Account acount)
        {
            if (string.IsNullOrEmpty(acount.UserName) || null == acount.UserBase)
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            string userName = string.Format("{0}_{1}", acount.UserName, (int)acount.AccountChannel);
            UserAccount uAccount = new UserAccount { UserName = userName, Password = userName };
            UserInfo uInfo = new UserInfo { NickName = acount.UserBase.NickName };
            UserSignUp(context, acount, uAccount, uInfo);
        }

        /// <summary>
        /// 游客账号注册
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        internal static void GuestAccountSignUp(DataContext context, Account acount)
        {
            UserAccount uAccount = new UserAccount { UserName = string.Format("{0}{1}", GuestUserNamePreFix, 0), Password = GuestUserPass };
            UserInfo uInfo = new UserInfo { NickName = "" };
            UserSignUp(context, acount, uAccount, uInfo);
        }

        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        /// <param name="uAccount">用户账户信息</param>
        /// <param name="uInfo">用户个人信息</param>
        private static void UserSignUp(DataContext context, Account acount, UserAccount uAccount, UserInfo uInfo)
        {
            UserExtInfo extInfo = new UserExtInfo
            {
                CreateDeviceId = context.DeviceId,
                CreateAPPChannel = context.ReqChannel,
                CreateAccountChannel = (int)acount.AccountChannel
            };

            UserBiz.CreateUser(uAccount, uInfo, extInfo);
            //注册结果：uAccount.UserId > 0 为成功，反之为失败！
            if (uAccount.UserId > 0)
            {
                //注册成功后，更新游客账户用户名、昵称信息
                if (acount.AccountChannel == AccountChannel.Guest)
                {
                    uAccount.UserName = string.Format("{0}{1}", GuestUserNamePreFix, uAccount.UserId);
                    uInfo.NickName = string.Format("游客{0}", Convert.ToBase64String(uAccount.UserId.GetIntOffsetBytes(), Base64FormattingOptions.None).TrimEnd('='));
                    UserBiz.UpdateGuestUserInfo(uAccount, uInfo);
                } 
           
                //写注册日志
                CreateSignUpLog(context, acount, uAccount);

                //输出登录结果
                UserVaildInfo vaildInfo = new UserVaildInfo
                {
                    UserId = uAccount.UserId,
                    LastLoginDeviceId = context.DeviceId,
                    LastLoginDate = uAccount.CreateDate,
                    LoginCount = uAccount.LoginCount
                };
                SignIn.FlushResult(context, vaildInfo);
            }
            else
            {
                context.Flush(RespondCode.ExecError);
            }
        }

        /// <summary>
        /// 创建注册日志
        /// </summary>
        /// <param name="context">当前请求上下文应答实例</param>
        /// <param name="acount">账号信息</param>
        /// <param name="uAccount">用户账户信息</param>
        private static void CreateSignUpLog(DataContext context, Account acount, UserAccount uAccount)
        {
            UserLoginLog log = new UserLoginLog
            {
                UserId = uAccount.UserId,
                LogType = 1,
                NetworkType = (int)acount.NetworkType,
                AccountChannel = (int)acount.AccountChannel,
                AppChannel = context.ReqChannel,
                AppVersion = acount.Version,
                DeviceId = context.DeviceId,
                LoginAccount = uAccount.UserName,
                CreateDate = DateTime.Now
            };

            LogsBiz.CreateLogs<UserLoginLog>(log);
        }
    }
}