using BaiCuoiKy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections;

namespace BaiCuoiKy.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            //Get All SANPHAM
            var DSSP = db.SANPHAMs.Where(sp => sp.DaXoa == false)
                .Select(sp => new SanPhamModel()
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    GiaBan = sp.GiaBan,
                    MaLSP = sp.MaLSP,
                    TenLSP = sp.LOAISANPHAM.TenLoaiSanPham,
                    MaNCC = sp.MaNCC,
                    DaXoa = sp.DaXoa,
                    AnhBia = sp.AnhBia,
                    AnhBia1 = sp.AnhBia1,
                    GiaGoc = (double)sp.GiaBan + (double)sp.GiaBan*((double)sp.KhuyenMai/100),
                    GiaSoc = sp.GiaSoc,
                    Sao = sp.Sao * 20,
                    Mau1 = sp.Mau1,
                    Mau2 = sp.Mau2
                });

            //Get All SANPHAM of each Category
            var DSDT = DSSP.Where(sp => sp.MaLSP == 1);
            var DSLT = DSSP.Where(sp => sp.MaLSP == 2);
            var DSMTB = DSSP.Where(sp => sp.MaLSP == 3);
            var DSDH = DSSP.Where(sp => sp.MaLSP == 4);
            var DSBanner = db.Banners;

            //Send to ViewBag
            ViewBag.SanPham = DSSP;
            ViewBag.DienThoai = DSDT;
            ViewBag.LapTop = DSLT;
            ViewBag.MayTinhBang = DSMTB;
            ViewBag.DongHo = DSDH;
            ViewBag.Banners = DSBanner;

            //Get Brands
            var Brands = db.NHACUNGCAPs;
            ViewBag.Brands = Brands.Take(7);

            //Get Great Deal
            var GreatDeal = DSSP.Where(sp => sp.GiaSoc == true).Take(1);
            ViewBag.GreatDeal = GreatDeal;

            //Get Countdown time
            int HoursLeft = 24 - DateTime.Now.Hour;
            int MinutesLeft = 60 - DateTime.Now.Minute;
            int SecondsLeft = 60 - DateTime.Now.Second;
            ViewBag.HoursLeft = HoursLeft;
            ViewBag.MinutesLeft = MinutesLeft;
            ViewBag.SecondsLeft = SecondsLeft;

            //Get Blog info
            var Blogs = db.BLOGs.ToList();
            ViewBag.Blogs = Blogs;
            return View();
            
        }

        public ActionResult Detail(int id)
        {
            //Get Product Info with id
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            var SanPham = db.SANPHAMs.SingleOrDefault(sp =>
            sp.MaSanPham == id && sp.DaXoa == false);
            SanPham.Sao *= 20;
            //Get Product Info for Specification
            Dictionary<string,string> SanPhamInfo = new Dictionary<string, string>();
            SanPhamInfo.Add("Màn hình:", SanPham.ManHinh);
            SanPhamInfo.Add("Hệ điều hành:", SanPham.HeDieuHanh);
            SanPhamInfo.Add("Camera sau:", SanPham.CameraSau);
            SanPhamInfo.Add("Camera trước:", SanPham.CameraTruoc);
            SanPhamInfo.Add("CPU:", SanPham.CPU);
            SanPhamInfo.Add("RAM", SanPham.RAM);
            SanPhamInfo.Add("Bộ nhớ trong:", SanPham.BoNhoTrong);
            SanPhamInfo.Add("SIM:", SanPham.SIM);
            SanPhamInfo.Add("Pin:", SanPham.Pin);
            int count = 0;

            //Get relevant products
            var DSSP = db.SANPHAMs.Where(sp => sp.DaXoa == false 
            && sp.MaLSP == SanPham.MaLSP && sp.MaSanPham != id);
            //Add to ViewBag
            ViewBag.SanPham = SanPham;
            ViewBag.SanPhamInfo = SanPhamInfo;
            ViewBag.Count = count;
            ViewBag.DSSP = DSSP;


            return View();
        }
        public ActionResult Category(int id, int page)
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            string TenLSP = db.LOAISANPHAMs.Single(item => item.MaLSP == id).TenLoaiSanPham;
            var DSSP = db.SANPHAMs.Where(sp => sp.DaXoa == false && sp.MaLSP == id).OrderBy(item => item.MaSanPham).Skip(6 * (page - 1)).Take(6)
                .Select(sp => new SanPhamModel()
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    GiaBan = sp.GiaBan,
                    MaLSP = sp.MaLSP,
                    TenLSP = sp.LOAISANPHAM.TenLoaiSanPham,
                    MaNCC = sp.MaNCC,
                    TenNCC = sp.NHACUNGCAP.TenNCC,
                    DaXoa = sp.DaXoa,
                    AnhBia = sp.AnhBia,
                    GiaGoc = (double)sp.GiaBan + (double)sp.GiaBan * ((double)sp.KhuyenMai / 100),
                    GiaSoc = sp.GiaSoc,
                    Sao = sp.Sao * 20,
                });
            ViewBag.DSSP = DSSP;
            ViewBag.TenLSP = TenLSP;
            ViewBag.MaLSP = id;
            ViewBag.SL = db.SANPHAMs.Where(sp => sp.DaXoa == false && sp.MaLSP == id).Count();


            var DSLSP = db.LOAISANPHAMs.Select(item => new LSPModel { 
                MaLSP = item.MaLSP,
                TenLoaiSanPham = item.TenLoaiSanPham,
                SoLuong = item.SANPHAMs.Count
            });
            
            ViewBag.SoLuong = DSSP.Count();
            ViewBag.DSLSP = DSLSP;

            var DSNCC = db.NHACUNGCAPs.Select(item => new NCCModel
            {
                MaNCC = item.MaNCC,
                TenNCC = item.TenNCC
            });
            ViewBag.DSNCC = DSNCC;
            return View();
        }

        [ChildActionOnly]
        public ActionResult _LoaiSanPham()
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            var LoaiSanPham = db.LOAISANPHAMs.ToList();
            ViewBag.LoaiSanPham = LoaiSanPham;
            return PartialView("_LoaiSanPham");
        }

        [ChildActionOnly]
        public ActionResult _DangNhapDangKy()
        {
            ViewBag.TaiKhoan = Session["TaiKhoan"];
            return PartialView("_DangNhapDangKy");
        }

        public ActionResult DangXuat()
        {
            Session.Remove("TaiKhoan");
            Session.Remove("GioHang");
            Session.Remove("YeuThich");
            return RedirectToAction("Index", "Home");
        }
    }
}