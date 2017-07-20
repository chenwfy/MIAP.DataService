using System;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用媒体文件类型枚举（Generated From Common.Proto）
    /// </summary>
    [ProtoContract(Name = @"MediaType")]
    public enum MediaType
    {
        /// <summary>
        /// 图像
        /// </summary>
        [ProtoEnum(Name = @"Image", Value = 0)]
        Image = 0,

        /// <summary>
        /// 音频
        /// </summary>
        [ProtoEnum(Name = @"Audio", Value = 1)]
        Audio = 1,

        /// <summary>
        /// 视频
        /// </summary>
        [ProtoEnum(Name = @"Video", Value = 2)]
        Video = 2
    }
}