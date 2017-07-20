using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用单个BOOL值数据结构信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"BoolSingle")]
    public partial class BoolSingle : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// BOOL值数据
        /// </summary>
        private bool m_Data = default(bool);

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
        /// 表示仅有一个BOOL类型字段的数据结构
        /// </summary>
        public BoolSingle()
        {
        }

        /// <summary>
        /// 获取或设置BOOL类型数据
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue(default(bool))]
        public bool Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }
    }
}