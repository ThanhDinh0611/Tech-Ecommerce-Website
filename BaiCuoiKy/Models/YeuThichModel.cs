using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class YeuThichModel
    {
        public int MaKH { get; set; }
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal GiaBan { get; set; }
        public string AnhBia { get; set; }
        [Range(1, 20, ErrorMessage = "Số lượng không được nhỏ hơn 1 hoặc vượt quá 20 sản phẩm!")]
        public string TinhTrang { get; set; }
    }
    public class ListYeuThichModel
    {
        public List<YeuThichModel> ListYeuThich { get; set; }
    }
}