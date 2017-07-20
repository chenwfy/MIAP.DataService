namespace MIAP.DataProvider
{
    /// <summary>
    /// 数据库连接配置
    /// </summary>
    internal static class DbConn
    {
        /// <summary>
        /// 可供读取的数据库链接配置
        /// </summary>
        internal const string ReadDb = "DefaultDB";

        /// <summary>
        /// 可供写入的数据库链接配置
        /// </summary>
        internal const string WriteDb = "WriteDB";
    }
}