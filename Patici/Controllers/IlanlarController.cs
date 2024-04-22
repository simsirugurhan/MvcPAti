using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class IlanlarController : Controller
    {
        // GET: Ilanlar
        public ActionResult Index()
        {
            return RedirectToAction("Sahiplendirme");
        }

        public ActionResult Sahiplendirme()
        {
            return View();
        }

        public ActionResult Kayip()
        {
            return View();
        }
    }
}