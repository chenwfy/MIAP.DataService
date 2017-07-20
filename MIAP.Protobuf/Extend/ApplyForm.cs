using System;
using System.ComponentModel;
using ProtoBuf;
using MIAP.Protobuf.Common;

namespace MIAP.Protobuf.Extend
{
    /// <summary>
    /// 报名表单信息类（Generated From Extend.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ApplyForm")]
    public partial class ApplyForm : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 姓名
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 联系电话
        /// </summary>
        private string m_Telphone = "";

        /// <summary>
        /// 所在城市
        /// </summary>
        private ParentSubKv m_City = null;

        /// <summary>
        /// 目标课程编号
        /// </summary>
        private int m_CourseId = default(int);

        /// <summary>
        /// 来源广告编号
        /// </summary>
        private int m_SourceAd = default(int);

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
        /// 报名信息表单数据构成
        /// </summary>
        public ApplyForm() 
        { 
        }

        /// <summary>
        /// 获取或设置报名用户姓名
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置报名用户联系电话
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Telphone", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Telphone
        {
            get { return m_Telphone; }
            set { m_Telphone = value; }
        }
        
        /// <summary>
        /// 获取或设置报名用户所在城市
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"City", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public MIAP.Protobuf.Common.ParentSubKv City
        {
            get { return m_City; }
            set { m_City = value; }
        }

        /// <summary>
        /// 获取或设置报名的目标课程编号
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"CourseId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int CourseId
        {
            get { return m_CourseId; }
            set { m_CourseId = value; }
        }

        /// <summary>
        /// 获取或设置报名来源广告编号
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"SourceAd", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int SourceAd
        {
            get { return m_SourceAd; }
            set { m_SourceAd = value; }
        }
    }
}