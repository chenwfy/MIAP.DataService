using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户个人主页访问日志信息
    /// </summary>
    public sealed class UserPagePvLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置访客用户编号
        /// </summary>
        public int VisitorId { get; set; }

        /// <summary>
        /// 获取或设置日志记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}