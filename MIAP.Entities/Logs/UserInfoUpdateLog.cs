using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户个人信息变更日志信息
    /// </summary>
    public sealed class UserInfoUpdateLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置变更信息类型：0-个人背景图片，1-个人头像，2-个人信息
        /// </summary>
        public int InfoType { get; set; }

        /// <summary>
        /// 获取或设置变更描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置变更时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}