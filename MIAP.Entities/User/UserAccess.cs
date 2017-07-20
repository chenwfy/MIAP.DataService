namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户登录权限枚举
    /// </summary>
    public enum UserAccess
    {
        /// <summary>
        /// 无权限
        /// </summary>
        None = 0,

        /// <summary>
        /// 可登录应用客户端（游客、自由注册的用户、学生、老师、客服）
        /// </summary>
        App = 1,

        /// <summary>
        /// 可登录学校管理平台（老师、客服、学校管理员）
        /// </summary>
        SchoolCenter = 2,

        /// <summary>
        /// 可登录网站用户中心（后期扩展网站时可用）
        /// </summary>
        Web = 4
    }
}