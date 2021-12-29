using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class SanPhamModel
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal? GiaBan { get; set; }
        public double? GiaGoc { get; set; }
        public int? MaLSP { get; set; }
        public string TenLSP { get; set; }
        public int? MaNCC { get; set; }
        public string TenNCC { get; set; }
        public bool? DaXoa { get; set; }
        public string AnhBia { get; set; }
        public string AnhBia1 { get; set; }
        public bool? GiaSoc { get; set; }
        public int? Sao { get; set; }
        public string Mau1 { get; set; }
        public string Mau2 { get; set; }
        public string SoLuong { get; set; }
    }

    public class LSPModel
    {
        public int MaLSP { get; set; }
        public string TenLoaiSanPham { get; set; }
        public int SoLuong { get; set; }
    }

    public class NCCModel
    {
        public int MaNCC { get; set; }
        public string TenNCC { get; set; }
    }
}