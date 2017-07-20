using System;
using System.Collections.Generic;

namespace MIAP.Entities
{
    /// <summary>
    /// 通用分页数据信息
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public sealed class PageResult<T>
    {
        /// <summary>
        /// 记录总数
        /// </summary>
        private int _recorCount = 0;
        /// <summary>
        /// 记录总数
        /// </summary>
        public int RecordCount
        {
            get { return this._recorCount; }
            set { this._recorCount = value; }
        }

        /// <summary>
        /// 分页数据数量
        /// </summary>
        private int _pageSize = 20;
        /// <summary>
        /// 分页数据数量
        /// </summary>
        public int PageSize
        {
            get { return this._pageSize; }
            set { this._pageSize = (value < 1 ? 20 : value); }
        }

        /// <summary>
        /// 分页总数
        /// </summary>
        public int PageCount
        {
            get
            {
                int count = this.RecordCount / this.PageSize;
                if (this.RecordCount % this.PageSize > 0)
                    count++;
                return count;
            }
        }

        /// <summary>
        /// 当前页码
        /// </summary>
        private int _pageIndex = 1;
        /// <summary>
        /// 当前页码
        /// </summary>
        public int PageIndex
        {
            get
            {
                int idx = this._pageIndex > this.PageCount ? this.PageCount : this._pageIndex;
                return idx < 1 ? 1 : idx;
            }
            set { this._pageIndex = value < 1 ? 1 : value; }
        }

        /// <summary>
        /// 分页列表数据
        /// </summary>
        public IEnumerable<T> Data { get; set; }
    }
}