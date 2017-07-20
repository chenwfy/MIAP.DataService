using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities;
using MIAP.Entities.User;
using MIAP.Entities.Social;
using MIAP.Cache;
using MIAP.Configuration;
using MIAP.DataProvider;
using MIAP.Utility;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 社交模块相关命令请求逻辑处理类
    /// </summary>
    public sealed class SocialBiz
    {
        #region 用户“关注”关系部分

        /// <summary>
        /// 是否已经存在“关注”关系
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="targetUserId">被关注的目标用户编号</param>
        /// <returns>是否已经存在“关注”关系</returns>
        public static bool AlreadyBeFollowed(int userId, int targetUserId)
        {
            return SocialData.BeFollowedWithTargetUser(new UserFollowed { UserId = userId, FollowedUserId = targetUserId });
        }

        /// <summary>
        /// “关注”指定的目标用户（异步）
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="targetUserId">被关注的目标用户编号</param>
        public static async void FollowedTargetUser(int userId, int targetUserId)
        {
            await Task.Run(() =>
            {
                UserFollowed uFollowed = new UserFollowed { UserId = userId, FollowedUserId = targetUserId, CreateDate = DateTime.Now };
                bool result = SocialData.ChangedFollowedWithTargetUser(uFollowed, 1);
                if (result)
                {
                    SocialConfig config = SocialConfigs.GetSocialConfigCache();
                    
                    if (config.BeFollowedExpChanged != 0)
                        UserBiz.UpdateUserExp(targetUserId, config.BeFollowedExpChanged, "被关注");
                    
                    if (config.BeFollowedCoinChanged != 0)
                        UserBiz.UpdateUserCoin(targetUserId, config.BeFollowedCoinChanged, "被关注");
                    
                    UserBiz.SetUserCacheInfo(userId);
                    UserBiz.SetUserCacheInfo(targetUserId);

                    //发送系统消息给被关注对象，提醒该用户被“关注”
                    //Todo....
                }
            });
        }

        /// <summary>
        /// 取消“关注”指定的目标用户（异步）
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="targetUserId">被关注的目标用户编号</param>
        public static async void RemoveFollowedByTargetUser(int userId, int targetUserId)
        {
            await Task.Run(() =>
            {
                UserFollowed uFollowed = new UserFollowed { UserId = userId, FollowedUserId = targetUserId, CreateDate = DateTime.Now };
                bool result = SocialData.ChangedFollowedWithTargetUser(uFollowed, 0);
                if (result)
                {
                    UserBiz.SetUserCacheInfo(userId);
                    UserBiz.SetUserCacheInfo(targetUserId);
                }
            });
        }

        /// <summary>
        /// 获取指定用户“关注”的目标用户信息分页数据
        /// </summary>
        /// <param name="userId">指定的用户编号</param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<UserFollowed> GetUserFollowedPageData(int userId, int pageIndex, int pageSize)
        {
            return GetUsersFollowedPageData(userId, pageIndex, pageSize, 0);
        }

        /// <summary>
        /// 获取“关注”指定用户的用户信息分页数据
        /// </summary>
        /// <param name="userId">指定的用户编号</param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<UserFollowed> GetFollowedUserPageData(int userId, int pageIndex, int pageSize)
        {
            return GetUsersFollowedPageData(userId, pageIndex, pageSize, 1);
        }

        /// <summary>
        /// 获取用户之间单向“关注”关系数据列表
        /// </summary>
        /// <param name="userId">指定的用户</param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="followedType">关注类型：0-用户关注的，1-关注用户的</param>
        /// <returns></returns>
        private static PageResult<UserFollowed> GetUsersFollowedPageData(int userId, int pageIndex, int pageSize, byte followedType)
        {
            List<UserFollowed> userFollowedList = SocialData.GetUsersFollowedList(userId, followedType).ToList();
            PageResult<UserFollowed> pageData = new PageResult<UserFollowed>
            {
                RecordCount = userFollowedList.Count,
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageData.Data = userFollowedList.SkipTake<UserFollowed>(pageData.PageSize, pageData.PageIndex);
            return pageData;
        }

        #endregion

        #region 群组部分

        /// <summary>
        /// 查找群组列表
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="interest"></param>
        /// <param name="onlyLess"></param>
        /// <param name="userId"></param>
        /// <param name="site"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<int> GroupFind(string keyword, string interest, bool onlyLess, int userId, int site, int pageIndex, int pageSize)
        {
            PageResult<int> pageData = new PageResult<int>
            {
                RecordCount = SocialData.GroupFindCount(keyword, interest, onlyLess, userId, site),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            pageData.Data = SocialData.GroupFindList(keyword, interest, onlyLess, userId, site, pageData.PageIndex, pageData.PageSize);
            return pageData;
        }

        /// <summary>
        /// 用户加入群组
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="groupId"></param>
        /// <param name="quickJoinCode"></param>
        /// <returns></returns>
        public static int UserJoinToGroup(int userId, int groupId, string quickJoinCode = "")
        {
            GroupInfo groupInfo = GetGroupInfoFromDb(groupId, quickJoinCode);
            if (null == groupInfo)
                return -2;

            if (groupInfo.MemberCount >= groupInfo.MaxMemberCount)
                return -1;

            GroupMember gMember = new GroupMember { GroupId = groupInfo.GroupId, UserId = userId, IsCreator = groupInfo.CreatorId == userId, CreateDate = DateTime.Now };
            int code = SocialData.UserJoinToGroup(gMember);
            if (1 == code)
            {
                groupInfo.MemberCount++;
                SetGroupCacheInfo(groupInfo.GroupId, groupInfo);

                List<UserCacheInfo> groupMemberList = GetGroupMembersList(groupInfo.GroupId);

                if (groupMemberList.Count > 0)
                {
                    //通知该群组之前的成员(groupMemberList)，更新群组成员列表
                    //Todo
                }

                groupMemberList.Add(UserBiz.ReadUserCacheInfo(userId));
                SetGroupMembersCacheInfo(groupInfo.GroupId, groupMemberList);
            }
            return code;
        }

        /// <summary>
        /// 用户从群组中退出
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="groupId"></param>
        public static void QuitFromGroup(int userId, int groupId)
        {
            GroupInfo groupInfo = ReadGroupCacheInfo(groupId);
            if (null != groupInfo)
            {
                int resultCode = SocialData.UserQuitFromGroup(userId, groupId);

                //仅当前用户退出群
                if (1 == resultCode)
                {
                    groupInfo.MemberCount--;
                    SetGroupCacheInfo(groupId, groupInfo);

                    Func<UserCacheInfo, bool> func = m => m.UserId == userId;
                    List<UserCacheInfo> groupMemberList = GetGroupMembersList(groupId);
                    if (groupMemberList.Count(func) > 0)
                    {
                        var removeUser = groupMemberList.Single(func);
                        groupMemberList.Remove(removeUser);
                        SetGroupMembersCacheInfo(groupInfo.GroupId, groupMemberList);
                    }
                    //通知该群组剩余成员 (groupMemberList)，更新群组成员列表
                    //Todo
                }

                //当前用户为群组创建者，退出成功导致群组解散
                if (0 == resultCode)
                {
                    RemoveGroupInfoCache(groupId);

                    Func<UserCacheInfo, bool> func = m => m.UserId == userId;
                    List<UserCacheInfo> groupMemberList = GetGroupMembersList(groupId);
                    if (groupMemberList.Count(func) > 0)
                    {
                        var removeUser = groupMemberList.Single(func);
                        groupMemberList.Remove(removeUser);
                        RemoveGroupMembersCache(groupId);
                    }

                    //通知该群组剩余成员 (groupMemberList)，群组被解散
                    //Todo
                }
            }
        }

        /// <summary>
        /// 获取指定用户所参与群组列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<int> GetGroupsByUser(int userId, int pageIndex, int pageSize)
        {
            IEnumerable<int> groupIds = SocialData.GetGroupsByUser(userId);
            PageResult<int> resultData = new PageResult<int>
            {
                RecordCount = groupIds.Count(),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            resultData.Data = groupIds.SkipTake<int>(resultData.PageSize, resultData.PageIndex);
            return resultData;
        }

        /// <summary>
        /// 获取群组成员列表
        /// </summary>
        /// <param name="groupId"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PageResult<UserCacheInfo> GetGroupMembers(int groupId, int pageIndex, int pageSize)
        {
            List<UserCacheInfo> memberList = ReadGroupMembersCacheInfo(groupId);
            PageResult<UserCacheInfo> resultData = new PageResult<UserCacheInfo>
            {
                RecordCount = memberList.Count(),
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            resultData.Data = memberList.SkipTake<UserCacheInfo>(resultData.PageSize, resultData.PageIndex);
            return resultData;
        }

        /// <summary>
        /// 创建群组
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="groupName"></param>
        /// <param name="interest"></param>
        /// <param name="iconData"></param>
        /// <param name="iconExtName"></param>
        /// <returns></returns>
        public static GroupInfo CreateGroup(int userId, string groupName, string interest, byte[] iconData, string iconExtName)
        {
            SocialConfig config = SocialConfigs.GetSocialConfigCache();
            GroupInfo groupInfo = new GroupInfo
            {
                GroupName = groupName,
                GroupIcon = config.DefaultGroupIcon,
                Comment = string.Empty,
                CreatorId = userId,
                GroupType = 0,
                InterestCode = interest,
                QuickJoinCode = string.Empty,
                MaxMemberCount = config.GroupMaxMemberCount < 1 ? 20 : config.GroupMaxMemberCount,
                MemberCount = 0,
                CreateDate = DateTime.Now
            };

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(userId);
            SocialData.CreateGroup(groupInfo, userCache.UserSite);

            if (groupInfo.GroupId > 0)
            {
                //更新快速加入码和图标
                groupInfo.QuickJoinCode = Convert.ToBase64String(groupInfo.GroupId.GetIntOffsetBytes()).TrimEnd('=').ToUpper();
                string iconUrl = iconData.SaveMediaFile(FileTarget.Group, groupInfo.GroupId, MediaType.Image, iconExtName);
                if (!string.IsNullOrEmpty(iconUrl))
                    groupInfo.GroupIcon = iconUrl;

                SocialData.UpdateGroupInfo(groupInfo);
                
                //缓存群信息和成员列表信息
                groupInfo.MemberCount++;
                SetGroupCacheInfo(groupInfo.GroupId, groupInfo);
                
                List<UserCacheInfo> memberList = new List<UserCacheInfo>(1) { UserBiz.ReadUserCacheInfo(userId) };
                SetGroupMembersCacheInfo(groupInfo.GroupId, memberList);

                return groupInfo;
            }
            return null;
        }

        #endregion

        #region 群组缓存部分

        /// <summary>
        /// 根据群编号或者快速加入码获取群组信息
        /// </summary>
        /// <param name="groupId">群组编号</param>
        /// <param name="quickJoinCode">快速加入码</param>
        /// <returns>群组信息</returns>
        public static GroupInfo GetGroupInfoFromDb(int groupId, string quickJoinCode = "")
        {
            return SocialData.GetGroupInfo(groupId, quickJoinCode);
        }

        /// <summary>
        /// 从缓存读取群组基本信息
        /// </summary>
        /// <param name="groupId">目标群组编号</param>
        /// <returns>群组基本信息</returns>
        public static GroupInfo ReadGroupCacheInfo(int groupId)
        {
            GroupInfoCacheData cacheData = groupId.GetGroupCacheFromStorage<GroupInfoCacheData>();
            if (null != cacheData && null != cacheData.CacheData && cacheData.CacheData.Length > 0)
                return cacheData.CacheData.ProtoBufDeserialize<GroupInfo>();

            GroupInfo cacheInfo = GetGroupInfoFromDb(groupId);
            if (null == cacheInfo)
                return cacheInfo;

            cacheData = new GroupInfoCacheData { GroupId = cacheInfo.GroupId, CacheData = cacheInfo.ProtoBufSerialize<GroupInfo>() };
            cacheData.GroupCacheStorage<GroupInfoCacheData>();
            return cacheInfo;
        }

        /// <summary>
        /// 将群组信息写入缓存
        /// </summary>
        /// <param name="groupId">目标群组编号</param>
        /// <param name="groupInfo">群组基本信息</param>
        public static async void SetGroupCacheInfo(int groupId, GroupInfo groupInfo = null)
        {
            await Task.Run(() =>
            {
                GroupInfo cacheInfo = groupInfo == null ? GetGroupInfoFromDb(groupId) : groupInfo;
                if (null != cacheInfo)
                    new GroupInfoCacheData { GroupId = cacheInfo.GroupId, CacheData = cacheInfo.ProtoBufSerialize<GroupInfo>() }.GroupCacheStorage<GroupInfoCacheData>();
            });
        }

        /// <summary>
        /// 删除群组信息缓存
        /// </summary>
        /// <param name="groupId"></param>
        public static void RemoveGroupInfoCache(int groupId)
        {
            groupId.RemoveGroupCache<GroupInfoCacheData>();
        }

        /// <summary>
        /// 从数据库读取指定群组成员列表信息
        /// </summary>
        /// <param name="groupId">目标群组编号</param>
        /// <returns>群组成员列表信息</returns>
        public static List<UserCacheInfo> GetGroupMembersList(int groupId)
        {
            IEnumerable<GroupMember> members = SocialData.GetGroupMemebers(groupId);
            return members.Select(m => UserBiz.ReadUserCacheInfo(m.UserId)).ToList();
        }

        /// <summary>
        /// 从缓存读取指定群组成员列表信息
        /// </summary>
        /// <param name="groupId">目标群组编号</param>
        /// <returns>群组成员列表信息</returns>
        public static List<UserCacheInfo> ReadGroupMembersCacheInfo(int groupId)
        {
            GroupMembersCacheData cacheData = groupId.GetGroupCacheFromStorage<GroupMembersCacheData>();
            if (null != cacheData && null != cacheData.CacheData && cacheData.CacheData.Length > 0)
                return cacheData.CacheData.ProtoBufDeserialize<List<UserCacheInfo>>();

            List<UserCacheInfo> cacheInfo = GetGroupMembersList(groupId);
            cacheData = new GroupMembersCacheData { GroupId = groupId, CacheData = cacheInfo.ProtoBufSerialize<List<UserCacheInfo>>() };
            cacheData.GroupCacheStorage<GroupMembersCacheData>();
            return cacheInfo;
        }

        /// <summary>
        /// 将群组成员信息写入缓存
        /// </summary>
        /// <param name="groupId">目标群组编号</param>
        /// <param name="memberList">群组成员列表信息</param>
        public static async void SetGroupMembersCacheInfo(int groupId, List<UserCacheInfo> memberList = null)
        {
            await Task.Run(() =>
            {
                List<UserCacheInfo> cacheInfo = memberList == null ? GetGroupMembersList(groupId) : memberList;
                new GroupMembersCacheData { GroupId = groupId, CacheData = cacheInfo.ProtoBufSerialize<List<UserCacheInfo>>() }.GroupCacheStorage<GroupMembersCacheData>();
            });
        }

        /// <summary>
        /// 删除群组成员列表缓存信息
        /// </summary>
        /// <param name="groupId"></param>
        public static void RemoveGroupMembersCache(int groupId)
        {
            groupId.RemoveGroupCache<GroupMembersCacheData>();
        }

        #endregion
    }
}