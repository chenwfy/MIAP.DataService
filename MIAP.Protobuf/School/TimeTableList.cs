using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 课表列表信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"TimeTableList")]
    public partial class TimeTableList : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 无课表时的描述内容
        /// </summary>
        private string m_Message = "";

        /// <summary>
        /// 课表信息列表
        /// </summary>
        private List<CoursesOneDay> m_CoursesOneDay = new List<CoursesOneDay>(0);

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
        /// 课表信息集合
        /// </summary>
        public TimeTableList()
        {
        }

        /// <summary>
        /// 获取或设置无课表时的描述内容
        /// </summary>

        [ProtoMember(1, IsRequired = false, Name = @"Message", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Message
        {
            get { return m_Message; }
            set { m_Message = value; }
        }

        /// <summary>
        /// 获取或设置课表信息列表
        /// </summary>
        [ProtoMember(2, Name = @"CoursesOneDay", DataFormat = DataFormat.Default)]
        public List<CoursesOneDay> CoursesOneDay
        {
            get { return m_CoursesOneDay; }
            set { m_CoursesOneDay = value; }
        }
    }
}