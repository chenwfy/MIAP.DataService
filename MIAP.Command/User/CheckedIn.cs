using System;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 用户“今日”是否已签到命令请求执行类
    /// </summary>
    public class CheckedIn : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            int userId = context.UserId;
            bool isCheckedIn = UserBiz.UserCheckedInToday(userId);
            context.Flush<BoolSingle>(new BoolSingle { Data = isCheckedIn });
        }
    }
}