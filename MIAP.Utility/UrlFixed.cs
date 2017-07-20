using System;
using CSharpLib.Common;

namespace MIAP.Utility
{
    /// <summary>
    /// URL路径补全辅助类
    /// </summary>
    public static class UrlFixed
    {
        /// <summary>
        /// 文件存储根目录
        /// </summary>
        internal static string ImageUrlPreFix { get; private set; }

        /// <summary>
        /// 课程详情WEB URL
        /// </summary>
        internal static string CourseWebUrl { get; private set; }

        /// <summary>
        /// 广告详情WEB URL
        /// </summary>
        internal static string AdvertWebUrl { get; private set; }

        /// <summary>
        /// 新闻详情WEB URL
        /// </summary>
        internal static string NewsWebUrl { get; private set; }

        /// <summary>
        /// 
        /// </summary>
        static UrlFixed()
        {
            ImageUrlPreFix = "MIAP.ImageUrlPreFix".GetAppSetting();
            CourseWebUrl = "MIAP.CourseWebUrl".GetAppSetting();
            AdvertWebUrl = "MIAP.AdvertWebUrl".GetAppSetting();
            NewsWebUrl = "MIAP.NewsWebUrl".GetAppSetting();
        }

        /// <summary>
        /// 图片URL HTTP路径补全
        /// </summary>
        /// <param name="imgUrl">图片原始访问URL</param>
        /// <returns>补全后的HTTP路径</returns>
        public static string ImageUrlFixed(this string imgUrl)
        {
            imgUrl = imgUrl ?? string.Empty;
            if (imgUrl.StartsWith("/"))
                return ImageUrlPreFix + imgUrl;
            return imgUrl;
        }

        /// <summary>
        /// 图片URL HTTP路径补全（带裁切）
        /// </summary>
        /// <param name="imgUrl">图片原始访问URL</param>
        /// <param name="toWidth">目标裁切宽度</param>
        /// <param name="toHeight">目标裁切高度</param>
        /// <returns>补全后的HTTP路径</returns>
        public static string ImageUrlFixed(this string imgUrl, uint? toWidth, uint? toHeight)
        {
            imgUrl = imgUrl ?? string.Empty;
            uint w = toWidth ?? 0, h = toHeight ?? 0;

            if (w == 0 && h == 0)
                return imgUrl.ImageUrlFixed();

            if (imgUrl.StartsWith("/"))
            {
                if (w > 0 && h > 0)
                    return string.Format("{0}/imageservice?orgImg={1}&toWidth={2}&toHeight={3}", ImageUrlPreFix, imgUrl, w, h);
                
                if (h == 0)
                    return string.Format("{0}/imageservice?orgImg={1}&toWidth={2}", ImageUrlPreFix, imgUrl, w);
                
                return string.Format("{0}/imageservice?orgImg={1}&toHeight={2}", ImageUrlPreFix, imgUrl, h);
            }

            return imgUrl;
        }

        /// <summary>
        /// 获取课程详情WEB页面访问URL
        /// </summary>
        /// <param name="courseId"></param>
        /// <returns></returns>
        public static string GetCourseWebUrl(this int courseId)
        {
            return string.Format(CourseWebUrl, courseId);
        }

        /// <summary>
        /// 获取广告详情WEB页面访问URL
        /// </summary>
        /// <param name="advertId"></param>
        /// <returns></returns>
        public static string GetAdvertWebUrl(this int advertId)
        {
            return string.Format(AdvertWebUrl, advertId);
        }

        /// <summary>
        /// 获取新闻详情WEB访问URL
        /// </summary>
        /// <param name="newsId"></param>
        /// <returns></returns>
        public static string GetNewsWebUrl(this int newsId)
        {
            return string.Format(NewsWebUrl, newsId);
        }
    }
}