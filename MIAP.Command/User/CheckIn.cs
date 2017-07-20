using System;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 用户“今日”签到命令请求执行类
    /// </summary>
    public class CheckIn : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            int userId = context.UserId;
            string result = UserBiz.UserCheckInToday(userId, context.ReqChannel);
            context.Flush<StringSingle>(new StringSingle { Data = result });
        }
    }
}