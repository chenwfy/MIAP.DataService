using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 学校用户信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"UserInSchool")]
    public partial class UserInSchool : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 学号
        /// </summary>
        private string m_StudNo = "";

        /// <summary>
        /// 班级信息
        /// </summary>
        private string m_ClassInfo = "";

        /// <summary>
        /// 描述
        /// </summary>
        private string m_Comment = "";

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
        /// 学校用户信息
        /// </summary>
        public UserInSchool()
        {
        }

        /// <summary>
        /// 获取或设置学号信息
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"StudNo", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string StudNo
        {
            get { return m_StudNo; }
            set { m_StudNo = value; }
        }

        /// <summary>
        /// 获取或设置班级信息
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ClassInfo", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string ClassInfo
        {
            get { return m_ClassInfo; }
            set { m_ClassInfo = value; }
        }

        /// <summary>
        /// 获取或设置描述信息
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Comment", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Comment
        {
            get { return m_Comment; }
            set { m_Comment = value; }
        }
    }
}