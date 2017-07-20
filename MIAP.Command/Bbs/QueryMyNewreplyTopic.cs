using System;
using System.Linq;
using System.Collections.Generic;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities;
using MIAP.Entities.Bbs;
using MIAP.Entities.User;
using MIAP.Protobuf.Bbs;
using CSharpLib.Common;

namespace MIAP.Command.Bbs
{
    /// <summary>
    /// “我”发布的有未读回复的帖子列表命令请求执行类
    /// </summary>
    public class QueryMyNewreplyTopic : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            //byte[] cmdData = context.CmdData;
            //if (cmdData.Length == 0)
            //{
            //    context.Flush(RespondCode.CmdDataLack);
            //    return;
            //}

            //TopicQuery query = cmdData.ProtoBufDeserialize<TopicQuery>();
            //if (Compiled.Debug)
            //    query.Debug("=== Bbs.QueryMyNewreplyTopic 上行数据 ===");
            
            //2014-10-11 取消该命令
            context.Flush();
        }
    }
}