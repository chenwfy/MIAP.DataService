using System;

namespace MIAP.Entities.Social
{
    /// <summary>
    /// 群组与成员关系数据信息类，对应数据库 Chat_GroupMembers 表结构
    /// </summary>
    public sealed class GroupMember
    {
        /// <summary>
        /// 获取或设置群组编号
        /// </summary>
        public int GroupId { get; set; }

        /// <summary>
        /// 获取或设置群组成员用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该用户是否为群组的创建者
        /// </summary>
        public bool IsCreator { get; set; }

        /// <summary>
        /// 获取或设置关系数据记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}