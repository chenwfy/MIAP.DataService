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
    /// “每日一句”命令请求执行类
    /// </summary>
    public class TodaySentence : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            context.Flush<Sentence>(MaterialBiz.GetTodaySentence().ToSentence());
        }
    }
}