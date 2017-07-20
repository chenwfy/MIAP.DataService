using System;
using MIAP.Protobuf.Material;
using MIAP.Utility;

namespace MIAP.Entities.Material
{
    /// <summary>
    /// 词、句、新闻等信息类（从数据库 Material_Wsn_Content 表结构中提取 ）
    /// </summary>
    public sealed class WsnContent
    {
        /// <summary>
        /// 获取或设置信息编号
        /// </summary>
        public int NewsId { get; set; }

        /// <summary>
        /// 获取或设置信息所属分类名称
        /// </summary>
        public string CategoryName { get; set; }

        /// <summary>
        /// 获取或设置信息标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 获取或设置信息副标题
        /// </summary>
        public string SubTitle { get; set; }

        /// <summary>
        /// 获取或设置信息配图URL
        /// </summary>
        public string ImagePath { get; set; }

        /// <summary>
        /// 获取或设置信息发音文件URL
        /// </summary>
        public string AudioPath { get; set; }

        /// <summary>
        /// 提取 Sentence 对象
        /// </summary>
        /// <returns></returns>
        public Sentence ToSentence()
        {
            string[] tmpArr = this.SubTitle.Split('\n');
            return new Sentence
            {
                TextEn = tmpArr[0].Trim(),
                TextCn = tmpArr[1].Trim(),
                ImageUrl = this.ImagePath.ImageUrlFixed(320, 200),
                AudioUrl = this.AudioPath.ImageUrlFixed()
            };
        }

        /// <summary>
        /// 提取 NewsBrief 对象
        /// </summary>
        /// <returns></returns>
        public NewsBrief ToNewsBrief()
        {
            return new NewsBrief
            {
                Title = this.Title.Trim(),
                CategoryName = this.CategoryName.Trim(),
                ImageUrl = this.ImagePath.ImageUrlFixed(200, 120),
                WebUrl = this.NewsId.GetNewsWebUrl()
            };
        }
    }
}