using System;
using CSharpLib.Common;
using CSharpLib.Common.Cache;
using CSharpLib.Common.NoSql;

namespace MIAP.Cache
{
    /// <summary>
    /// 登录鉴权辅助类
    /// </summary>
    public static class SessionHelper
    {
        /// <summary>
        /// 
        /// </summary>
        static SessionHelper()
        {
        }

        /// <summary>
        /// 判断当前登录用户鉴权信息是否合法
        /// </summary>
        /// <param name="sessionId"></param>
        /// <param name="userId"></param>
        /// <param name="expired"></param>
        /// <returns></returns>
        public static bool SessionIsValid(this string sessionId, int userId, int expired)
        {
            if (sessionId.Length != 16)
                return false;

            object sessionValue = sessionId.GetSession();
            if (sessionValue != null && (int)sessionValue == userId)
            {
                sessionId.SetSession(userId, expired);
                return true;
            }
            return false;
        }

        /// <summary>
        /// 重新设置会话状态缓存
        /// </summary>
        /// <param name="sessionId"></param>
        /// <param name="userId"></param>
        /// <param name="expired"></param>
        public static void SetSession(this string sessionId, int userId, int expired)
        {
            if (expired > 0)
                sessionId.MemcachedSet(userId, new RelativeTimeExpiration(new TimeSpan(0, expired, 0)));
            else
                sessionId.MemcachedSet(userId, new NeverExpiration());
        }

        /// <summary>
        /// 获取当前登录用户鉴权信息
        /// </summary>
        /// <param name="sessionId">SESSIONID</param>
        /// <returns>SESSIONID对应的用户鉴权信息</returns>
        private static object GetSession(this string sessionId)
        {
            return sessionId.MemcachedRead();
        }

        /// <summary>
        /// 获取SESSIONID
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static string GetSessionId(this int userId)
        {
            return (DateTime.Now.ToString("yyyyMMddHHmmss") + userId + "MIAP").CreateMD5EncryptShort().ToUpper();
        }

        /// <summary>
        /// 移除缓存
        /// </summary>
        /// <param name="sessionId"></param>
        public static void RemoveSession(this string sessionId)
        {
            sessionId.MemcachedRemove();
        }
    }
}