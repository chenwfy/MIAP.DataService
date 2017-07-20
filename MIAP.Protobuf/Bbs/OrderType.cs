using System;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 帖子排序类型枚举（Generated From Bbs.Proto）
    /// </summary>
    [ProtoContract(Name = @"OrderType")]
    public enum OrderType
    {
        /// <summary>
        /// 默认排序
        /// </summary>
        [ProtoEnum(Name = @"Default", Value = 0)]
        Default = 0,

        /// <summary>
        /// 发布时间排序
        /// </summary>
        [ProtoEnum(Name = @"PublishTime", Value = 1)]
        PublishTime = 1,

        /// <summary>
        /// 回帖数量排序
        /// </summary>
        [ProtoEnum(Name = @"RepliedCount", Value = 2)]
        RepliedCount = 2,

        /// <summary>
        /// 点“赞”次数排序
        /// </summary>
        [ProtoEnum(Name = @"FavouredCount", Value = 3)]
        FavouredCount = 3
    }
}