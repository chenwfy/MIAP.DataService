using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户每日签到信息类
    /// </summary>
    public sealed class UserCheckedInLog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置应用渠道标识码
        /// </summary>
        public string AppChannel { get; set; }

        /// <summary>
        /// 获取或设置记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}