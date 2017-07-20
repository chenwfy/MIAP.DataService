using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Configuration;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Support;
using CSharpLib.Common;

namespace MIAP.Command.Support
{
    /// <summary>
    /// 获取命令请求分发服务器信息命令执行类
    /// </summary>
    public class CmdDispatch : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 获取命令请求分发服务器信息命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length != 4)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            int lastVer = BitConverter.ToInt32(cmdData.Reverse(), 0);
            if (Compiled.Debug)
            {
                cmdData.Debug("=== Support.CmdDispatch 上行数据===");
                lastVer.Debug("=== Support.CmdDispatch 上行数据 ===");
            }

            CmdConfig config = CmdConfigs.GetCmdConfigFromStorage();
            var cmdWithServers = config.CmdList.Where(c => c.VCode > lastVer);
            if (cmdWithServers.Count() > 0)
            {
                CmdServer result = new CmdServer
                {
                    LastVer = cmdWithServers.Max(c => c.VCode),
                    DataList = cmdWithServers.Select(c => new KvPair { Key = c.Cmd, Value = c.Server }).ToList()
                };
                context.Flush<CmdServer>(result);
            }
            else
            {
                context.Flush();
            }
        }
    }
}