using System;
using MIAP.Protobuf.Extend;
using MIAP.Utility;

namespace MIAP.Entities.Extend
{
    /// <summary>
    /// 广告信息类，对应数据库 Extend_Adverts 表结构
    /// </summary>
    public sealed class AdvertDetail
    {
        /// <summary>
        /// 获取或设置广告编号
        /// </summary>
        public int AdvertId { get; set; }

        /// <summary>
        /// 获取或设置广告名称（标题）
        /// </summary>
        public string AdName { get; set; }

        /// <summary>
        /// 获取或设置广告图标文件路径
        /// </summary>
        public string SmallerIcon { get; set; }

        /// <summary>
        /// 获取或设置广告打开的 WEB URL
        /// </summary>
        public string AdUrl { get; set; }

        /// <summary>
        /// 获取或设置广告内容页面URL打开方式：
        /// 0：调用外部浏览器打开AdUrl字段指定的页面
        /// 1：应用内嵌WEB控件打开AdUrl字段指定的页面
        /// </summary>
        public int AdType { get; set; }

        /// <summary>
        /// 提取 Advert 信息
        /// </summary>
        /// <returns></returns>
        public Advert ToAdvert()
        {
            return new Advert
            {
                Id = this.AdvertId,
                Name = this.AdName,
                Icon = this.SmallerIcon.ImageUrlFixed(320, 60),
                Url = string.IsNullOrEmpty(this.AdUrl) ? this.AdvertId.GetAdvertWebUrl() : this.AdUrl.Trim(),
                UrlOpen = string.IsNullOrEmpty(this.AdUrl) ? Advert.AdUrlOpen.WebView : Advert.AdUrlOpen.Web
            };
        }
    }
}