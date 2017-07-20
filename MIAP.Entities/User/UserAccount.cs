using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户账户信息，对应数据库 User_UserBase 表结构
    /// </summary>
    public sealed class UserAccount
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户名
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 获取或设置用户密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 获取或设置用户密码加密类型
        /// </summary>
        public int PasswordFormat = 3;

        /// <summary>
        /// 获取或设置用户密码混淆码
        /// </summary>
        public string PasswordSalt { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次更改密码时间
        /// </summary>
        public DateTime LastPasswordChangedDate { get; set; }

        /// <summary>
        /// 获取或设置用户账户是否可用
        /// </summary>
        public bool IsApproved { get; set; }

        /// <summary>
        /// 获取或设置用户账户最后一次设为可用时间
        /// </summary>
        public DateTime ApprovedDate { get; set; }

        /// <summary>
        /// 获取或设置用户账户是否被锁定
        /// </summary>
        public bool IsLocked { get; set; }

        /// <summary>
        /// 获取或设置用户账户最后一次解锁时间
        /// </summary>
        public DateTime LastLockedoutDate { get; set; }

        /// <summary>
        /// 获取或设置用户账户创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 获取或设置用户登录次数
        /// </summary>
        public int LoginCount { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次登录时间
        /// </summary>
        public DateTime LastLoginDate { get; set; }
    }
}