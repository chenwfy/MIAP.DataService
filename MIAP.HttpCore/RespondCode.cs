namespace MIAP.HttpCore
{
    /// <summary>
    /// 响应结果状态码定义类
    /// </summary>
    public static class RespondCode
    {
        /// <summary>
        /// 成功
        /// </summary>
        public const string Success = "SUCCESS";

        /// <summary>
        /// 第一层数据校验错误
        /// </summary>
        public const string HeaderSigInvalid = "HS_INVALID";

        /// <summary>
        /// 第二层数据校验错误
        /// </summary>
        public const string BodyDataInvalid = "BODY_INVALID";

        /// <summary>
        /// 请求命令错误
        /// </summary>
        public const string CmdInvalid = "CMD_INVALID";

        /// <summary>
        /// 设备编码不正确
        /// </summary>
        public const string DeviceInvalid = "DID_INVALID";

        /// <summary>
        /// 用户鉴权错误
        /// </summary>
        public const string SessionInvalid = "NOT_LOGIN";

        /// <summary>
        /// 请求缺少必须的数据
        /// </summary>
        public const string CmdDataLack = "CD_LACK";

        /// <summary>
        /// 请求数据错误
        /// </summary>
        public const string DataInvalid = "CD_INVALID";

        /// <summary>
        /// 命令执行错误
        /// </summary>
        public const string ExecError = "EXEC_ERROR";

        /// <summary>
        /// 自定义错误
        /// </summary>
        public const string CustomError = "CUSTOM_ERROR";

        /// <summary>
        /// 可显示的错误
        /// </summary>
        public const string ShowError = "SHOW_ERROR";
    }
}