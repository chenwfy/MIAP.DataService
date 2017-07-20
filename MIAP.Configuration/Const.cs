using System;
using CSharpLib.Common;

namespace MIAP.Configuration
{
    /// <summary>
    /// 应用配置部分配置项、常量部分定义类
    /// </summary>
    internal static class Const
    {
        /// <summary>
        /// 系统核心配置缓存名
        /// </summary>
        internal static string CoreCacheName
        {
            get { return "MIPA.CoreCacheName".GetAppSetting(); }
        }

        /// <summary>
        /// 系统核心配置信息MongoDB存储连接字符串
        /// </summary>
        internal static string MongoDbConn
        {
            get { return "MongoDbCached.Configs".GetAppSetting(); }
        }
    }
}