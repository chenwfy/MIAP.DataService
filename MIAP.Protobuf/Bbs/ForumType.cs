using System;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 论坛版块功能类型枚举（Generated From Bbs.Proto）
    /// </summary>
    [ProtoContract(Name = @"ForumType")]
    public enum ForumType
    {
        /// <summary>
        /// 发帖版块
        /// </summary>
        [ProtoEnum(Name = @"ForTopic", Value = 0)]
        ForTopic = 0,

        /// <summary>
        /// 连接至课程列表
        /// </summary>
        [ProtoEnum(Name = @"ForCourse", Value = 1)]
        ForCourse = 1,

        /// <summary>
        /// 连接至客服列表
        /// </summary>
        [ProtoEnum(Name = @"ForCSUser", Value = 2)]
        ForCSUser = 2,

        /// <summary>
        /// 连接至“我的课表”
        /// </summary>
        [ProtoEnum(Name = @"ForMyTimeTable", Value = 3)]
        ForMyTimeTable = 3
    }
}