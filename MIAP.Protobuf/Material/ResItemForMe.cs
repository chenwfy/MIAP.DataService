using System;
using System.ComponentModel;
using ProtoBuf;

namespace MIAP.Protobuf.Material
{
    /// <summary>
    /// “每用户”资源内容条信息类（Generated From Material.Proto）
    /// </summary>
    [Serializable, ProtoContract(Name = @"ResItemForMe")]
    public partial class ResItemForMe : IExtensible
    {
        #region 私有成员

        /// <summary>
        /// 资源内容条信息
        /// </summary>
        private ResItem m_ItemInfo = null;

        /// <summary>
        /// 该内容条用户的练习模式得分
        /// </summary>
        private int m_TestScore = default(int);

        /// <summary>
        /// 该内容条用户的练习模式记录
        /// </summary>
        private byte[] m_TestResult = null;

        /// <summary>
        /// 该内容条用户的测试（游戏）模式得分
        /// </summary>
        private int m_GameScore = default(int);

        /// <summary>
        /// 该内容条用户的测试（游戏）模式记录
        /// </summary>
        private byte[] m_GameResult = null;

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
        /// 表示一条和用户相关联的资源内容条信息构成
        /// </summary>
        public ResItemForMe()
        {
        }

        /// <summary>
        /// 获取或设置资源内容条信息
        /// </summary>
        [ProtoMember(1, IsRequired = false, Name = @"ItemInfo", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public ResItem ItemInfo
        {
            get { return m_ItemInfo; }
            set { m_ItemInfo = value; }
        }

        /// <summary>
        /// 获取或设置该资源内容条用户练习模式得分
        /// </summary>
        [ProtoMember(2, IsRequired = false, Name = @"TestScore", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int TestScore
        {
            get { return m_TestScore; }
            set { m_TestScore = value; }
        }

        /// <summary>
        /// 获取或设置该资源内容条用户练习模式记录
        /// </summary>
        [ProtoMember(3, IsRequired = false, Name = @"TestResult", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] TestResult
        {
            get { return m_TestResult; }
            set { m_TestResult = value; }
        }

        /// <summary>
        /// 获取或设置该资源内容条用户游戏（测试）模式得分
        /// </summary>
        [ProtoMember(4, IsRequired = false, Name = @"GameScore", DataFormat = DataFormat.TwosComplement)]
        [DefaultValue(default(int))]
        public int GameScore
        {
            get { return m_GameScore; }
            set { m_GameScore = value; }
        }

        /// <summary>
        /// 获取或设置该资源内容条用户游戏（测试）模式记录
        /// </summary>
        [ProtoMember(5, IsRequired = false, Name = @"GameResult", DataFormat = DataFormat.Default)]
        [DefaultValue(null)]
        public byte[] GameResult
        {
            get { return m_GameResult; }
            set { m_GameResult = value; }
        }
    }
}