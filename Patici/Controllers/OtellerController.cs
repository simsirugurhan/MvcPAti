using Patici.EDMX;
using Patici.Manager;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class OtellerController : Controller
    {
        // GET: Oteller
        public ActionResult Index()
        {
            var oteller = OtelManager.GetOteller();

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");

            return View(oteller);
        }

        [HttpPost]
        public ActionResult Index(Guid? SehirID = null, string girisTarih = null, string cikisTarih = null, Guid? FiyatID = null, Guid? CinsID = null)
        {
            var oteller = OtelManager.GetOtellerFromSearch(SehirID, girisTarih, cikisTarih, FiyatID, CinsID);

            if (oteller.Count == 0)
            {
                ViewBag.Mesaj = "Aradığınız kriterlerde otel bulunamadı!";
            }

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");

            return View(oteller);
        }

        public ActionResult OtelDetay(Guid otelId)
        {
            return View();
        }

        public ActionResult OtelAyar(Guid otelId)
        {
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");

            return View();
        }
    }
}