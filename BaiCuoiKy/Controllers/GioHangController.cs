using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;

namespace BaiCuoiKy.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        public ActionResult Index(ListGioHangModel model)
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            model = Session["GioHang"] as ListGioHangModel;
            if (model != null && (model.ListGioHang == null || model.ListGioHang.Count() == 0))
            {
                Session.Remove("GioHang");
            }
            if(TaiKhoan != null)
            {
                model = new ListGioHangModel();
                model.Shipping = 2;
                var query = db.GioHangs.Where(item => item.MaKH == TaiKhoan.MaKH);
                model.ListGioHang = new List<GioHangModel>();
                if (query.Count() == 0)
                {
                    model.ListGioHang = null;
                }
                else
                {
                    //Add all items in DB to GioHang
                    foreach (var item in query)
                    {
                        GioHangModel GioHangItem = new GioHangModel()
                        {
                            MaKH = item.MaKH,
                            MaSanPham = item.MaSanPham,
                            TenSanPham = item.TenSanPham,
                            GiaBan = item.GiaBan,
                            SoLuong = item.SoLuong,
                            AnhBia = item.AnhBia,
                            GiaTong = item.GiaTong
                        };
                        model.ListGioHang.Add(GioHangItem);
                        model.Shipping = item.GiaoHang;
                    }
                }
                Session["GioHang"] = model;
            }
            //Get Total
            if(model != null)
            {
                model.TongTien = 0;
                model.TongTienSauShip = 0;
                if (model.ListGioHang != null)
                {
                    for (int i = 0; i < model.ListGioHang.Count(); i++)
                    {
                        model.TongTien += model.ListGioHang[i].GiaTong;
                    }
                    model.TongTienSauShip = model.TongTien;
                    if (model.Shipping == 2) model.TongTienSauShip = model.TongTien + 30000;
                    else if (model.Shipping == 3) model.TongTienSauShip = model.TongTien + 100000;

                }
            }
            return View(model);
        }

        public ActionResult ThemVaoGioHang(ListGioHangModel model, int id)
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            //Get TaiKhoan Session
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;

            //Get Product from DB
            var SanPham = db.SANPHAMs.SingleOrDefault(sp => sp.MaSanPham == id);

            //Not login --> Use session otherwise use DB
            if (TaiKhoan == null)
            {
                model = Session["GioHang"] as ListGioHangModel;
                //Create Session GioHang if null
                if (model == null)
                {
                    model = new ListGioHangModel();
                    model.ListGioHang = new List<GioHangModel>();
                    model.Shipping = 2;
                    Session["GioHang"] = model;
                }

                //Check if product is existed
                if (!model.ListGioHang.Any(item => item.MaSanPham == id))
                {
                    var SanPhamMoi = new GioHangModel()
                    {
                        MaSanPham = SanPham.MaSanPham,
                        TenSanPham = SanPham.TenSanPham,
                        GiaBan = SanPham.GiaBan,
                        AnhBia = SanPham.AnhBia,
                        SoLuong = 1,
                        GiaTong = SanPham.GiaBan
                    };
                    model.ListGioHang.Add(SanPhamMoi);
                }
                else
                {
                    var sp = model.ListGioHang.Single(item => item.MaSanPham == id);
                    sp.SoLuong++;
                    sp.GiaTong = sp.SoLuong * sp.GiaBan;
                }
            }
            else
            {
                //Check if existed
                var GioHangItem = db.GioHangs.Where(item => item.MaSanPham == id)
                    .FirstOrDefault();
                if (GioHangItem == null)
                {
                    //Add To DB
                    GioHang NewGioHangItem = new GioHang()
                    {
                        MaKH = TaiKhoan.MaKH,
                        MaSanPham = SanPham.MaSanPham,
                        TenSanPham = SanPham.TenSanPham,
                        GiaBan = SanPham.GiaBan,
                        AnhBia = SanPham.AnhBia,
                        SoLuong = 1,
                        GiaTong = SanPham.GiaBan,
                    };
                    db.GioHangs.Add(NewGioHangItem);
                    db.SaveChanges();
                }
                else
                {
                    GioHangItem.SoLuong++;
                    GioHangItem.GiaTong = GioHangItem.SoLuong * GioHangItem.GiaBan;
                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index");
        }
        public ActionResult XoaSanPham(int id)
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            //Check if Login
            //Use Session
            var GioHangSession = Session["GioHang"] as ListGioHangModel;
            var DeletedItemSession = GioHangSession.ListGioHang.Where(item => item.MaSanPham == id).FirstOrDefault();
            if (DeletedItemSession != null)
            {
                GioHangSession.ListGioHang.Remove(DeletedItemSession);
            }

            if (TaiKhoan != null)
            {
                //Use Database
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                var GioHang = db.GioHangs.Where(item => item.MaKH == TaiKhoan.MaKH);
                var DeletedItem = GioHang.Where(item => item.MaSanPham == id).FirstOrDefault();
                if (DeletedItem != null)
                {
                    db.GioHangs.Remove(DeletedItem);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult CapNhatSoLuong(ListGioHangModel model)
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            var GioHang = Session["GioHang"] as ListGioHangModel;
            //Check if Login
            if (TaiKhoan == null)
            {
                //Update quantity to Session
                
                if(GioHang!= null)
                {
                    for (int i = 0; i < GioHang.ListGioHang.Count(); i++)
                    {
                        GioHang.ListGioHang[i].SoLuong = model.ListGioHang[i].SoLuong;
                        GioHang.ListGioHang[i].GiaTong = GioHang.ListGioHang[i].SoLuong * GioHang.ListGioHang[i].GiaBan;
                    }
                    GioHang.Shipping = model.Shipping;
                    Session["GioHang"] = GioHang;
                }
                
            }
            else
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();

                //Get GioHang in DB
                var query = db.GioHangs.Where(item => item.MaKH == TaiKhoan.MaKH);
                int i = -1;
                //Update all quantities in GioHang
                foreach(var item in query)
                {
                    i++;
                    item.SoLuong = model.ListGioHang[i].SoLuong;
                    item.GiaTong = item.GiaBan * item.SoLuong;
                    item.GiaoHang = model.Shipping;
                }
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [ChildActionOnly]
        public ActionResult _GioHang()
        {
            var TaiKhoan = Session["TaiKhoan"] as KHACHHANG;
            if(TaiKhoan == null)
            {
                var GioHang = Session["GioHang"] as ListGioHangModel;
                decimal TongTien = 0;
                int SoLuong = 0; 
                if(GioHang != null)
                {
                    SoLuong = GioHang.ListGioHang.Count();
                    foreach (var item in GioHang.ListGioHang)
                    {
                        TongTien += item.GiaTong;
                    }
                }
                ViewBag.GioHang = GioHang;
                ViewBag.SoLuong = SoLuong;
                ViewBag.TongTien = TongTien;
            }
            else
            {
                QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
                var GioHang = new ListGioHangModel();
                GioHang.ListGioHang = new List<GioHangModel>();
                var query = db.GioHangs.Where(item => item.MaKH == TaiKhoan.MaKH);
                decimal TongTien = 0;
                int SoLuong = 0;
                if(query.Count() == 0)
                {
                    GioHang.ListGioHang = null;
                    SoLuong = 0;
                }
                else
                {
                    SoLuong = query.Count();
                    foreach (var item in query)
                    {
                        TongTien += item.GiaTong;
                        GioHangModel GioHangItem = new GioHangModel()
                        {
                            MaKH = item.MaKH,
                            MaSanPham = item.MaSanPham,
                            TenSanPham = item.TenSanPham,
                            GiaBan = item.GiaBan,
                            SoLuong = item.SoLuong,
                            AnhBia = item.AnhBia,
                            GiaTong = item.GiaTong
                        };
                        GioHang.ListGioHang.Add(GioHangItem);
                        GioHang.Shipping = item.GiaoHang;
                    }
                }
                ViewBag.SoLuong = SoLuong;
                ViewBag.GioHang = GioHang;
                ViewBag.TongTien = TongTien;
            }
            return PartialView();
        }
    }
}