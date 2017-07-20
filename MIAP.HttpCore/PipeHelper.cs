using System;
using System.Collections.Generic;
using MIAP.Configuration;
using CSharpLib.Common.Cache;

namespace MIAP.HttpCore
{
    /// <summary>
    /// 终端PUSH通道辅助类
    /// </summary>
    public static class PipeHelper
    {
        /// <summary>
        /// 
        /// </summary>
        static PipeHelper()
        {
        }

        /// <summary>
        /// 连接通道缓存名称
        /// </summary>
        private const string PipeCacheName = "MIAP_PIPE";

        /// <summary>
        /// 记录用户PUSH通道
        /// </summary>
        /// <param name="pipe"></param>
        /// <param name="userId"></param>
        public static void SetPipe(this PushPipe pipe, int userId)
        {
            string cacheKey = string.Format("PIPE_{0}", userId);
            object userPipe = PipeCacheName.GetCache(cacheKey);
            if (null != PipeCacheName.GetCache(cacheKey))
                userId.RemovePipes();

            PipeCacheName.SetCache(cacheKey, new Tuple<PushPipe, DateTime>(pipe, DateTime.Now));
        }

        /// <summary>
        /// 获取用户PUSH通道
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static PushPipe GetPipes(this int userId)
        {
            string cacheKey = string.Format("PIPE_{0}", userId);
            object userPipe = PipeCacheName.GetCache(cacheKey);
            if (userPipe == null)
                return null;

            Tuple<PushPipe, DateTime> pipeTuple = userPipe as Tuple<PushPipe, DateTime>;
            if (DateTime.Now.Subtract(pipeTuple.Item2).TotalSeconds <= ExpiredConfigs.GetPipeExpired())
                return pipeTuple.Item1;

            userId.RemovePipes();
            return null;
        }

        /// <summary>
        /// 移除用户PUSH通道
        /// </summary>
        /// <param name="userId"></param>
        public static void RemovePipes(this int userId)
        {
            string cacheKey = string.Format("PIPE_{0}", userId);
            PipeCacheName.RemoveCache(cacheKey);
        }

        /// <summary>
        /// 通过用户PUSH通道将数据PUSH给用户
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pushData"></param>
        public static void Push(this int userId, byte[] pushData)
        {
            PushPipe pipe = userId.GetPipes();
            if (null != pipe)
            {
                pipe.Data = pushData;
                pipe.Push();
            }
            userId.RemovePipes();
        }
    }
}