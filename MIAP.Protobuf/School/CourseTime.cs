using System;
using System.Collections.Generic;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 课程每日上课时间段信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CourseTime")]
    public partial class CourseTime : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 课程信息
        /// </summary>
        private CourseInfo m_Course = null;

        /// <summary>
        /// 上课时间列表
        /// </summary>
        private List<string> m_TimePart = new List<string>(0);

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
        /// 课程及其对应的每日上课时段信息数据构成
        /// </summary>
        public CourseTime()
        {
        }

        /// <summary>
        /// 获取或设置课程信息
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Course", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public CourseInfo Course
        {
            get { return m_Course; }
            set { m_Course = value; }
        }

        /// <summary>
        /// 获取或设置上课时间段（HH:mm - HH:mm 格式）列表
        /// </summary>
        [ProtoMember(2, Name = @"TimePart", DataFormat = DataFormat.Default)]
        public List<string> TimePart
        {
            get { return m_TimePart; }
            set { m_TimePart = value; }
        }
    }
}