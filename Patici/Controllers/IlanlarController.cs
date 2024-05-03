using Patici.Manager;
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
            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View();
        }

        public ActionResult Kayip()
        {
            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View();
        }

        public ActionResult IlanDetay(int ilanId)
        {
            

            return View();
        }
    }
}