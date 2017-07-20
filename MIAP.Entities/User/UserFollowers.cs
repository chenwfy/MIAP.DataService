using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户关注关系信息，对应数据库 User_Followers 表结构
    /// </summary>
    public sealed class UserFollowers
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置“关注”的目标用户编号
        /// </summary>
        public int FollowedUserId { get; set; }

        /// <summary>
        /// 获取或设置关系数据记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}