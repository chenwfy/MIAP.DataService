using System;
using MIAP.Protobuf.Bbs;
using MIAP.Utility;

namespace MIAP.Entities.Bbs
{
    /// <summary>
    /// 论坛版块信息结构类（从数据库 Forum_Forums 和 Forum_SchoolForums 中根据实际情况提取）
    /// </summary>
    public sealed class ForumInfo
    {
        /// <summary>
        /// 获取或设置版块编号
        /// </summary>
        public int ForumId { get; set; }

        /// <summary>
        /// 获取或设置版块名称
        /// </summary>
        public string ForumName { get; set; }

        /// <summary>
        /// 获取或设置版块图标URL
        /// </summary>
        public string ForumIcon { get; set; }

        /// <summary>
        /// 获取或设置版块是否允许发帖：0：均不允许 1：可自由发帖 2：只允许老师发帖 4：只允许管理后台发帖 位运算结果
        /// </summary>
        public int AllowPost { get; set; }

        /// <summary>
        /// 获取或设置版块允许发帖的类型：1-普通帖 2-问答贴：提问题，可以设置最佳答案，并奖励积分 4-悬赏帖：提问题，可以设置最佳回答，并奖励金币
        /// </summary>
        public int AllowPostType { get; set; }

        /// <summary>
        /// 获取或设置版块功能连接类型：0：正常论坛功能   1：课程列表功能入口   2：客服列表功能入口   3：我的课表功能入口
        /// </summary>
        public int LinkType { get; set; }

        /// <summary>
        /// 提取 MIAP.Protobuf.Bbs.Forum 结构
        /// </summary>
        /// <returns></returns>
        public Forum ToForum()
        {
            return new Forum
            {
                Id = this.ForumId,
                Name = this.ForumName,
                Icon = this.ForumIcon.ImageUrlFixed(),
                PostRole = (this.AllowPost == 0 || this.AllowPost == 4) ? PostRole.Forbidden : ((this.AllowPost & 1) == 1 ? PostRole.Always : PostRole.NotStudent),
                AllowTopicType = (TopicType)this.AllowPostType,
                ForumType = (ForumType)this.LinkType
            };
        }
    }

    /// <summary>
    /// 版块和新帖数量信息
    /// </summary>
    public sealed class ForumTopicCount
    {
        /// <summary>
        /// 获取或设置版块编号
        /// </summary>
        public int ForumId { get; set; }

        /// <summary>
        /// 获取或设置版块新帖数量
        /// </summary>
        public int TopicCount { get; set; }
    }
}