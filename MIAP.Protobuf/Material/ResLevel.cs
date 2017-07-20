using System;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源内容难度等级枚举（Generated From Material.Proto）
    /// </summary>
    [ProtoContract(Name = @"ResLevel")]
    public enum ResLevel
    {
        /// <summary>
        /// 无（用于上行查询，不限难度）
        /// </summary>
        [ProtoEnum(Name = @"None", Value = 0)]
        None = 0,

        /// <summary>
        /// 入门
        /// </summary>
        [ProtoEnum(Name = @"Low", Value = 1)]
        Low = 1,

        /// <summary>
        /// 进阶
        /// </summary>
        [ProtoEnum(Name = @"Middle", Value = 2)]
        Middle = 2,

        /// <summary>
        /// 高级
        /// </summary>
        [ProtoEnum(Name = @"High", Value = 3)]
        High = 3,

        /// <summary>
        /// 挑战
        /// </summary>
        [ProtoEnum(Name = @"Hardest", Value = 4)]
        Hardest = 4
    }
}