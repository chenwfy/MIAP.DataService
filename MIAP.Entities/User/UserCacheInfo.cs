using System;
using ProtoBuf;
using MIAP.Protobuf.User;
using MIAP.Protobuf.Common;
using MIAP.Utility;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用于缓存的用户信息
    /// </summary>
    [ProtoContract]
    public sealed class UserCacheInfo
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        [ProtoMember(1, IsRequired = true)]
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户名
        /// </summary>
        [ProtoMember(2, IsRequired = true)]
        public string UserName { get; set; }

        /// <summary>
        /// 获取或设置用户昵称
        /// </summary>
        [ProtoMember(3, IsRequired = true)]
        public string NickName { get; set; }

        /// <summary>
        /// 获取或设置用户真实姓名
        /// </summary>
        [ProtoMember(4, IsRequired = true)]
        public string RealName { get; set; }

        /// <summary>
        /// 获取或设置用户个人信息背景图片文件路径
        /// </summary>
        [ProtoMember(5, IsRequired = true)]
        public string BackIcon { get; set; }

        /// <summary>
        /// 获取或设置用户头像图片文件路径
        /// </summary>
        [ProtoMember(6, IsRequired = true)]
        public string HeadIcon { get; set; }

        /// <summary>
        /// 获取或设置用户个人签名
        /// </summary>
        [ProtoMember(7, IsRequired = true)]
        public string Signature { get; set; }

        /// <summary>
        /// 获取或设置用户性别：0-保密，1-男，2-女
        /// </summary>
        [ProtoMember(8, IsRequired = true)]
        public int Gender { get; set; }

        /// <summary>
        /// 获取或设置用户所在城市信息
        /// </summary>
        [ProtoMember(9, IsRequired = true)]
        public string Area { get; set; }

        /// <summary>
        /// 获取或设置用户生日(出生年月日)
        /// </summary>
        [ProtoMember(10, IsRequired = true)]
        public DateTime Birthday { get; set; }

        /// <summary>
        /// 获取或设置用户年龄（计算列，不能写入数据库）
        /// </summary>
        [ProtoMember(11, IsRequired = true)]
        public int UserAge { get; set; }

        /// <summary>
        /// 获取或设置用户个人兴趣
        /// </summary>
        [ProtoMember(12, IsRequired = true)]
        public string Interests { get; set; }

        /// <summary>
        /// 获取或设置用户归属：大于0表示为编号为该值的学校用户，0-表示非学校用户
        /// </summary>
        [ProtoMember(13, IsRequired = true)]
        public int UserSite { get; set; }

        /// <summary>
        /// 获取或设置用户角色
        /// </summary>
        [ProtoMember(14, IsRequired = true)]
        public int UserRole { get; set; }

        /// <summary>
        /// 获取或设置用户权限
        /// </summary>
        [ProtoMember(15, IsRequired = true)]
        public int UserAccess { get; set; }

        /// <summary>
        /// 获取或设置用户的经验值
        /// </summary>
        [ProtoMember(16, IsRequired = true)]
        public int ExpScore { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级序号
        /// </summary>
        [ProtoMember(17, IsRequired = true)]
        public int ExpLevel { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级名称
        /// </summary>
        [ProtoMember(18, IsRequired = true)]
        public string GradeName { get; set; }

        /// <summary>
        /// 获取或设置用户的经验等级图标文件路径
        /// </summary>
        [ProtoMember(19, IsRequired = true)]
        public string GradeIcon { get; set; }

        /// <summary>
        /// 获取或设置用户虚拟币账户余额
        /// </summary>
        [ProtoMember(20, IsRequired = true)]
        public int VirtualCoinCount { get; set; }

        /// <summary>
        /// 获取或设置用户“粉丝”总数
        /// </summary>
        [ProtoMember(21, IsRequired = true)]
        public int FansCount { get; set; }

        /// <summary>
        /// 获取或设置用户“关注”总数
        /// </summary>
        [ProtoMember(22, IsRequired = true)]
        public int FollowedCount { get; set; }

        /// <summary>
        /// 获取或设置用户发帖总数
        /// </summary>
        [ProtoMember(23, IsRequired = true)]
        public int TopicCount { get; set; }

        /// <summary>
        /// 获取或设置用户回帖总数
        /// </summary>
        [ProtoMember(24, IsRequired = true)]
        public int ReplyCount { get; set; }

        /// <summary>
        /// 获取或设置“学号”信息
        /// </summary>
        [ProtoMember(25, IsRequired = true)]
        public string StudNo { get; set; }

        /// <summary>
        /// 获取或设置“班级”信息
        /// </summary>
        [ProtoMember(26, IsRequired = true)]
        public string ClassInfo { get; set; }

        /// <summary>
        /// 获取或设置“学校备注”信息
        /// </summary>
        [ProtoMember(27, IsRequired = true)]
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受私信提醒
        /// </summary>
        [ProtoMember(28, IsRequired = true)]
        public bool RemindPrivateMessage { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受群消息提醒
        /// </summary>
        [ProtoMember(29, IsRequired = true)]
        public bool RemindGroupMessage { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受被关注提醒
        /// </summary>
        [ProtoMember(30, IsRequired = true)]
        public bool RemindBeFollowed { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示是否接受帖子被回复提醒
        /// </summary>
        [ProtoMember(31, IsRequired = true)]
        public bool RemindTopicBeReply { get; set; }

        /// <summary>
        /// 获取或设置设备操作系统平台
        /// </summary>
        [ProtoMember(32, IsRequired = true)]
        public int OSPlatform { get; set; }

        /// <summary>
        /// 获取或设置用户设备授权码
        /// </summary>
        [ProtoMember(33, IsRequired = true)]
        public string DeviceToken { get; set; }

        /// <summary>
        /// 获取或设置一个值，表示该用户账号是否为试用账号
        /// </summary>
        [ProtoMember(34, IsRequired = true)]
        public bool IsTrial { get; set; }


        /// <summary>
        /// 从用户缓存信息提取用户基本信息
        /// </summary>
        /// <returns></returns>
        public UserBase ToUserBase()
        {
            return new UserBase
            {
                UserId = this.UserId,
                UserName = this.UserName,
                NickName = this.NickName,
                HeadIcon = this.HeadIcon.ImageUrlFixed(96, 96),
                Signature = this.Signature,
                SchoolId = this.UserSite,
                UserRole = 20 == this.UserRole ? MIAP.Protobuf.User.UserRole.Normal : (UserRole)this.UserRole,
                ExpLevel = new ExpLevel
                {
                    LevelId = this.ExpLevel,
                    ExpScore = this.ExpScore,
                    LevelName = this.GradeName,
                    LevelIcon = this.GradeIcon
                }
            };
        }

        /// <summary>
        /// 从用户缓存信息中提取用户扩展信息
        /// </summary>
        /// <returns></returns>
        public UserExt ToUserExt()
        {
            return new UserExt
            {
                UserId = this.UserId,
                UserName = this.UserName,
                NickName = this.NickName,
                HeadIcon = this.HeadIcon.ImageUrlFixed(96, 96),
                Signature = this.Signature,
                BackIcon = this.BackIcon.ImageUrlFixed(480, 240),
                UserRole = 20 == this.UserRole ? MIAP.Protobuf.User.UserRole.Normal : (UserRole)this.UserRole,
                Gender = (Gender)this.Gender,
                ExpLevel = new ExpLevel
                {
                    LevelId = this.ExpLevel,
                    ExpScore = this.ExpScore,
                    LevelName = this.GradeName,
                    LevelIcon = this.GradeIcon
                },
                City = new ParentSubKv().Serialize(this.Area),
                CoinCount = this.VirtualCoinCount,
                FansCount = this.FansCount,
                FollowedCount = this.FollowedCount,
                InfoInSchool = new UserInSchool
                {
                    StudNo = this.StudNo,
                    ClassInfo = this.ClassInfo,
                    Comment = this.Comment
                },
                Interest = new ParentSubKv().Serialize(this.Interests),
                ReviewCount = this.ReplyCount,
                TopicCount = this.TopicCount,
                UserAge = this.UserAge
            };
        }

        /// <summary>
        /// 从用户缓存信息中提取用户个人信息
        /// </summary>
        /// <returns></returns>
        public Personal ToPersonal()
        {
            return new Personal
            {
                NickName = this.NickName,
                Signature = this.Signature,
                Gender = (Gender)this.Gender,
                City = new ParentSubKv().Serialize(this.Area),
                Interest = new ParentSubKv().Serialize(this.Interests),
                BirthDay = this.Birthday.ToString("yyyy-MM-dd")
            };
        }

        /// <summary>
        /// 从用户缓存信息中提取用户应用设置信息
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