using ProtoBuf;

namespace MIAP.Protobuf.Base
{
    /// <summary>
    /// 命令请求响应状态枚举（Generated From Base.Proto）
    /// </summary>
    [ProtoContract(Name = @"Status")]
    public enum Status
    {
        /// <summary>
        /// 失败
        /// </summary>
        [ProtoEnum(Name = @"Failed", Value = 0)]
        Failed = 0,

        /// <summary>
        /// 成功
        /// </summary>
        [ProtoEnum(Name = @"Succeed", Value = 1)]
        Succeed = 1
    }
}