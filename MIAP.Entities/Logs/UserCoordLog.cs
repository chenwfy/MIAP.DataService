using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户位置坐标（经纬度）变更日志信息
    /// </summary>
    public sealed class UserCoordLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置坐标获取方式:0-未知；1-GPS；2-基站；3-WIFI；4-IP；5-第三方SDK；6-其他
        /// </summary>
        public int Method { get; set; }

        /// <summary>
        /// 获取或设置经度
        /// </summary>
        public decimal Longitude { get; set; }

        /// <summary>
        /// 获取或设置纬度
        /// </summary>
        public decimal Latitudes { get; set; }
        
        /// <summary>
        /// 获取或设置日志记录时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}