using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 命令请求日志信息
    /// </summary>
    public sealed class CmdQueryLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置请求命令号
        /// </summary>
        public string Command { get; set; }

        /// <summary>
        /// 获取或设置请求命令描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置请求命令所属的渠道标识码
        /// </summary>
        public string AppChannel { get; set; }

        /// <summary>
        /// 获取或设置日志记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}