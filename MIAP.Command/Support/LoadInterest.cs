using System;
using System.Collections.Generic;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Support;
using MIAP.Entities.Support;
using MIAP.Business;
using CSharpLib.Common;

namespace MIAP.Command.Support
{
    /// <summary>
    /// 请求兴趣组数据列表命令执行类
    /// </summary>
    public class LoadInterest : ExecuteBase<DataContext>
    {
        /// <summary>
        /// 命令执行
        /// </summary>
        /// <param name="context"></param>
        public override void Execute(DataContext context)
        {
            var interestTypes = SupportBiz.GetInterestTypes();
            var interestWords = SupportBiz.GetInterestWords();
            InterestList interestList = new InterestList
            {
                DataList = interestTypes.Select(t => new ParentSubListKv
                {
                    ParentData = new KvPair { Key = t.Id.ToString(), Value = t.Name },
                    SubList = interestWords.Where(w => w.TypeId == t.Id).Select(w => new KvPair { Key = w.Id.ToString(), Value = w.Word }).ToList()
                }).ToList()
            };

            context.Flush<InterestList>(interestList);
        }
    }
}