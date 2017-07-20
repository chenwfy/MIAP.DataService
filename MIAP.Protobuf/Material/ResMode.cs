using System;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源学习方式枚举（Generated From Material.Proto）
    /// </summary>
    [ProtoContract(Name = @"ResMode")]
    public enum ResMode
    {
        /// <summary>
        /// 听力
        /// </summary>
        [ProtoEnum(Name = @"Listening", Value = 1)]
        Listening = 1,

        /// <summary>
        /// 词汇
        /// </summary>
        [ProtoEnum(Name = @"Vocabulary", Value = 2)]
        Vocabulary = 2,

        /// <summary>
        /// 阅读
        /// </summary>
        [ProtoEnum(Name = @"Reading", Value = 3)]
        Reading = 3,

        /// <summary>
        /// 测试
        /// </summary>
        [ProtoEnum(Name = @"Examing", Value = 4)]
        Examing = 4
    }
}