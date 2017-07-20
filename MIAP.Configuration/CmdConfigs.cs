using System;
using System.Collections.Generic;
using System.Linq;
using CSharpLib.Common;
using CSharpLib.Common.Cache;
using CSharpLib.Common.NoSql;
using MongoDB;

namespace MIAP.Configuration
{
    /// <summary>
    /// 命令号相关配置
    /// </summary>
    public static class CmdConfigs
    {
        private const string CacheKey = "CmdConfigs";

        /// <summary>
        /// 
        /// </summary>
        static CmdConfigs()
        {
        }

        /// <summary>
        /// 判断命令号是否存在
        /// </summary>
        /// <param name="command">待验证的命令号内容</param>
        /// <returns>命令号是否存在</returns>
        public static bool CmdExists(this string command)
        {
            CmdConfig config = GetCmdConfigCache();
            if (null != config)
                return config.CmdList.Count(c => c.Cmd.Equals(command)) > 0;
            return false;
        }

        /// <summary>
        /// 判断命令号是否无需校验：登录鉴权/设备编号
        /// </summary>
        /// <param name="command">待验证的命令号内容</param>
        /// <param name="exceptType">校验例外类型：0-登录鉴权；1-设备编号</param>
        /// <returns>命令号是否无需校验</returns>
        public static bool CmdIsExcepted(this string command, byte exceptType = 0)
        {
            CmdConfig config = GetCmdConfigCache();
            if (null != config)
            {
                List<string> exceptedList = exceptType == 0 ? config.SessionIdExceptedCmds : config.DeviceIdExceptedCmds;
                return exceptedList.Contains(command);
            }
            return false;
        }

        /// <summary>
        /// 获取是否记录每个命令号请求日志
        /// </summary>
        /// <returns></returns>
        public static bool CreateCmdQueryLogs()
        {
            CmdConfig config = GetCmdConfigCache();
            if (null != config)
                return config.CreateCmdQueryLogs;
            return true;
        }

        /// <summary>
        /// 命令号配置信息写入存储
        /// </summary>
        /// <param name="config"></param>
        public static void CmdConfigStorage(this CmdConfig config)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<CmdConfig>().Count() > 0)
                {
                    CmdConfig orgConfig = mc.Collection<CmdConfig>().Linq().First();
                    mc.Collection<CmdConfig>().Update(config, orgConfig);
                }
                else
                    mc.Collection<CmdConfig>().Insert(config);
            }
        }

        /// <summary>
        /// 从存储中读取命令号配置信息
        /// </summary>
        /// <returns></returns>
        public static CmdConfig GetCmdConfigFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<CmdConfig>().Count() > 0)
                    return mc.Collection<CmdConfig>().Linq().First();
            }
            return null;
        }

        /// <summary>
        /// 从缓存读取命令号配置信息
        /// </summary>
        /// <returns></returns>
        private static CmdConfig GetCmdConfigCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal)
                return (CmdConfig)cacheVal;

            CmdConfig config = GetCmdConfigFromStorage();
            if (null != config)
                Const.CoreCacheName.SetCache(CacheKey, config);
            return config;
        }
    }

    #region 

    /// <summary>
    /// 命令号配置信息
    /// </summary>
    public sealed class CmdConfig
    {
        /// <summary>
        /// 是否记录每个命令请求日志
        /// </summary>
        public bool CreateCmdQueryLogs { get; set; }

        /// <summary>
        /// 无需验证设备编号的命令号集合
        /// </summary>
        public List<string> DeviceIdExceptedCmds { get; set; }

        /// <summary>
        /// 无需验证登录状态的命令号集合
        /// </summary>
        public List<string> SessionIdExceptedCmds { get; set; }

        /// <summary>
        /// 命令号和对应的请求服务器配置信息集合
        /// </summary>
        public List<CmdWithReqServer> CmdList { get; set; }
    }

    /// <summary>
    /// 命令号和对应的请求服务器配置信息
    /// </summary>
    public sealed class CmdWithReqServer
    {
        /// <summary>
        /// 命令号
        /// </summary>
        public string Cmd { get; set; }
        
        /// <summary>
        /// 命令号对应的请求服务器信息
        /// </summary>
        public string Server { get; set; }
        
        /// <summary>
        /// 配置标示号
        /// </summary>
        public int VCode { get; set; }
    }

    #endregion
}