using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiCuoiKy.Models
{
    public class AccountModel
    {
        public int MaKH { get; set; }
        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được bỏ trống")]
        [RegularExpression("([aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]+[ ]?)+", ErrorMessage = "Họ tên chỉ được chứa các ký tự và khoảng trắng")]
        public string HoTen { get; set; }

        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = "Tài khoản không được bỏ trống")]
        [RegularExpression("[A-Za-z0-9]{6,24}", ErrorMessage = "Tài khoản có độ dài từ 6 - 24 ký tự!")]
        public string TaiKhoan { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được bỏ trống")]
        [RegularExpression(@".{6,24}", ErrorMessage = "Mật khẩu có độ dài từ 6 - 24 ký tự!")]
        public string MatKhau { get; set; }

        [Display(Name = "Nhập lại mật khẩu")]
        [Required(ErrorMessage = "Nhập lại mật khẩu không được bỏ trống")]
        [RegularExpression(@".{6,24}", ErrorMessage = "Mật khẩu có độ dài từ 6 - 24 ký tự!")]
        [Compare("MatKhau", ErrorMessage = "Nhập lại mật khẩu không trùng khớp, vui lòng kiểm tra lại!")]
        public string NhapLaiMatKhau { get; set; }

        [Display(Name = "Ngày sinh")]
        [Required(ErrorMessage = "Ngày sinh không được bỏ trống")]
        public DateTime? NgaySinh { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được bỏ trống")]
        public string DiaChi { get; set; }

        [Required(ErrorMessage = "Email không được bỏ trống")]
        [RegularExpression(@"^.+@\w+(\.\w+)+$", ErrorMessage ="Email không hợp lệ!")]
        public string Email { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được bỏ trống")]
        [RegularExpression(@"[0-9]{10}", ErrorMessage = "Số điện thoại không hợp lệ, vui lòng kiểm tra lại!")]
        public string DienThoai { get; set; }
    }
    public class DangNhapModel
    {
        public int MaKH { get; set; }

        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = "Tài khoản không được bỏ trống")]
        public string TaiKhoan { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được bỏ trống")]
        public string MatKhau { get; set; }
    }
}