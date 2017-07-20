using System;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用网络类型枚举（Generated From Common.Proto）
    /// </summary>
    [ProtoContract(Name = @"NetworkType")]
    public enum NetworkType
    {
        /// <summary>
        /// 未知网络
        /// </summary>
        [ProtoEnum(Name = @"Unknow", Value = 0)]
        Unknow = 0,

        /// <summary>
        /// 电信CDMA
        /// </summary>
        [ProtoEnum(Name = @"Cdma", Value = 1)]
        Cdma = 1,

        /// <summary>
        /// 电信CDMA2000
        /// </summary>
        [ProtoEnum(Name = @"Evdo", Value = 2)]
        Evdo = 2,

        /// <summary>
        /// 移动GSM
        /// </summary>
        [ProtoEnum(Name = @"Gsm00", Value = 3)]
        Gsm00 = 3,

        /// <summary>
        /// 移动3G
        /// </summary>
        [ProtoEnum(Name = @"Tdscdma", Value = 4)]
        Tdscdma = 4,

        /// <summary>
        /// 联通GSM
        /// </summary>
        [ProtoEnum(Name = @"Gsm01", Value = 5)]
        Gsm01 = 5,

        /// <summary>
        /// 联通WCDMA
        /// </summary>
        [ProtoEnum(Name = @"Wcdma", Value = 6)]
        Wcdma = 6,

        /// <summary>
        /// 无线网络
        /// </summary>
        [ProtoEnum(Name = @"Wireless", Value = 7)]
        Wireless = 7,

        /// <summary>
        /// 有线网络
        /// </summary>
        [ProtoEnum(Name = @"EtherNet", Value = 8)]
        EtherNet = 8,

        /// <summary>
        /// 移动4G网络
        /// </summary>
        [ProtoEnum(Name = @"Tddlte", Value = 9)]
        Tddlte = 9,

        /// <summary>
        /// 电信、联通4G网络
        /// </summary>
        [ProtoEnum(Name = @"Fddlte", Value = 10)]
        Fddlte = 10,

        /// <summary>
        /// 其他
        /// </summary>
        [ProtoEnum(Name = @"Other", Value = 11)]
        Other = 11
    }
}