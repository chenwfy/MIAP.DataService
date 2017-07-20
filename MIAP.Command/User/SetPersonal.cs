using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 更新用户个人信息命令请求处理类
    /// </summary>
    public class SetPersonal : ExecuteBase<DataContext>
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

            Personal personal = cmdData.ProtoBufDeserialize<Personal>();
            if (Compiled.Debug)
                personal.Debug("=== User.SetPersonal 上行数据===");

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);

            DateTime birthDay = (personal.BirthDay ?? string.Empty).Parse<DateTime>();
            if (birthDay == default(DateTime))
                birthDay = DateTime.Now.AddYears(-18);
            
            UserInfo userInfo = new UserInfo
            {
                UserId = context.UserId,
                NickName = personal.NickName ?? string.Empty,
                Signature = personal.Signature ?? string.Empty,
                Gender = (int)personal.Gender,
                Birthday = birthDay,
                Area = personal.City == null ? string.Empty : personal.City.ToString(),
                Interests = personal.Interest == null ? string.Empty : personal.Interest.ToString()
            };

            UserBiz.UpdateUserInfo(userInfo);

            //更改了个人兴趣组，可以重新推送群组信息给用户
            if (!userCache.Area.Equals(userInfo.Area) && !string.IsNullOrEmpty(userInfo.Area))
            { 
                //Todo
            }

            context.Flush();
        }
    }
}