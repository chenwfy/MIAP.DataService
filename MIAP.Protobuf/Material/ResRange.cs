using System;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源数据内容类型枚举（Generated From Material.Proto）
    /// </summary>
    [ProtoContract(Name = @"ResRange")]
    public enum ResRange
    {
        /// <summary>
        /// 所有（用于上行查询，不限类型）
        /// </summary>
        [ProtoEnum(Name = @"All", Value = 0)]
        All = 0,

        /// <summary>
        /// 日常口语
        /// </summary>
        [ProtoEnum(Name = @"Spoken", Value = 1)]
        Spoken = 1,

        /// <summary>
        /// 商务英语
        /// </summary>
        [ProtoEnum(Name = @"Business", Value = 2)]
        Business = 2,

        /// <summary>
        /// 留学出国
        /// </summary>
        [ProtoEnum(Name = @"Abroad", Value = 3)]
        Abroad = 3,

        /// <summary>
        /// 专业英语
        /// </summary>
        [ProtoEnum(Name = @"Professional", Value = 4)]
        Professional = 4
    }
}