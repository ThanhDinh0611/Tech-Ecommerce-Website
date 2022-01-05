using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

namespace BaiCuoiKy.Controllers
{
    
    public class AdminController : Controller
    {
        private QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();

        //Convert a string to HashCode
        static string ComputeStringToSha256Hash(string plainText)
        {
            // Create a SHA256 hash from string   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Computing Hash - returns here byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(plainText));

                // now convert byte array to a string   
                StringBuilder stringbuilder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    stringbuilder.Append(bytes[i].ToString("x2"));
                }
                return stringbuilder.ToString();
            }
        }
        // GET: Admin
        [Authorize(Roles = "admin")]
        public ActionResult Index(int id)
        {

            //Initialize data for diagram with 12 months
            List<decimal?> data = new List<decimal?>
            {
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
            };


            //Get DoanhThu from DB <Thang, DoanhThu>
            var DoanhThu = db.DONDATHANGs
                .Where(item => item.DaThanhToan == true && item.NgayDat.Value.Year == id)
                .GroupBy(item => item.NgayDat.Value.Month)
                .Select(g => new DoanhThuModel()
                {
                    Thang = g.Key,
                    DoanhThu = g.Sum(item => item.TongTien)
                });

            //Iterate DoanhThu and assign to data
            foreach (var item in DoanhThu)
            {
                int index = item.Thang - 1;
                data[index] = item.DoanhThu;
            }

            //Get list of years
            var years = db.DONDATHANGs.GroupBy(item => item.NgayDat.Value.Year)
                .Select(g => g.Key).ToList();

            //Get general Data
            var SoDonHang = db.DONDATHANGs.Count();
            var SoKhachHang = db.KHACHHANGs.Count();
            var SoSanPham = db.SANPHAMs.Count();
            var TongDoanhThu = db.DONDATHANGs.Sum(item => item.TongTien);

            ViewBag.SoDonHang = SoDonHang;
            ViewBag.SoKhachHang = SoKhachHang;
            ViewBag.SoSanPham = SoSanPham;
            ViewBag.TongDoanhThu = TongDoanhThu;
            ViewBag.Years = years;

            int RowsCount = (int)Math.Ceiling(DoanhThu.Count()/2.0);
            ViewBag.ThisYear = id;
            ViewBag.DoanhThu1 = DoanhThu.OrderBy(item => item.Thang).Take(RowsCount);
            ViewBag.DoanhThu2 = DoanhThu.OrderBy(item => item.Thang).Skip(RowsCount).Take(DoanhThu.Count() - RowsCount);
            ViewBag.data = JsonConvert.SerializeObject(data);
            return View();
        }

        //GET
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        //POST
        [HttpPost]
        public ActionResult DangNhap(ADMIN Model)
        {
            if (ModelState.IsValid)
            {
                var Admin = db.ADMINs.FirstOrDefault(user => user.TaiKhoan == Model.TaiKhoan);
                if (Admin == null)
                {
                    Session["LoginFailed"] = "Tài khoản không tồn tại!";
                    return View();
                }
                else
                {
                    if (ComputeStringToSha256Hash(Model.MatKhau) == Admin.MatKhau)
                    {
                        Session.Remove("LoginFailed");
                        Session["TaiKhoan"] = Admin;
                        FormsAuthentication.SetAuthCookie(Admin.TaiKhoan, false);
                        return RedirectToAction("Index", new { id = DateTime.Now.Year });
                    }
                    else
                    {
                        Session["LoginFailed"] = "Mật khẩu không đúng!";
                        return View();
                    }
                }
            }
            return View();
        }

        public ActionResult DangXuat()
        {
            //Delete Session and Reload
            Session.Remove("TaiKhoan");
            return RedirectToAction("DangNhap");
        }

        [Authorize(Roles = "admin")]
        public ActionResult QLSanPham()
        {
            //Get All Products
            var ProductList = db.SANPHAMs.OrderBy(item => item.MaLSP)
                .Select(item => new SanPhamModel()
                {
                    AnhBia = item.AnhBia,
                    TenSanPham = item.TenSanPham,
                    TenLSP = item.LOAISANPHAM.TenLoaiSanPham,
                    TenNCC = item.NHACUNGCAP.TenNCC,
                    SoLuong = item.SoLuongTon,
                }).ToList();

            ViewBag.ProductList = ProductList;
            return View();
        }

        [Authorize(Roles="admin")]
        public ActionResult QLLoaiSanPham()
        {
            //Get All Product Types
            var ProductTypes = db.LOAISANPHAMs.OrderBy(item => item.MaLSP).ToList();

            ViewBag.ProductTypes = ProductTypes;
            return View();
        }

        [Authorize(Roles="admin")]
        public ActionResult QLNhaCungCap()
        {
            //Get All Vendors
            var Vendors = db.NHACUNGCAPs.OrderBy(item => item.MaNCC).ToList();

            ViewBag.Vendors = Vendors;
            return View();
        }

        [Authorize(Roles="admin")]
        public ActionResult QLDonHang()
        {
            //Get All Delivered Orders
            var DeliveredOrders = db.DONDATHANGs.Where(item => item.TinhTrangGiaoHang == true)
                .Select(item => new DonDatHangModel()
            {
                MaDonHang = item.MaDonHang,
                TenKhachHang = item.KHACHHANG.HoTen,
                NgayDat = item.NgayDat,
                NgayGiao = item.NgayGiao,
                TongTien = item.TongTien,
                YeuCau = item.YeuCau
            }).ToList();

            ViewBag.DeliveredOrders = DeliveredOrders;

            //Get All Undelivered Orders
            var UndeliveredOrders = db.DONDATHANGs.Where(item => item.TinhTrangGiaoHang == false)
                .Select(item => new DonDatHangModel()
                {
                    MaDonHang = item.MaDonHang,
                    TenKhachHang = item.KHACHHANG.HoTen,
                    NgayDat = item.NgayDat,
                    NgayGiao = item.NgayGiao,
                    TongTien = item.TongTien,
                    YeuCau = item.YeuCau
                }).ToList();

            ViewBag.UndeliveredOrders = UndeliveredOrders;
            return View();
        }

        [Authorize(Roles = "admin")]
        public ActionResult ThongTinCaNhan()
        {
            //Current User
            var TaiKhoan = Session["TaiKhoan"] as ADMIN;
            //Get Info
            var User = db.ADMINs.SingleOrDefault(item => TaiKhoan.TaiKhoan == item.TaiKhoan);

            if(User != null)
            {
                ViewBag.User = User;
                return View();
            }

            return RedirectToAction("DangNhap");
        }

        public ActionResult _NavBar()
        {
            ADMIN TaiKhoan = Session["TaiKhoan"] as ADMIN;
            if (TaiKhoan == null)
            {
                return RedirectToAction("DangNhap");
            }
            ADMIN Admin = db.ADMINs.FirstOrDefault(user => user.TaiKhoan == TaiKhoan.TaiKhoan);
            return PartialView("_NavBar", Admin);
        }
    }
}