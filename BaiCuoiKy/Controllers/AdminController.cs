﻿using System;
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
            var ProductList = db.SANPHAMs.Where(item => item.DaXoa == false)
                .OrderBy(item => item.MaLSP)
                .Select(item => new SanPhamModel()
                {
                    MaSanPham = item.MaSanPham,
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
            var ProductTypes = db.LOAISANPHAMs.Where(item => item.DaXoa == false)
                .OrderBy(item => item.MaLSP).ToList();

            ViewBag.ProductTypes = ProductTypes;
            return View();
        }

        [Authorize(Roles="admin")]
        public ActionResult QLNhaCungCap()
        {
            //Get All Vendors
            var Vendors = db.NHACUNGCAPs.Where(item => item.DaXoa == false)
                .OrderBy(item => item.MaNCC).ToList();

            ViewBag.Vendors = Vendors;
            return View();
        }

        [Authorize(Roles="admin")]
        public ActionResult QLDonHang()
        {
            //Get All Delivered Orders
            var DeliveredOrders = db.DONDATHANGs
                .Where(item => item.TinhTrangGiaoHang == true && item.DaXoa == false)
                .Select(item => new DonDatHangModel()
            {
                MaDonHang = item.MaDonHang,
                TenKhachHang = item.KHACHHANG.HoTen,
                NgayDat = item.NgayDat,
                NgayGiao = item.NgayGiao,
                TongTien = item.TongTien,
                YeuCau = item.YeuCau,
                DiaChi = item.DiaChi
                
            }).ToList();

            ViewBag.DeliveredOrders = DeliveredOrders;

            //Get All Undelivered Orders
            var UndeliveredOrders = db.DONDATHANGs
                .Where(item => item.TinhTrangGiaoHang == false && item.DaXoa == false)
                .Select(item => new DonDatHangModel()
                {
                    MaDonHang = item.MaDonHang,
                    TenKhachHang = item.KHACHHANG.HoTen,
                    NgayDat = item.NgayDat,
                    NgayGiao = item.NgayGiao,
                    TongTien = item.TongTien,
                    YeuCau = item.YeuCau,
                    DiaChi = item.DiaChi
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

        [Authorize(Roles = "admin")]
        public ActionResult ThemSanPham()
        {
            //Get data
            var ProductTypes = db.LOAISANPHAMs
                .Where(item => item.DaXoa == false).ToList();

            var Vendors = db.NHACUNGCAPs
                .Where(item => item.DaXoa == false).ToList();

            //Pass dropdown list to View
            ViewBag.ProductTypes = new SelectList(ProductTypes, "MaLSP", "TenLoaiSanPham", null);
            ViewBag.Vendors = new SelectList(Vendors, "MaNCC", "TenNCC", null);
            return View();
        }

        [Authorize(Roles="admin")]
        [HttpPost]
        public ActionResult ThemSanPham(SANPHAM model)
        {
            if (ModelState.IsValid)
            {
                //Create a new product
                SANPHAM NewProduct = new SANPHAM()
                {
                    TenSanPham = model.TenSanPham,
                    GiaBan = model.GiaBan,
                    MoTa = model.MoTa,
                    ManHinh = model.ManHinh,
                    HeDieuHanh = model.HeDieuHanh,
                    CameraSau = model.CameraSau,
                    CameraTruoc = model.CameraTruoc,
                    CPU = model.CPU,
                    RAM = model.RAM,
                    BoNhoTrong = model.BoNhoTrong,
                    SIM = model.SIM,
                    Pin = model.Pin,
                    AnhBia = model.AnhBia,
                    SoLuongTon = model.SoLuongTon,
                    MaLSP = model.MaLSP,
                    MaNCC = model.MaNCC,
                    AnhBia1 = model.AnhBia1,
                    KhuyenMai = model.KhuyenMai,
                    Sao = 3,
                    GiaSoc = false,
                    Mau1 = "../../assets/images/Colours/black.png",
                    Mau2 = "../../assets/images/Colours/black.png",
                    DaXoa = false,
                    NgayCapNhat = DateTime.Now
                };

                //Add product.
                db.SANPHAMs.Add(NewProduct);
                db.SaveChanges();

                //Redirect 
                return Content("<script language='javascript' type='text/javascript'>alert('Thêm sản phẩm thành công!'); window.location = '../../Admin/QLSanPham';</script>");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult XoaSanPham(int id)
        {
            //Get Selected product.
            var Product = db.SANPHAMs
                .SingleOrDefault(item => item.MaSanPham == id);
            
            //Pass necessary info of the product to view.
            if (Product != null)
            {
                ViewBag.ProductType = Product.LOAISANPHAM.TenLoaiSanPham;
                ViewBag.Vendor = Product.NHACUNGCAP.TenNCC;
                return View(Product);
            }
            return RedirectToAction("QLSanPham");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult XoaSanPham(SANPHAM model)
        {
            //Get selected product.
            var Product = db.SANPHAMs.Single(item => item.MaSanPham == model.MaSanPham);

            //Delete product.
            Product.DaXoa = true;
            db.SaveChanges();
            return RedirectToAction("QLSanPham");
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ChinhSuaSanPham(int id)
        {
            //Get selected product.
            var Product = db.SANPHAMs
                .SingleOrDefault(item => item.MaSanPham == id);

            //Get all product types for the dropdown list
            var ProductTypes = db.LOAISANPHAMs
                .Where(item => item.DaXoa == false).ToList();

            //Get all vendors for the dropdown list.
            var Vendors = db.NHACUNGCAPs
                .Where(item => item.DaXoa == false).ToList();

            //Create dropdown list and pass all info to View.
            ViewBag.ProductTypes = new SelectList(ProductTypes, "MaLSP", "TenLoaiSanPham", null);
            ViewBag.Vendors = new SelectList(Vendors, "MaNCC", "TenNCC", null);
            return View(Product);
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult ChinhSuaSanPham(SANPHAM model)
        {
            if (ModelState.IsValid)
            {
                //Update the seleccted product
                var Product = db.SANPHAMs.Single(item => item.MaSanPham == model.MaSanPham);
                Product.TenSanPham = model.TenSanPham;
                Product.GiaBan = model.GiaBan;
                Product.MoTa = model.MoTa;
                Product.ManHinh = model.ManHinh;
                Product.HeDieuHanh = model.HeDieuHanh;
                Product.CameraSau = model.CameraSau;
                Product.CameraTruoc = model.CameraTruoc;
                Product.CPU = model.CPU;
                Product.RAM = model.RAM;
                Product.BoNhoTrong = model.BoNhoTrong;
                Product.SIM = model.SIM;
                Product.Pin = model.Pin;
                Product.AnhBia = model.AnhBia;
                Product.SoLuongTon = model.SoLuongTon;
                Product.MaLSP = model.MaLSP;
                Product.MaNCC = model.MaNCC;
                Product.AnhBia1 = model.AnhBia1;
                Product.KhuyenMai = model.KhuyenMai;
                Product.Sao = model.Sao;
                Product.GiaSoc = model.GiaSoc;
                Product.Mau1 = "../../assets/images/Colours/black.png";
                Product.Mau2 = "../../assets/images/Colours/black.png";
                Product.DaXoa = false;
                Product.NgayCapNhat = DateTime.Now;
                db.SaveChanges();

                //Redirect
                return Content("<script language='javascript' type='text/javascript'>alert('Chỉnh sửa sản phẩm thành công!'); window.location = '../../Admin/QLSanPham';</script>");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ThemLoaiSanPham()
        {
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult ThemLoaiSanPham(LOAISANPHAM model)
        {
            if (ModelState.IsValid)
            {
                //Updated info and add new ProductType.
                model.DaXoa = false;
                db.LOAISANPHAMs.Add(model);
                db.SaveChanges();

                //Redirect.
                return Content("<script language='javascript' type='text/javascript'>alert('Thêm loại sản phẩm thành công!'); window.location = '../../Admin/QLLoaiSanPham';</script>");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult XoaLoaiSanPham(int id)
        {
            //Get selected product
            var ProductType = db.LOAISANPHAMs
                .SingleOrDefault(item => item.MaLSP == id);

            //Pass the selected product to View
            if(ProductType != null)
            {
                return View(ProductType);
            }
            return RedirectToAction("QLLoaiSanPham");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult XoaLoaiSanPham(LOAISANPHAM model)
        {
            if (ModelState.IsValid)
            {
                //Get selected product type
                var ProductType = db.LOAISANPHAMs
                    .SingleOrDefault(item => item.MaLSP == model.MaLSP);

                if(ProductType != null)
                {
                    //Delete Products if any.
                    var Products = db.SANPHAMs.Where(item => item.MaLSP == ProductType.MaLSP);
                    foreach(var Product in Products)
                    {
                        Product.DaXoa = true;
                    }

                    //Delete selected product type.
                    ProductType.DaXoa = true;
                    db.SaveChanges();

                    //Redirect.
                    return Content("<script language='javascript' type='text/javascript'>alert('Xóa loại sản phẩm thành công!'); window.location = '../../Admin/QLLoaiSanPham';</script>");
                }
                return RedirectToAction("QLLoaiSanPham");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ChinhSuaLoaiSanPham(int id)
        {
            //Get selected product type.
            var ProductType = db.LOAISANPHAMs
                .SingleOrDefault(item => item.MaLSP == id);

            //Pass the selected product type to View.
            if (ProductType != null)
            {
                return View(ProductType);
            }
            return RedirectToAction("QLLoaiSanPham");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult ChinhSuaLoaiSanPham(LOAISANPHAM model)
        {
            if (ModelState.IsValid)
            {
                //Get the selected product type.
                var ProductType = db.LOAISANPHAMs
                    .SingleOrDefault(item => item.MaLSP == model.MaLSP);

                //Updated the selected product type.
                if (ProductType != null)
                {
                    ProductType.TenLoaiSanPham = model.TenLoaiSanPham;
                    db.SaveChanges();
                    return Content("<script language='javascript' type='text/javascript'>alert('Chỉnh sửa loại sản phẩm thành công!'); window.location = '../../Admin/QLLoaiSanPham';</script>");
                }
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ThemNhaCungCap()
        {
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult ThemNhaCungCap(NHACUNGCAP model)
        {
            if (ModelState.IsValid)
            {
                //Updated and add a new vendor.
                model.DaXoa = false;
                db.NHACUNGCAPs.Add(model);
                db.SaveChanges();

                //Redirect.
                return Content("<script language='javascript' type='text/javascript'>alert('Thêm nhà cung cấp thành công!'); window.location = '../../Admin/QLNhaCungCap';</script>");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult XoaNhaCungCap(int id)
        {
            //Get selected vendor.
            var Vendor = db.NHACUNGCAPs
                .SingleOrDefault(item => item.MaNCC == id);

            //Pass the selected vendor to View.
            if (Vendor != null)
            {
                return View(Vendor);
            }
            return RedirectToAction("QLNhaCungCap");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult XoaNhaCungCap(NHACUNGCAP model)
        {
            if (ModelState.IsValid)
            {
                //Get the selected vendor.
                var Vendor = db.NHACUNGCAPs
                    .SingleOrDefault(item => item.MaNCC == model.MaNCC);

                if (Vendor != null)
                {
                    //Delete Products if any.
                    var Products = db.SANPHAMs.Where(item => item.MaNCC == Vendor.MaNCC);
                    foreach (var Product in Products)
                    {
                        Product.DaXoa = true;
                    }

                    //Delete the selected vendor.
                    Vendor.DaXoa = true;
                    db.SaveChanges();

                    //Redirect.
                    return Content("<script language='javascript' type='text/javascript'>alert('Xóa nhà cung cấp thành công!'); window.location = '../../Admin/QLNhaCungCap';</script>");
                }
                return RedirectToAction("QLNhaCungCap");
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult ChinhSuaNhaCungCap(int id)
        {
            //Get the selected vendor.
            var Vendor = db.NHACUNGCAPs
                .SingleOrDefault(item => item.MaNCC == id);
            
            //Pass the selected vendor to view.
            if (Vendor != null)
            {
                return View(Vendor);
            }
            return RedirectToAction("QLLoaiSanPham");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult ChinhSuaNhaCungCap(NHACUNGCAP model)
        {
            if (ModelState.IsValid)
            {
                //Get the selected vendor.
                var Vendor = db.NHACUNGCAPs
                    .SingleOrDefault(item => item.MaNCC == model.MaNCC);
                
                //Updated the selected vendor.
                if (Vendor != null)
                {
                    Vendor.DiaChi = model.DiaChi;
                    Vendor.DienThoai = model.DienThoai;
                    Vendor.Logo = model.Logo;
                    Vendor.TenNCC = model.TenNCC;
                    db.SaveChanges();

                    //Redirect.
                    return Content("<script language='javascript' type='text/javascript'>alert('Chỉnh sửa nhà cung cấp thành công!'); window.location = '../../Admin/QLNhaCungCap';</script>");
                }
            }
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult XoaDonHang(int id)
        {
            //Get the selected order.
            var Order = db.DONDATHANGs
                .SingleOrDefault(item => item.MaDonHang == id);

            //Pass it to view
            if (Order != null)
            {
                return View(Order);
            }
            return RedirectToAction("QLDonHang");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult XoaDonHang(DONDATHANG model)
        {
            if (ModelState.IsValid)
            {
                //Get the selected order.
                var Order = db.DONDATHANGs
                    .SingleOrDefault(item => item.MaDonHang == model.MaDonHang);

                if (Order != null)
                {
                    //Delete OrderDetails if any.
                    var OrderDetails = db.CHITIETDONTHANGs
                        .Where(item => item.MaDonHang == Order.MaDonHang);
                    foreach (var OrderDetail in OrderDetails)
                    {
                        OrderDetail.DaXoa = true;
                    }

                    //Delete the selected order.
                    Order.DaXoa = true;
                    db.SaveChanges();

                    //Redirect.
                    return Content("<script language='javascript' type='text/javascript'>alert('Xóa nhà cung cấp thành công!'); window.location = '../../Admin/QLNhaCungCap';</script>");
                }
                return RedirectToAction("QLNhaCungCap");
            }
            return View();
        }


        [Authorize(Roles = "admin")]
        public ActionResult _NavBar()
        {
            //Get current login session
            ADMIN TaiKhoan = Session["TaiKhoan"] as ADMIN;

            //If not logged in yet, redirect to Login page
            if (TaiKhoan == null)
            {
                return RedirectToAction("DangNhap");
            }

            //Get current user info
            ADMIN Admin = db.ADMINs
                .FirstOrDefault(user => user.TaiKhoan == TaiKhoan.TaiKhoan);

            //Pass to view
            return PartialView("_NavBar", Admin);
        }
    }
}