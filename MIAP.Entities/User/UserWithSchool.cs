using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 学校用户相关信息，对应数据库 School_Users 表结构
    /// </summary>
    public sealed class UserWithSchool
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户所属学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置一个值表示当前用户是否为试用账号
        /// </summary>
        public bool IsTrial { get; set; }

        /// <summary>
        /// 获取或设置试用账号来源（比如关联某广告、活动等）
        /// </summary>
        public string TrialedSource { get; set; }

        /// <summary>
        /// 获取或设置试用账号是否已激活
        /// </summary>
        public bool IsActivated { get; set; }

        /// <summary>
        /// 获取或设置试用账号激活时间
        /// </summary>
        public DateTime ActivatedDate { get; set; }

        /// <summary>
        /// 获取或设置试用账号是否已过期
        /// </summary>
        public bool IsExpired { get; set; }

        /// <summary>
        /// 获取或设置试用账号过期时间
        /// </summary>
        public DateTime ExpiredDate { get; set; }

        /// <summary>
        /// 获取或设置“学号”信息
        /// </summary>
        public string StudNo { get; set; }

        /// <summary>
        /// 获取或设置“班级”信息
        /// </summary>
        public string ClassInfo { get; set; }

        /// <summary>
        /// 获取或设置“学校备注”信息
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示该用户信息是否需要同步至学校BBS
        /// </summary>
        public bool SyncForBbs { get; set; }

        /// <summary>
        /// 获取或设置用户学习状态：0-空闲中，1-学习中，2-已结业
        /// </summary>
        public int Status { get; set; }
    }
}