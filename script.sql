USE [master]
GO
/****** Object:  Database [QLBanDienThoai]    Script Date: 1/12/2022 11:45:21 AM ******/
CREATE DATABASE [QLBanDienThoai]
GO
ALTER DATABASE [QLBanDienThoai] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBanDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanDienThoai] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBanDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBanDienThoai', N'ON'
GO
USE [QLBanDienThoai]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](max) NULL,
	[TenAdmin] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Anh] [nvarchar](max) NULL,
	[Loai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BLOG]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOG](
	[MaBlog] [int] IDENTITY(1,1) NOT NULL,
	[BlogTitle] [nvarchar](200) NULL,
	[ContentTitle1] [nvarchar](50) NULL,
	[ContentTitle2] [nvarchar](50) NULL,
	[ContentTitle3] [nvarchar](50) NULL,
	[ContentTitle4] [nvarchar](50) NULL,
	[ContentTitle5] [nvarchar](50) NULL,
	[content1] [nvarchar](max) NULL,
	[content2] [nvarchar](max) NULL,
	[content3] [nvarchar](max) NULL,
	[content4] [nvarchar](max) NULL,
	[content5] [nvarchar](max) NULL,
	[content6] [nvarchar](max) NULL,
	[content7] [nvarchar](max) NULL,
	[content8] [nvarchar](max) NULL,
	[content9] [nvarchar](max) NULL,
	[content10] [nvarchar](max) NULL,
	[BlogDate] [datetime] NULL,
	[Author] [nvarchar](50) NULL,
	[ImageContent1] [nvarchar](max) NULL,
	[ImageContent2] [nvarchar](max) NULL,
	[ImageContent3] [nvarchar](max) NULL,
	[ImageContent4] [nvarchar](max) NULL,
	[ImageContent5] [nvarchar](max) NULL,
	[IsPopular] [bit] NULL,
 CONSTRAINT [PK_BLOG] PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONTHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[YeuCau] [nvarchar](max) NULL,
	[TongTien] [decimal](20, 0) NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaKH] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 10) NOT NULL,
	[AnhBia] [nvarchar](max) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaTong] [decimal](20, 0) NOT NULL,
	[GiaoHang] [int] NOT NULL,
 CONSTRAINT [PK_GIOHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
	[Active] [bit] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAISANPHAM]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISANPHAM](
	[MaLSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
	[Logo] [nvarchar](max) NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 0) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[ManHinh] [nvarchar](max) NULL,
	[HeDieuHanh] [nvarchar](max) NULL,
	[CameraSau] [nvarchar](max) NULL,
	[CameraTruoc] [nvarchar](max) NULL,
	[CPU] [nvarchar](max) NULL,
	[RAM] [nvarchar](max) NULL,
	[BoNhoTrong] [nvarchar](max) NULL,
	[SIM] [nvarchar](max) NULL,
	[Pin] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](max) NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaLSP] [int] NULL,
	[MaNCC] [int] NULL,
	[DaXoa] [bit] NULL,
	[AnhBia1] [nvarchar](max) NULL,
	[KhuyenMai] [decimal](18, 0) NULL,
	[GiaSoc] [bit] NULL,
	[Sao] [int] NULL,
	[Mau1] [varchar](100) NULL,
	[Mau2] [varchar](100) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YEUTHICH]    Script Date: 1/12/2022 11:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YEUTHICH](
	[MaKH] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 10) NOT NULL,
	[AnhBia] [nvarchar](max) NULL,
	[TinhTrang] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ADMIN] ([TaiKhoan], [MatKhau], [TenAdmin], [NgaySinh], [DiaChi], [SDT], [Email], [RoleID]) VALUES (N'dcthanh0611', N'ec71da68220250a328d36b78fa29b5cf12724300560fb268cd9182af96d43024', N'Đinh Công Thành', CAST(N'1998-11-06' AS Date), N'Biên Hòa, Đồng Nai', N'0358238666', N'dcthanh0611@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [Anh], [Loai]) VALUES (1, N'../../assets/images/Banners/slider1.jpg', N'banner')
INSERT [dbo].[Banner] ([ID], [Anh], [Loai]) VALUES (2, N'../../assets/images/Banners/slider2.jpg', N'banner')
INSERT [dbo].[Banner] ([ID], [Anh], [Loai]) VALUES (3, N'../../assets/images/Banners/slider3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[BLOG] ON 

INSERT [dbo].[BLOG] ([MaBlog], [BlogTitle], [ContentTitle1], [ContentTitle2], [ContentTitle3], [ContentTitle4], [ContentTitle5], [content1], [content2], [content3], [content4], [content5], [content6], [content7], [content8], [content9], [content10], [BlogDate], [Author], [ImageContent1], [ImageContent2], [ImageContent3], [ImageContent4], [ImageContent5], [IsPopular]) VALUES (1, N'MSI Creator 15 A11U ra mắt: Màn hình OLED 4K, Intel Core i7 thế hệ 11, tương đối mỏng nhẹ nhưng giá khá đắt đỏ', NULL, NULL, NULL, NULL, NULL, N'MSI đã chính thức ra mắt dòng máy tính xách tay mới dành cho các nhà sáng tạo nội dung tại thị trường Nhật Bản. Đó là MSI Creator 15 A11U mang thiết kế tương đối mỏng và nhẹ đi kèm màn hình OLED 4K. Giống như nhiều thiết bị thuộc dòng Creator của các hãng khác, mẫu MSI Creator mới cũng có giá khá đắt đỏ.', N'MSI Creator 15 A11U sở hữu những thông số kỹ thuật hàng đầu như CPU Intel Core i7-11800H thế hệ thứ 11, kết hợp với GPU NVIDIA GeForce RTX 3080 mạnh mẽ. Thiết bị sở hữu 16 GB RAM DDR4 và bộ nhớ SSD 1 TB chuẩn M.2 NVMe.', N'Như đã đề cập, mẫu MSI mới có màn hình OLED kích thước 15.6 inch, độ phân giải 4K (3.840 x 2.160 px). Màn hình hỗ trợ hỗ trợ HDR và ​​có gam màu DCI-P3.', N'MSI Creator 15 A11U được cài sẵn hệ điều hành Windows 10 Pro và tất nhiên ​​sẽ hỗ trợ nâng lên Windows 11. Máy tính có một cổng Thunderbolt 4, một cổng USB 3.2 Gen 2 Type-C, ba cổng USB 3.2 Gen 2 Type-A, một cổng HDMI và cổng cắm tai nghe 3.5 mm.

', N'MSI Creator 15 A11U còn có các tính năng nổi bật như công nghệ làm mát Cooler Boost Trinity+, nhờ hệ thống sáu ống dẫn nhiệt và ba quạt tản nhiệt, được trang bị loa Duo Wave. Máy tính có một màu đen duy nhất và có kích thước 358.3 x 248 x 19.8 mm.', N'MSI bán Creator 15 A11U với giá 350.000 Yên (gần 70 triệu đồng). Bạn nhận xét thế nào về cấu hình và giá bán của thiết bị MSI dòng Creator mới?', NULL, NULL, NULL, NULL, CAST(N'2021-10-15 19:35:00.000' AS DateTime), N'Minh Vũ', N'../../assets/images/blog-img/blog1/Blog1-anh1.jpg', N'../../assets/images/blog-img/blog1/Blog1-anh2.jpg', N'../../assets/images/blog-img/blog1/Blog1-anh3.jpg', NULL, NULL, 1)
INSERT [dbo].[BLOG] ([MaBlog], [BlogTitle], [ContentTitle1], [ContentTitle2], [ContentTitle3], [ContentTitle4], [ContentTitle5], [content1], [content2], [content3], [content4], [content5], [content6], [content7], [content8], [content9], [content10], [BlogDate], [Author], [ImageContent1], [ImageContent2], [ImageContent3], [ImageContent4], [ImageContent5], [IsPopular]) VALUES (2, N'Galaxy S22 Ultra với thiết kế camera sau kiểu 11 được tái hiện rõ nét trong bản concept mới, ấn tượng tông màu đỏ sẫm', NULL, NULL, NULL, NULL, NULL, N'Hồi cuối tháng 9, kiểu thiết kế camera sau hình chữ P và 11 của Galaxy S22 Ultra bị rò rỉ thông qua ốp lưng. Sau đó, concept kiểu chữ P đã xuất hiện và bây giờ tới lượt kiểu 11 cũng nối gót được render 3D.', N'Bản concept Galaxy S22 Ultra mới này được nhà thiết kế đồ họa Parvez Khan (chủ kênh YouTube Technizo Concept) hợp tác với LetsGoDigital tạo ra.', N'Dựa trên những thông tin rò rỉ, concept Galaxy S22 Ultra mới cho chúng ta thấy điện thoại có 3 tùy chọn màu sắc: Đen, trắng và đỏ sẫm. Theo Ice Universe, màu đỏ này được gọi là Burgundy Red, giống như trên dòng Galaxy S8 và Galaxy S9.', N'Về cơ bản, tổng thể thiết kế của hai bản concept gần đây đều giống nhau như sở hữu màn hình đục lỗ ở trung tâm phía trên để chứa camera selfie, cùng với thiết kế vuông vắn hơn lấy cảm hứng từ dòng Galaxy Note 10. Đặc biệt, điện thoại còn có khay cắm bút S Pen tích hợp nằm ở đáy máy bên trái', N'Khác biệt có chăng là đến từ cấu trúc camera sau: Kiểu chữ P và 11. Trong đó concept kiểu 11 có hai cột camera riêng biệt đặt ở góc trên bên trái: Cột thứ nhất chứa 3 cảm biến, cột thứ hai ngắn hơn chứa 2 cảm biến và đèn flash LED nằm giữa.', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-15 19:35:00.000' AS DateTime), N'Dương Lê', N'../../assets/images/blog-img/blog2/Blog2-anh1.jpg', N'../../assets/images/blog-img/blog2/Blog2-anh2.jpg', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[BLOG] OFF
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (7, 51, 3, CAST(7990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (8, 49, 3, CAST(20490000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (8, 52, 3, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (9, 51, 2, CAST(7990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (10, 49, 1, CAST(20490000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (11, 50, 1, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (12, 50, 1, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (13, 50, 1, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (14, 50, 1, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (15, 50, 1, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (16, 50, 10, CAST(35990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (17, 46, 4, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (18, 51, 5, CAST(7990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (19, 51, 1, CAST(7990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (20, 54, 5, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (21, 54, 1, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (22, 54, 10, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (23, 52, 1, CAST(26990000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (7, 1, 1, CAST(N'2021-09-14 00:00:00.000' AS DateTime), CAST(N'2021-10-17 00:00:00.000' AS DateTime), 15, N'Sang', CAST(24070000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (8, 1, 1, CAST(N'2021-09-14 00:00:00.000' AS DateTime), CAST(N'2021-10-21 00:00:00.000' AS DateTime), 2, NULL, CAST(142470000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (9, 1, 1, CAST(N'2021-08-15 00:00:00.000' AS DateTime), CAST(N'2021-10-18 00:00:00.000' AS DateTime), 5, NULL, CAST(16080000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (10, 1, 1, CAST(N'2021-08-15 00:00:00.000' AS DateTime), CAST(N'2021-10-22 00:00:00.000' AS DateTime), 16, NULL, CAST(20520000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (11, 1, 0, CAST(N'2021-07-15 00:00:00.000' AS DateTime), CAST(N'2021-10-18 00:00:00.000' AS DateTime), 2, N'fdsa', CAST(35990000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (12, 1, 0, CAST(N'2021-07-15 00:00:00.000' AS DateTime), CAST(N'2021-10-22 00:00:00.000' AS DateTime), 17, NULL, CAST(36020000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (13, 1, 0, CAST(N'2021-10-15 00:00:00.000' AS DateTime), CAST(N'2021-10-22 00:00:00.000' AS DateTime), 18, NULL, CAST(36020000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (14, 1, 0, CAST(N'2021-05-15 00:00:00.000' AS DateTime), CAST(N'2021-10-22 00:00:00.000' AS DateTime), 19, N'123', CAST(36020000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (15, 1, 0, CAST(N'2021-05-15 00:00:00.000' AS DateTime), CAST(N'2021-10-22 00:00:00.000' AS DateTime), 20, NULL, CAST(36020000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (16, 1, 0, CAST(N'2021-06-16 00:00:00.000' AS DateTime), CAST(N'2021-10-23 00:00:00.000' AS DateTime), 5, NULL, CAST(359930000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (17, 1, 0, CAST(N'2021-04-18 00:00:00.000' AS DateTime), CAST(N'2021-10-25 00:00:00.000' AS DateTime), 21, N'Giao nhanh', CAST(107990000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (18, 1, 0, CAST(N'2021-10-18 00:00:00.000' AS DateTime), CAST(N'2021-10-25 00:00:00.000' AS DateTime), 22, NULL, CAST(39980000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (19, 1, 0, CAST(N'2021-11-18 00:00:00.000' AS DateTime), CAST(N'2021-10-25 00:00:00.000' AS DateTime), 2, NULL, CAST(8020000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (20, 1, 0, CAST(N'2021-03-18 00:00:00.000' AS DateTime), CAST(N'2021-10-21 00:00:00.000' AS DateTime), 23, N'Kiểm hàng trước khi nhận', CAST(135050000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (21, 1, 0, CAST(N'2021-02-25 00:00:00.000' AS DateTime), CAST(N'2021-12-26 00:00:00.000' AS DateTime), 23, NULL, CAST(26990000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (22, 1, 0, CAST(N'2021-12-24 00:00:00.000' AS DateTime), CAST(N'2021-12-27 00:00:00.000' AS DateTime), 21, NULL, CAST(269900000 AS Decimal(20, 0)))
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH], [YeuCau], [TongTien]) VALUES (23, 0, 0, CAST(N'2022-01-04 00:00:00.000' AS DateTime), CAST(N'2022-01-11 00:00:00.000' AS DateTime), 29, NULL, CAST(27020000 AS Decimal(20, 0)))
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
INSERT [dbo].[GioHang] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [SoLuong], [GiaTong], [GiaoHang]) VALUES (2, 49, N'iPhone 12 64GB', CAST(20490000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Iphone/iphone-12-64GB.jpg', 1, CAST(20490000 AS Decimal(20, 0)), 0)
INSERT [dbo].[GioHang] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [SoLuong], [GiaTong], [GiaoHang]) VALUES (2, 51, N'OPPO A74 5G', CAST(7990000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Oppo/OPPO A74 5G.jpg', 2, CAST(15980000 AS Decimal(20, 0)), 0)
INSERT [dbo].[GioHang] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [SoLuong], [GiaTong], [GiaoHang]) VALUES (6, 52, N'OPPO Find X3 Pro 5G', CAST(26990000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Oppo/OPPO Find X3 Pro 5G.jpg', 1, CAST(26990000 AS Decimal(20, 0)), 3)
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (1, N'Đinh Công Thành', N'dinhcongthanh', N'123456', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'Biên Hòa', N'dcthanh0611@gmail.com', N'0358238666', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (2, N'Đinh Công Thành', N'riocamcarot', N'thanh123', CAST(N'1998-11-06 00:00:00.000' AS DateTime), NULL, NULL, N'0358238666', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (5, N'Đinh Công Thành', N'dinhcongthanh0611', N'thanh123', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'abc Đinh Tiên Hoàng', N'151900089@dntu.edu.vn', N'0358238666', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (6, N'Nguyễn Văn A', N'admin1', N'123456', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'Biên Hòa', N'riocamcarot@gmail.com', N'0358238666', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (15, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'Biên Hòa - Đồng Nai', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (16, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'abc Đinh Tiên Hoàng', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (17, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'abc Đinh Tiên Hoàng', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (18, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'abc Đinh Tiên Hoàng', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (19, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'abc Đinh Tiên Hoàng', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (20, N'Nguyễn Thị A', N'Guest', N'Guest', NULL, N'123', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (21, N'Uyên', N'Guest', N'Guest', NULL, N'123456', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (22, N'Đinh Công Thành', N'admin3', N'thanh123', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'abc Đinh Tiên Hoàng', N'riocamcarot@gmail.com', N'0123456789', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (23, N'Uyên', N'Guest', N'Guest', NULL, N'abc Đinh Tiên Hoàng', N'abc@gmail.com', N'0123456789', 0, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (24, N'Thành', N'lonely', N'lylone', CAST(N'3000-03-09 00:00:00.000' AS DateTime), N'Biên Hòa - Đồng Nai', N'abc@gmail.com', N'0123456789', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (25, N'Đinh Công Thành', N'admin4', N'thanh123', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'abc Đinh Tiên Hoàng', N'riocamcarot@gmail.com', N'0123456789', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (26, N'Đinh Công Thành', N'admin5', N'thanh123', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'abc Đinh Tiên Hoàng', N'riocamcarot@gmail.com', N'0358238666', 1, 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai], [Active], [RoleID]) VALUES (29, N'Đinh Công Thành', N'Guest', N'Guest', NULL, N'Biên Hòa', N'test@gmail.com', N'0351232321', 0, NULL)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAISANPHAM] ON 

INSERT [dbo].[LOAISANPHAM] ([MaLSP], [TenLoaiSanPham], [DaXoa]) VALUES (1, N'Điện thoại', 0)
INSERT [dbo].[LOAISANPHAM] ([MaLSP], [TenLoaiSanPham], [DaXoa]) VALUES (2, N'Laptop', 0)
INSERT [dbo].[LOAISANPHAM] ([MaLSP], [TenLoaiSanPham], [DaXoa]) VALUES (3, N'Máy tính bảng', 0)
INSERT [dbo].[LOAISANPHAM] ([MaLSP], [TenLoaiSanPham], [DaXoa]) VALUES (4, N'Đồng hồ thông minh', 0)
SET IDENTITY_INSERT [dbo].[LOAISANPHAM] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (1, N'Asus', NULL, NULL, N'../../assets/images/Logos/Asus.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (2, N'Dell', NULL, NULL, N'../../assets/images/Logos/Dell.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (3, N'HP', NULL, NULL, N'../../assets/images/Logos/HP.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (4, N'Lenovo', NULL, NULL, N'../../assets/images/Logos/Lenovo.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (5, N'MSI', NULL, NULL, N'../../assets/images/Logos/MSI.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (6, N'Apple', NULL, NULL, N'../../assets/images/Logos/Apple.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (7, N'Oppo', NULL, NULL, N'../../assets/images/Logos/Oppo.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (8, N'Samsung', NULL, NULL, N'../../assets/images/Logos/Samsung.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (9, N'Vivo', NULL, NULL, N'../../assets/images/Logos/Vivo.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (10, N'Xiaomi', NULL, NULL, N'../../assets/images/Logos/Xiaomi.jpg', 0)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai], [Logo], [DaXoa]) VALUES (11, N'Garmin', NULL, NULL, N'../../assets/images/Logos/Garmin.jpg', 0)
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
INSERT [dbo].[ROLES] ([RoleID], [RoleName]) VALUES (1, N'khách hàng')
INSERT [dbo].[ROLES] ([RoleID], [RoleName]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (39, N'Asus TUF Gaming FX506HCB i7 11800H (HN141T)', CAST(27990000 AS Decimal(18, 0)), N'Asus TUF Gaming FX506HCB (HN141T) hoàn toàn chinh phục mọi game thủ không chỉ ở cấu hình mạnh mẽ đến từ con chip thế hệ 11 mà còn hấp dẫn với vẻ ngoài cực chất, đậm phong cách riêng. Tác chiến game cực đã với hiệu năng đẳng cấp và đồ họa linh hoạt. Bộ vi xử lý Core i7 đến từ nhà Intel cung cấp một cấu hình ổn định khi chiến các tựa game cạnh tranh hiện nay như LOL, PUBG, GTA V, Call of Duty: Warzone,... hay thỏa sức livestream một cách chuyên nghiệp và mượt mà nhờ CPU 8 nhân 16 luồng mạnh mẽ với tốc độ ép xung lên đến 4.6 GHz nhờ Turbo boost. Đảm bảo độ đa nhiệm mượt mà với bộ nhớ RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời), cho các thao tác chuyển đổi giữa các cửa sổ làm việc được diễn ra mạch lạc, bạn hoàn toàn có thể yên tâm khi vừa chơi game vừa phát trực tiếp hiệu quả với tốc độ phản hồi nhanh nhờ tốc độ Bus RAM lên đến 3200 MHz, máy còn hỗ trợ nâng cấp đến 32 GB cân mọi thể loại game “ngốn” RAM.', N'15.6" Full HD (1920 x 1080) 144Hz', N'Windows 10 Home SL', NULL, NULL, N'i7 11800H 2.30 GHz', N'8 GB DDR4 2 khe (1 khe 8GB + 1 khe r?i) 3200 MHz', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB) SSD 512 GB NVMe PCIe', NULL, N'3-cell Li-ion, 48 Wh', N'../../assets/images/Laptop/Asus/Asus TUF Gaming FX506HCB i7 11800H (HN141T).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 10, 2, 1, 0, N'../../assets/images/Laptop/Asus/Asus TUF Gaming FX506HCB i7 11800H (HN141T)1.jpg', CAST(25 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (40, N'Asus VivoBook A415EA i5 1135G7 (AM888T)', CAST(18690000 AS Decimal(18, 0)), N'Laptop Asus VivoBook A415EA i5 (AM888T) tối ưu và phù hợp trong tầm giá học sinh, sinh viên ở phân khúc laptop học tập, văn phòng bởi tính di động và hiệu năng ổn định từ trang bị CPU thế hệ thứ 11 mạnh mẽ, thích hợp với nhiều nhu cầu công việc giải trí khác nhau. Thiết kế nắp lưng kim loại hiện đại, tinh tế. Laptop Asus VivoBook A415EA sở hữu thiết kế gọn nhẹ và thanh lịch nhẹ nhàng với độ mỏng 17.9 mm và nhẹ chỉ 1.4 kg khẳng định tính di động, tiện lợi của sản phẩm, bạn có thể dễ dàng bỏ cừa balo mang đi học tập, làm việc khắp nơi. Nắp lưng được làm bằng kim loại rắn chắc, cực kỳ thẩm mỹ cùng phần thân nhựa giúp giảm thiểu khối lượng máy những không làm máy trở nên nặng nề, thay vào đó mềm mại trong từng bo góc. Laptop mang thiết kế mỏng nhẹ nhưng không đánh mất sự rắn chắc tinh tế, bền bỉ và chống va đập phù hợp với tính di động của nhu cầu công việc hay học tập của mỗi người, hứa hẹn sẽ là sản phẩm lý tưởng trong phân khúc laptop học tập văn phòng.', N'14" Full HD (1920 x 1080)', N'Windows 10 Home SL', NULL, N'HD webcam', N'i5 1135G7 2.4GHz', N'8 GB DDR4 (On board) 3200 MHz', N'SSD 512 GB NVMe PCIe', NULL, N'3-cell Li-ion, 42 Wh', N'../../assets/images/Laptop/Asus/Asus VivoBook A415EA i5 1135G7 (AM888T).jpg', CAST(N'2021-09-21 00:00:00.000' AS DateTime), 25, 2, 1, 0, N'../../assets/images/Laptop/Asus/Asus VivoBook A415EA i5 1135G7 (AM888T)1.jpg', CAST(15 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (41, N'Dell Gaming G3 15 i7 10750H (P89F002BWH)', CAST(31490000 AS Decimal(18, 0)), N'Laptop Dell G3 15 i7 (P89F002BWH) thuộc dòng laptop gaming với cấu hình mạnh mẽ, thiết kế trang nhã và rất sang trọng, dễ lựa chọn cho cả người đi đọc, đi làm, là 1 phiên bản tốt để lựa chọn cho cả nhu cầu làm việc, học tập và chơi game giải trí. Sang trọng, tinh tế, phong cách trẻ trung, hiện đại. Được đưa vào phân khúc laptop gaming, Dell G3 vì thế trang bị vẻ ngoài cũng mang hơi hướng mạnh mẽ, cá tính, nhưng đủ tinh tế và rất sang trọng để người dùng có thể thoải mái mang theo sử dụng ở mọi nơi. Lớp vỏ nhựa màu trắng hiện đại, các đường vát góc cạnh rất tinh tế, ngoại hình chắc chắn, trọng lượng 2.58 kg, độ dày 30.96 mm không quá nhẹ nhưng cũng không quá khó khăn để mang kèm nó tới văn phòng, lớp học,…', N'15.6" Full HD (1920 x 1080) 120Hz', N'Windows 10 Home SL', NULL, N'HD Webcam', N'i7 10750H 2.6GHz', N'16 GB DDR4 2 khe (1 khe 8GB + 1 khe 8GB) 2933 MHz', N'SSD 512 GB NVMe PCIe', NULL, N'4-cell Li-ion, 68 Wh', N'../../assets/images/Laptop/Dell/Dell Gaming G3 15 i7 10750H (P89F002BWH).jpg', CAST(N'2021-09-19 00:00:00.000' AS DateTime), 30, 2, 2, 0, N'../../assets/images/Laptop/Dell/Dell Gaming G3 15 i7 10750H (P89F002BWH)1.jpg', CAST(20 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (42, N'Dell XPS 13 9310 i5 1135G7 (70231343)', CAST(39990000 AS Decimal(18, 0)), N'Laptop Dell XPS 13 9310 i5 (70231343) sở hữu một cấu hình mạnh mẽ đáng gờm trong thân máy siêu mỏng nhẹ, màn hình tràn viền cùng với độ sáng 500 nits rực rỡ đáp ứng trọn vẹn mọi nhu cầu của dân văn phòng. Thiết kế mỏng nhẹ, bền bỉ từ kim loại nguyên khối. Laptop Dell XPS có thiết kế mỏng nhẹ của dòng ultrabook, thân máy được gia công từ nhôm  kèm theo cấu tạo với sợi carbon và bảo vệ bằng kính Corning Gorilla Glass vừa tăng độ bền vừa khiến máy trở nên sang trọng hơn. Với độ dày chỉ 14.35 mm, trọng lượng 1.32 kg, Dell XPS hoàn toàn không gây trở ngại khi di chuyển.', N'13.4" Full HD+ (1920 x 1200)', N'Windows 10 Home SL', NULL, N'HD Webcam', N'i5 1135G7 2.4GHz', N'8 GB LPDDR4 (On board) 4267 MHz', N'SSD 256 GB NVMe PCIe', NULL, N'4-cell Li-ion, 52 Wh', N'../../assets/images/Laptop/Dell/Dell XPS 13 9310 i5 1135G7 (70231343).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 2, 0, N'../../assets/images/Laptop/Dell/Dell XPS 13 9310 i5 1135G7 (70231343)1.jpg', CAST(15 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (43, N'HP 240 G8 i5 1135G7 (3D3H7PA)', CAST(17790000 AS Decimal(18, 0)), N'HP 240 G8 i5 (3D3H7PA) là chiếc máy tính nhỏ gọn cho khả năng xử lý mạnh mẽ nhờ con chip Intel thế hệ 11 tân tiến cũng như bộ nhớ rộng rãi, không ngại đáp ứng các nhu cầu học tập và tác vụ văn phòng. Thiết kế tối giản, gọn nhẹ. Laptop HP có thiết kế thanh lịch, khung máy bằng nhựa bền chắc, sử dụng tông màu xám bạc tạo cảm giác sang trọng. Kích thước khá gọn gàng với độ dày 19.9 mm mang lại cảm giác chắc chắn hơn. Ngoài ra, máy chỉ có trọng lượng nhẹ 1.426 kg tiện lợi bỏ vào balo hoặc túi xách lớn thoải mái mang đi mọi lúc, mọi nơi.', N'14" Full HD (1920 x 1080)', N'Windows 10 Home SL', NULL, N'HD Webcam', N'i5 1135G7 2.4GHz', N'8 GB DDR4 2 khe (1 khe 8GB + 1 khe rời) 3200 MHz', N'SSD 512 GB NVMe PCIe', NULL, N'3-cell Li-ion, 41 Wh', N'../../assets/images/Laptop/Hp/HP 240 G8 i5 1135G7 (3D3H7PA).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 3, 0, N'../../assets/images/Laptop/Hp/HP 240 G8 i5 1135G7 (3D3H7PA)1.jpg', CAST(25 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (44, N'HP Envy 13 ba1030TU i7 1165G7 (2K0B6PA)', CAST(28690000 AS Decimal(18, 0)), N'Laptop HP Envy 13 ba1030TU i7 (2K0B6PA) sở hữu thiết kế mỏng nhẹ cùng cấu hình cực mạnh mẽ đáp ứng đa dạng nhu cầu làm việc, giúp bạn đạt được hiệu suất làm việc tốt nhất. Hiệu năng mạnh mẽ cho mọi công việc đạt hiệu suất tối đa. Laptop HP Envy được trang bị bộ xử lý Intel Core i7. Đây là chiếc laptop sở hữu CPU thế hệ 11, lõi tứ 8 luồng cho xung nhịp trung bình 2.80 GHz ở các công việc văn phòng như Word, Excel, Powerpoint và xung nhịp tối đa lên đến 4.7 GHz với các tác vụ hạng nặng như: Photoshop, Adobe Premiere nhờ công nghệ Turbo Boost, mang đến hiệu năng mạnh mẽ đảm bảo xử lý tốt các công việc của bạn.', N'13.3" Full HD (1920 x 1080)', N'Windows 10 Home SL + Office H&S 2019 vĩnh viễn', NULL, N'HD Webcam', N'i7 1165G7 2.8GHz', N'8 GB DDR4 (On board) 2933 MHz', N' SSD 512 GB NVMe PCIe ', NULL, N'3-cell Li-ion', N'../../assets/images/Laptop/Hp/HP Envy 13 ba1030TU i7 1165G7 (2K0B6PA).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 3, 0, N'../../assets/images/Laptop/Hp/HP Envy 13 ba1030TU i7 1165G7 (2K0B6PA)1.jpg', CAST(20 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (45, N'Lenovo IdeaPad 3 15ITL6 i5 1135G7 (82H80042VN)', CAST(17590000 AS Decimal(18, 0)), N'Laptop Lenovo IdeaPad 3 15ITL6 i5 (82H80042VN) với thiết kế mỏng nhẹ đẹp mắt cùng hiệu năng ổn định giúp bạn hoàn thành công việc một cách nhanh chóng, hiệu quả. Thiết kế gọn nhẹ, phong cách trẻ trung. Laptop Lenovo với sắc xám thanh lịch, lớp vỏ nhựa ít trầy xước, bám vân tay cùng trọng lượng 1.65 kg và dày 19.9 mm giúp bạn dễ dàng mang theo bên mình, đảm bảo thời gian làm việc hay giải trí không bị gián đoạn.', N'15.6" Full HD (1920 x 1080)', N'Windows 10 Home SL', NULL, N'HD Webcam', N'i5 1135G7 2.4GHz', N'8 GB DDR4 (On board 4GB +1 khe 4GB) 3200 MHz', N'SSD 512 GB NVMe PCIe Hỗ trợ khe cắm HDD SATA', NULL, N'Li-ion, 38 Wh', N'../../assets/images/Laptop/Lenovo/Lenovo IdeaPad 3 15ITL6 i5 1135G7 (82H80042VN).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 4, 0, N'../../assets/images/Laptop/Lenovo/Lenovo IdeaPad 3 15ITL6 i5 1135G7 (82H80042VN)1.jpg', CAST(15 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (46, N'Lenovo Legion 5 Gaming 15IMH05 i7 10750H (82AU0051VN)', CAST(26990000 AS Decimal(18, 0)), N'Laptop Lenovo Legion 5 15IMH05 i7 (82AU0051VN) là thế hệ laptop gaming được thiết kế theo xu hướng hiện đại. Với vi xử lí đa nhân gen 10, card đồ họa rời mạnh mẽ, Lenovo Legion 5 cho trải nghiệm chiến các tựa game bom tấn cực đã. Thiết kế mạnh mẽ, cứng cáp. Lenovo Legion thiết kế theo phong cách gaming mạnh mẽ nhưng vẫn tạo cảm giác sang trọng. Vỏ máy được phủ sơn màu đen lịch lãm, logo Legion đặt gọn trên mặt lưng tạo điểm nhấn cho thiết kế. Chiếc laptop gaming này vẫn đảm bảo tính di động khi độ dày chỉ khoảng 23.57 mm, nặng 2.3 kg, dễ dàng để đem theo bên mình và chiến game cùng bạn bè hay mang đi học, đi làm hằng ngày.', N'15.6" Full HD (1920 x 1080) 120Hz', N'Windows 10 Home SL', NULL, N'HD Webcam', N'i7 10750H 2.6GHz', N'8 GB DDR4 2 khe (1 khe 8GB + 1 khe rời) 2933 MHz', N'HDD 1 TB SATA 3 SSD 256 GB NVMe PCIe', NULL, N'4-cell Li-Po, 60 Wh', N'../../assets/images/Laptop/Lenovo/Lenovo Legion 5 Gaming 15IMH05 i7 10750H (82AU0051VN).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 4, 0, N'../../assets/images/Laptop/Lenovo/Lenovo Legion 5 Gaming 15IMH05 i7 10750H (82AU0051VN)1.jpg', CAST(25 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (47, N'MSI Gaming GE66 Raider 11UH i7 11800H (259VN)', CAST(74490000 AS Decimal(18, 0)), N'MSI Gaming GE66 Raider 11UH i7 (259VN) thuộc dòng laptop gaming cao cấp của nhà MSI, sở hữu thiết kế độc đáo với cấu hình mạnh mẽ cùng hiệu suất chơi game gần như hoàn hảo nhờ sở hữu con chip Intel Gen 11 hiện đại. Đây chắc chắn sẽ là chiếc laptop mang đến cho bạn những giây phút giải trí tuyệt vời. Sức mạnh nổi bật nhờ công nghệ tiên tiến. MSI Gaming GE66 được trang bị bộ vi xử lý Intel Core i7 Tiger Lake 11800H với cấu trúc 8 nhân 16 luồng, mức xung nhịp trung bình là 2.3 GHz và đạt tối đa 4.6 GHz nhờ Turbo Boost giúp bạn hoàn thành mọi công việc một cách mượt mà nhất. Xử lý nhanh gọn các tính năng văn phòng phức tạp trên Word, Excel,... hay chỉnh sửa hình ảnh với dung lượng cao, thiết kế poster, render video,... cũng tuyệt vời không kém mà còn tiết kiệm điện năng vượt trội.', N'15.6" QHD (2560 x 1440) 240Hz', N'Windows 10 Home SL', NULL, N'FHD (30fps@1080p)', N'i7 11800H 2.30 GHz', N'32 GB DDR4 2 khe (1 khe 16GB + 1 khe 16GB) 3200 MHz', N'SSD 2 TB NVMe PCIe', NULL, N'4-cell, 99.9 Wh', N'../../assets/images/Laptop/MSI/MSI Gaming GE66 Raider 11UH i7 11800H (259VN).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 15, 2, 5, 0, N'../../assets/images/Laptop/MSI/MSI Gaming GE66 Raider 11UH i7 11800H (259VN)1.jpg', CAST(30 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (48, N'MSI Summit E13 Flip i7 1185G7 (211VN)', CAST(37990000 AS Decimal(18, 0)), N'Khi nhắc tới MSI chắc chắn mọi người sẽ nghĩ ngay đến dòng laptop gaming cực nổi tiếng của hãng, nhưng MSI đã từng ngày thay đổi quan niệm này bằng cách cho ra mắt các mẫu laptop mỏng nhẹ với cấu hình mạnh mẽ như chiếc MSI Summit E13 Flip Evo i7 (211VN) này. Thiết kế 2 trong 1 linh hoạt, khả năng bảo mật vượt trội. Sáng tạo trực tiếp ngay trên màn hình cảm ứng đa điểm của MSI, khi đang trình chiếu hay họp nhóm bạn có thể thao tác chỉnh sửa bằng tay nhanh chóng không cần phải di chuột hay gõ phím phức tạp. Đi kèm là bút cảm ứng MSI được trang bị công nghệ MPP2.0 cho thao tác đồ họa thêm phần chính xác và linh động hơn.', N'13.4" Full HD+ (1920 x 1200)', N'Windows 10 Home SL', NULL, N'HD Webcamm', N'i7 1185G7 3GHz', N'16 GB LPDDR4 (On board) 2133 MHz', N'SSD 1 TB NVMe PCIe Gen4x4', NULL, N'4-cell Li-ion, 70 Wh', N'../../assets/images/Laptop/MSI/MSI Summit E13 Flip i7 1185G7 (211VN).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 2, 5, 0, N'../../assets/images/Laptop/MSI/MSI Summit E13 Flip i7 1185G7 (211VN)1.jpg', CAST(10 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (49, N'iPhone 12 64GB', CAST(20490000 AS Decimal(18, 0)), N'<p>Trong những th&aacute;ng cuối năm 2020, Apple đ&atilde; ch&iacute;nh thức giới thiệu đến người d&ugrave;ng cũng như iFan thế hệ iPhone 12 series mới với h&agrave;ng loạt t&iacute;nh năng bứt ph&aacute;, thiết kế được lột x&aacute;c ho&agrave;n to&agrave;n, hiệu năng đầy mạnh mẽ v&agrave; một trong số đ&oacute; ch&iacute;nh l&agrave; iPhone 12 64GB. Hiệu năng vượt xa mọi giới hạn. Apple đ&atilde; trang bị con chip mới nhất của h&atilde;ng (t&iacute;nh đến 11/2020) cho iPhone 12 đ&oacute; l&agrave; A14 Bionic, được sản xuất tr&ecirc;n tiến tr&igrave;nh 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị tr&ecirc;n phi&ecirc;n bản tiền nhiệm iPhone 11.</p>', N'OLED 6.1" Super Retina XDR', N'iOS 14', N'2 camera 12 MP', N'12MP', N'Apple A14 Bionic', N'4 GB', N'64 GB', N'1 Nano SIM & 1 eSIM Hỗ trợ 5G', N'2815 mAh 20 W', N'../../assets/images/Phone/Iphone/iphone-12-64GB.jpg', CAST(N'2022-01-12 11:41:15.217' AS DateTime), 30, 1, 6, 0, N'../../assets/images/Phone/Iphone/iphone-12-64GB1.jpg', CAST(20 AS Decimal(18, 0)), 1, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/black.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (50, N'iPhone 12 Pro 512GB', CAST(35990000 AS Decimal(18, 0)), N'Thêm siêu phẩm của series iPhone 12 được Apple cho ra mắt trong sự kiện “Hi Speed”, mang trên mình các yếu tố của một siêu phẩm với nhiều tính năng đặc biệt, hấp dẫn và không ai khác đó chính là iPhone 12 Pro 512 GB. Tốc độ 5G siêu nhanh. Điểm sáng giá đầu tiên phải nói đến kết nối 5G lần đầu được Apple tích hợp trên các dòng iPhone 12 của mình với tốc độ và hiệu suất cao. Kết nối 5G cho phép tốc độ tải xuống và tải lên nhanh hơn, giúp tăng tốc mọi thứ từ việc load trang web đến tải xuống các ứng dụng, chương trình truyền hình và phim một cách nhanh chóng.', N'OLED 6.1" Super Retina XDR', N'iOS 14', N'3 camera 12 MP', N'12MP', N'Apple A14 Bionic', N'6 GB', N'512 GB', N'1 Nano SIM & 1 eSIM Hỗ trợ 5G', N'2815 mAh 20 W', N'../../assets/images/Phone/Iphone/iphone-12-pro-512GB.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 6, 0, N'../../assets/images/Phone/Iphone/iphone-12-pro-512GB1.jpg', CAST(10 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (51, N'OPPO A74 5G', CAST(7990000 AS Decimal(18, 0)), N'OPPO A74 5G mẫu điện thoại có kết nối 5G với mức giá tốt của OPPO. Máy có thiết kế tinh tế, màn hình 90 Hz mượt mà và cụm camera làm đẹp AI sẽ là những điểm nhấn “đáng tiền” trên mẫu điện thoại này. Thiết kế đơn giản, thời trang. OPPO A74 5G có thiết kế đặc trưng thường thấy ở các mẫu điện thoại OPPO được ra mắt gần đây, dải sáng phản chiếu đẹp mắt tạo điểm nhấn ở mặt lưng, các đường nét vuốt mỏng dần về cạnh viền, mang đến một chiếc điện thoại đẹp khi nhìn vào và luôn thoải mái khi cầm nắm trong lòng bàn tay.', N'IPS LCD 6.5" Full HD+', N'Android 11', N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP', N'16MP', N'Snapdragon 480 8 nhân 5G', N'6 GB', N'128 GB', N'2 Nano SIM Hỗ trợ 5G', N'5000 mAh 18 W', N'../../assets/images/Phone/Oppo/OPPO A74 5G.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 7, 0, N'../../assets/images/Phone/Oppo/OPPO A74 5G1.jpg', CAST(5 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (52, N'OPPO Find X3 Pro 5G', CAST(26990000 AS Decimal(18, 0)), N'OPPO đã làm khuynh đảo thị trường smartphone khi cho ra đời chiếc điện thoại OPPO Find X3 Pro 5G. Đây là một sản phẩm có thiết kế độc đáo, sở hữu cụm camera khủng, cấu hình thuộc top đầu trong thế giới Android. Kết quả của sự sáng tạo không ngừng. Nếu nhìn qua mặt lưng của OPPO Find X3 Pro 5G thì bạn sẽ bất ngờ ngay với cụm camera sau, được tạo hình giống như miệng núi lửa, thiết kế này đã ngốn rất nhiều thời gian và công sức của nhà sản xuất để mang đến cho người dùng sự khác biệt mới lạ.', N'AMOLED 6.7" Quad HD+ (2K+)', N'Android 11', N'Chính 50 MP & Phụ 50 MP, 13 MP, 3 MP', N'32MP', N'Snapdragon 888', N'12 GB', N'256 GB', N'2 Nano SIM Hỗ trợ 5G', N'4500 mAh 65 W', N'../../assets/images/Phone/Oppo/OPPO Find X3 Pro 5G.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 7, 0, N'../../assets/images/Phone/Oppo/OPPO Find X3 Pro 5G1.jpg', CAST(25 AS Decimal(18, 0)), 1, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (53, N'Samsung Galaxy S21 Ultra 5G 128GB', CAST(25990000 AS Decimal(18, 0)), N'Sự đẳng cấp được Samsung gửi gắm thông qua chiếc smartphone Galaxy S21 Ultra 5G với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong, hứa hẹn đáp ứng trọn vẹn nhu cầu ngày càng cao của người dùng. Đột phá trong thiết kế thời thượng. Không chỉ đơn thuần phục vụ giao tiếp và giải trí, Samsung Galaxy S21 Ultra 5G còn chính là món phụ kiện thời trang khẳng định vị thế của người sở hữu. Vẻ ngoài mảnh mai và thon gọn đến bất ngờ chỉ 165.1 x 75.6 x 8.9 mm và trọng lượng 228 g dù phải “vác” một viên pin lớn.', N'Dynamic AMOLED 2X 6.8" Quad HD+ (2K+)', N'Android 11', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', N'40MP', N'Exynos 2100', N'12 GB', N'128 GB', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM Hỗ trợ 5G', N'5000 mAh 25 W', N'../../assets/images/Phone/Samsung/Samsung Galaxy S21 Ultra 5G 128GB.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 8, 0, N'../../assets/images/Phone/Samsung/Samsung Galaxy S21 Ultra 5G 128GB1.jpg', CAST(25 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (54, N'Samsung Galaxy Z Flip3 5G 256GB', CAST(26990000 AS Decimal(18, 0)), N'Nối tiếp thành công của Galaxy Z Flip 5G, trong sự kiện Galaxy Unpacked vừa qua Samsung tiếp tục giới thiệu đến thế giới về Galaxy Z Flip3 5G 256GB. Sản phẩm có nhiều cải tiến từ độ bền cho đến hiệu năng và thậm chí nó còn vượt xa hơn mong đợi của mọi người. Thiết kế nhỏ gọn đầy lôi cuốn. Samsung Galaxy Z Flip3 5G dễ dàng lấy lòng phái nữ khi thiết kế của nó được lấy cảm hứng từ hộp đựng phấn trang điểm. Kết hợp với 7 màu sắc khác nhau, giúp bạn thoải mái thể hiện cá tính, từ mạnh mẽ sang trọng đến hiện đại trẻ trung.', N'Dynamic AMOLED 2X Chính 6.7" & Phụ 1.9" Full HD+', N'Android 11', N'2 camera 12 MP', N'10MP', N'Snapdragon 888', N'8 GB', N'256 GB', N'1 Nano SIM + 1 eSIM Hỗ trợ 5G', N'3300 mAh 15 W', N'../../assets/images/Phone/Samsung/Samsung Galaxy Z Flip3 5G 256GB.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 8, 0, N'../../assets/images/Phone/Samsung/Samsung Galaxy Z Flip3 5G 256GB1.jpg', CAST(30 AS Decimal(18, 0)), 1, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (55, N'Vivo V20 (2021)', CAST(7790000 AS Decimal(18, 0)), N'Vivo tung ra chiếc điện thoại Vivo V20 (2021) là phiên bản nâng cấp của Vivo V20 ra mắt trước đó. Chiếc smartphone này được nâng cấp lên bộ xử lý mạnh mẽ hơn mà vẫn giữ được thiết kế siêu mỏng và cụm camera chụp đẹp đáng kinh ngạc. Sở hữu thiết kế mỏng đẹp mắt. Vivo V20 (2021) nổi bật với thiết kế mỏng chỉ 7.38 mm, mặt lưng được hoàn thiện từ kính mờ cao cấp, giúp hạn chế bám dấu vân tay. Khung máy làm từ nhựa nhưng có chất lượng hoàn thiện cao, mang lại cảm giác cứng cáp, chắn chắn.', N'AMOLED 6.44" Full HD+', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'44 MP', N'Snapdragon 730', N'8 GB', N'128 GB', N'2 Nano SIM Hỗ trợ 4G', N'4000 mAh 33 W', N'../../assets/images/Phone/Vivo/Vivo V20 (2021).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 9, 0, N'../../assets/images/Phone/Vivo/Vivo V20 (2021)1.jpg', CAST(35 AS Decimal(18, 0)), 1, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (56, N'Vivo V20 SE', CAST(6490000 AS Decimal(18, 0)), N'Dù được định vị ở phân khúc điện thoại tầm trung, Vivo V20 SE vẫn sở hữu những nét riêng biệt, đủ để thu hút sự chú ý của những ai yêu công nghệ. Hãy cùng tìm hiểu xem chiếc smartphone này có gì khác biệt với các đối thủ khác. Thu hút từ cái nhìn đầu tiên. Mặt trước có thiết kế hình giọt nước sang trọng nhẹ khoảng 171 g, kết hợp cùng các đường cong 3D chất liệu polyme cao cấp, chiếc điện thoại dễ dàng nằm gọn trong lòng bàn tay người dùng.', N'AMOLED 6.44" Full HD+', N'Android 11', N'Chính 48 MP & Phụ 8 MP, 2 MP', N'32 MP', N'Snapdragon 665', N'8 GB', N'128 GB', N'2 Nano SIM Hỗ trợ 4G', N'4100 mAh 33 W', N'../../assets/images/Phone/Vivo/Vivo V20 SE.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 9, 0, N'../../assets/images/Phone/Vivo/Vivo V20 SE1.jpg', CAST(25 AS Decimal(18, 0)), 1, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (57, N'Xiaomi Mi 10T Pro 5G', CAST(12490000 AS Decimal(18, 0)), N'Mi 10T Pro 5G mẫu smartphone cao cấp của Xiaomi trong năm 2020 cuối cùng cũng được trình làng với loạt những thông số gây “choáng ngợp”: Màn hình tần số quét 144 Hz, vi xử lý Snapdragon 865 và cụm camera khủng 108 MP kèm theo đó là một mức giá dễ chịu cho người dùng. Mượt mà trong từng khung hình với tần số quét 144 Hz. Tần số quét 144 Hz là một trong những điểm ấn tượng của Mi 10T Pro, cung cấp lên đến 144 khung hình/giây mang đến sự mượt mà tối đa, nâng cao mọi trải nghiệm cho dù bạn đang chơi game, xem phim hay chỉ đơn giản là cuộn trang web để xem tin tức.', N'IPS LCD 6.67" Full HD+', N'Android 11', N'Chính 108 MP & Phụ 13 MP, 5 MP', N'20 MP', N'Snapdragon 865', N'8 GB', N'256 GB', N'2 Nano SIM Hỗ trợ 5G', N'5000 mAh 33 W', N'../../assets/images/Phone/Xiaomi/Xiaomi Mi 10T Pro 5G.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 10, 0, N'../../assets/images/Phone/Xiaomi/Xiaomi Mi 10T Pro 5G1.jpg', CAST(20 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (58, N'Xiaomi Mi 11 5G', CAST(16990000 AS Decimal(18, 0)), N'Xiaomi Mi 11 một siêu phẩm đến từ Xiaomi, máy cho trải nghiệm hiệu năng hàng đầu với vi xử lý Qualcomm Snapdragon 888, cùng loạt công nghệ đỉnh cao, khiến bất kỳ ai cũng sẽ choáng ngợp về smartphone này. Thiết kế nổi bật với cụm camera độc nhất. Có thể thấy, điểm sáng trong thiết kế của Mi 11 đến từ cụm 3 camera mặt sau được đặt trong mô-đun hình vuông, được phân tầng với 2 lớp kính tạo nên sự khác biệt và nổi bật ngay từ cái nhìn đầu tiên.', N'AMOLED 6.81" Quad HD+ (2K+)', N'Android 11', N'Chính 108 MP & Phụ 13 MP, 5 MP', N'20 MP', N'Snapdragon 888', N'8 GB', N'256 GB', N'2 Nano SIM Hỗ trợ 5G', N'4600 mAh 55 W', N'../../assets/images/Phone/Xiaomi/Xiaomi Mi 11 5G.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 1, 10, 0, N'../../assets/images/Phone/Xiaomi/Xiaomi Mi 11 5G1.jpg', CAST(15 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (59, N'Apple Watch S5 LTE 40mm viền thép dây thép vàng', CAST(16990000 AS Decimal(18, 0)), N'Apple Watch S5 LTE 40mm viền thép dây thép vàng được trang bị bộ khung viền cứng cáp, dây đeo bằng thép dạng lưới đan mỏng tôn lên nét hiện đại, tinh tế. Đồng hồ sở hữu màn hình OLED 1.57 inch giúp hiển thị thông tin rõ ràng, sắc nét. Mặt kính cường lực Sapphire giúp bảo vệ đồng hồ an toàn trước những va chạm thường ngày.', N'OLED, 1.57 inch', N'watchOS 6.0', NULL, NULL, N'Apple S5 64 bit', NULL, N'32 GB', N'sim', N'245 mAh', N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 40mm viền thép dây thép vàng.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 20, 4, 6, 0, N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 40mm viền thép dây thép vàng1.jpg', CAST(15 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (60, N'Apple Watch S5 LTE 40mm viền thép dây thép', CAST(16990000 AS Decimal(18, 0)), N'Apple Watch S5 LTE 44mm viền thép dây thép mang ngoại hình tương tự như thế hệ Apple Watch Series 4 và thậm chí linh kiện, kết cấu cũng tương tự. Dây đeo thiết kế dạng lưới đan mỏng, gia công hoàn toàn từ thép không gỉ, vừa quý phái lại vừa mang cảm giác thoải mái cho người đeo.', N'OLED, 1.57 inch', N'watchOS 6.0', NULL, NULL, N'Apple S5 64 bit', NULL, N'32 GB', NULL, N'245 mAh', N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 40mm viền thép dây thép.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 4, 6, 0, N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 40mm viền thép dây thép1.jpg', CAST(15 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (61, N'Garmin Approach S62 dây silicone', CAST(12990000 AS Decimal(18, 0)), N'Đồng hồ thông minh Garmin Approach S62 là chiếc đồng hồ có thiết kế gọn gàng nhưng vẫn không kém phần lịch lãm, sang trọng. Mặt đồng hồ có đường kính 47mm, thích hợp với nam giới có cổ tay lớn. Khung viền benzel của thiết bị làm từ gốm, có khả năng chịu va chạm tốt và mang lại tổng thể sang trọng, đẳng cấp.', N'MIP, 1.3 inch', N'Android, IOS', NULL, NULL, NULL, NULL, N'1 GB', NULL, N'Khoảng 14 ngày, Khoảng 20 giờ khi sử dụng GPS', N'../../assets/images/Smart Watch/Garmin/Garmin Approach S62 dây silicone.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 10, 4, 11, 0, N'../../assets/images/Smart Watch/Garmin/Garmin Approach S62 dây silicone1.jpg', CAST(15 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (62, N'Garmin Enduro dây vải', CAST(19990000 AS Decimal(18, 0)), N'Đồng hồ thông minh Garmin Enduro dây vải có thiết kế thể thao, nam tính với khung viền thép không gỉ và dây đeo bằng vải dù ôm trọn cổ tay, cho bạn có cảm giác dễ chịu hơn khi đeo. Màn hình có kích thước 1.4 inch cùng với mặt kính cường lực chắc chắn có khả năng chịu lực, chống trầy xước hơn hẳn kính thông thường.', N'MIP1.4 inch', N'Android, IOS', NULL, NULL, NULL, NULL, N'64 MB', NULL, N'Khoảng 50 ngàyKhoảng 70 giờ khi sử dụng GPS', N'../../assets/images/Smart Watch/Garmin/Garmin Enduro dây vải.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 12, 4, 11, 0, N'../../assets/images/Smart Watch/Garmin/Garmin Enduro dây vải1.jpg', CAST(10 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (63, N'Samsung Galaxy Watch 3 41mm viền thép bạc dây da', CAST(4490000 AS Decimal(18, 0)), N'Samsung Galaxy Watch 3 41mm viền thép bạc dây da sở hữu 2 nút bấm và vòng bezel xoay điều khiển vật lý độc đáo. Màn hình 1.2 inch cùng độ phân giải 360 x 360 pixels giúp hình ảnh hiển thị được chân thật, rõ nét. Viền đồng hồ được làm bằng thép cứng cáp cùng dây đeo bằng da tạo cảm giác chắc chắn và dễ chịu cho người dùng khi đeo.', N'SUPER AMOLED, 1.2 inch', N'OS TIZEN', NULL, NULL, N'Exynos 9110', NULL, N'8 GB', NULL, N'247 mAh', N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 3 41mm viền thép dây da.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 25, 4, 8, 0, N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 3 41mm viền thép dây da1.jpg', CAST(25 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (64, N'Samsung Galaxy Watch 4 40mm', CAST(6490000 AS Decimal(18, 0)), N'Phiên bản đồng hồ Samsung Galaxy Watch 4 này được thiết kế đơn giản với mặt đồng hồ dạng tròn có đường kính 40 mm thường thấy ở đồng hồ thông minh tạo nên phong cách năng động, cuốn hút. Khung viền đồng hồ được làm từ chất liệu nhôm bền chắc, trọng lượng nhẹ. Bên cạnh đó dây đeo silicone êm ái, không gây khó chịu khi đeo suốt ngày dài, kể cả khi người dùng vận động, tập thể thao ra nhiều mồ hôi tay.', N'SUPER AMOLED, 1.19 inch', N'One UI Watch', NULL, NULL, N'Exynos W920', NULL, N'16 GB', NULL, N'247 mAh', N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 4 40mm.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 21, 4, 8, 0, N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 4 40mm1.jpg', CAST(30 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (65, N'iPad Air 4 Wifi Cellular 256GB (2020)', CAST(24790000 AS Decimal(18, 0)), N'Chấn động giới công nghệ toàn cầu, khi một tablet lần đầu được tích hợp một trong những chipset hàng đầu 2020, iPad Air 4 Wifi Cellular 256GB 2020 sở hữu con chip A14 Bionic với hiệu năng vô cùng mạnh mẽ, kết nối 4G tiện dụng cùng bộ nhớ cực khủng lên đến 256 GB.', N'10.9", Liquid Retina', N'iPadOS 14', N'12 MP', N'7 MP', N'Apple A14 Bionic 6 nhân', N'4 GB', N'256 GB', N'1 Nano SIM hoặc 1 eSIM', N'Li-Po 28.65 Wh (~ 7600 mAh), 20 W', N'../../assets/images/Tablet/Ipad/iPad Air 4 Wifi Cellular 256GB (2020).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 24, 3, 6, 0, N'../../assets/images/Tablet/Ipad/iPad Air 4 Wifi Cellular 256GB (2020)1.jpg', CAST(50 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (66, N'iPad Pro 11 inch Wifi 128GB (2020)', CAST(21790000 AS Decimal(18, 0)), N'iPad Pro 11 inch Wifi 128GB (2020) là mẫu iPad được Apple ra mắt vào 18/3 với thiết kế gần như không thay đổi so với thế hệ trước, chủ yếu là sự nâng cấp đến từ chip A12Z cho hiệu năng mạnh mẽ và cụm camera có cảm biến mới hỗ trợ tăng cường thực tế ảo. ', N'11", Liquid Retina', N'iPadOS 14', N'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', N'7 MP', N'Apple A12Z Bionic', N'6 GB', N'128 GB', NULL, N'Li-Po 28.65 Wh (~ 7600 mAh)', N'../../assets/images/Tablet/Ipad/iPad Pro 11 inch Wifi 128GB (2020).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 23, 3, 6, 0, N'../../assets/images/Tablet/Ipad/iPad Pro 11 inch Wifi 128GB (2020)1.jpg', CAST(35 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (67, N'Samsung Galaxy Tab A7 (2020)', CAST(7990000 AS Decimal(18, 0)), N'Samsung Galaxy Tab A7 (2020) là một chiếc máy tính bảng có thiết kế đẹp, cấu hình khá, nhiều tính năng tiện ích, một công cụ đắc lực hỗ trợ bạn trong công việc cũng như trong học tập hay giải trí.', N'10.4", TFT LCD', N'Android 10', N'8 MP', N'5 MP', N'Snapdragon 662', N'3 GB', N'64 GB', N'1 Nano SIM', N'Li-Ion 7040 mAh', N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab A7 (2020).jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 18, 3, 8, 0, N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab A7 (2020)1.jpg', CAST(25 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (68, N'Samsung Galaxy Tab A7 Lite', CAST(4490000 AS Decimal(18, 0)), N'Galaxy Tab A7 Lite là phiên bản rút gọn của dòng máy tính bảng "ăn khách" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.', N'8.7", TFT LCD', N'Android 11', N'8 MP', N'2 MP', N'MediaTek MT8768T 8 nhân', N'3 GB', N'32 GB', N'1 Nano SIM', N'Li-Ion 5100 mAh', N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab A7 Lite.jpg', CAST(N'2021-09-22 00:00:00.000' AS DateTime), 12, 3, 8, 0, N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab A7 Lite1.jpg', CAST(10 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (71, N'Asus ZenBook UX425EA i7 1165G7 (KI439T)', CAST(30190000 AS Decimal(18, 0)), N'Laptop Asus ZenBook UX425EA i7 (KI439T) sang trọng, thời trang với bộ CPU thế hệ 11 mang đến cấu hình mạnh mẽ lý tưởng cho những tác vụ nặng, đáp ứng tốt từ các ứng dụng văn phòng cơ bản đến đồ phức tạp, chơi game giải trí thật mượt mà, rất đáng để bạn trải nghiệm. Asus ZenBook UX425EA i7 (KI439T) là chiếc laptop mỏng nhẹ sở hữu lớp vỏ kim loại nguyên khối màu xám đen hiện đại với mặt lưng thể hiện logo Asus đơn giản mà sang trọng, đủ tạo sức hút tinh tế ngay từ cái nhìn đầu tiên. Kích thước nhỏ gọn chỉ mỏng 13.9 mm, siêu nhẹ 1.17 kg mang đến tính di động cực cao, đặt gọn dễ dàng trong balo, túi xách để bạn thuận tiện mang theo đi học, đi làm hay công tác xa.', N' 14" Full HD (1920 x 1080) ', N'Windows 10 Home SL', NULL, N'HD Webcam', N' i7 1165G7 2.8GHz ', N' 16 GB LPDDR4X (On board) 4266 MHz ', N'
SSD 512 GB NVMe PCIe ', NULL, N'4-cell Li-ion, 67 Wh', N'../../assets/images/Laptop/Asus/Asus ZenBook UX425EA i7 1165G7 (KI439T).jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 23, 2, 1, 0, N'../../assets/images/Laptop/Asus/Asus ZenBook UX425EA i7 1165G7 (KI439T)1.jpg', CAST(5 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (75, N'Dell Gaming G3 i7 10750H (P89F002G3500B)', CAST(27990000 AS Decimal(18, 0)), N'Laptop Dell G3 15 i7 (P89F002G3500C) là chiếc laptop trong phân khúc gaming nhận được nhiều sự quan tâm đặc biệt bởi thiết kế phổ thông, đơn giản cùng hiệu năng tối ưu mạnh mẽ phù hợp với đa dạng người dùng cho cả nhu cầu học tập, làm việc và giải trí. Dell G3 sở hữu vẻ ngoài đơn giản và phổ thông nhưng vẫn không kém phần tinh tế và trẻ trung với độ dày 30.96 mm và khối lượng 2.56 kg, mang cảm giác mạnh mẽ, cá tính. Thiết kế với chất liệu nhựa, nắp lưng được tạo vân không bám dính vân tay và mồ hôi, giữ máy luôn sạch sẽ, nổi bật là logo Dell với màu xanh cá tính, năng động mang một nét riêng làm nên sự nổi bật của chiếc laptop gaming này.', N' 15.6" Full HD (1920 x 1080) 120Hz ', N'Windows 10 Home SL', NULL, N'HD Webcam', N'
i7 10750H 2.6GHz ', N' 16 GB DDR4 2 khe (1 khe 8GB + 1 khe 8GB) 2933 MHz ', N'SSD 256 GB NVMe PCIe HDD 1 TB', NULL, N'
3-cell Li-ion, 51 Wh ', N'../../assets/images/Laptop/Dell/Dell Gaming G3 i7 10750H (P89F002G3500B).jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 20, 2, 2, 0, N'../../assets/images/Laptop/Dell/Dell Gaming G3 i7 10750H (P89F002G3500B)1.jpg', CAST(10 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (76, N'HP EliteBook X360 1040 G7 i7 10710U (230P8PA)', CAST(25990000 AS Decimal(18, 0)), N'HP EliteBook X360 1040 (230P8PA) là một phiên bản laptop với thiết kế mỏng nhẹ cùng với chip Core i7 hiệu năng mạnh mẽ. Đây thực sự là con laptop đáng mong đợi dành cho doanh nhân hay các bạn có nhu cầu di chuyển cao. Được sử dụng bộ vi xử lý đến từ hãng Intel, Intel Core i7 Comet Lake được trang bị 6 nhân 12 luồng đem đến sự cải tiến về hiệu năng lẫn tốc độ xử lý, giúp nâng cao năng suất làm việc của người dùng với xung nhịp cơ sở là 1.1 GHz và được ép xung tối đa lên đến 4.7 GHz.', N' 14" Full HD (1920 x 1080) ', N'
Windows 10 Pro ', NULL, N'HD Webcam', N' i7 10710U 1.1GHz ', N' 16 GB LPDDR4 (On board) 2933 MHz ', N' SSD 512 GB NVMe PCIe Intel Optane 32GB (H10) ', NULL, N'4-cell Li-ion, 78.5 Wh', N'../../assets/images/Laptop/Hp/HP EliteBook X360 1040 G7 i7 10710U (230P8PA).jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 24, 2, 3, 0, N'../../assets/images/Laptop/Hp/HP EliteBook X360 1040 G7 i7 10710U (230P8PA)1.jpg', CAST(15 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (77, N'Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN)', CAST(28290000 AS Decimal(18, 0)), N'ThinkBook 14s Yoga ITL i7 (20WE004FVN) là dòng laptop cao cấp được nhà Lenovo cho ra mắt với phong thái sang trọng, thời thượng cùng sức mạnh vượt trội đến từ con chip Intel Gen 11 mạnh mẽ, đáp ứng tốt mọi tác vụ từ cơ bản đến nâng cao. Khoác lên mình chiếc áo màu xám hiện đại cùng lớp vỏ kim loại bền bỉ, cứng cáp, Lenovo ThinkBook sở hữu cho mình phong cách đơn giản nhưng không kém phần trẻ trung, năng động, thích hợp cho mọi đối tượng giới văn phòng hay các bạn học sinh, sinh viên. Thỏa nhu cầu là một chiếc laptop học tập - văn phòng nên tính di động của máy được ưu tiên hơn hết với độ dày 16.9 mm và trọng lượng nhẹ 1.5 kg, cho phép người dùng dễ dàng mang máy theo khắp nơi và đặt máy ở mọi không gian làm việc.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Thiết kế

Một điểm đặc biệt giúp laptop Lenovo nổi bật hơn so với các mẫu laptop cùng dòng khác là thiết kế bản lề gập xoay 360 độ cho bạn thỏa sức xây dựng và trình bày ý tưởng một cách dễ dàng với nhiều tư thế và góc độ máy khác nhau, nâng cao khả năng làm việc nhóm hiệu quả.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Bản lề 360 độ

Hành trình phím ổn với nút bấm êm và đổ nảy tốt, mang lại cảm giác nhập liệu thoải mái, máy còn trang bị đèn nền cho phép người dùng làm việc mọi lúc mọi nơi dù ở trong môi trường thiếu sáng.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Bàn phím

Đăng nhập máy và khởi động ứng dụng nhanh chóng hơn với thao tác chạm tay dễ dàng nhờ vào tính năng cảm biến vân tay được tích hợp trên nút nguồn Lenovo 14s Yoga.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Bảo mật vân tay

Học tập, làm việc trực tuyến tiện lợi hơn với HD webcam có độ phân giải 720p, máy còn trang bị công tắc khóa đóng camera khi không sử dụng đến, đảm bảo được độ bảo mật thông tin an toàn, ngăn chặn các tin tặc đánh cắp thông tin và dữ liệu hình ảnh cá nhân.

Dọc hai bên thân máy là đầy đủ cổng kết nối như Jack tai nghe 3.5 mm, 1 cổng USB 3.2, HDMI, 1 cổng USB 3.2 (Always on), USB Type-C và đặc biệt là Thunderbolt 4 USB-C có khả năng vừa sạc máy vừa truyền dữ liệu, giúp bạn kết nối với các thiết bị ngoại vi khác như loa, chuột, bàn phím,... một cách dễ dàng, không quá phức tạp.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Cổng kết nối

Đảm bảo tốc độ đường truyền ổn định, hạn chế tình trạng mất kết nối, ngắt quãng giữa chừng khi đang học tập, giải trí nhờ vào chuẩn Bluetooth 5.1 và Wi-Fi 6 (802.11ax) cho hiệu suất công việc được nâng cao đáng kể.
Bứt phá mọi tác vụ với cấu hình vượt bật

Máy được trang bị bộ vi xử lý Intel Core i7 Tiger Lake 1165G7 nâng tầm sức mạnh tối ưu với cấu trúc CPU 4 nhân 8 luồng mạnh mẽ, đạt xung nhịp tối đa lên đến Turbo boost 4.7 GHz phục vụ hoàn hảo các công việc văn phòng trên Word, Excel, PowerPoint,... và đồ họa từ cơ bản đến nâng cao, tăng hiệu suất làm việc cho người dùng.

Card đồ họa tích hợp Intel Iris Xe Graphics cho hiệu suất đồ họa được tối ưu hóa, giúp bạn chỉnh sửa các hình ảnh 2D, 3D hay render video một cách chuyên nghiệp thông qua các ứng dụng của Adobe như Photoshop, Illustrator, AI, Pr,... hay giải trí với các tựa game có mức cài đặt trung bình cao như LOL, FIFA, DOTA 2,... một cách trơn tru, mượt mà.

Tăng khả năng đa nhiệm với bộ nhớ RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB on board + 1 khe rời 8 GB), cho phép người dùng dễ dàng mở hàng chục cửa sổ làm việc cùng lúc mà không có hiện tượng giật lag hay đứng máy nhờ tốc độ Bus RAM 3200 MHz, máy còn hỗ trợ nâng cấp tối đa 40 GB nhằm phục vụ tối đa nhu cầu sử dụng.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Cấu hình

Ổ cứng SSD 512 GB NVMe PCIe với khả năng tháo rời và thay thế thanh khác tối đa lên đến 1 TB, tạo không gian lưu trữ vừa vặn các tập tài liệu hữu ích, đồng thời rút ngắn tốc độ khởi động máy và ứng dụng nhưng vẫn đảm bảo tiết kiệm nguồn pin đáng kể. ThinkBook 14s Yoga còn cung cấp thêm 1 khe cắm SSD M.2 PCIe mở rộng tối đa 1 TB tối ưu hóa công việc của bạn.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - SSD
Hiển thị âm thanh, hình ảnh chuyên nghiệp

Màn hình 14 inch với độ phân giải Full HD (1920x1080) cung cấp những khung hình rõ nét với màu sắc tươi mới, sống động, đem đến cho người dùng cảm giác chân thật như đang trong chính bối cảnh những bộ phim hay nhân vật game.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Hình ảnh

Laptop có độ sáng lên đến 300 nits với màn hình 100% sRGB cung cấp cho người dùng lượng ánh sáng cần thiết để có thể làm việc với cường độ cao mà không bị mỏi mắt, thoải mái tận hưởng những khung hình tuyệt mỹ qua khung hình rộng lên đến 178 độ nhờ tấm nền IPS hiện đại. 

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Hiển thị chân thực

Biến đổi dễ dàng và linh hoạt sử dụng như một chiếc máy tính bảng thực thụ với màn hình cảm ứng đa điểm cùng bút kèm theo cho bạn thỏa sức sáng tạo mọi lúc mọi nơi mà không cần đến chuột hay bàn phím.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Cảm ứng đa điểm

Tận hưởng trọn vẹn khoảnh khắc thư giãn tuyệt vời với chất âm hoàn hảo đến từ công nghệ Sound by Dynaudio kết hợp với âm thanh vòm Dolby Audio cho khả năng lọc khử tiếng ồn trong trẻo và độ khuếch đại cao, đắm chìm trên từng nốt nhạc.

Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN) - Âm thanh

Laptop Lenovo ThinkBook 14s Yoga ITL i7 (20WE004FVN) sẽ là một người đồng hành lý tưởng cho người dùng văn phòng bởi thiết kế đẳng cấp, thời thượng cùng những thông số kỹ thuật vượt bật.
', N' 14" Full HD (1920 x 1080) ', N'
Windows 10 Home SL ', NULL, N'HD Webcam', N' i7 1165G7 2.8GHz ', N' 16 GB DDR4 2 khe (8GB onboard+ 1 khe 8GB) 3200 MHz ', N'512 GB SSD NVMe PCIe', NULL, N'
60Wh ', N'../../assets/images/Laptop/Lenovo/Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN).jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 15, 2, 4, 0, N'../../assets/images/Laptop/Lenovo/Lenovo ThinkBook 14s Yoga ITL i7 1165G7 (20WE004FVN)1.jpg', CAST(20 AS Decimal(18, 0)), 0, 1, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (78, N'iPhone 13 Pro 256 GB', CAST(30990000 AS Decimal(18, 0)), N'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 - điện thoại có nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng. Con chip Apple A15 Bionic siêu mạnh được sản xuất trên quy trình 5 nm giúp iPhone 13 đạt hiệu năng ấn tượng, với CPU nhanh hơn 50%, GPU nhanh hơn 30% so với các đối thủ trong cùng phân khúc.', N'OLED, 6.1", Super Retina XDR', N'iOS 15', N'3 camera 12 MP', N'12 MP', N'Apple A15 Bionic 6 nhân', N'6 GB', N'256 GB', N'1 Nano SIM & 1 eSIM, Hỗ trợ 5G', N'3095 mAh, 20 W', N'../../assets/images/Phone/Iphone/iphone-13-pro-256GB.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 17, 1, 6, 0, N'../../assets/images/Phone/Iphone/iphone-13-pro-256GB1.jpg', CAST(5 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (79, N'OPPO Reno5 Marvel', CAST(9190000 AS Decimal(18, 0)), N'OPPO cho ra mắt một phiên bản giới hạn mới OPPO Reno5 Marvel, về hiệu năng cấu hình bên trong máy hoàn toàn tương tự so với Reno5, nhưng về kiểu dáng bên ngoài máy có phần khác biệt với thiết kế tùy chỉnh với mặt lưng có logo Marvel, logo Avengers hoàn toàn mới lạ. Thoạt nhìn, OPPO Reno5 Marvel trông như một chiếc điện thoại chơi game với chủ đạo là màu đen, xen lẫn là các màu đỏ và bạc, sự kết hợp này tạo nên điểm nhấn nổi bật về một chiếc điện thoại mang phong cách thể thao nhưng vẫn toát lên vẻ đẹp thanh lịch.', N' AMOLED 6.43" Full HD+ ', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', N'44 MP', N'Snapdragon 720G', N'8 GB', N'
128 GB ', N' 2 Nano SIM Hỗ trợ 4G ', N' 4310 mAh 50 W ', N'../../assets/images/Phone/Oppo/OPPO Reno5 Marvel.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 13, 1, 7, 0, N'../../assets/images/Phone/Oppo/OPPO Reno5 Marvel1.jpg', CAST(10 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (80, N'Samsung Galaxy Z Fold3 5G 256GB', CAST(40990000 AS Decimal(18, 0)), N'Galaxy Z Fold3 5G, chiếc điện thoại được nâng cấp toàn diện về nhiều mặt, đặc biệt đây là điện thoại màn hình gập đầu tiên trên thế giới có camera ẩn (08/2021). Sản phẩm sẽ là một “cú hit” của Samsung góp phần mang đến những trải nghiệm mới cho người dùng. Có thể thấy mẫu smartphone Galaxy Z Fold3 lần này vẫn giữ nguyên ngoại hình cùng cơ chế màn hình gập mở dạng quyển sách như của tiền nhiệm, hồ biến chiếc smartphone thành một chiếc máy tính bảng mini một cách dễ dàng và ngược lại.', N' Dynamic AMOLED 2X Chính 7.6" & Phụ 6.2" Full HD+ ', N'Android 11', N'3 camera 12 MP', N'10 MP & 4 MP', N' Snapdragon 888 ', N'12 GB', N'256 GB', N' 2 Nano SIM Hỗ trợ 5G ', N' 4400 mAh 25 W ', N'../../assets/images/Phone/Samsung/Samsung Galaxy Z Fold3 5G 256GB.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 19, 1, 8, 0, N'../../assets/images/Phone/Samsung/Samsung Galaxy Z Fold3 5G 256GB1.jpg', CAST(15 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (81, N'Điện thoại Samsung Galaxy Note 20 Ultra ', CAST(20990000 AS Decimal(18, 0)), N'Sau Galaxy Note 20 thì Galaxy Note 20 Ultra là phiên bản tiếp theo cao cấp hơn thuộc dòng Note 20 Series của Samsung, với nhiều thay đổi, từ cụm camera hỗ trợ lấy nét laser AF cùng ống kính góc rộng mới, màn hình tràn viền lên đến 6.9 inch. Màn hình tràn viền góc cạnh tối đa, kế thừa những đặc tính từ thế hệ trước, công nghệ màn hình Dynamic AMOLED 2X cho gam màu chính xác chuẩn điện ảnh cho bạn những trải nghiệm những thước phim chân thật trên chính smartphone của mình. Ngoài ra, bằng cách giảm thiểu tối đa ánh sáng xanh gây hại, Dynamic AMOLED 2X còn giúp hạn chế tình trạng mỏi mắt giúp tối ưu trải nghiệm của người dùng.

Màn hình tràn viền tối đa - Samsung Galaxy Note 20 Ultra

Giới hạn khuyết điểm màn hình ở mức tối đa cũng mang đến tỷ lệ hiển thị cao nhất, cao hơn so với những smartphone thiết kế tai thỏ hay giọt nước đã quá phổ biến trên thị trường, máy cũng sở hữu mặt kính cảm ứng Corning Gorilla Glass Victus bền bỉ, chắc chắn với khả năng giảm thiểu trầy xước cao.

Mặt trước vẫn là camera selfie có độ phân giải lên đến 10 MP đặt ở vị trí trung tâm, tuy nhiên nếu để ý kỹ bạn sẽ thấy kích thước nốt ruồi đã được tối giản và trông nhỏ hơn so với phiên bản tiền nhiệm.

Camera selfie 10 MP - Samsung Galaxy Note 20 Ultra
Hiệu năng mạnh mẽ với phần cứng được nâng cấp

Tất nhiên một smartphone với thiết kế đỉnh cao thì sẽ không thiếu đi sức mạnh phần cứng, Galaxy Note 20 Ultra sử dụng con chip Exynos 990 8 nhân mạnh mẽ, đảm nhiệm gần như hoàn hảo mọi tác vụ từ lướt web, xem phim, phát họa hình ảnh hay edit video độ phân giải cao.

Trang bị chipset Exynos 990 | Galaxy Note 20 Ultra

Với bộ nhớ RAM 8 GB, 256 GB ROM thì máy có thể thừa sức đa nhiệm tốt mọi tác vụ và lưu trữ số lượng lớn hình ảnh hay video, tài liệu nặng, với điểm số hiệu năng AnTuTu cao ngất ngưỡng gần 500.000 điểm, Galaxy Note 20 Ultra hoàn toàn thoải mái cân mọi tác vụ.

Với cấu hình mạnh như vậy giúp điện thoại chơi game luôn luôn được ổn định với mức setting cao nhất, đảm bảo mọi trải nghiệm luôn được hoàn hảo.

Điểm số AnTuTu cao ngất ngưỡng - Samsung Galaxy Note 20 Ultra

Cảm biến vân tay siêu âm dưới màn hình được Samsung trang bị trên Galaxy Note 20 Ultra là công nghệ cảm biến vân tay hiện đại có thể thao tác mở khóa nhanh chóng chỉ với 1 lần chạm.

Thiết lập mật khẩu vân tay trên máy - Samsung Galaxy Note 20 Ultra
Bút S Pen mới, được nâng cấp nhiều tính năng

Bút S Pen trên Galaxy Note 20 Ultra có sự thay đổi sang vị trí bên trái thay vì bên phải như trước đây, độ trễ được giảm đi nhiều lần so với phiên bản tiền nhiệm, mang lại trải nghiệm mượt mà hơn. S Pen vẫn có những tính năng như hỗ trợ cử chỉ thông minh từ xa, chuyển chữ viết tay thành văn bản, chụp màn hình nhanh,...

Không những có tính năng hoạt động độc lập như trên Galaxy Note 10, S Pen trên Note 20 Ultra còn được nâng cấp để có thể tương tác thực tế ảo trực tiếp, điều khiển cử chỉ thông minh hơn nhờ vào loạt cảm biến hoàn toàn mới được Samsung áp dụng lên trong năm nay. 

Cận cảnh bút S-Pen - Samsung Galaxy Note 20 Ultra
Camera độc đáo, từ thiết kế đến tính năng

Note 20 Ultra với những nâng cấp về cảm biến ảnh, camera chính có độ phân giải lên đến 108 MP bổ sung lấy nét Laser AF, khắc phục những hạn chế trong lấy nét ở những dòng Note trước. 

Camera chụp ảnh siêu sắc nét - Samsung Galaxy Note 20 Ultra

Camera tele có độ phân giải là 12 MP với khả năng zoom xa tối đa lên đến 50x, camera góc siêu rộng có độ phân giải là 12 MP, đây là một cảm biến cho khả năng chụp những bức ảnh phong cảnh nghệ thuật với góc rộng hơn bao giờ hết. 

Ảnh chụp góc thường 1x trên Galaxy Note 20 Ultra

Ảnh chụp zoom 5x trên Galaxy Note 20 Ultra

Ảnh chụp zoom 10x trên Galaxy Note 20 Ultra

Hơn thế nữa khi giờ đây bạn đã có thể có những thước phim xuất sắc 8K nhờ công nghệ chống rung, lấy nét tự động, quay siêu chậm,... Bên cạnh đó, camera selfie 10 MP cho ra những bức ảnh đẹp lung linh, tự nhiên giúp bạn chia sẽ lên các mạng xã hội hoặc chia sẻ cùng người thân, bạn bè.

Ảnh selfie trên Galaxy Note 20 Ultra

Ảnh selfie trên Galaxy Note 20 Ultra

Pin dung lượng lớn, cho trải nghiệm cả ngày dài

Sở hữu viên pin lớn 4500 mAh, Note 20 Ultra mang lại cho người dùng thời gian dài sử dụng, bên cạnh đó máy còn được hỗ trợ công nghệ sạc nhanh 25w giúp cho thời gian sạc pin được rút ngắn đến mức tối thiểu.

Sở hữu pin lớn, hỗ trợ sạc nhanh - Samsung Galaxy Note 20 Ultra

Với Galaxy Note 20 Ultra, bạn có thể giải quyết các công việc của mình song song với nhu cầu giải trí hàng ngày, với các tính năng được nâng cấp gần như hoàn hảo, chắc chắn sẽ mang lại những trải nghiệm tuyệt vời, sản phẩm thực sự là một sự lựa chọn rất đáng cân nhắc để sở hữu trong năm 2020.
', N'
Dynamic AMOLED 2X 6.9" Quad HD+ (2K+) ', N'Android 10', N'Chính 108 MP & Phụ 12 MP, 12 MP, cảm biến Laser AF', N'10 MP', N'Exynos 990', N'
8 GB ', N'
256 GB ', N' 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM Hỗ trợ 4G ', N' 4500 mAh 25 W ', N'../../assets/images/Phone/Samsung/samsung-galaxy-note-20-ultra.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 14, 1, 8, 0, N'../../assets/images/Phone/Samsung/samsung-galaxy-note-20-ultra1.jpg', CAST(20 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (83, N'Vivo Y72 5G', CAST(7590000 AS Decimal(18, 0)), N'Vivo Y72 5G mẫu smartphone 5G của Vivo, máy sở hữu một màn hình lớn, hiệu năng mạnh mẽ, cụm 3 camera sắc nét và thời lượng pin ấn tượng, máy đáp ứng tốt hầu hết nhu cầu sử dụng mà người dùng cần. Khung viền của Vivo Y72 5G được gia công tỉ mỉ với độ hoàn thiện cao kết hợp với mặt lưng làm từ nhựa cao cấp nên có độ bền và khả năng chịu lực tốt, giúp bảo vệ điện thoại khỏi tác động của ngoại lực trong quá trình sử dụng. ', N' IPS LCD 6.58" Full HD+', N'Android 11', N' Chính 64 MP & Phụ 8 MP, 2 MP ', N' 16 MP ', N' MediaTek Dimensity 700 ', N' 8 GB ', N' 128 GB ', N' 2 Nano SIM (SIM 2 chung khe thẻ nhớ) Hỗ trợ 5G ', N' 5000 mAh 18 W ', N'../../assets/images/Phone/Vivo/Vivo Y72 5G.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 10, 1, 9, 0, N'../../assets/images/Phone/Vivo/Vivo Y72 5G1.jpg', CAST(35 AS Decimal(18, 0)), 0, 2, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (84, N'Xiaomi Redmi Note 10S', CAST(6490000 AS Decimal(18, 0)), N'Bên cạnh Redmi Note 10, Xiaomi còn giới thiệu thêm phiên bản Redmi Note 10S với điểm nhấn chính là cụm camera 64 MP, màn hình AMOLED sắc nét, hiệu năng mạnh mẽ nhưng lại có mức giá rẻ đến bất ngờ. Redmi Note 10S được trang bị bộ bốn camera với camera chính 64 MP khẩu độ f/1.79 cho khả năng lấy nét nhanh giúp ghi lại những khoảnh khắc đáng nhớ xung quanh bất kỳ lúc nào bạn muốn.', N'
AMOLED 6.43" Full HD+ ', N' Android 11 ', N' Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP ', N' 13 MP ', N' MediaTek Helio G95 ', N' 8 GB ', N' 128 GB ', N' 2 Nano SIM Hỗ trợ 4G ', N' 5000 mAh 33 W ', N'../../assets/images/Phone/Xiaomi/Xiaomi Redmi Note 10S.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 9, 1, 10, 0, N'../../assets/images/Phone/Xiaomi/Xiaomi Redmi Note 10S.jpg', CAST(10 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (85, N'Apple Watch S5 LTE 44mm viền thép dây thép bạc', CAST(18990000 AS Decimal(18, 0)), N'Apple Watch S5 LTE 44mm viền thép dây thép bạc có dây đeo dạng lưới đan mỏng, được gia công hoàn toàn từ thép không gỉ, vừa quý phái lại vừa mang cảm mát tay khi mang. Màn hình cảm ứng có mặt kính Saphire cứng cáp giúp bảo vệ chiếc đồng hồ của bạn an toàn trước những va đập không mong muốn. Apple Watch không chỉ là đồng hồ với nhiều tính năng thông minh mà còn là một phụ kiện thời trang cao cấp', N'OLED 1.78inch', N'watchOS 6.0', NULL, NULL, N'Apple S5 64 bit', NULL, N'32 GB', NULL, N'296 mAh', N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 44mm viền thép dây thép.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 15, 4, 6, 0, N'../../assets/images/Smart Watch/Apple/Apple Watch S5 LTE 44mm viền thép dây thép1.jpg', CAST(5 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (86, N'Apple Watch SE 40mm viền nhôm dây cao su', CAST(8001000 AS Decimal(18, 0)), N'Apple Watch SE 40mm viền nhôm dây cao su hồng có khung viền chắc chắn, thiết kế bo tròn 4 góc giúp thao tác vuốt chạm thoải mái hơn. Mặt kính cường lực Ion-X strengthened glass với kích thước 1.57 inch, hiển thị rõ ràng. Khung viền nhôm chắc chắn cùng dây đeo cao su có độ đàn hồi cao, êm ái, tạo cảm giác thoải mái khi đeo.', N'OLED 1.57inch', N'watchOS 7.0', NULL, NULL, N'Apple S5 64 bit', NULL, N'32 GB', NULL, N'Khoảng 1.5 ngày', N'../../assets/images/Smart Watch/Apple/Apple Watch SE 40mm viền nhôm dây cao su.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 15, 4, 6, 0, N'../../assets/images/Smart Watch/Apple/Apple Watch SE 40mm viền nhôm dây cao su1.jpg', CAST(10 AS Decimal(18, 0)), 1, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (87, N'Garmin Fenix 6 Pro Solar dây silicone', CAST(21490000 AS Decimal(18, 0)), N'Đồng hồ thông minh Garmin Fenix 6 Pro Solar trang bị màn hình có độ phân giải 260 x 260 pixels và kích thước 1.3 inch, giúp hình ảnh hiển thị được sắc nét ngay cả khi có ánh nắng mặt trời. Dây đeo silicone cho cảm giác vô cùng mềm mại với cổ tay người đeo, không bị đau khi sử dụng trong khoảng thời gian dài. Mẫu đồng hồ này không có thao tác cảm ứng mà sử dụng 5 phím cứng để điều khiển. Điểm nổi trội nhất ở mẫu đồng hồ này là khả năng sạc pin nhờ vào ánh nắng mặt trời, giúp đồng hồ không bị hết pin nhanh, người dùng không phải mang đi sạc thường xuyên.', N'MIP 1.3inch', N'AndroidiOS', NULL, NULL, NULL, NULL, N'32 GB', N'sim', N'pin', N'../../assets/images/Smart Watch/Garmin/Garmin Fenix 6 Pro Solar dây silicone.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 10, 4, 11, 0, N'../../assets/images/Smart Watch/Garmin/Garmin Fenix 6 Pro Solar dây silicone1.jpg', CAST(10 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (92, N'iPad mini 6 WiFi 256GB', CAST(19990000 AS Decimal(18, 0)), N'iPad mini 6 WiFi 256GB được trình làng với cấu hình mạnh mẽ từ chip Apple A15 Bionic, cho bạn những trải nghiệm tuyệt vời trên màn hình sắc nét vượt trội, Apple Pen thỏa sức sáng tạo, và camera thông minh tuyệt vời không thua kém so với smartphone.', N'8.3" LED-backlit IPS LCD', N'iPadOS 15', N'12 MP', N'12 MP', N'Apple A15 Bionic', NULL, N'256 GB', NULL, N'19.3 Wh', N'../../assets/images/Tablet/Ipad/iPad mini 6 WiFi 256GB.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 24, 3, 6, 0, N'../../assets/images/Tablet/Ipad/iPad mini 6 WiFi 256GB1.jpg', CAST(0 AS Decimal(18, 0)), 1, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (93, N'Samsung Galaxy Tab S7 FE', CAST(10790000 AS Decimal(18, 0)), N'Samsung chính thức trình làng mẫu máy tính bảng có tên Galaxy Tab S7 FE, máy trang bị cấu hình mạnh mẽ, màn hình giải trí siêu lớn và điểm ấn tượng nhất là viên pin siêu khủng được tích hợp bên trong, giúp tăng hiệu suất làm việc nhưng vẫn có tính di động cực cao.', N'12.4" TFT LCD', N'Android 11', N'8 MP', N'5 MP', N'Snapdragon 750G', N'4 GB', N'64 GB', N'1 Nano SIM', N'10090 mAh, 45 W', N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab S7 FE.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 20, 3, 8, 0, N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab S7 FE1.jpg', CAST(22 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (94, N'Samsung Galaxy Tab S6 Lite', CAST(9090000 AS Decimal(18, 0)), N'Sau thành công của Galaxy Tab S6, Samsung tiếp tục chinh phục người dùng với Galaxy Tab S6 Lite có phân khúc giá rẻ hơn. Thiết bị vẫn hỗ trợ bút S Pen thần thánh, thiết kế kim loại cao cấp và màn hình, âm thanh giải trí đỉnh cao.', N'10.4" PLS LCD', N'Android 10', N'8 MP', N'5 MP', N'Exynos 9611', N'4 GB', N'64 GB', N'1 Nano SIM', N'7040 mAh10 W', N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab S6 Lite.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 25, 3, 8, 0, N'../../assets/images/Tablet/Samsung/Samsung Galaxy Tab S6 Lite1.jpg', CAST(9 AS Decimal(18, 0)), 0, 4, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (95, N'Garmin Lily dây silicone trắng', CAST(3992000 AS Decimal(18, 0)), N'Chiếc đồng hồ có thiết kế nhỏ gọn với đường kính mặt chỉ 35 mm và trọng lượng nhẹ 24g. Chất liệu khung viền được làm từ polyme bền chắc chịu sự va chạm tốt. Bên cạnh đó, dây đeo silicone mềm dẻo, êm ái và ôm gọn cổ tay có độ rộng dây thanh mảnh 1.4 cm, độ dài dây 10 cm. Đây là những ưu điểm thiết kế mà chiếc đồng hồ thông minh Lily sở hữu.', N'LCD 1inch', N'AndroidiOS', NULL, NULL, NULL, NULL, NULL, NULL, N'Khoảng 5 ngày', N'../../assets/images/Smart Watch/Garmin/Garmin Lily dây silicone.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 15, 4, 11, 0, N'../../assets/images/Smart Watch/Garmin/Garmin Lily dây silicone1.jpg', CAST(20 AS Decimal(18, 0)), 1, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (96, N'Samsung Galaxy Watch 4 LTE Classic 42mm', CAST(9490000 AS Decimal(18, 0)), N'Samsung Galaxy Watch 4 LTE Classic 42mm sở hữu thiết kế trẻ trung, hiện đại cùng khung viền thép không gỉ sang trọng, cứng cáp, lớp kính cường lực Gorrilla Glass Dx+ bảo vệ an toàn cho đồng hồ trước những va chạm thông thường. Dây đeo silicone mềm nhẹ, đàn hồi tốt, không thấm mồ hôi, cho cảm giác thoải mái khi mang.', N'SUPER AMOLED 1.19inch', N'Android dùng Google Mobile Service', NULL, NULL, N'Exynos W920', NULL, N'16 GB', NULL, N'247 mAh', N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 4 LTE Classic 42mm.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 25, 4, 8, 0, N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch 4 LTE Classic 42mm1.jpg', CAST(0 AS Decimal(18, 0)), 0, 5, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (97, N'Samsung Galaxy Watch Active 2 44mm viền thép dây da', CAST(4990000 AS Decimal(18, 0)), N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 44mm là phiên bản có sự cải tiến về công nghệ để mang đến những trải nghiệm tốt nhất cho người dùng với nhiều tính năng chăm sóc sức khỏe, nhận cuộc gọi trực tiếp cũng như nhiều tính năng tiện ích khác.', N'SUPER AMOLED 1.4inch', N'OS TIZEN', NULL, NULL, N'Exynos 9110', NULL, N'4 GB', NULL, N'340 mAh', N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch Active 2 44mm viền thép dây da.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 20, 4, 8, 0, N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch Active 2 44mm viền thép dây da1.jpg', CAST(50 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (98, N'Samsung Galaxy Watch Active 2 44mm viền thép dây da', CAST(4990000 AS Decimal(18, 0)), N'Đồng hồ thông minh Samsung Galaxy Watch Active 2 44mm là phiên bản có sự cải tiến về công nghệ để mang đến những trải nghiệm tốt nhất cho người dùng với nhiều tính năng chăm sóc sức khỏe, nhận cuộc gọi trực tiếp cũng như nhiều tính năng tiện ích khác.', N'SUPER AMOLED 1.4inch', N'OS TIZEN', NULL, NULL, N'Exynos 9110', NULL, N'4 GB', NULL, N'340 mAh', N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch Active 2 44mm viền thép dây da.jpg', CAST(N'2021-10-18 00:00:00.000' AS DateTime), 20, 4, 8, 0, N'../../assets/images/Smart Watch/Samsung/Samsung Galaxy Watch Active 2 44mm viền thép dây da1.jpg', CAST(50 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/white.png')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [SIM], [Pin], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaLSP], [MaNCC], [DaXoa], [AnhBia1], [KhuyenMai], [GiaSoc], [Sao], [Mau1], [Mau2]) VALUES (101, N'Samsung Galaxy Watch 4 Classic 42mm ', CAST(6792000 AS Decimal(18, 0)), N'<h3>Thiết kế cổ điển, sang trọng</h3>
<p>Đồng hồ Samsung Galaxy Watch 4 Classic 42mm sở hữu khung viền l&agrave;m từ th&eacute;p kh&ocirc;ng gỉ bền chắc v&agrave; được chứng nhận độ bền MIL-STD-810G, cho khả năng chống ăn m&ograve;n tốt hơn trong những điều kiện thời tiết kh&aacute;c nhau. Chiếc đồng hồ điều hướng linh hoạt với v&ograve;ng xoay bezel độc đ&aacute;o tạo n&ecirc;n vẻ đẹp sang trọng vượt thời gian. Samsung đ&atilde; sử dụng phần d&acirc;y đeo silicone mang lại cho bạn cảm gi&aacute;c &ecirc;m &aacute;i, thỏa sức tham gia c&aacute;c hoạt động thể thao như chạy bộ, đạp xe,...</p>
<h3>M&agrave;n h&igrave;nh c&oacute; độ hiển thị sắc n&eacute;t cao</h3>
<p>Chiếc đồng hồ được trang bị mặt k&iacute;nh cường lực Gorilla Glass Dx+ c&oacute; độ cứng cao n&ecirc;n bạn c&oacute; thể an t&acirc;m sử dụng m&agrave; kh&ocirc;ng lo trầy xước. Samsung Galaxy Watch 4 Classic sử dụng tấm nền Super AMOLED đặc trưng của những mẫu đồng hồ Samsung, đem lại những trải nghiệm tuyệt vời về hiển thị. K&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 1.19 inch với độ ph&acirc;n giải 369 x 396 pixels sắc n&eacute;t, c&aacute;c chi tiết nhỏ được t&aacute;i tạo rất tốt c&ugrave;ng d&atilde;y m&agrave;u rộng, n&ecirc;n c&aacute;c m&agrave;u sắc hiển thị rất tươi v&agrave; nịnh mắt.</p>
<h3>Hệ điều h&agrave;nh WearOS (One UI Watch 3.5) lần đầu ti&ecirc;n được ra mắt</h3>
<p>Samsung đ&atilde; hợp t&aacute;c với Google để cho ra mắt hệ điều h&agrave;nh WearOS (One UI Watch 3.5) được tinh chỉnh để th&iacute;ch hợp với hệ sinh th&aacute;i của của h&atilde;ng. Hệ điều h&agrave;nh cho ph&eacute;p bạn tối ưu h&oacute;a sự đồng bộ giữa c&aacute;c thiết bị Samsung với nhau v&agrave; c&agrave;i th&ecirc;m được c&aacute;c ứng dụng b&ecirc;n thứ 3, gi&uacute;p n&acirc;ng cao trải nghiệm người d&ugrave;ng.</p>
<p></p>', N'SUPER AMOLED 1.19 inch', N'One UI Watch', NULL, NULL, N'Exynos W920', NULL, N'16 GB', NULL, N'247 mAh', N'https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1519402397.jpeg', CAST(N'2022-01-12 10:28:28.157' AS DateTime), 50, 4, 8, 0, N'https://cdn.tgdd.vn/Products/Images/7077/248764/samsung-galaxy-watch-4-lte-classic-42mm-den-thumb-1-600x600.jpg', CAST(10 AS Decimal(18, 0)), 0, 3, N'../../assets/images/Colours/black.png', N'../../assets/images/Colours/black.png')
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
INSERT [dbo].[YEUTHICH] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [TinhTrang]) VALUES (2, 49, N'iPhone 12 64GB', CAST(20490000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Iphone/iphone-12-64GB.jpg', N'Còn hàng')
INSERT [dbo].[YEUTHICH] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [TinhTrang]) VALUES (2, 50, N'iPhone 12 Pro 512GB', CAST(35990000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Iphone/iphone-12-pro-512GB.jpg', N'Còn hàng')
INSERT [dbo].[YEUTHICH] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [TinhTrang]) VALUES (2, 51, N'OPPO A74 5G', CAST(7990000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Oppo/OPPO A74 5G.jpg', N'Còn hàng')
INSERT [dbo].[YEUTHICH] ([MaKH], [MaSanPham], [TenSanPham], [GiaBan], [AnhBia], [TinhTrang]) VALUES (6, 50, N'iPhone 12 Pro 512GB', CAST(35990000.0000000000 AS Decimal(18, 10)), N'../../assets/images/Phone/Iphone/iphone-12-pro-512GB.jpg', N'Còn hàng')
ALTER TABLE [dbo].[ADMIN]  WITH CHECK ADD  CONSTRAINT [FK_ADMIN_ROLES] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ROLES] ([RoleID])
GO
ALTER TABLE [dbo].[ADMIN] CHECK CONSTRAINT [FK_ADMIN_ROLES]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_SACH] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_SACH]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GIOHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GIOHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GIOHANG_SANPHAM] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GIOHANG_SANPHAM]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANG_ROLES] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ROLES] ([RoleID])
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK_KHACHHANG_ROLES]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSanPham] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LOAISANPHAM] ([MaLSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_LoaiSanPham]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NhaXB] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_NhaXB]
GO
ALTER TABLE [dbo].[YEUTHICH]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[YEUTHICH]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Dongi__440B1D61] CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Dongi__440B1D61]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Soluo__4316F928] CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Soluo__4316F928]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CK__SANPHAM__Giaban__20C1E124] CHECK  (([Giaban]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CK__SANPHAM__Giaban__20C1E124]
GO
USE [master]
GO
ALTER DATABASE [QLBanDienThoai] SET  READ_WRITE 
GO
