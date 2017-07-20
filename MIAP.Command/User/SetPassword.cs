using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Business;
using MIAP.Cache;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 用户更改登录密码命令请求执行类
    /// </summary>
    public class SetPassword : ExecuteBase<DataContext>
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

            PasswordForm passForm = cmdData.ProtoBufDeserialize<PasswordForm>();
            if (Compiled.Debug)
                passForm.Debug("=== User.SetPassword 上行数据===");

            string oldPassword = passForm.OldPassword ?? string.Empty;
            string newPassword = passForm.NewPassword ?? string.Empty;
            if (string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword))
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            UserAccount uAccount = UserBiz.GetUserAccount(context.UserId);
            string oldEncrypt = UserBiz.CreatePassword(oldPassword, uAccount.PasswordSalt);
            if (!oldEncrypt.Equals(uAccount.Password))
            {
                context.Flush(RespondCode.ShowError, "旧密码错误！");
                return;
            }

            if (!oldPassword.Equals(newPassword))
            {
                uAccount.Password = UserBiz.CreatePassword(newPassword, uAccount.PasswordSalt);
                uAccount.LastPasswordChangedDate = DateTime.Now;
                UserBiz.UserChangedPassword(uAccount);
            }

            context.SessionId.RemoveSession();
            context.Flush();
        }
    }
}