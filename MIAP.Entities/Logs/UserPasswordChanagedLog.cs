using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户更改密码日志信息
    /// </summary>
    public sealed class UserPasswordChanagedLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置修改方式：0-APP终端修改，1-WEB网站修改，2-学校平台修改，3-管理后台修改。。。后续扩展
        /// </summary>
        public int MethodType { get; set; }

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