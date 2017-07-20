using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户位置坐标（经纬度）信息，对应数据库 User_UserCoords 表
    /// </summary>
    public sealed class UserCoords
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户经度坐标
        /// </summary>
        public decimal Longitude { get; set; }

        /// <summary>
        /// 获取或设置用户纬度坐标
        /// </summary>
        public decimal Latitudes { get; set; }

        /// <summary>
        /// 获取或设置用户坐标记录最后一次更新时间
        /// </summary>
        public DateTime LastChangeTime { get; set; }
    }
}