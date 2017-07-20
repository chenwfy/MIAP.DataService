using System;

namespace MIAP.Entities.Logs
{
    /// <summary>
    /// 用户登录日志信息
    /// </summary>
    public sealed class UserLoginLog : ILog
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置动作类型：0：未知  1：注册    2：登录    3：退出登录
        /// </summary>
        public int LogType { get; set; }

        /// <summary>
        /// 获取或设置操作的设备编号
        /// </summary>
        public int DeviceId { get; set; }

        /// <summary>
        /// 获取或设置操作的账号类型，对应 MIAP.Protobuf.User.AccountChannel
        /// </summary>
        public int AccountChannel { get; set; }

        /// <summary>
        /// 获取或设置操作的账号
        /// </summary>
        public string LoginAccount { get; set; }

        /// <summary>
        /// 获取或设置应用渠道标识码
        /// </summary>
        public string AppChannel { get; set; }

        /// <summary>
        /// 获取或设置应用版本号
        /// </summary>
        public string AppVersion { get; set; }

        /// <summary>
        /// 获取或设置网络类型，对应 MIAP.Protobuf.Common.NetworkType
        /// </summary>
        public int NetworkType { get; set; }

        /// <summary>
        /// 获取或设置日志记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}