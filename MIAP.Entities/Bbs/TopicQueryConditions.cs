using System;
using MIAP.Protobuf.Bbs;

namespace MIAP.Entities.Bbs
{
    /// <summary>
    /// 帖子查询条件信息组合
    /// </summary>
    public class TopicQueryConditions
    {
        /// <summary>
        /// 获取或设置指定查询的学校编号
        /// </summary>
        public int SchoolId { get; set; }

        /// <summary>
        /// 获取或设置指定查询的版块编号
        /// </summary>
        public int ForumId { get; set; }

        /// <summary>
        /// 获取或设置指定查询的发布人用户编号
        /// </summary>
        public int OwnerId { get; set; }

        /// <summary>
        /// 获取或设置指定查询的帖子附加内容
        /// </summary>
        public string AttachContent { get; set; }

        /// <summary>
        /// 获取或设置一个值表示查询是否已有最佳回复的帖子（TRUE表示查询所有，FALSE表示仅查询尚未有最佳回复的帖子）
        /// </summary>
        public bool HasBestAnswer { get; set; }

        /// <summary>
        /// 获取或设置查询匹配的关键词
        /// </summary>
        public string Keyword { get; set; }

        /// <summary>
        /// 获取或设置查询匹配的帖子状态（-1 为不限）
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 获取或设置查询结果列表排序方式
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 帖子查询条件信息结构
        /// </summary>
        public TopicQueryConditions()
        {
        }

        /// <summary>
        /// 帖子查询条件信息结构
        /// </summary>
        /// <param name="schoolId"></param>
        /// <param name="query"></param>
        /// <param name="status"></param>
        public TopicQueryConditions(int schoolId, TopicQuery query, int status = -1)
        {
            this.SchoolId = schoolId;
            this.ForumId = query.ForumId;
            this.OwnerId = query.OwnerId;
            this.AttachContent = query.AttachContent;
            this.HasBestAnswer = query.HasBestAnswer;
            this.Keyword = query.Keyword;
            this.Sort = (int)query.OrderType;
            this.Status = status;
        }
    }
}