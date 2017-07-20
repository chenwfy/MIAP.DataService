namespace MIAP.HttpCore
{
    /// <summary>
    /// 请求和应答内容类型
    /// </summary>
    internal enum ContentType
    {
        /// <summary>
        /// 明文（对应解析：直接解析）
        /// </summary>
        ClearText = 0,

        /// <summary>
        /// 压缩（对应解析：解压，然后解析）
        /// </summary>
        Compressed = 1,

        /// <summary>
        /// 加密（对应解析：解密，然后解析）
        /// </summary>
        Encrypted = 2,

        /// <summary>
        /// 加密并压缩（对应解析：先解压再解密，然后解析）
        /// </summary>
        EncryptionAndCompression = 3
    }
}