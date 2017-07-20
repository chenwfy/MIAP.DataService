using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户修改密码表单信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"PasswordForm")]
    public partial class PasswordForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 旧密码
        /// </summary>
        private string m_OldPassword = "";

        /// <summary>
        /// 新密码
        /// </summary>
        private string m_NewPassword = "";

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
        /// 用户修改密码表单信息
        /// </summary>
        public PasswordForm()
        {
        }

        /// <summary>
        /// 获取或设置旧密码
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"OldPassword", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string OldPassword
        {
            get { return m_OldPassword; }
            set { m_OldPassword = value; }
        }

        /// <summary>
        /// 获取或设置新密码
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"NewPassword", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string NewPassword
        {
            get { return m_NewPassword; }
            set { m_NewPassword = value; }
        }
    }
}