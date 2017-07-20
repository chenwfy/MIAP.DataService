using System;

namespace MIAP.Entities.Extend
{
    /// <summary>
    /// 报名详情信息，对应数据库 Extend_UserApply 表结构
    /// </summary>
    public sealed class ApplyInfo
    {
        /// <summary>
        /// 获取或设置报名信息编号
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// 获取或设置报名人用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置报名人姓名
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 获取或设置报名人联系电话
        /// </summary>
        public string Telphone { get; set; }

        /// <summary>
        /// 获取或设置报名人所在城市
        /// </summary>
        public string AreaCity { get; set; }

        /// <summary>
        /// 获取或设置报名目标学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置报名目标课程编号
        /// </summary>
        public int CourseId { get; set; }

        /// <summary>
        /// 获取或设置报名人信息来源广告编号
        /// </summary>
        public int SourceAd { get; set; }

        /// <summary>
        /// 获取或设置报名时间
        /// </summary>
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 获取或设置报名信息状态：0-待处理，1-处理中，2-已处理
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 获取或设置报名信息描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置报名信息处理结果描述
        /// </summary>
        public string HandleInfo { get; set; }

        /// <summary>
        /// 获取或设置报名信息处理时间
        /// </summary>
        public DateTime HandleDate { get; set; }
    }
}