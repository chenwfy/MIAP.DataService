using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户扩展信息类，对应数据库 User_UserExt 表结构
    /// </summary>
    public sealed class UserExtInfo
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户归属：大于0表示为编号为该值的学校用户，0-表示非学校用户
        /// </summary>
        public int UserSite { get; set; }

        /// <summary>
        /// 获取或设置用户角色
        /// </summary>
        public int UserRole { get; set; }

        /// <summary>
        /// 获取或设置用户权限
        /// </summary>
        public UserAccess UserAccess { get; set; }

        /// <summary>
        /// 获取或设置用户账户创建时所使用的设备编号
        /// </summary>
        public int CreateDeviceId { get; set; }

        /// <summary>
        /// 获取或设置用户账户创建时的应用渠道标识码
        /// </summary>
        public string CreateAPPChannel { get; set; }

        /// <summary>
        /// 获取或设置用户账户创建时的账户类型
        /// </summary>
        public int CreateAccountChannel { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次登录时使用的设备编号
        /// </summary>
        public int LastLoginDeviceId { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次登录时的应用渠道标识码
        /// </summary>
        public string LastLoginAPPChannel { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次登录时的账户类型
        /// </summary>
        public int LastLoginAccountChannel { get; set; }

        /// <summary>
        /// 获取或设置用户的经验值
        /// </summary>
        public int ExpScore { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级序号
        /// </summary>
        public int ExpLevel { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级名称
        /// </summary>
        public string GradeName { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级图标文件路径
        /// </summary>
        public string GradeIcon { get; set; }

        /// <summary>
        /// 获取或设置用户的虚拟币账户余额
        /// </summary>
        public int VirtualCoinCount { get; set; }

        /// <summary>
        /// 获取或设置用户“粉丝”总数
        /// </summary>
        public int FansCount { get; set; }

        /// <summary>
        /// 获取或设置用户“关注”总数
        /// </summary>
        public int FollowedCount { get; set; }

        /// <summary>
        /// 获取或设置用户发帖总数
        /// </summary>
        public int TopicCount { get; set; }

        /// <summary>
        /// 获取或设置用户回帖总数
        /// </summary>
        public int ReplyCount { get; set; }
    }
}