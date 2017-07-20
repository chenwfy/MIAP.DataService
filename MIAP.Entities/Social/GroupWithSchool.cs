using System;

namespace MIAP.Entities.Social
{
    /// <summary>
    /// 群组与学校关系信息类，对应数据库 Chat_Group_SchoolAndClass 表结构
    /// </summary>
    public sealed class GroupWithSchool
    {
        /// <summary>
        /// 获取或设置群组编号
        /// </summary>
        public int GroupId { get; set; }

        /// <summary>
        /// 获取或设置群组所属学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置群组所属班级编号
        /// </summary>
        public int ClassId { get; set; }
    }
}