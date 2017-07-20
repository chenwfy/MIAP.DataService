using System;

namespace MIAP.Entities.Support
{
    /// <summary>
    /// 兴趣组信息
    /// </summary>
    public sealed class InterestWordInfo
    {
        /// <summary>
        /// 获取或设置兴趣组编号
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// 获取或设置兴趣组所属类型编号
        /// </summary>
        public int TypeId { get; set; }

        /// <summary>
        /// 获取或设置兴趣组名称
        /// </summary>
        public string Word { get; set; }

        /// <summary>
        /// 获取或设置兴趣组描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置兴趣组排序
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 获取或设置一个值表示兴趣组是否可用
        /// </summary>
        public bool IsEnabled { get; set; }

        /// <summary>
        /// 获取或设置兴趣组数据记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}