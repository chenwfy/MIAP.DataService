using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 指定日期内课表信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CoursesOneDay")]
    public partial class CoursesOneDay : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 日期
        /// </summary>
        private string m_Date = "";

        /// <summary>
        /// 课程及上课时段信息列表
        /// </summary>
        private List<CourseTime> m_CourseTime = new List<CourseTime>(0);

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
        /// 指定日期内课表信息
        /// </summary>
        public CoursesOneDay() 
        { 
        }

        /// <summary>
        /// 获取或设置日期（yyyy-MM-dd 格式）
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Date", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Date
        {
            get { return m_Date; }
            set { m_Date = value; }
        }

        /// <summary>
        /// 获取或设置日期内课程及上课时间安排信息列表
        /// </summary>
        [ProtoMember(2, Name = @"CourseTime", DataFormat = DataFormat.Default)]
        public List<CourseTime> CourseTime
        {
            get { return m_CourseTime; }
            set { m_CourseTime = value; }
        }
    }
}