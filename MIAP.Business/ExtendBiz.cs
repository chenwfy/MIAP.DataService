using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities;
using MIAP.Entities.Extend;
using MIAP.DataProvider;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 辅助扩充内容部分命令请求逻辑处理类
    /// </summary>
    public sealed class ExtendBiz
    {
        /// <summary>
        /// 获取符合条件的前N条广告信息
        /// </summary>
        /// <param name="appChannel">应用渠道标识码</param>
        /// <param name="schoolId">学校编号</param>
        /// <param name="topCount">获取的最大广告数量</param>
        /// <returns>符合条件的前N条广告信息</returns>
        public static IEnumerable<AdvertDetail> GetTopAdverts(string appChannel, int schoolId, int topCount)
        {
            return ExtendData.GetTopAdverts(appChannel, schoolId, topCount);
        }

        /// <summary>
        /// 提交报名信息
        /// </summary>
        /// <param name="apply"></param>
        public static void SubmitApply(ApplyInfo apply)
        {
            ExtendData.SubmitApply(apply);
        }
    }
}