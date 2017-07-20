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
    /// 用户系统相关配置信息辅助类
    /// </summary>
    public static class UserConfigs
    {
        private const string CacheKey = "UserConfigs";

        /// <summary>
        /// 
        /// </summary>
        static UserConfigs()
        {
        }

        /// <summary>
        /// 用户系统初始相关配置信息写入存储
        /// </summary>
        /// <param name="config"></param>
        public static void UserConfigStorage(this UserConfig config)
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<UserConfig>().Count() > 0)
                {
                    UserConfig orgConfig = mc.Collection<UserConfig>().Linq().First();
                    mc.Collection<UserConfig>().Update(config, orgConfig);
                }
                else
                    mc.Collection<UserConfig>().Insert(config);
            }
        }

        /// <summary>
        /// 从存储中读取用户系统初始相关配置信息
        /// </summary>
        /// <returns></returns>
        public static UserConfig GetUserConfigFromStorage()
        {
            using (MongoDbContext mc = new MongoDbContext(Const.MongoDbConn))
            {
                if (mc.Collection<UserConfig>().Count() > 0)
                    return mc.Collection<UserConfig>().Linq().First();
            }
            return null;
        }

        /// <summary>
        /// 从缓存读取用户系统初始相关配置信息
        /// </summary>
        /// <returns></returns>
        public static UserConfig GetUserConfigCache()
        {
            object cacheVal = Const.CoreCacheName.GetCache(CacheKey);
            if (null != cacheVal)
                return (UserConfig)cacheVal;

            UserConfig config = GetUserConfigFromStorage();
            if (null != config)
                Const.CoreCacheName.SetCache(CacheKey, config);
            return config;
        }
    }

    /// <summary>
    /// 用户系统初始相关配置信息
    /// </summary>
    public sealed class UserConfig
    {
        /// <summary>
        /// 默认头像路径
        /// </summary>
        public string DefaultHeadIcon { get; set; }

        /// <summary>
        /// 个人信息界面默认背景图片路径（针对非学校用户，学员用户默认背景图片由学校信息设置）
        /// </summary>
        public string DefaultBackIcon { get; set; }

        /// <summary>
        /// 试用账号过期天数（从首次登录之日开始算起）：0为永不过期
        /// </summary>
        public int TrialAccountExpiredDay { get; set; }

        /// <summary>
        /// 初始经验值（注册即有，针对非学校用户）
        /// </summary>
        public int InitExp { get; set; }

        /// <summary>
        /// 初始虚拟币余额（注册即有，针对非学校用户。学校用户可由各学校根据自身情况自行处理）
        /// </summary>
        public int InitCoin { get; set; }

        /// <summary>
        /// 登录增加经验值
        /// </summary>
        public int LoginExpChanged { get; set; }

        /// <summary>
        /// 登录增加虚拟币值
        /// </summary>
        public int LoginCoinChanged { get; set; }

        /// <summary>
        /// 首次更改个人头像增加经验值
        /// </summary>
        public int SetHeadIconExpChanged { get; set; }

        /// <summary>
        /// 首次更改个人头像增加虚拟币值
        /// </summary>
        public int SetHeadIconCoinChanged { get; set; }

        /// <summary>
        /// 首次更改个人信息界面背景图片增加经验值
        /// </summary>
        public int SetBackIconExpChanged { get; set; }

        /// <summary>
        /// 首次更改个人信息界面背景图片增加虚拟币值
        /// </summary>
        public int SetBackIconCoinChanged { get; set; }

        /// <summary>
        /// 首次更新个人信息增加经验值
        /// </summary>
        public int SetPersonalExpChanged { get; set; }

        /// <summary>
        /// 首次更新个人信息增加虚拟币值
        /// </summary>
        public int SetPersonalCoinChanged { get; set; }

        /// <summary>
        /// 连续每日签到增加经验值策略（11个元素，1-10分别为连续签到1-10天的经验值变化数，第11个元素为连续签到超过10天后，仍连续每日签到的经验值变化数）
        /// </summary>
        public List<int> ContinuousCheckedInExpChanged { get; set; }

        /// <summary>
        /// 连续每日签到增加虚拟币策略（11个元素，1-10分别为连续签到1-10天的虚拟币变化数，第11个元素为连续签到超过10天后，仍连续每日签到的虚拟币变化数）
        /// </summary>
        public List<int> ContinuousCheckedInCoinChanged { get; set; }
    }
}