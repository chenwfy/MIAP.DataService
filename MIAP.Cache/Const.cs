using System;
using CSharpLib.Common;

namespace MIAP.Cache
{
    /// <summary>
    /// 应用数据缓存部分配置项、常量部分定义类
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
        /// 配置信息MongoDB存储连接字符串
        /// </summary>
        internal static string ConfigsMongoDbConn
        {
            get { return "MongoDbCached.Configs".GetAppSetting(); }
        }

        /// <summary>
        /// 用户缓存信息MongoDB存储连接字符串
        /// </summary>
        internal static string UsersMongoDbConn
        {
            get { return "MongoDbCached.Users".GetAppSetting(); }
        }

        /// <summary>
        /// 群组缓存信息MongoDB存储连接字符串
        /// </summary>
        internal static string GroupsMongoDbConn
        {
            get { return "MongoDbCached.Groups".GetAppSetting(); }
        }
    }
}