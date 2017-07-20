using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 账户类型枚举（Generated From User.Proto）
    /// </summary>
    [ProtoContract(Name = @"AccountChannel")]
    public enum AccountChannel
    {
        /// <summary>
        /// 匿名账号
        /// </summary>
        [ProtoEnum(Name = @"Guest", Value = 0)]
        Guest = 0,

        /// <summary>
        /// 自有账号
        /// </summary>
        [ProtoEnum(Name = @"Owner", Value = 1)]
        Owner = 1,

        /// <summary>
        /// 新浪微博账号
        /// </summary>
        [ProtoEnum(Name = @"Weibo", Value = 11)]
        Weibo = 11,

        /// <summary>
        /// 微信账号
        /// </summary>
        [ProtoEnum(Name = @"WeiXin", Value = 23)]
        WeiXin = 23,

        /// <summary>
        /// 学校账号
        /// </summary>
        [ProtoEnum(Name = @"SchoolAccount", Value = 31)]
        SchoolAccount = 31
    }
}