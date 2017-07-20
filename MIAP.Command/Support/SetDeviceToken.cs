using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Support;
using MIAP.Entities.Support;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Support
{
    /// <summary>
    /// 设置IOS设备TOKEN命令请求执行类
    /// </summary>
    public class SetDeviceToken : ExecuteBase<DataContext>
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

            StringSingle cmdStr = cmdData.ProtoBufDeserialize<StringSingle>();
            if (Compiled.Debug)
                cmdStr.Debug("=== Support.SetDeviceToken 上行数据===");

            context.Flush();

            UserDevice userDevice = new UserDevice { DeviceId = context.DeviceId, Token = cmdStr.Data };
            SupportBiz.SetDeviceToken(userDevice);
        }
    }
}