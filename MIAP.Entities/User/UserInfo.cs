using System;

namespace MIAP.Entities.User
{
    /// <summary>
    /// 用户个人信息类，对应数据库 User_UserInfo 表结构
    /// </summary>
    public sealed class UserInfo
    {
        /// <summary>
        /// 获取或设置用户编号
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 获取或设置用户昵称
        /// </summary>
        public string NickName { get; set; }

        /// <summary>
        /// 获取或设置用户真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 获取或设置用户个人信息背景图片文件路径
        /// </summary>
        public string BackIcon { get; set; }

        /// <summary>
        /// 获取或设置用户头像图片文件路径
        /// </summary>
        public string HeadIcon { get; set; }

        /// <summary>
        /// 获取或设置用户个人签名
        /// </summary>
        public string Signature { get; set; }

        /// <summary>
        /// 获取或设置用户描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 获取或设置用户性别：0-保密，1-男，2-女
        /// </summary>
        public int Gender { get; set; }

        /// <summary>
        /// 获取或设置用户出生年月日
        /// </summary>
        public DateTime Birthday { get; set; }

        /// <summary>
        /// 获取或设置用户年龄（计算列，不能写入数据库）
        /// </summary>
        public int UserAge { get; set; }

        /// <summary>
        /// 获取或设置用户身份证号码
        /// </summary>
        public string IDCardNo { get; set; }

        /// <summary>
        /// 获取或设置用户所在地区（省份和城市）
        /// </summary>
        public string Area { get; set; }

        /// <summary>
        /// 获取或设置用户详细通信地址
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// 获取或设置用户详细通信地址的邮政编码
        /// </summary>
        public string PostCode { get; set; }

        /// <summary>
        /// 获取或设置用户所从事的行业
        /// </summary>
        public string Industry { get; set; }

        /// <summary>
        /// 获取或设置用户所在公司名称
        /// </summary>
        public string Company { get; set; }

        /// <summary>
        /// 获取或设置用户职务
        /// </summary>
        public string JobPosition { get; set; }

        /// <summary>
        /// 获取或设置用户个人兴趣
        /// </summary>
        public string Interests { get; set; }

        /// <summary>
        /// 获取或设置用户个人网站URL
        /// </summary>
        public string WebSite { get; set; }

        /// <summary>
        /// 获取或设置用户个人电子邮件账号
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 获取或设置用户移动电话号码
        /// </summary>
        public string Mobile { get; set; }

        /// <summary>
        /// 获取或设置用户联系电话号码
        /// </summary>
        public string Telphone { get; set; }

        /// <summary>
        /// 获取或设置用户联系QQ号码
        /// </summary>
        public string QQ { get; set; }

        /// <summary>
        /// 获取或设置用户MSN账号
        /// </summary>
        public string MSN { get; set; }

        /// <summary>
        /// 获取或设置用户其他信息
        /// </summary>
        public string OtherInfo { get; set; }

        /// <summary>
        /// 获取或设置用户信息最后一次更新时间
        /// </summary>
        public DateTime LastChangeDate { get; set; }
    }
}