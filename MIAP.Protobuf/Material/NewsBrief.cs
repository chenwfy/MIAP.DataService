using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 资料-资讯阅读内容基本信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"NewsBrief")]
    public partial class NewsBrief : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 信息标题
        /// </summary>
        private string m_Title = "";

        /// <summary>
        /// 信息图片文件路径
        /// </summary>
        private string m_ImageUrl = "";

        /// <summary>
        /// 信息详情展示WEB页面URL
        /// </summary>
        private string m_WebUrl = "";

        /// <summary>
        /// 信息所属分类名称
        /// </summary>
        private string m_CategoryName = "";

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
        /// 0参构造函数
        /// </summary>
        public NewsBrief()
        {
        }

        /// <summary>
        /// 获取或设置信息标题
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Title", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }

        /// <summary>
        /// 获取或设置信息图片文件路径
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ImageUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ImageUrl
        {
            get { return m_ImageUrl; }
            set { m_ImageUrl = value; }
        }

        /// <summary>
        /// 获取或设置信息详情展示WEB页面URL
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"WebUrl", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string WebUrl
        {
            get { return m_WebUrl; }
            set { m_WebUrl = value; }
        }

        /// <summary>
        /// 获取或设置信息所属分类名称
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"CategoryName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string CategoryName
        {
            get { return m_CategoryName; }
            set { m_CategoryName = value; }
        }
    }
}