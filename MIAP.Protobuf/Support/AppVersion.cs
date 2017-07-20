using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Support
{
    /// <summary>
    /// 应用版本信息类（Generated From Support.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"AppVersion")]
    public partial class AppVersion : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 版本号
        /// </summary>
        private string m_VerCode = "";

        /// <summary>
        /// 版本描述
        /// </summary>
        private string m_Comment = "";

        /// <summary>
        /// 是否为强制升级版本
        /// </summary>
        private bool m_IsRequired = default(bool);

        /// <summary>
        /// 版本升级渠道
        /// </summary>
        private UpgradeChannel m_Channel = UpgradeChannel.SelfServer;

        /// <summary>
        /// 升级路径
        /// </summary>
        private string m_UpgradePath = "";

        /// <summary>
        /// 
        /// </summary>
        private IExtension extensionObject;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="createIfMissing"></param>
        /// <returns></returns>
        IExtension IExtensible.GetExtensionObject(bool createIfMissing)
        {
            return Extensible.GetExtensionObject(ref extensionObject, createIfMissing);
        }

        #endregion

        /// <summary>
        /// 应用版本信息
        /// </summary>
        public AppVersion()
        {
        }

        /// <summary>
        /// 获取或设置版本号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"VerCode", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string VerCode
        {
            get { return m_VerCode; }
            set { m_VerCode = value; }
        }

        /// <summary>
        /// 获取或设置版本描述
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Comment", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Comment
        {
            get { return m_Comment; }
            set { m_Comment = value; }
        }

        /// <summary>
        /// 获取或设置是否为强制升级版本
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"IsRequired", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool IsRequired
        {
            get { return m_IsRequired; }
            set { m_IsRequired = value; }
        }

        /// <summary>
        /// 获取或设置版本升级渠道
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Channel", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(UpgradeChannel.SelfServer)]
        public UpgradeChannel Channel
        {
            get { return m_Channel; }
            set { m_Channel = value; }
        }

        /// <summary>
        /// 获取或设置版本升级路径
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"UpgradePath", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string UpgradePath
        {
            get { return m_UpgradePath; }
            set { m_UpgradePath = value; }
        }

        /// <summary>
        /// 版本升级渠道枚举
        /// </summary>
        [ProtoContract(Name = @"UpgradeChannel")]
        public enum UpgradeChannel
        {
            /// <summary>
            /// 市场升级
            /// </summary>
            [ProtoEnum(Name = @"Market", Value = 1)]
            Market = 1,

            /// <summary>
            /// 自有服务器升级
            /// </summary>
            [ProtoEnum(Name = @"SelfServer", Value = 2)]
            SelfServer = 2
        }
    }
}