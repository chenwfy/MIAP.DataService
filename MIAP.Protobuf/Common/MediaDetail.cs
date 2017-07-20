using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用媒体文件数据结构信息类（Generated From Common.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"MediaDetail")]
    public partial class MediaDetail : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 文件类型
        /// </summary>
        private MediaType m_Type = MediaType.Image;

        /// <summary>
        /// 文件数据
        /// </summary>
        private byte[] m_Data = null;

        /// <summary>
        /// 文件名
        /// </summary>
        private string m_Name = "";

        /// <summary>
        /// 文件属性
        /// </summary>
        private string m_Attr = "";

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
        /// 通用的媒体文件信息数据结构
        /// </summary>
        public MediaDetail()
        {
        }

        /// <summary>
        /// 获取或设置媒体文件类型
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Type", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(MediaType.Image)]
        public MediaType Type
        {
            get { return m_Type; }
            set { m_Type = value; }
        }

        /// <summary>
        /// 获取或设置媒体文件数据
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Data", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] Data
        {
            get { return m_Data; }
            set { m_Data = value; }
        }

        /// <summary>
        /// 获取或设置媒体文件名称
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Name", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        /// <summary>
        /// 获取或设置媒体文件属性
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"Attr", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string Attr
        {
            get { return m_Attr; }
            set { m_Attr = value; }
        }
    }
}