//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BaiCuoiKy
{
    using System;
    using System.Collections.Generic;
    
    public partial class GioHang
    {
        public int MaKH { get; set; }
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal GiaBan { get; set; }
        public string AnhBia { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaTong { get; set; }
        public int GiaoHang { get; set; }
    
        public virtual KHACHHANG KHACHHANG { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}
