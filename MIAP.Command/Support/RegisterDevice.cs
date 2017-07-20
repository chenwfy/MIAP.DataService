using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Protobuf.Support;
using MIAP.Entities.Support;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Support
{
    /// <summary>
    /// 设备注册命令请求执行类
    /// </summary>
    public class RegisterDevice : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 设备注册命令请求执行
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

            Device device = cmdData.ProtoBufDeserialize<Device>();
            if (Compiled.Debug)
                device.Debug("=== Support.RegisterDevice 上行数据===");

            UserDevice userDevice = new UserDevice
            {
                IMEI = device.IMEI,
                IMSI = device.IMSI,
                Platform = (int)device.Platform,
                OS = device.OS,
                MSID = context.Msid,
                ChannelCode = context.ReqChannel,
                Code = device.Model,
                Token = string.Empty,
                CreateDate = DateTime.Now
            };

            SupportBiz.RegisterDevice(userDevice);
            context.Flush(BitConverter.GetBytes(userDevice.DeviceId).Reverse());
        }
    }
}