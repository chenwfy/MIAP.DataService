using System;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源数据排序类型枚举（Generated From Material.Proto）
    /// </summary>
    [ProtoContract(Name = @"ResSort")]
    public enum ResSort
    {
        /// <summary>
        /// 默认排序
        /// </summary>
        [ProtoEnum(Name = @"Default", Value = 0)]
        Default = 0,

        /// <summary>
        /// 最新优先
        /// </summary>
        [ProtoEnum(Name = @"Latest", Value = 1)]
        Latest = 1,

        /// <summary>
        /// 最热门优先
        /// </summary>
        [ProtoEnum(Name = @"Hottest", Value = 2)]
        Hottest = 2,

        /// <summary>
        /// 最好优先
        /// </summary>
        [ProtoEnum(Name = @"Best", Value = 3)]
        Best = 3
    }
}