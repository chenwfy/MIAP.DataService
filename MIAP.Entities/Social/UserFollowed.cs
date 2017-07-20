using System;

namespace MIAP.Entities.Social
{
    /// <summary>
    /// “关注”关系信息，对应数据库 User_Followers 表结构
    /// </summary>
    public sealed class UserFollowed
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户“关注”的目标用户编号
        /// </summary>
        public int FollowedUserId { get; set; }
        
        /// <summary>
        /// 获取或设置关系数据记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}