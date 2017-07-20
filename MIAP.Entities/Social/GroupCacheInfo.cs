using System;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Social;
using MIAP.Utility;
using ProtoBuf;

namespace MIAP.Entities.Social
{
    /// <summary>
    /// 用于缓存的群组信息
    /// </summary>
    [ProtoContract]
    public sealed class GroupCacheInfo
    {
        /// <summary>
        /// 获取或设置群组编号
        /// </summary>
        [ProtoMember(1, IsRequired = true)]
        public int GroupId { get; set; }

        /// <summary>
        /// 获取或设置群组名称
        /// </summary>
        [ProtoMember(2, IsRequired = true)]
        public string GroupName { get; set; }

        /// <summary>
        /// 获取或设置群组图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = true)]
        public string GroupIcon { get; set; }

        /// <summary>
        /// 获取或设置群组描述
        /// </summary>
        [ProtoMember(4, IsRequired = true)]
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置群组允许的最大成员数
        /// </summary>
        [ProtoMember(5, IsRequired = true)]
        public int MaxMemberCount { get; set; }

        /// <summary>
        /// 获取或设置群组现有成员数
        /// </summary>
        [ProtoMember(6, IsRequired = true)]
        public int MemberCount { get; set; }

        /// <summary>
        /// 获取或设置群组类型：0-普通群，1-系统群
        /// </summary>
        [ProtoMember(7, IsRequired = true)]
        public int GroupType { get; set; }

        /// <summary>
        /// 获取或设置群组创建者用户编号
        /// </summary>
        [ProtoMember(8, IsRequired = true)]
        public int CreatorId { get; set; }

        /// <summary>
        /// 获取或设置群组归属的兴趣组内容
        /// </summary>
        [ProtoMember(9, IsRequired = true)]
        public string InterestCode { get; set; }

        /// <summary>
        /// 获取或设置群组的快速加入码
        /// </summary>
        [ProtoMember(10, IsRequired = true)]
        public string QuickJoinCode { get; set; }

        /// <summary>
        /// 获取或设置群组创建时间
        /// </summary>
        [ProtoMember(11, IsRequired = true)]
        public DateTime CreateDate { get; set; }

        /// <summary>
        /// 转换为GroupBase类
        /// </summary>
        /// <returns></returns>
        public GroupBase ToGroupBase()
        {
            return new GroupBase
            {
                GroupId = this.GroupId,
                GroupIcon = this.GroupIcon.ImageUrlFixed(120, 120),
                GroupName = this.GroupName,
                Comment = this.Comment,
                MaxMemberCount = this.MaxMemberCount,
                MemberCount = this.MemberCount,
                QuickJoinCode = this.QuickJoinCode,
                Interest = new ParentSubKv().Serialize(this.InterestCode)
            };
        }
    }
}