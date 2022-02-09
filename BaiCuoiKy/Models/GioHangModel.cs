using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class GioHangModel
    {
        public int MaKH { get; set; }
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal GiaBan { get; set; }
        public string AnhBia { get; set; }
        [Range(1,20, ErrorMessage ="Số lượng không được nhỏ hơn 1 hoặc vượt quá 20 sản phẩm!")]
        public int SoLuong { get; set; }
        public decimal GiaTong { get; set; }
    }

    //Get listGioHang and get quantities
    public class ListGioHangModel
    {
        public List<GioHangModel> ListGioHang { get; set; }
        public decimal TongTien { get; set; }

        [Display(Name = "Phương thức giao hàng")]
        [Required(ErrorMessage = "Bạn chưa chọn phương thức giao hàng!")]
        public int Shipping { get; set; }
        
        [Display(Name = "Thanh toán khi nhận hàng")]
        public bool COD { get; set; }

        public decimal TongTienSauShip { get; set; }
    }
}