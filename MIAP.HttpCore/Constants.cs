namespace MIAP.HttpCore
{
    /// <summary>
    /// 内部常量定义
    /// </summary>
    internal static class Constants
    {
        /// <summary>
        /// 请求应答上下文实例中实例缓存名称
        /// </summary>
        internal const string ContextKey = "CONTEXT_MIAP";

        /// <summary>
        /// 请求应答上下文实例中计时器实例名称
        /// </summary>
        internal const string StopwatchKey = "STOPWATCH_MIAP";

        /// <summary>
        /// 请求响应执行的驱动实例名
        /// </summary>
        internal const string CmdProviderName = "MIAP.Command.{0}, MIAP.Command";

        /// <summary>
        /// 当前HTTP请求上下文实例驱动实例名
        /// </summary>
        internal const string ContextProviderName = "MIAP.HttpCore.{0}Context, MIAP.HttpCore";

        /// <summary>
        /// 数据链路请求重定向URL
        /// </summary>
        internal const string DataContextRedirectUrl = "/Service/Data.ashx";

        /// <summary>
        /// 同步链路请求重定向URL
        /// </summary>
        internal const string SyncContextRedirectUrl = "/Service/Sync.ashx";
    }
}