using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;

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
                        TongTien = GioHang.TongTienSauShip
                    };
                    db.DONDATHANGs.Add(DonHang);
                    db.SaveChanges();

                    //Add ChiTietDonHang
                    foreach (var item in GioHang.ListGioHang)
                    {
                        CHITIETDONTHANG CTDH = new CHITIETDONTHANG()
                        {
                            MaSanPham = item.MaSanPham,
                            SoLuong = item.SoLuong,
                            DonGia = item.GiaBan,
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
                        TongTien = GioHang.TongTienSauShip
                    };
                    db.DONDATHANGs.Add(DonHang);
                    db.SaveChanges();

                    //Add ChiTietDonHang

                    foreach (var item in GioHang.ListGioHang)
                    {
                        CHITIETDONTHANG CTDH = new CHITIETDONTHANG()
                        {
                            MaSanPham = item.MaSanPham,
                            SoLuong = item.SoLuong,
                            DonGia = item.GiaBan,
                        };
                        db.DONDATHANGs.ToList().Last().CHITIETDONTHANGs.Add(CTDH);
                    }
                    db.SaveChanges();
                }

                //Remove Giohang
                if (Session["GioHang"] != null)
                    Session.Remove("GioHang");
                Session["ThanhCong"] = true;
                return Content("<script language='javascript' type='text/javascript'>alert('Đặt hàng thành công!'); window.location = '../../Home/Index';</script>");
                //return RedirectToAction("Index", "Home");
            }
            //Validation failed --> Reload
            return RedirectToAction("Index");
        }
    }
}