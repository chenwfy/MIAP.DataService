using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.User
{
    /// <summary>
    /// 用户经验值等级信息类（Generated From User.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ExpLevel")]
    public partial class ExpLevel : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 等级编号
        /// </summary>
        private int m_LevelId = default(int);

        /// <summary>
        /// 用户经验值
        /// </summary>
        private int m_ExpScore = default(int);

        /// <summary>
        /// 经验值等级名称
        /// </summary>
        private string m_LevelName = "";

        /// <summary>
        /// 经验值等级图标文件路径
        /// </summary>
        private string m_LevelIcon = "";

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
        /// 用户经验值等级信息
        /// </summary>
        public ExpLevel()
        {
        }

        /// <summary>
        /// 获取或设置经验值等级序号
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"LevelId", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int LevelId
        {
            get { return m_LevelId; }
            set { m_LevelId = value; }
        }

        /// <summary>
        /// 获取或设置用户经验值
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"ExpScore", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int ExpScore
        {
            get { return m_ExpScore; }
            set { m_ExpScore = value; }
        }

        /// <summary>
        /// 获取或设置用户经验值等级名称
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"LevelName", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string LevelName
        {
            get { return m_LevelName; }
            set { m_LevelName = value; }
        }

        /// <summary>
        /// 获取或设置用户经验值等级图标文件路径
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"LevelIcon", DataFormat = DataFormat.Default)]
        [DefaultValue("")]
        public string LevelIcon
        {
            get { return m_LevelIcon; }
            set { m_LevelIcon = value; }
        }
    }
}