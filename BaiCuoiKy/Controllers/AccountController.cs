using BaiCuoiKy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiCuoiKy.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult DangKy(AccountModel model)
        {
            if (ModelState.IsValid)
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                if(!db.KHACHHANGs.Any(item => item.TaiKhoan == model.TaiKhoan))
                {
                    KHACHHANG kh = new KHACHHANG();
                    kh.HoTen = model.HoTen;
                    kh.TaiKhoan = model.TaiKhoan;
                    kh.MatKhau = model.MatKhau;
                    kh.NgaySinh = model.NgaySinh;
                    kh.DiaChi = model.DiaChi;
                    kh.Email = model.Email;
                    kh.DienThoai = model.DienThoai;
                    kh.Active = true;
                    db.KHACHHANGs.Add(kh);
                    db.SaveChanges();
                    return Content("<script language='javascript' type='text/javascript'>alert('Đăng ký thành công!'); window.location = '../../Account/DangNhap';</script>");
                    //return RedirectToAction("DangNhap");
                }
                else
                {
                    return Content("<script language='javascript' type='text/javascript'>alert('Tài khoản đã tồn tại!'); window.location = '../../Account/DangKy';</script>");
                }
            }
            return View();
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult DangNhap(DangNhapModel model)
        {
            if (ModelState.IsValid)
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                KHACHHANG TaiKhoan = db.KHACHHANGs.Where(kh => kh.TaiKhoan == model.TaiKhoan
                && kh.MatKhau == model.MatKhau && kh.Active == true).FirstOrDefault();
                if (TaiKhoan != null)
                {
                    Session["TaiKhoan"] = TaiKhoan;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return Content("<script language='javascript' type='text/javascript'>alert('Tài khoản hoặc mật khẩu không đúng!'); window.location = '../../Account/DangNhap';</script>");
                }
            }
            return View("DangNhap");
        }

    }
}