﻿using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户验证信息
    /// </summary>
    public class UserVaildInfo
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
        /// 获取或设置用户密码混淆码
        /// </summary>
        public string PasswordSalt { get; set; }

        /// <summary>
        /// 获取或设置用户账户是否可用
        /// </summary>
        public bool IsApproved { get; set; }

        /// <summary>
        /// 获取或设置用户账户是否被锁定
        /// </summary>
        public bool IsLocked { get; set; }

        /// <summary>
        /// 获取或设置用户账户最后一次解锁时间
        /// </summary>
        public DateTime LastLockedoutDate { get; set; }

        /// <summary>
        /// 获取或设置用户登录次数
        /// </summary>
        public int LoginCount { get; set; }

        /// <summary>
        /// 获取或设置用户最后一次登录时间
        /// </summary>
        public DateTime LastLoginDate { get; set; }

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
        /// 获取或设置用户最后一次登录时使用的设备编号
        /// </summary>
        public int LastLoginDeviceId { get; set; }
    }
}