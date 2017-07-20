using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户虚拟币账户变更日志信息
    /// </summary>
    public sealed class UserVirtualCoinChangedLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置虚拟币账户变更数量
        /// </summary>
        public int VirtualCoinChanged { get; set; }

        /// <summary>
        /// 获取或设置操作描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置日志记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}