using System;
using System.Text;

namespace MIAP.Protobuf.Common
{
    /// <summary>
    /// 通用两级键值对数据结构信息扩展类
    /// </summary>
    public partial class ParentSubKv
    {
        /// <summary>
        /// 重写ToString()方法
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return string.Join(",", this.ToArray());
        }

        /// <summary>
        /// ParentSubKv 转换为数组格式
        /// </summary>
        /// <returns></returns>
        public string[] ToArray()
        {
            string[] array = new string[2] { "", "" };
            if (this.ParentData != null)
                array[0] = string.Format("{0}|{1}", this.ParentData.Key, this.ParentData.Value);
            if (this.SubData != null)
                array[1] = string.Format("{0}|{1}", this.SubData.Key, this.SubData.Value);
            return array;
        }

        /// <summary>
        /// 将符合格式的字符串信息格式化为ParentSubKv类型
        /// </summary>
        /// <param name="info">符合格式的字符串信息</param>
        /// <returns>ParentSubKv</returns>
        public ParentSubKv Serialize(string info)
        {
            if (!string.IsNullOrEmpty(info) && info.Contains(","))
            {
                string[] array = info.Split(',');
                if (array.Length == 2 && array[0].Contains("|") && array[1].Contains("|"))
                {
                    string[] pArr = array[0].Split('|');
                    string[] sArr = array[1].Split('|');
                    if (pArr.Length == 2 && sArr.Length == 2)
                    {
                        this.ParentData = new KvPair { Key = pArr[0], Value = pArr[1] };
                        this.SubData = new KvPair { Key = sArr[0], Value = sArr[1] };
                        return this;
                    }
                }
            }
            return null;
        }
    }
}