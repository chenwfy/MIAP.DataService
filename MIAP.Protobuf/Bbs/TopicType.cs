using System;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子类型枚举（Generated From Bbs.Proto）
    /// </summary>
    [ProtoContract(Name = @"TopicType")]
    public enum TopicType
    {
        /// <summary>
        /// 常规帖
        /// </summary>
        [ProtoEnum(Name = @"Normal", Value = 1)]
        Normal = 1,

        /// <summary>
        /// 提问帖
        /// </summary>
        [ProtoEnum(Name = @"Questions", Value = 2)]
        Questions = 2,

        /// <summary>
        /// 悬赏帖
        /// </summary>
        [ProtoEnum(Name = @"Reward", Value = 4)]
        Reward = 4
    }
}