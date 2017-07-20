using System;
using System.Collections.Generic;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using CSharpLib.Common;

namespace MIAP.Utility
{
    /// <summary>
    /// 文件所属对象类型枚举
    /// </summary>
    public enum FileTarget
    {
        /// <summary>
        /// 用户
        /// </summary>
        User = 1,

        /// <summary>
        /// 帖子
        /// </summary>
        Topic = 2,

        /// <summary>
        /// 回帖
        /// </summary>
        Post = 3,

        /// <summary>
        /// 群组
        /// </summary>
        Group = 4
    }

    /// <summary>
    /// 媒体文件类型枚举
    /// </summary>
    public enum MediaType
    {
        /// <summary>
        /// 图像
        /// </summary>
        Image = 0,

        /// <summary>
        /// 音频
        /// </summary>
        Audio = 1,

        /// <summary>
        /// 视频
        /// </summary>
        Video = 2
    }

    /// <summary>
    /// 媒体文件相关操作辅助类
    /// </summary>
    public static class MediaFileHelper
    {
        /// <summary>
        /// 文件存储根目录
        /// </summary>
        internal static string FileRoot { get; private set; }

        /// <summary>
        /// 
        /// </summary>
        static MediaFileHelper()
        {
            FileRoot = "MIAP.FileRoot".GetAppSetting();
        }

        /// <summary>
        /// 保存文件，并返回文件相对访问URL
        /// </summary>
        /// <param name="fileData"></param>
        /// <param name="target"></param>
        /// <param name="targetId"></param>
        /// <param name="fileType"></param>
        /// <param name="extName"></param>
        /// <returns></returns>
        public static string SaveMediaFile(this byte[] fileData, FileTarget target, object targetId, MediaType fileType, string extName)
        {
            Tuple<string, string> tuplePath = CreateSavePath(target, targetId);
            string fileName = CreateFileName(fileType, extName);

            if (Path.Combine(tuplePath.Item2, fileName).WriteFile(fileData))
                return tuplePath.Item1 + fileName;
            return string.Empty;
        }

        /// <summary>
        /// 获取图片尺寸，以Tuple&lt;int, int&gt;形式返回，Item1为宽度，Item2为高度。如果均为0，则表示获取失败
        /// </summary>
        /// <param name="imageUrl">图片URL（必须是服务器本机物理存在的图片）</param>
        /// <returns></returns>
        public static Tuple<int, int> GetImageSize(this string imageUrl)
        {
            if (string.IsNullOrEmpty(imageUrl))
                return new Tuple<int, int>(0, 0);

            string imgPath = imageUrl.MapPath();
            if (!File.Exists(imgPath))
                return new Tuple<int, int>(0, 0);

            Bitmap bitmap = new Bitmap(imgPath);
            int width = bitmap.Width;
            int height = bitmap.Height;
            bitmap.Dispose();
            bitmap = null;
            
            return new Tuple<int, int>(width, height);
        }

        /// <summary>
        /// 创建文件保存路径：Item1 = 相对URL；Item2 = 存放目录的绝对物理路径
        /// </summary>
        /// <param name="target"></param>
        /// <param name="targetId"></param>
        /// <returns></returns>
        private static Tuple<string, string> CreateSavePath(FileTarget target, object targetId)
        {
            string url = FileRoot + target.ToString() + "/" + targetId + "/";
            string path = url.MapPath();
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            return new Tuple<string, string>(url.TrimStart('~'), path);
        }

        /// <summary>
        /// 创建文件名
        /// </summary>
        /// <param name="fileType"></param>
        /// <param name="extName"></param>
        /// <returns></returns>
        private static string CreateFileName(MediaType fileType, string extName)
        {
            return string.Format("{0}{1}", DateTime.Now.ToString("yyyyMMddHHmmssfff"), CreateFileExtName(fileType, extName));
        }

        /// <summary>
        /// 创建文件扩展名
        /// </summary>
        /// <param name="fileType"></param>
        /// <param name="extName"></param>
        /// <returns>文件扩展名</returns>
        private static string CreateFileExtName(MediaType fileType, string extName)
        {
            Dictionary<MediaType, string[]> fileTypeExtsDict = new Dictionary<MediaType, string[]>(3)
            {
                { MediaType.Image, new string[5] { ".jpg", ".png", ".gif", ".bmp", ".jpeg" } },
                { MediaType.Audio, new string[5] { ".mp3", ".wav", ".3gp", ".amr", ".ogg" } },
                { MediaType.Video, new string[2] { ".mp4", ".3gp" }}
            };

            foreach (var item in fileTypeExtsDict[fileType])
            {
                if (extName.EndsWith(item))
                    return item;
            }

            return fileTypeExtsDict[fileType][0];
        }
    }
}