using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MIAP.Entities.Support;
using MIAP.DataProvider;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 系统支撑模块数据逻辑处理类
    /// </summary>
    public sealed class SupportBiz
    {
        /// <summary>
        /// 注册用户设备信息
        /// </summary>
        /// <param name="device"></param>
        public static void RegisterDevice(UserDevice device)
        {
            SupportData.RegisterDevice(device);
        }

        /// <summary>
        /// 更新设备授权码
        /// </summary>
        /// <param name="device"></param>
        public static void SetDeviceToken(UserDevice device)
        {
            SupportData.SetDeviceToken(device);
        }

        /// <summary>
        /// 获取下一个版本信息
        /// </summary>
        /// <param name="channelCode">渠道标识码</param>
        /// <param name="currentVerName">当前版本号</param>
        /// <returns>下一个版本信息</returns>
        public static AppVersionInfo GetNextVersion(string channelCode, string currentVerName)
        {
            return SupportData.GetNextVersion(channelCode, currentVerName);
        }

        /// <summary>
        /// 获取所有兴趣类型列表
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<InterestTypeInfo> GetInterestTypes()
        {
            return SupportData.GetInterestTypes();
        }

        /// <summary>
        /// 获取所有兴趣组列表
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<InterestWordInfo> GetInterestWords()
        {
            return SupportData.GetInterestWords();
        }
    }
}