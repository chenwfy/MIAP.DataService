using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 工具-词典翻译结果信息块信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"DictResultPackage")]
    public partial class DictResultPackage : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 信息块名称
        /// </summary>
        private string m_PackageName = "";

        /// <summary>
        /// 信息块内容列表
        /// </summary>
        private List<DictResultPortion> m_PackageData = new List<DictResultPortion>(0);

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
        /// 
        /// </summary>
        public DictResultPackage()
        {
        }

        /// <summary>
        /// 获取或设置信息块名称
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"PackageName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string PackageName
        {
            get { return m_PackageName; }
            set { m_PackageName = value; }
        }

        /// <summary>
        /// 获取或设置信息块内容列表
        /// </summary>
        [ProtoMember(2, Name = @"PackageData", DataFormat = DataFormat.Default)]
        public List<DictResultPortion> PackageData
        {
            get { return m_PackageData; }
            set { m_PackageData = value; }
        }
    }
}