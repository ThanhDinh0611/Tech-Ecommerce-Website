using BaiCuoiKy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiCuoiKy.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            //Get all blog
            var Blogg = db.BLOGs.Select(bl => new BlogModel
            {
                MaBlog = bl.MaBlog,
                BlogTitle = bl.BlogTitle,
                ContentTitle1 = bl.ContentTitle1,
                ContentTitle2 = bl.ContentTitle2,
                ContentTitle3 = bl.ContentTitle3,
                ContentTitle4 = bl.ContentTitle4,
                ContentTitle5 = bl.ContentTitle5,
                content1 = bl.content1,
                content2 = bl.content2,
                content3 = bl.content3,
                content4 = bl.content4,
                content5 = bl.content5,
                content6 = bl.content6,
                content7 = bl.content7,
                content8 = bl.content8,
                content9 = bl.content9,
                content10 = bl.content10,
                BlogDate = bl.BlogDate,
                Author = bl.Author,
                ImageContent1 = bl.ImageContent1,
                ImageContent2 = bl.ImageContent2,
                ImageContent3 = bl.ImageContent3,
                ImageContent4 = bl.ImageContent4,
                ImageContent5 = bl.ImageContent5,
            });
            //Get all popular Blog
            var popular = db.BLOGs.Where(bl => bl.IsPopular == true);
            //send to ViewBag
            ViewBag.Blog = Blogg;
            ViewBag.popular = popular;

            return View();
        }
        public ActionResult Detail(int id)
        {
            QLBanDienThoaiEntities db = new QLBanDienThoaiEntities();
            //Get blog with specific blog id
            var blogList = db.BLOGs.Select(bl => new BlogModel
            {
                MaBlog = bl.MaBlog,
                BlogTitle = bl.BlogTitle,
                ContentTitle1 = bl.ContentTitle1,
                ContentTitle2 = bl.ContentTitle2,
                ContentTitle3 = bl.ContentTitle3,
                ContentTitle4 = bl.ContentTitle4,
                ContentTitle5 = bl.ContentTitle5,
                content1 = bl.content1,
                content2 = bl.content2,
                content3 = bl.content3,
                content4 = bl.content4,
                content5 = bl.content5,
                content6 = bl.content6,
                content7 = bl.content7,
                content8 = bl.content8,
                content9 = bl.content9,
                content10 = bl.content10,
                BlogDate = bl.BlogDate,
                Author = bl.Author,
                ImageContent1 = bl.ImageContent1,
                ImageContent2 = bl.ImageContent2,
                ImageContent3 = bl.ImageContent3,
                ImageContent4 = bl.ImageContent4,
                ImageContent5 = bl.ImageContent5,
            });
            var blogDetail = blogList.FirstOrDefault(item => item.MaBlog == id);

            //Get next blog with one times increased id
            var nextBlog = db.BLOGs.SingleOrDefault(bl => bl.MaBlog == id + 1);

            //Check if next blog is null or not
            if (nextBlog == null)
            {
                nextBlog = db.BLOGs.SingleOrDefault(bl => bl.MaBlog == id);
                nextBlog.BlogTitle = "";
            }
            //Get next blog with one times decreased id
            var previousBlog = db.BLOGs.SingleOrDefault(bl => bl.MaBlog == id - 1);
            //Check if previous blog is null or not
            if (previousBlog == null)
            {
                previousBlog = db.BLOGs.SingleOrDefault(bl => bl.MaBlog == id);
                previousBlog.BlogTitle = "";
            }
            //Get all popular Blog
            var popular = db.BLOGs.Where(bl => bl.IsPopular == true);
            //Send to ViewBag
            ViewBag.nextBlog = nextBlog;
            ViewBag.previousBlog = previousBlog;
            ViewBag.blogdetail = blogDetail;
            ViewBag.popular = popular;
            return View();
        }
    }
}