using System;
using System.Collections.Generic;
using System.Linq;
using CSharpLib.Common;
using CSharpLib.Common.Cache;
using CSharpLib.Common.NoSql;
using MongoDB;

namespace MIAP.Cache
{
    /// <summary>
    /// 群组信息缓存辅助类
    /// </summary>
    public static class GroupCacheHelper
    {
        /// <summary>
        /// 
        /// </summary>
        static GroupCacheHelper()
        {
        }

        /// <summary>
        /// 群组相关信息写入存储
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cacheData"></param>
        public static void GroupCacheStorage<T>(this T cacheData) where T : GroupCacheData
        {
            using (MongoDbContext mc = new MongoDbContext(Const.GroupsMongoDbConn))
            {
                Func<T, bool> func = g => g.GroupId == cacheData.GroupId;
                if (mc.Collection<T>().Count(func) > 0)
                    mc.Collection<T>().Update(cacheData, func);
                else
                    mc.Collection<T>().Insert(cacheData);
            }
        }

        /// <summary>
        /// 从存储中读取指定的群组信息
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public static T GetGroupCacheFromStorage<T>(this int groupId) where T : GroupCacheData
        {
            using (MongoDbContext mc = new MongoDbContext(Const.GroupsMongoDbConn))
            {
                Func<T, bool> func = g => g.GroupId == groupId;
                if (mc.Collection<T>().Count(func) > 0)
                    return mc.Collection<T>().FindOne(func);
                return null;
            }
        }

        /// <summary>
        /// 删除群组相关缓存信息
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="groupId"></param>
        public static void RemoveGroupCache<T>(this int groupId) where T : GroupCacheData
        {
            using (MongoDbContext mc = new MongoDbContext(Const.GroupsMongoDbConn))
            {
                Func<T, bool> func = g => g.GroupId == groupId;
                if (mc.Collection<T>().Count(func) > 0)
                    mc.Collection<T>().Remove(func);
            }
        }
    }

    /// <summary>
    /// 群组缓存信息
    /// </summary>
    public abstract class GroupCacheData
    {
        /// <summary>
        /// 
        /// </summary>
        public GroupCacheData()
        {
        }

        /// <summary>
        /// 群组编号
        /// </summary>
        public int GroupId { get; set; }

        /// <summary>
        /// 群组缓存信息经Protobuf序列化后的数据
        /// </summary>
        public byte[] CacheData { get; set; }
    }

    /// <summary>
    /// 群组基本信息缓存类(CacheData 为群组基本信息经Protobuf序列化后的数据)
    /// </summary>
    public sealed class GroupInfoCacheData : GroupCacheData
    {
        /// <summary>
        /// 
        /// </summary>
        public GroupInfoCacheData()
            : base()
        {
        }
    }

    /// <summary>
    /// 群组成员列表信息缓存类(CacheData 为群组成员列表List 《 UserCacheInfo 》 经Protobuf序列化后的数据)
    /// </summary>
    public sealed class GroupMembersCacheData : GroupCacheData
    {
        /// <summary>
        /// 
        /// </summary>
        public GroupMembersCacheData()
            : base()
        {
        }
    }
}