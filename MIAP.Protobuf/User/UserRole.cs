using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户角色枚举（Generated From User.Proto）
    /// </summary>
    [ProtoContract(Name = @"UserRole")]
    public enum UserRole
    {
        /// <summary>
        /// 一般用户
        /// </summary>
        [ProtoEnum(Name = @"Normal", Value = 0)]
        Normal = 0,

        /// <summary>
        /// 学员
        /// </summary>
        [ProtoEnum(Name = @"Student", Value = 1)]
        Student = 1,

        /// <summary>
        /// 老师
        /// </summary>
        [ProtoEnum(Name = @"Teacher", Value = 2)]
        Teacher = 2,

        /// <summary>
        /// 客服
        /// </summary>
        [ProtoEnum(Name = @"CustomerService", Value = 3)]
        CustomerService = 3,

        /// <summary>
        /// 可进行智能对话的系统用户（聊天机器人）
        /// </summary>
        [ProtoEnum(Name = @"ChatRobot", Value = 10)]
        ChatRobot = 10,

        /// <summary>
        /// 仅单向推送消息的系统用户
        /// </summary>
        [ProtoEnum(Name = @"PushRobot", Value = 11)]
        PushRobot = 11
    }
}