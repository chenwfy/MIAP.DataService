using System;
using MIAP.Protobuf.Support;

namespace MIAP.Entities.Support
{
    /// <summary>
    /// 应用版本信息
    /// </summary>
    public sealed class AppVersionInfo
    {
        /// <summary>
        /// 获取或设置版本编号
        /// </summary>
        public int VersionId { get; set; }

        /// <summary>
        /// 获取或设置版本所属渠道标识码
        /// </summary>
        public string ChannelCode { get; set; }

        /// <summary>
        /// 获取或设置版本名称（即版本号）
        /// </summary>
        public string VersionName { get; set; }

        /// <summary>
        /// 获取或设置版本的上一个版本编号
        /// </summary>
        public int PrevVersionId { get; set; }

        /// <summary>
        /// 获取或设置版本描述
        /// </summary>
        public string VersionComment { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该版本是否为强制升级版本
        /// </summary>
        public bool IsRequired { get; set; }

        /// <summary>
        /// 获取或设置版本升级渠道：1-应用市场升级，2-自有升级
        /// </summary>
        public int UpgradeSource { get; set; }

        /// <summary>
        /// 获取或设置版本升级路径
        /// </summary>
        public string UpgradePath { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该版本是否可用
        /// </summary>
        public bool IsEnabled { get; set; }

        /// <summary>
        /// 获取或设置版本信息记录创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 转换为Protobuf类AppVersion
        /// </summary>
        /// <returns></returns>
        public AppVersion ToAppVersion()
        {
            return new AppVersion
            {
                VerCode = this.VersionName,
                Comment = this.VersionComment,
                IsRequired = this.IsRequired,
                Channel = (AppVersion.UpgradeChannel)this.UpgradeSource,
                UpgradePath = this.UpgradePath
            };
        }
    }
}