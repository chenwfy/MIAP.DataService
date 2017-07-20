using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.School
{
    /// <summary>
    /// 课程列表查询信息类（Generated From School.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"CourseQuery")]
    public partial class CourseQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 查询序号（第几次查询）
        /// </summary>
        private int m_QueryIndex = default(int);

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
        /// 课程列表查询信息
        /// </summary>
        public CourseQuery()
        {
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置当前查询序号（第几次查询）
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }
    }
}