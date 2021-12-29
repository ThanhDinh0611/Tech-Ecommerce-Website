using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;

namespace BaiCuoiKy.Controllers
{
    public class YeuThichController : Controller
    {
        QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
        // GET: YeuThich
        public ActionResult Index()
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            var YeuThich = Session["YeuThich"] as List<YeuThichModel>;
            if(TaiKhoan != null)
            {
                var query = db.YEUTHICHes.Where(item => item.MaKH == TaiKhoan.MaKH).ToList();
                YeuThich = new List<YeuThichModel>();
                if (query.Count == 0)
                    YeuThich = null;
                else
                {
                    //Add all items in DB to YeuThich
                    foreach(var item in query)
                    {
                        var YeuThichItem = new YeuThichModel()
                        {
                            MaKH = TaiKhoan.MaKH,
                            MaSanPham = item.MaSanPham,
                            TenSanPham = item.TenSanPham,
                            GiaBan = item.GiaBan,
                            AnhBia = item.AnhBia,
                            TinhTrang = item.TinhTrang
                        };
                        YeuThich.Add(YeuThichItem);
                    }
                }
                
                Session["YEUTHICH"] = YeuThich;
            }
            ViewBag.YeuThich = YeuThich;
            return View();
        }

        public ActionResult ThemVaoYeuThich(int id)
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            //Get TaiKhoan Session
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;

            //Get Product from DB
            var SanPham = db.SANPHAMs.FirstOrDefault(item => item.MaSanPham == id);

            //Check if Login
            if(TaiKhoan == null)
            {
                var YeuThich = Session["YEUTHICH"] as List<YeuThichModel>;
                if (YeuThich == null)
                {
                    YeuThich = new List<YeuThichModel>();
                    Session["YEUTHICH"] = YeuThich;
                }

                //Check if product existed in yeuThichList --> add if not
                if(!YeuThich.Any(item => item.MaSanPham == id))
                {
                    YeuThichModel sp = new YeuThichModel()
                    {
                        MaSanPham = SanPham.MaSanPham,
                        TenSanPham = SanPham.TenSanPham,
                        GiaBan = SanPham.GiaBan,
                        AnhBia = SanPham.AnhBia,
                        TinhTrang = "Còn hàng"
                    };
                    YeuThich.Add(sp);
                }
            }
            else
            {
                var YeuThichItem = db.YEUTHICHes.Where(item => item.MaKH == TaiKhoan.MaKH
                && item.MaSanPham == id).FirstOrDefault();
                //if null --> Add to DB
                if(YeuThichItem == null)
                {
                    YEUTHICH item = new YEUTHICH()
                    {
                        MaKH = TaiKhoan.MaKH,
                        MaSanPham = SanPham.MaSanPham,
                        TenSanPham = SanPham.TenSanPham,
                        GiaBan = SanPham.GiaBan,
                        AnhBia = SanPham.AnhBia,
                        TinhTrang = "Còn hàng"
                    };
                    db.YEUTHICHes.Add(item);
                    db.SaveChanges();
                }
            }
            
            
            return RedirectToAction("Index");
        }
        public ActionResult XoaSanPham(int id)
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            //Check if Login
            //Delete item in session
            var YeuThichSession = Session["YeuThich"] as List<YeuThichModel>;
            var DeletedItemSession = YeuThichSession.Where(item => item.MaSanPham == id).FirstOrDefault();
            if (DeletedItemSession != null)
            {
                YeuThichSession.Remove(DeletedItemSession);
            }

            //Delete item in db if login
            if (TaiKhoan != null)
            {
                //Use Database
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                var YeuThich = db.YEUTHICHes.Where(item => item.MaKH == TaiKhoan.MaKH);
                var DeletedItem = YeuThich.Where(item => item.MaSanPham == id).FirstOrDefault();
                if (DeletedItem != null)
                {
                    db.YEUTHICHes.Remove(DeletedItem);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index");
        }

        [ChildActionOnly]
        public ActionResult _YeuThich()
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            if (TaiKhoan == null)
            {
                var YeuThich = Session["YeuThich"] as List<YeuThichModel>;
                int SoLuong = 0;
                if (YeuThich != null)
                {
                    SoLuong = YeuThich.Count();
                }
                ViewBag.SoLuong = SoLuong;
            }
            else
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                int SoLuong = db.YEUTHICHes.Where(item => item.MaKH == TaiKhoan.MaKH)
                    .Count();
                ViewBag.SoLuong = SoLuong;
               
            }
            return PartialView();
        }
    }
}