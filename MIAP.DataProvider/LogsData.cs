using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.Logs;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 日志记录模块数据库操作类
    /// </summary>
    public sealed class LogsData
    {
        /// <summary>
        /// 通用存储过程执行方法（仅执行，无返回）
        /// </summary>
        /// <param name="procedureName">存储过程名</param>
        /// <param name="paramNames">输入参数名，多个以英文逗号分隔：“p1, p2, p3 ...”</param>
        /// <param name="paramValues">输入参数对应的参数值，必须和参数对应</param>
        public static void ProcedureExecuteNonQuery(string procedureName, string paramNames, params object[] paramValues)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, procedureName, CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(paramNames, paramValues);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 获取指定用户、指定个人信息类型的更新次数
        /// </summary>
        /// <param name="log">日志内容（用于指定用户编号和更新的个人信息类型）</param>
        /// <returns>曾经更新的次数</returns>
        public static int UserUpdateSelfInfoCount(UserInfoUpdateLog log)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Logs_GetUserInfoUpdatesCount", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("UserId, InfoType", log.UserId, log.InfoType);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}