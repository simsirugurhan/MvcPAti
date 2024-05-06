using Patici.EDMX;
using Patici.Manager;
using System;
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
            var sahiplendirme = IlanManager.GetSahiplendirmeIlanlar();

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View(sahiplendirme);
        }

        [HttpPost]
        public ActionResult Sahiplendirme(Guid? SehirID = null, Guid? CinsID = null)
        {
            var ilanlar = IlanManager.GetSahiplendirmeIlanlarFromSearch(SehirID, CinsID);

            if (ilanlar.Count == 0)
            {
                ViewBag.Mesaj = "Aradığınız kriterlerde sahiplendirme ilanı bulunamadı!";
            }

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View(ilanlar);
        }

        public ActionResult Kayip()
        {
            var kayiplar = IlanManager.GetKayipIlanlar();

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View(kayiplar);
        }

        [HttpPost]
        public ActionResult Kayip(Guid? SehirID = null, Guid? CinsID = null)
        {
            var ilanlar = IlanManager.GetKayipIlanlarFromSearch(SehirID, CinsID);

            if (ilanlar.Count == 0)
            {
                ViewBag.Mesaj = "Aradığınız kriterlerde kayıp ilanı bulunamadı!";
            }

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");

            return View(ilanlar);
        }

        public ActionResult IlanDetay(Guid ilanId)
        {
            var ilan = IlanManager.GetIlan(ilanId);

            if (ilan == null) return RedirectToAction("Index", "Home");

            return View(ilan);
        }

        public ActionResult IlanAyar(Guid ilanId)
        {
            var ilan = IlanManager.GetIlan(ilanId);

            if (ilan == null) return RedirectToAction("Index", "Home");

            ViewBag.Tur = new SelectList(IlanManager.GetIlanTurler().ToList(), "Id", "Ad");
            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.HayTur = new SelectList(IlanManager.GetHayvanTurler().ToList(), "Id", "Ad");
            ViewBag.Yas = new SelectList(IlanManager.GetHayvanYas().ToList(), "Id", "Ad");

            return View(ilan);
        }

        [HttpPost]
        public ActionResult IlanAyar(Ilan model, Guid IlanTur, bool Tasma, Guid YasID, HttpPostedFileBase[] IlanFotos )
        {

            return View();
        }
    }
}