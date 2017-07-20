using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 广告PV日志信息
    /// </summary>
    public sealed class AdvertPvLog : ILog
    {
        /// <summary>
        /// 获取或设置广告编号
        /// </summary>
        public int AdvertId { get; set; }

        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置应用渠道标识码
        /// </summary>
        public string AppChannel { get; set; }

        /// <summary>
        /// 获取或设置日志描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置日志记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}