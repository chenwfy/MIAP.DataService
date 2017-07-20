namespace MIAP.HttpCore
{
    /// <summary>
    /// 请求执行接口
    /// </summary>
    public interface IExecute<T> where T : IContext
    {
        /// <summary>
        /// 执行请求方法
        /// </summary>
        /// <param name="context">应用请求上下文应答实例</param>
        void Execute(T context);

        /// <summary>
        /// 记录命令请求日志
        /// </summary>
        /// <param name="context">应用请求上下文应答实例</param>
        void CreateCmdLogs(T context);
    }
}