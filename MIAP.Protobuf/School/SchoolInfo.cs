using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 学校信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"SchoolInfo")]
    public partial class SchoolInfo : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 学校编号
        /// </summary>
        private int m_Id = default(int);

        /// <summary>
        /// 学校名称
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 英文名
        /// </summary>
        private string m_EnglishName = "";

        /// <summary>
        /// 学校简称
        /// </summary>
        private string m_ShortName = "";

        /// <summary>
        /// 学校LOGO文件路径
        /// </summary>
        private string m_Logo = "";

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
        /// 学校信息数据构成
        /// </summary>
        public SchoolInfo()
        {
        }

        /// <summary>
        /// 获取或设置学校编号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Id", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }

        /// <summary>
        /// 获取或设置学校名称
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置学校英文名
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"EnglishName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string EnglishName
        {
            get { return m_EnglishName; }
            set { m_EnglishName = value; }
        }

        /// <summary>
        /// 获取或设置学校简称
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"ShortName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ShortName
        {
            get { return m_ShortName; }
            set { m_ShortName = value; }
        }

        /// <summary>
        /// 获取或设置学校LOGO图片文件路径
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"Logo", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Logo
        {
            get { return m_Logo; }
            set { m_Logo = value; }
        }
    }
}