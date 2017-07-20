using System;
using ProtoBuf;

namespace MIAP.Protobuf.Bbs
{
    /// <summary>
    /// 发帖权限枚举（Generated From Bbs.Proto）
    /// </summary>
    [ProtoContract(Name = @"PostRole")]
    public enum PostRole
    {
        /// <summary>
        /// 禁止发帖
        /// </summary>
        [ProtoEnum(Name = @"Forbidden", Value = 0)]
        Forbidden = 0,

        /// <summary>
        /// 总是允许发帖
        /// </summary>
        [ProtoEnum(Name = @"Always", Value = 1)]
        Always = 1,

        /// <summary>
        /// 非学生角色允许发帖（仅针对学校贴吧）
        /// </summary>
        [ProtoEnum(Name = @"NotStudent", Value = 2)]
        NotStudent = 2
    }
}