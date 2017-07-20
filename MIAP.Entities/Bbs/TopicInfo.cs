using System;

namespace MIAP.Entities.Bbs
{
    /// <summary>
    /// 帖子信息类（从数据库 Forum_Topics 表字段中提取）
    /// </summary>
    public class TopicInfo
    {
        /// <summary>
        /// 获取或设置帖子编号
        /// </summary>
        public int TopicId { get; set; }

        /// <summary>
        /// 获取或设置帖子所属板块编号
        /// </summary>
        public int ForumId { get; set; }

        /// <summary>
        /// 获取或设置帖子发布人用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置帖子主题附加内容
        /// </summary>
        public string AttachContent { get; set; }

        /// <summary>
        /// 获取或设置帖子标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 获取或设置帖子内容（XML格式字符串）
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 获取或设置帖子内容简介
        /// </summary>
        public string Intro { get; set; }

        /// <summary>
        /// 获取或设置帖子图标文件路径
        /// </summary>
        public string Icon { get; set; }

        /// <summary>
        /// 获取或设置帖子附带第一个声音文件路径
        /// </summary>
        public string Voice { get; set; }

        /// <summary>
        /// 获取或设置帖子编辑说明
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 获取或设置帖子悬赏的虚拟币额度（0为非悬赏）
        /// </summary>
        public int Reward { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该帖子是否为提问帖
        /// </summary>
        public bool IsQuestion { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该帖子是否允许回复
        /// </summary>
        public bool IsAllowReply { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该帖子是否已被设为置顶
        /// </summary>
        public bool IsStick { get; set; }

        /// <summary>
        /// 获取或设置一个值表示该帖子是否已被设为精华
        /// </summary>
        public bool IsRefined { get; set; }

        /// <summary>
        /// 获取或设置帖子属性值变化说明
        /// </summary>
        public string AttrChangedMark { get; set; }

        /// <summary>
        /// 获取或设置帖子发布人经验值变化值
        /// </summary>
        public int ExpChanged { get; set; }

        /// <summary>
        /// 获取或设置帖子发布人虚拟币账户余额变化值
        /// </summary>
        public int VirtualCoinChanged { get; set; }

        /// <summary>
        /// 获取或设置最佳回复编号
        /// </summary>
        public int BestAnswerId { get; set; }

        /// <summary>
        /// 获取或设置帖子被点赞次数
        /// </summary>
        public int FavouredCount { get; set; }

        /// <summary>
        /// 获取或设置帖子被回复次数
        /// </summary>
        public int RepliedCount { get; set; }

        /// <summary>
        /// 获取或设置帖子被浏览次数
        /// </summary>
        public int ViewCount { get; set; }

        /// <summary>
        /// 获取或设置帖子被收藏次数
        /// </summary>
        public int FavoritedCount { get; set; }

        /// <summary>
        /// 获取或设置帖子发布时间
        /// </summary>
        public DateTime CreateDate { get; set; }
    }

    /// <summary>
    /// 帖子完整信息（对应数据库 Forum_Topics 表结构）
    /// </summary>
    public class TopicFullInfo : TopicInfo
    {
        /// <summary>
        /// 获取或设置帖子所属学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置帖子最新回复的发布人用户编号集合
        /// </summary>
        public string RepliedUserIds { get; set; }

        /// <summary>
        /// 获取或设置帖子最后一次被回复的时间
        /// </summary>
        public DateTime LastRepliedDate { get; set; }

        /// <summary>
        /// 获取或设置帖子状态
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 获取或设置帖子管理日志内容
        /// </summary>
        public string ManageMark { get; set; }

        /// <summary>
        /// 获取或设置帖子最后一次被管理时间
        /// </summary>
        public DateTime LastManageDate { get; set; }
    }
}