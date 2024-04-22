using Patici.EDMX;
using Patici.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Iletisim()
        {
            var model = new Iletisim();

            return View(model);
        }

        [HttpPost]
        public ActionResult Iletisim(Iletisim iletisim)
        {
            var yanit = IletisimManager.MesajGonder(iletisim).Result;
            ViewBag.Mesaj = !yanit ? "Mesajınız iletilirken bir hata oluştu!" : "Mesajınız başarıyla iletilmiştir.";
            var model = new Iletisim();

            return View(model);
        }
    }
}