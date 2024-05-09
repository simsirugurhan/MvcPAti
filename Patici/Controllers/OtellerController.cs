using Patici.EDMX;
using Patici.Manager;
using System;
using System.IO;
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
            var otel = OtelManager.GetOtel(otelId);

            if (otel == null) return RedirectToAction("Index", "Oteller");

            return View(otel);
        }

        public ActionResult OtelAyar(Guid otelId)
        {
            var otel = OtelManager.GetOtel(otelId);

            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");
            ViewBag.AyrilmisTarihler = OtelManager.GetKapaliTarihler(otelId);

            return View(otel);
        }


        [HttpPost]
        public ActionResult OtelAyar(Otel model, Guid[] CinsID = null, string[] kapaliGunler = null, HttpPostedFileBase belge = null, HttpPostedFileBase[] otelFotos = null)
        {
            if (belge != null)
            {
                var fotoformat = Path.GetExtension(belge.FileName);
                var fotoad = Guid.NewGuid() + fotoformat;
                var fotoyol = Path.Combine(Server.MapPath("/Upload/Belge/" + fotoad));
                belge.SaveAs(fotoyol);
                model.KullaniciDetay.Belge = "/Upload/Belge/" + fotoad;
            }

            if (otelFotos.Length > 0 && otelFotos != null)
            {
                int sira = 1;
                foreach (var f in otelFotos)
                {
                    if(f is null) continue;
                    var fotoformat = Path.GetExtension(f.FileName);
                    var fotoad = Guid.NewGuid() + fotoformat;
                    var fotoyol = Path.Combine(Server.MapPath("/Upload/Oteller/" + fotoad));
                    f.SaveAs(fotoyol);
                    var yol = "/Upload/Oteller/" + fotoad;

                    OtelManager.PostOtelGaleri(model.KulDetayID, model.Id, yol, sira);
                    sira++;
                }
            }

            var result = OtelManager.PostOtelAyar(model, CinsID, kapaliGunler);

            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.Fiyat = new SelectList(OtelManager.GetFiyat().ToList(), "Id", "Ad");

            return View(result);
        }

        public bool OtelSil(Guid otelId) => OtelManager.OtelSil(otelId);
    }
}