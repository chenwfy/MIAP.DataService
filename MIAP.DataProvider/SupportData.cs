using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using MIAP.Entities.Support;
using CSharpLib.DataAccess;
using CSharpLib.Common;

namespace MIAP.DataProvider
{
    /// <summary>
    /// 系统支撑模块数据库操作类
    /// </summary>
    public sealed class SupportData
    {
        /// <summary>
        /// 注册用户设备信息
        /// </summary>
        /// <param name="device"></param>
        public static void RegisterDevice(UserDevice device)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Support_DeviceCreate", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters(
                    "IMSI, IMEI, MSID, Platform, OS, Code, Token, ChannelCode, CreateDate",
                    device.IMSI, device.IMEI, device.MSID, device.Platform, device.OS, device.Code, device.Token, device.ChannelCode, device.CreateDate
                );
                device.DeviceId = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        /// <summary>
        /// 更新设备授权码
        /// </summary>
        /// <param name="device"></param>
        public static void SetDeviceToken(UserDevice device)
        {
            using (DbCommander cmd = new DbCommander(DbConn.WriteDb, "SP_Support_DeviceSetToken", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("DeviceId, Token", device.DeviceId, device.Token);
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 获取下一个版本信息
        /// </summary>
        /// <param name="channelCode">渠道标识码</param>
        /// <param name="currentVerName">当前版本号</param>
        /// <returns>下一个版本信息</returns>
        public static AppVersionInfo GetNextVersion(string channelCode, string currentVerName)
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Support_GetNextVersion", CommandType.StoredProcedure))
            {
                cmd.AddInputParameters("ChannelCode, VersionName", channelCode, currentVerName);
                AppVersionInfo nextVer = null;
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        nextVer = new AppVersionInfo
                        {
                            VersionName = (string)reader["VersionName"],
                            VersionComment = (string)reader["VersionComment"],
                            IsRequired = (bool)reader["IsRequired"],
                            UpgradeSource = (int)reader["UpgradeSource"],
                            UpgradePath = (string)reader["VersionName"]
                        };
                    }
                    reader.Close();
                }
                return nextVer;
            }
        }

        /// <summary>
        /// 获取所有兴趣类型列表
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<InterestTypeInfo> GetInterestTypes()
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Support_GetInterestTypeList", CommandType.StoredProcedure))
            {
                List<InterestTypeInfo> resultData = new List<InterestTypeInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new InterestTypeInfo
                        {
                            Id = (int)reader["Id"],
                            Name = (string)reader["Name"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }

        /// <summary>
        /// 获取所有兴趣组列表
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<InterestWordInfo> GetInterestWords()
        {
            using (DbCommander cmd = new DbCommander(DbConn.ReadDb, "SP_Support_GetInterestWordList", CommandType.StoredProcedure))
            {
                List<InterestWordInfo> resultData = new List<InterestWordInfo>(0);
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        resultData.Add(new InterestWordInfo
                        {
                            Id = (int)reader["Id"],
                            TypeId = (int)reader["TypeId"],
                            Word = (string)reader["Name"]
                        });
                    }
                    reader.Close();
                }
                return resultData;
            }
        }
    }
}