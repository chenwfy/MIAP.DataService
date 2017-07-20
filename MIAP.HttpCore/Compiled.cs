namespace MIAP.HttpCore
{
    /// <summary>
    /// 当前应用程序编译方式定义类
    /// </summary>
    public static class Compiled
    {
        /// <summary>
        /// 获取当前应用程序是否以DEBUG方式编译
        /// </summary>
        public static bool Debug
        {
            get
            {
#if DEBUG
                return true;
#else
                return false;
#endif
            }
        }
    }
}