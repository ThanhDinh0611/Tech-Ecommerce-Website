using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiCuoiKy.Models;
using System.Security.Cryptography;
using System.Text;

namespace BaiCuoiKy.Controllers
{
    public class AdminController : Controller
    {
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
        public ActionResult Index()
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            
            //Initialize data for diagram with 12 months
            List<decimal?> data = new List<decimal?>
            {
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
            };

            int ThisYear = DateTime.Today.Year;

            //Get DoanhThu from DB <Thang, DoanhThu>
            var DoanhThu = db.DONDATHANGs
                .Where(item => item.DaThanhToan == true && item.NgayDat.Value.Year == ThisYear)
                .GroupBy(item => item.NgayDat.Value.Month)
                .Select(g => new DoanhThuModel()
                {
                    Thang = g.Key,
                    DoanhThu = g.Sum(item => item.TongTien)
                });

            //Iterate DoanhThu and assign to data
            foreach(var item in DoanhThu)
            {
                int index = item.Thang - 1;
                data[index] = item.DoanhThu;
            }

            int RowsCount = (int)Math.Ceiling(DoanhThu.Count()/2.0);

            ViewBag.ThisYear = ThisYear;
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
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            var Admin = db.ADMINs.FirstOrDefault(user => user.TaiKhoan == Model.TaiKhoan);
            if (Admin == null)
            {
                Session["LoginFailed"] = "Tài khoản không tồn tại!";
                return View();
            }
            else
            {
                if(ComputeStringToSha256Hash(Model.MatKhau) == Admin.MatKhau)
                {
                    Session.Remove("LoginFailed");
                    Session["TaiKhoan"] = Admin;
                    return RedirectToAction("Index");
                }
                else
                {
                    Session["LoginFailed"] = "Mật khẩu không đúng!";
                    return View();
                }
            }
        }

        public ActionResult _NavBar()
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            ADMIN TaiKhoan = Session["TaiKhoan"] as ADMIN;
            ADMIN Admin = db.ADMINs.FirstOrDefault(user => user.TaiKhoan == TaiKhoan.TaiKhoan);
            return PartialView("_NavBar", Admin);
        }
    }
}