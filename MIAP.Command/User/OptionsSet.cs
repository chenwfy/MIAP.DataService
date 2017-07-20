using System;
using MIAP.HttpCore;
using MIAP.Protobuf.User;
using MIAP.Entities.User;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 更新用户应用设置命令请求执行类
    /// </summary>
    public class OptionsSet : ExecuteBase<DataContext>
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

            AppOptions options = cmdData.ProtoBufDeserialize<AppOptions>();
            if (Compiled.Debug)
                options.Debug("=== User.OptionsSet 上行数据===");

            UserOptions userOptions = new UserOptions
            {
                UserId = context.UserId,
                RemindPrivateMessage = options.RemindPrivateMessage,
                RemindGroupMessage = options.RemindGroupMessage,
                RemindBeFollowed = options.RemindBeFollowed,
                RemindTopicBeReply = options.RemindTopicBeReply,
                LastChangeDate = DateTime.Now
            };
            UserBiz.SetUserAppOptions(userOptions);

            context.Flush();
        }
    }
}