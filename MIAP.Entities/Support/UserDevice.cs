using System;

namespace MIAP.Entities.Support
{
    /// <summary>
    /// 用户设备信息类
    /// </summary>
    public sealed class UserDevice
    {
        /// <summary>
        /// 获取或设置设备编号
        /// </summary>
        public int DeviceId { get; set; }

        /// <summary>
        /// 获取或设置设备IMSI串号
        /// </summary>
        public string IMSI { get; set; }

        /// <summary>
        /// 获取或设置设备IMEI串号
        /// </summary>
        public string IMEI { get; set; }

        /// <summary>
        /// 获取或设置设备手机号码
        /// </summary>
        public string MSID { get; set; }

        /// <summary>
        /// 获取或设置设备操作系统平台:1-IOS, 2-Android, 3-Windows Phone
        /// </summary>
        public int Platform { get; set; }

        /// <summary>
        /// 获取或设置设备操作系统及版本内容
        /// </summary>
        public string OS { get; set; }

        /// <summary>
        /// 获取或设置设备编号
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 获取或设置设备型号、名称等
        /// </summary>
        public string Token { get; set; }

        /// <summary>
        /// 获取或设置设备所属渠道标示码
        /// </summary>
        public string ChannelCode { get; set; }
        
        /// <summary>
        /// 获取或设置记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}