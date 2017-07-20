using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资源内容条信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResItem")]
    public partial class ResItem : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 内容条数据编号
        /// </summary>
        private int m_ItemId = default(int);

        /// <summary>
        /// 内容条名称
        /// </summary>
        private string m_ItemName = "";

        /// <summary>
        /// 内容条图标文件路径
        /// </summary>
        private string m_ItemIcon = "";

        /// <summary>
        /// 内容条图标简介
        /// </summary>
        private string m_Intro = "";

        /// <summary>
        /// 内容条数据文件下载URL
        /// </summary>
        private string m_FilePath = "";

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
        /// 表示一条资源内容条信息数据构成
        /// </summary>
        public ResItem()
        {
        }

        /// <summary>
        /// 获取或设置内容条编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ItemId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ItemId
        {
            get { return m_ItemId; }
            set { m_ItemId = value; }
        }

        /// <summary>
        /// 获取或设置内容条名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ItemName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ItemName
        {
            get { return m_ItemName; }
            set { m_ItemName = value; }
        }

        /// <summary>
        /// 获取或设置内容条图标文件路径
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"ItemIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ItemIcon
        {
            get { return m_ItemIcon; }
            set { m_ItemIcon = value; }
        }

        /// <summary>
        /// 获取或设置内容条简介内容
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Intro", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Intro
        {
            get { return m_Intro; }
            set { m_Intro = value; }
        }

        /// <summary>
        /// 获取或设置内容条数据文件下载路径
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"FilePath", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string FilePath
        {
            get { return m_FilePath; }
            set { m_FilePath = value; }
        }
    }
}