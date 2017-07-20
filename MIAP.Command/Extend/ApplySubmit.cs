using System;
using System.Linq;
using MIAP.HttpCore;
using MIAP.Business;
using MIAP.Entities.User;
using MIAP.Entities.Extend;
using MIAP.Protobuf.Common;
using MIAP.Protobuf.Extend;
using CSharpLib.Common;

namespace MIAP.Command.Extend
{
    /// <summary>
    /// 用户提交报名信息命令请求执行类
    /// </summary>
    public class ApplySubmit : ExecuteBase<DataContext>
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

            ApplyForm form = cmdData.ProtoBufDeserialize<ApplyForm>();
            if (Compiled.Debug)
                form.Debug("=== Extend.ApplySubmit 请求数据 ===");

            UserCacheInfo userCache = UserBiz.ReadUserCacheInfo(context.UserId);
            ApplyInfo applyInfo = new ApplyInfo
            {
                UserId = context.UserId,
                SchoolId = userCache.UserSite,
                UserName = form.Name ?? string.Empty,
                Telphone = form.Telphone ?? string.Empty,
                AreaCity = null == form.City ? string.Empty : form.City.ToString(),
                CourseId = form.CourseId,
                SourceAd = form.SourceAd,
                Comment = string.Empty,
                CreateDate = DateTime.Now
            };

            if (string.IsNullOrEmpty(applyInfo.UserName) || string.IsNullOrEmpty(applyInfo.Telphone) || string.IsNullOrEmpty(applyInfo.AreaCity))
            {
                context.Flush(RespondCode.DataInvalid);
                return;
            }

            ExtendBiz.SubmitApply(applyInfo);
            if (applyInfo.Id < 0)
            {
                context.Flush(RespondCode.ExecError);
                return;
            }            
            
            StringSingle result = new StringSingle();
            if (applyInfo.Id > 0)
                result.Data = "报名成功！请保持报名电话畅通，我们将在一个工作日内和您电话联系！";
            else
                result.Data = "您的报名信息已在处理中，请保持报名电话畅通，我们将在一个工作日内和您电话联系！";
            
            context.Flush<StringSingle>(result);
        }
    }
}