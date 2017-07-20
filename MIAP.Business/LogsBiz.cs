using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MIAP.Entities.Logs;
using MIAP.DataProvider;
using CSharpLib.Common;

namespace MIAP.Business
{
    /// <summary>
    /// 日志记录模块业务逻辑处理类
    /// </summary>
    public sealed class LogsBiz
    {
        /// <summary>
        /// 通用日志记录写入数据库方法（异步）
        /// 适用于 MIAP.Entities.Logs 下所有实现了 ILog 接口的日志实体类
        /// 仅适用于日志数据写入数据库操作
        /// 每个实体类对应一个数据库存储过程，对应关系为：SP_Logs_Create + 日志实体类名
        /// 如：CmdQueryLog 对应存储过程为：SP_Logs_CreateCmdQueryLog
        /// 所有存储过程的输入参数为 实体类的 公开成员名称，参数值为成员对应的值
        /// 所有存储过程均无返回值
        /// </summary>
        /// <typeparam name="T">日志类型</typeparam>
        /// <param name="log">日志内容</param>
        public static async void CreateLogs<T>(T log) where T : ILog
        {
            await Task.Run(() =>
            {
                Tuple<string, IEnumerable<string>, IEnumerable<object>> tupleResult = log.ToReflection();
                string logClassName = tupleResult.Item1.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries).Last();
                string dbProcedureName = string.Format("SP_Logs_Create{0}", logClassName);
                LogsData.ProcedureExecuteNonQuery(dbProcedureName, string.Join(",", tupleResult.Item2), tupleResult.Item3.ToArray());
            });
        }

        /// <summary>
        /// 判断用户是否第一次更新指定类型的个人信息（异步）
        /// </summary>
        /// <param name="log">日志内容（用户编号和更新类型字段）</param>
        /// <returns>判断结果</returns>
        public static bool IsFirstUpdateSelfInfoByUser(UserInfoUpdateLog log)
        {
            return LogsData.UserUpdateSelfInfoCount(log) == 0;
        }
    }
}