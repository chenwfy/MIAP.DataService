using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户性别枚举（Generated From User.Proto）
    /// </summary>
    [ProtoContract(Name = @"Gender")]
    public enum Gender
    {
        /// <summary>
        /// 保密
        /// </summary>
        [ProtoEnum(Name = @"Secrecy", Value = 0)]
        Secrecy = 0,

        /// <summary>
        /// 男
        /// </summary>
        [ProtoEnum(Name = @"Male", Value = 1)]
        Male = 1,

        /// <summary>
        /// 女
        /// </summary>
        [ProtoEnum(Name = @"Female", Value = 2)]
        Female = 2
    }
}