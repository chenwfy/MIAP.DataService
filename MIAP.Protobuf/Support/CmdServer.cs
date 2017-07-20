using System;
using System.ComponentModel;
using System.Collections.Generic;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Support
{
    /// <summary>
    /// 命令请求服务分发配置信息类（Generated From Support.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CmdServer")]
    public partial class CmdServer : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 最新版本
        /// </summary>
        private int m_LastVer = default(int);

        /// <summary>
        /// 数据列表
        /// </summary>
        private List<KvPair> m_DataList = new List<KvPair>(0);

        /// <summary>
        /// 
        /// </summary>
        private IExtension extensionObject;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="createIfMissing"></param>
        /// <returns></returns>
        IExtension IExtensible.GetExtensionObject(bool createIfMissing)
        {
            return Extensible.GetExtensionObject(ref extensionObject, createIfMissing);
        }

        #endregion

        /// <summary>
        /// 命令请求服务分发配置信息
        /// </summary>
        public CmdServer()
        {
        }

        /// <summary>
        /// 获取或设置命令分发配置最新版本号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"LastVer", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int LastVer
        {
            get { return m_LastVer; }
            set { m_LastVer = value; }
        }

        /// <summary>
        /// 获取或设置命令分发最新配置数据列表
        /// </summary>
        [ProtoMember(2, Name = @"DataList", DataFormat = DataFormat.Default)]
        public List<KvPair> DataList
        {
            get { return m_DataList; }
            set { m_DataList = value; }
        }
    }
}