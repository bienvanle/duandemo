using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanhanga.Models;
using System.IO;
using PagedList;

namespace WebBanhanga.Controllers
{
    public class AdminController : Controller
    {
        bdmarketingEntities db = new bdmarketingEntities();
		
        // GET: Admin
		
        [HttpGet]
		
		// load view
		
        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
		
		// Phương thức kiểm tra đăng nhập
		
        public ActionResult login(db_admin avm)
        {
            db_admin ad=db.db_admin.Where(x => x.ad_username == avm.ad_username && x.ad_password == avm.ad_password).SingleOrDefault();
            if (ad != null)
            {

                Session["ad_id"] = ad.ad_id.ToString();
                return RedirectToAction("Create");

            }
            else
            {
                ViewBag.error = "Sai username hoặc Password";

            }
            return View();
        }

		//Kiểm tra dữ liệu đầu vào
        public ActionResult Create()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("login");
            }
            return View();
        }
        [HttpPost]
		
		//Phương thức load sản phẩm mới lên website
		
        public ActionResult Create(db_Category cvm, HttpPostedFileBase imgfile)
        {
            string path = uploadimgfile(imgfile);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Không thể tải ảnh lên....";
            }
            else
            {
                db_Category cat = new db_Category();
                cat.cat_name = cvm.cat_name;
                cat.cat_image = path;
                cat.cat_status = 1;
                cat.cat_fk_ad = Convert.ToInt32(Session["ad_id"].ToString());
                db.db_Category.Add(cat);
                db.SaveChanges();
                return RedirectToAction("Create");
            }
                return View();
        }// kết thúc

		// Hiệu ứng ảnh danh mục xoay
        public ActionResult ViewCategory(int? page)
        {
            int pagesize = 9, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.db_Category.Where(x => x.cat_status == 1).OrderByDescending(x => x.cat_id).ToList();
            IPagedList<db_Category> stu = list.ToPagedList(pageindex, pagesize);

            return View(stu);


        }
		// Phương thức upload ảnh từ thư viện
        public string uploadimgfile(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {

                        path = Path.Combine(Server.MapPath("~/Content/upload"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/Content/upload/" + random + Path.GetFileName(file.FileName);

                        //    ViewBag.Message = "File uploaded successfully";
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Please select a file'); </script>");
                path = "-1";
            }



            return path;
        }

    }
}