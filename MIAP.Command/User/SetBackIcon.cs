using System;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.User
{
    /// <summary>
    /// 设置用户个人信息背景图片命令请求执行类
    /// </summary>
    public class SetBackIcon : ExecuteBase<DataContext>
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

            MediaDetail iconData = cmdData.ProtoBufDeserialize<MediaDetail>();
            if (Compiled.Debug)
                iconData.Debug("=== User.SetBackIcon 上行数据===");

            if (iconData.Data != null && iconData.Data.Length > 0)
            {
                string extName = (iconData.Name ?? ".jpg").ToLower();
                string iconUrl = UserBiz.SetUserBackIcon(context.UserId, iconData.Data, extName);

                if (!string.IsNullOrEmpty(iconUrl))
                    context.Flush<StringSingle>(new StringSingle { Data = iconUrl });
                else
                    context.Flush(RespondCode.ExecError);
            }
            else
            {
                context.Flush(RespondCode.DataInvalid);
            }
        }
    }
}