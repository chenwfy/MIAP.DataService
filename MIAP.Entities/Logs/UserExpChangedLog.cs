using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户经验值变更日志信息
    /// </summary>
    public sealed class UserExpChangedLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置经验值变化量
        /// </summary>
        public int ExpChanged { get; set; }

        /// <summary>
        /// 获取或设置经验变更描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置经验值变更时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}