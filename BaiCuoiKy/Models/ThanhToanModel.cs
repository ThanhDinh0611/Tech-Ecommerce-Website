using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class ThanhToanModel
    {
        public int MaKH { get; set; }

        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được bỏ trống")]
        [RegularExpression("([aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]+[ ]?)+", ErrorMessage = "Họ tên chỉ được chứa các ký tự và khoảng trắng")]
        public string HoTen { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được bỏ trống")]
        public string DiaChi { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được bỏ trống")]
        [RegularExpression(@"[0-9]{10}", ErrorMessage = "Số điện thoại không hợp lệ, vui lòng kiểm tra lại!")]
        public string DienThoai { get; set; }

        [Required(ErrorMessage = "Email không được bỏ trống")]
        [RegularExpression(@"^.+@\w+(\.\w+)+$", ErrorMessage = "Email không hợp lệ!")]
        public string Email { get; set; }

        [Display(Name = "Yêu cầu (Nếu có)")]
        public string YeuCau { get; set; }
        public ListGioHangModel GioHang { get; set; }

    }
}