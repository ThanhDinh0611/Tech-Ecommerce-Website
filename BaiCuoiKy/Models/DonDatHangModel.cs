using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class DonDatHangModel
    {
        public int MaDonHang { get; set; }
        public string TenKhachHang { get; set; }
        public DateTime? NgayDat { get; set; }
        public DateTime? NgayGiao { get; set; }
        public decimal? TongTien { get; set;}
        public string YeuCau { get; set; }
    }
}