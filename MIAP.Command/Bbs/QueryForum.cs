using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.Bbs;
using MIAP.Protobuf.Bbs;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// 用户查询贴吧版块列表命令请求执行类
    /// </summary>
    public class QueryForum : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            List<ForumInfo> forumsUpdated = BbsBiz.GetUpdatedForumsList(context.UserId, context.DeviceId).ToList();
            if (forumsUpdated.Count > 0)
                context.Flush<ForumList>(new ForumList { DataList = forumsUpdated.Select(u => u.ToForum()).ToList() });
            else
                context.Flush();
        }
    }
}