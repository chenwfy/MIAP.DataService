using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Material;
using MIAP.Protobuf.Material;
using CSharpLib.Common;

namespace MIAP.Command.Material
{
    /// <summary>
    /// “每日新闻”命令请求执行类
    /// </summary>
    public class TodayNews : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            byte[] cmdData = context.CmdData;
            if (cmdData.Length == 0)
            {
                context.Flush(RespondCode.CmdDataLack);
                return;
            }

            NewsQuery query = cmdData.ProtoBufDeserialize<NewsQuery>();
            if (Compiled.Debug)
                query.Debug("=== Material.TodayNews 请求数据 ===");

            PageResult<WsnContent> pageResult = MaterialBiz.GetTodayNewsList(query.QueryIndex, query.QuerySize);
            NewsList newsList = new NewsList
            {
                RecordCount = pageResult.RecordCount,
                IndexCount = pageResult.PageCount,
                QueryIndex = pageResult.PageIndex,
                QuerySize = pageResult.PageSize,
                DataList = pageResult.Data.Select(n => n.ToNewsBrief()).ToList()
            };
            context.Flush<NewsList>(newsList);
        }
    }
}