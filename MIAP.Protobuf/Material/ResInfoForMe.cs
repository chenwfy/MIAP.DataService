using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// “我的资源”信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResInfoForMe")]
    public partial class ResInfoForMe : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源基本信息
        /// </summary>
        private ResBasic m_ResBasic = null;

        /// <summary>
        /// 资源大图文件路径
        /// </summary>
        private string m_LargerIcon = "";

        /// <summary>
        /// 资源描述内容
        /// </summary>
        private string m_Comment = "";

        /// <summary>
        /// 资源学习完成度
        /// </summary>
        private double m_Completeness = default(double);

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
        /// 表示一条被用户所拥有的资源数据信息结构
        /// </summary>
        public ResInfoForMe()
        {
        }

        /// <summary>
        /// 获取或设置资源数据基本信息
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ResBasic", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ResBasic ResBasic
        {
            get { return m_ResBasic; }
            set { m_ResBasic = value; }
        }

        /// <summary>
        /// 获取或设置资源对应的大图文件路径
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"LargerIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string LargerIcon
        {
            get { return m_LargerIcon; }
            set { m_LargerIcon = value; }
        }

        /// <summary>
        /// 获取或设置资源描述内容
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Comment", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Comment
        {
            get { return m_Comment; }
            set { m_Comment = value; }
        }

        /// <summary>
        /// 获取或设置用户对该资源的学习完成度
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Completeness", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(double))]
        public double Completeness
        {
            get { return m_Completeness; }
            set { m_Completeness = value; }
        }
    }
}