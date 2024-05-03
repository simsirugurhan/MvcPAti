using Patici.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class OtellerController : Controller
    {
        // GET: Oteller
        public ActionResult Index()
        {
            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");

            return View();
        }

        public ActionResult OtelDetay(Guid otelId)
        {
            return View();
        }
    }
}