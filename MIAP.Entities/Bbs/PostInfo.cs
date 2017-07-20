using System;

namespace MIAP.Entities.Bbs
{
    /// <summary>
    /// 帖子回复信息（从数据库 Forum_Posts 表中提取）
    /// </summary>
    public class PostInfo
    {
        /// <summary>
        /// 获取或设置回复所属的帖子编号
        /// </summary>
        public int TopicId { get; set; }

        /// <summary>
        /// 获取或设置回帖编号
        /// </summary>
        public int PostId { get; set; }

        /// <summary>
        /// 获取或设置回帖发布人用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置回帖内容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 获取或设置回帖被“点赞”次数
        /// </summary>
        public int FavouredCount { get; set; }

        /// <summary>
        /// 获取或设置回帖针对的目标用户编号
        /// </summary>
        public int ReplyForUserId { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该回复是否被设定为最佳回复
        /// </summary>
        public bool IsBestReply { get; set; }

        /// <summary>
        /// 获取或设置被设定为最佳回复的时间
        /// </summary>
        public DateTime SetBestDate { get; set; }
        
        /// <summary>
        /// 获取或设置该回复引发发布人的经验值变化值
        /// </summary>
        public int ExpChanged { get; set; }

        /// <summary>
        /// 获取或设置该回复引发发布人的虚拟币余额变化值
        /// </summary>
        public int VirtualCoinChanged { get; set; }

        /// <summary>
        /// 获取或设置回复发布时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }

    /// <summary>
    /// 帖子回帖信息（对应数据库 Forum_Posts 表结构）
    /// </summary>
    public class PostFullInfo : PostInfo
    {
        /// <summary>
        /// 获取或设置回复所属的帖子的版块编号
        /// </summary>
        public int ForumId { get; set; }

        /// <summary>
        /// 获取或设置回复所属的帖子的学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置回复状态码
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 获取或设置回复编辑操作说明
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 获取或设置回复的管理操作说明
        /// </summary>
        public string ManageMark { get; set; }

        /// <summary>
        /// 获取或设置回复最后一次管理操作时间
        /// </summary>
        public DateTime LastManageDate { get; set; }
    }
}