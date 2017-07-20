using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Support
{
    /// <summary>
    /// 用户终端设备信息类（Generated From Support.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"Device")]
    public partial class Device : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// IMSI
        /// </summary>
        private string m_IMSI = "";

        /// <summary>
        /// IMEI
        /// </summary>
        private string m_IMEI = "";

        /// <summary>
        /// 操作系统
        /// </summary>
        private string m_OS = "";

        /// <summary>
        /// 型号或名称
        /// </summary>
        private string m_Model = "";

        /// <summary>
        /// 设备操作系统平台枚举
        /// </summary>
        private OSType m_Platform = OSType.IOS;

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
        { return Extensible.GetExtensionObject(ref extensionObject, createIfMissing); }

        #endregion

        /// <summary>
        /// 用户终端设备信息
        /// </summary>
        public Device()
        {
        }

        /// <summary>
        /// 获取或设置设备IMSI串号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"IMSI", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string IMSI
        {
            get { return m_IMSI; }
            set { m_IMSI = value; }
        }

        /// <summary>
        /// 获取或设置设备IMEI串号
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"IMEI", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string IMEI
        {
            get { return m_IMEI; }
            set { m_IMEI = value; }
        }

        /// <summary>
        /// 获取或设置设备操作系统及版本信息
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"OS", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string OS
        {
            get { return m_OS; }
            set { m_OS = value; }
        }

        /// <summary>
        /// 获取或设置设备型号、名称等信息
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Model", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Model
        {
            get { return m_Model; }
            set { m_Model = value; }
        }

        /// <summary>
        /// 获取或设置设备操作系统平台
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Platform", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(OSType.IOS)]
        public OSType Platform
        {
            get { return m_Platform; }
            set { m_Platform = value; }
        }

        /// <summary>
        /// 设备操作系统平台枚举
        /// </summary>
        [ProtoContract(Name = @"OSType")]
        public enum OSType
        {
            /// <summary>
            /// IOS
            /// </summary>
            [ProtoEnum(Name = @"IOS", Value = 1)]
            IOS = 1,

            /// <summary>
            /// Android
            /// </summary>
            [ProtoEnum(Name = @"Android", Value = 2)]
            Android = 2,

            /// <summary>
            /// Windows Phone
            /// </summary>
            [ProtoEnum(Name = @"WP", Value = 3)]
            WP = 3
        }
    }
}