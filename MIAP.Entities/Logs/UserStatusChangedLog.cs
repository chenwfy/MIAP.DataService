using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户状态更改日志信息
    /// </summary>
    public sealed class UserStatusChangedLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置修改方式：0-锁定，1-解锁，后续可扩展
        /// </summary>
        public int Action { get; set; }

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