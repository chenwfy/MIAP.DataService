using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// 在线资源查询信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResQuery")]
    public partial class ResQuery : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 查询的难度级别
        /// </summary>
        private ResLevel m_Level = ResLevel.None;

        /// <summary>
        /// 查询的内容类型
        /// </summary>
        private ResRange m_Range = ResRange.All;

        /// <summary>
        /// 查询结果排序方式
        /// </summary>
        private ResSort m_Sort = ResSort.Default;

        /// <summary>
        /// 单次查询数量
        /// </summary>
        private int m_QuerySize = default(int);

        /// <summary>
        /// 当前查询次数序号（第几次查询）
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
        /// 表示一个资源数据查询的数据构成
        /// </summary>
        public ResQuery()
        {
        }

        /// <summary>
        /// 获取或设置查询的资源数据难度级别
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"Level", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResLevel.None)]
        public ResLevel Level
        {
            get { return m_Level; }
            set { m_Level = value; }
        }

        /// <summary>
        /// 获取或设置查询的资源内容类型
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"Range", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResRange.All)]
        public ResRange Range
        {
            get { return m_Range; }
            set { m_Range = value; }
        }

        /// <summary>
        /// 获取或设置查询结果排序方式
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"Sort", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(ResSort.Default)]
        public ResSort Sort
        {
            get { return m_Sort; }
            set { m_Sort = value; }
        }

        /// <summary>
        /// 获取或设置单次查询数量
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"QuerySize", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QuerySize
        {
            get { return m_QuerySize; }
            set { m_QuerySize = value; }
        }

        /// <summary>
        /// 获取或设置当前查询次数序号（当前第几次查询）
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"QueryIndex", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int QueryIndex
        {
            get { return m_QueryIndex; }
            set { m_QueryIndex = value; }
        }
    }
}