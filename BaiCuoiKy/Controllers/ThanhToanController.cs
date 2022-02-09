using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;
using Payments;

namespace BaiCuoiKy.Controllers
{
    public class ThanhToanController : Controller
    {
        // GET: ThanhToan
        [ValidateInput(false)]
        public ActionResult Index(ThanhToanModel model)
        {
            ModelState.Clear();
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            var GioHang = Session["GioHang"] as ListGioHangModel;

            //Check if Login and Add info
            if (TaiKhoan != null)
            {
                model.MaKH = TaiKhoan.MaKH;
                model.HoTen = TaiKhoan.HoTen;
                model.Email = TaiKhoan.Email;
                model.DiaChi = TaiKhoan.DiaChi;
                model.DienThoai = TaiKhoan.DienThoai;
                model.YeuCau = null;
            }
            //Add ListGioHang
            model.GioHang = GioHang;
            ViewBag.ThanhCong = Session["ThanhCong"];
            return View(model);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ThanhToan(ThanhToanModel model)
        {
            if (ModelState.IsValid)
            {
                //Check if not Login --> Create Inactive KhachHang --> Add Transaction Info
                var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
                var GioHang = Session["GioHang"] as ListGioHangModel;
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                int MaDH;
                if (TaiKhoan != null)
                {
                    //Add DonDatHang
                    DONDATHANG DonHang = new DONDATHANG()
                    {
                        DaThanhToan = false,
                        TinhTrangGiaoHang = false,
                        NgayDat = DateTime.Today,
                        //Giao thường --> 7 ngày, Giao nhanh --> 3 ngày
                        NgayGiao = GioHang.Shipping == 2 ? DateTime.Today.AddDays(7) : DateTime.Today.AddDays(3),
                        MaKH = TaiKhoan.MaKH,
                        YeuCau = model.YeuCau,
                        TongTien = GioHang.TongTienSauShip,
                        DiaChi = model.DiaChi,
                        DaXoa = false
                    };
                    db.DONDATHANGs.Add(DonHang);
                    db.SaveChanges();

                    //Retrieve MaDonHang
                    MaDH = db.DONDATHANGs.Last().MaDonHang;

                    //Add ChiTietDonHang
                    foreach (var item in GioHang.ListGioHang)
                    {
                        CHITIETDONTHANG CTDH = new CHITIETDONTHANG()
                        {
                            MaSanPham = item.MaSanPham,
                            SoLuong = item.SoLuong,
                            DonGia = item.GiaBan,
                            DaXoa = false
                        };
                        db.DONDATHANGs.ToList().Last().CHITIETDONTHANGs.Add(CTDH);
                    }

                    //Delete GioHang
                    var DeletedGioHang = db.GioHangs.Where(item => item.MaKH == TaiKhoan.MaKH);
                    db.GioHangs.RemoveRange(DeletedGioHang);
                    db.SaveChanges();
                }
                else
                {
                    //Add Inactive KhachHang
                    KHACHHANG kh = new KHACHHANG()
                    {
                        TaiKhoan = "Guest",
                        MatKhau = "Guest",
                        HoTen = model.HoTen,
                        DiaChi = model.DiaChi,
                        Email = model.Email,
                        DienThoai = model.DienThoai,
                        Active = false
                    };
                    db.KHACHHANGs.Add(kh);
                    db.SaveChanges();

                    //Add DonDatHang
                    int MaKH = db.KHACHHANGs.ToList().Last().MaKH;
                    DONDATHANG DonHang = new DONDATHANG()
                    {
                        DaThanhToan = false,
                        TinhTrangGiaoHang = false,
                        NgayDat = DateTime.Today,
                        //Giao thường --> 7 ngày, Giao nhanh --> 3 ngày
                        NgayGiao = GioHang.Shipping == 2 ? DateTime.Today.AddDays(7) : DateTime.Today.AddDays(3),
                        MaKH = MaKH,
                        YeuCau = model.YeuCau,
                        TongTien = GioHang.TongTienSauShip,
                        DiaChi = model.DiaChi,
                        DaXoa = false
                    };
                    db.DONDATHANGs.Add(DonHang);
                    db.SaveChanges();

                    //Retrieve MaDonHang
                    MaDH = db.DONDATHANGs.ToList().Last().MaDonHang;

                    //Add ChiTietDonHang

                    foreach (var item in GioHang.ListGioHang)
                    {
                        CHITIETDONTHANG CTDH = new CHITIETDONTHANG()
                        {
                            MaSanPham = item.MaSanPham,
                            SoLuong = item.SoLuong,
                            DonGia = item.GiaBan,
                            DaXoa = false
                        };
                        db.DONDATHANGs.ToList().Last().CHITIETDONTHANGs.Add(CTDH);
                    }
                    db.SaveChanges();
                }

                

                //Check Payment Type
                if (GioHang.COD)
                {
                    //Remove Giohang
                    if (Session["GioHang"] != null)
                        Session.Remove("GioHang");
                    
                    Session["ThanhCong"] = true;
                    return Content("<script language='javascript' type='text/javascript'>alert('Đặt hàng thành công!'); window.location = '../../Home/Index';</script>");
                    //return RedirectToAction("Index", "Home");
                }
                else
                {
                    //Proceed VNPAY Payment
                    string url = ConfigurationManager.AppSettings["Url"];
                    string returnUrl = ConfigurationManager.AppSettings["ReturnUrl"];
                    string tmnCode = ConfigurationManager.AppSettings["TmnCode"];
                    string hashSecret = ConfigurationManager.AppSettings["HashSecret"];
                    string money = (GioHang.TongTienSauShip * 100).ToString();
                    PayLib pay = new PayLib();

                    pay.AddRequestData("vnp_Version", "2.0.0"); //Phiên bản api mà merchant kết nối. Phiên bản hiện tại là 2.0.0
                    pay.AddRequestData("vnp_Command", "pay"); //Mã API sử dụng, mã cho giao dịch thanh toán là 'pay'
                    pay.AddRequestData("vnp_TmnCode", tmnCode); //Mã website của merchant trên hệ thống của VNPAY (khi đăng ký tài khoản sẽ có trong mail VNPAY gửi về)
                    pay.AddRequestData("vnp_Amount", money); //số tiền cần thanh toán, công thức: số tiền * 100 - ví dụ 10.000 (mười nghìn đồng) --> 1000000
                    pay.AddRequestData("vnp_BankCode", ""); //Mã Ngân hàng thanh toán (tham khảo: https://sandbox.vnpayment.vn/apis/danh-sach-ngan-hang/), có thể để trống, người dùng có thể chọn trên cổng thanh toán VNPAY
                    pay.AddRequestData("vnp_CreateDate", DateTime.Now.ToString("yyyyMMddHHmmss")); //ngày thanh toán theo định dạng yyyyMMddHHmmss
                    pay.AddRequestData("vnp_CurrCode", "VND"); //Đơn vị tiền tệ sử dụng thanh toán. Hiện tại chỉ hỗ trợ VND
                    pay.AddRequestData("vnp_IpAddr", Util.GetIpAddress()); //Địa chỉ IP của khách hàng thực hiện giao dịch
                    pay.AddRequestData("vnp_Locale", "vn"); //Ngôn ngữ giao diện hiển thị - Tiếng Việt (vn), Tiếng Anh (en)
                    pay.AddRequestData("vnp_OrderInfo", MaDH.ToString()); //Thông tin mô tả nội dung thanh toán
                    pay.AddRequestData("vnp_OrderType", "other"); //topup: Nạp tiền điện thoại - billpayment: Thanh toán hóa đơn - fashion: Thời trang - other: Thanh toán trực tuyến
                    pay.AddRequestData("vnp_ReturnUrl", returnUrl); //URL thông báo kết quả giao dịch khi Khách hàng kết thúc thanh toán
                    pay.AddRequestData("vnp_TxnRef", DateTime.Now.Ticks.ToString()); //mã hóa đơn

                    string paymentUrl = pay.CreateRequestUrl(url, hashSecret);

                    return Redirect(paymentUrl);
                }

            }
            //Validation failed --> Reload
            return RedirectToAction("Index");
        }
        public ActionResult PaymentConfirm()
        {
            if (Request.QueryString.Count > 0)
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                var GioHang = Session["GioHang"] as ListGioHangModel;
                string hashSecret = ConfigurationManager.AppSettings["HashSecret"]; //Chuỗi bí mật
                var vnpayData = Request.QueryString;
                PayLib pay = new PayLib();

                //lấy toàn bộ dữ liệu được trả về
                foreach (string s in vnpayData)
                {
                    if (!string.IsNullOrEmpty(s) && s.StartsWith("vnp_"))
                    {
                        pay.AddResponseData(s, vnpayData[s]);
                    }
                }

                long orderId = Convert.ToInt64(pay.GetResponseData("vnp_TxnRef")); //mã hóa đơn
                long vnpayTranId = Convert.ToInt64(pay.GetResponseData("vnp_TransactionNo")); //mã giao dịch tại hệ thống VNPAY
                long PaymentAmount = Convert.ToInt64(pay.GetResponseData("vnp_Amount"))/100; // Tổng tiền
                int OrderInfo = Convert.ToInt32(pay.GetResponseData("vnp_OrderInfo")); // Mã hóa đơn
                string vnp_ResponseCode = pay.GetResponseData("vnp_ResponseCode"); //response code: 00 - thành công, khác 00 - xem thêm https://sandbox.vnpayment.vn/apis/docs/bang-ma-loi/
                string vnp_SecureHash = Request.QueryString["vnp_SecureHash"]; //hash của dữ liệu trả về

                //Update DonDatHang DaThuTien = true
                var DonHang = db.DONDATHANGs.Single(dh => dh.MaDonHang == OrderInfo);
                DonHang.DaThanhToan = true;
                db.SaveChanges();

                bool checkSignature = pay.ValidateSignature(vnp_SecureHash, hashSecret); //check chữ ký đúng hay không?

                if (checkSignature)
                {
                    if (vnp_ResponseCode == "00")
                    {
                        //Thanh toán thành công
                        ViewBag.Message = "Thanh toán thành công";
                        ViewBag.ResponseCode = vnp_ResponseCode;
                        ViewBag.OrderId = orderId;
                        ViewBag.VnpayTranId = vnpayTranId;
                        ViewBag.PaymentAmount = PaymentAmount;
                        ViewBag.MaDonHang = OrderInfo;
                    }
                    else
                    {
                        //Thanh toán không thành công. Mã lỗi: vnp_ResponseCode
                        ViewBag.Message = "Có lỗi xảy ra trong quá trình xử lý hóa đơn " + orderId + " | Mã giao dịch: " + vnpayTranId + " | Mã lỗi: " + vnp_ResponseCode;
                    }
                }
                else
                {
                    ViewBag.Message = "Có lỗi xảy ra trong quá trình xử lý";
                }
            }

            //Remove Giohang
            if (Session["GioHang"] != null)
                Session.Remove("GioHang");

            return View();
        }
    }
}