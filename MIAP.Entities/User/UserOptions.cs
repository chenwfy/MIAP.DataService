using System;
using MIAP.Protobuf.User;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户应用设置信息，对应数据库 User_AppOptions 表结构
    /// </summary>
    public sealed class UserOptions
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受私信提醒
        /// </summary>
        public bool RemindPrivateMessage { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受群消息提醒
        /// </summary>
        public bool RemindGroupMessage { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受被关注提醒
        /// </summary>
        public bool RemindBeFollowed { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受帖子被回复提醒
        /// </summary>
        public bool RemindTopicBeReply { get; set; }

        /// <summary>
        /// 获取或设置用户坐标记录最后一次更新时间
        /// </summary>
        public DateTime LastChangeDate { get; set; }

        /// <summary>
        /// 转换为 MIAP.Protobuf.User.AppOptions 类
        /// </summary>
        /// <returns></returns>
        public AppOptions ToAppOptions()
        {
            return new AppOptions
            {
                RemindPrivateMessage = this.RemindPrivateMessage,
                RemindGroupMessage = this.RemindGroupMessage,
                RemindBeFollowed = this.RemindBeFollowed,
                RemindTopicBeReply = this.RemindTopicBeReply
            };
        }
    }
}