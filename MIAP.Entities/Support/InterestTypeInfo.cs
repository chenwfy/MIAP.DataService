using System;

namespace MIAP.Entities.Support
{
    /// <summary>
    /// 兴趣组类型信息
    /// </summary>
    public sealed class InterestTypeInfo
    {
        /// <summary>
        /// 获取或设置兴趣组类型编号
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// 获取或设置兴趣组类型名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或设置兴趣组类型描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置兴趣组类型排序
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 获取或设置一个值表示兴趣组类型是否可用
        /// </summary>
        public bool IsEnabled { get; set; }

        /// <summary>
        /// 获取或设置兴趣组类型数据记录时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }
}