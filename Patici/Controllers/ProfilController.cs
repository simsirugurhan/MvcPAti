using Patici.EDMX;
using Patici.Manager;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class ProfilController : Controller
    {
        // GET: Profil
        public ActionResult Index()
        {
            if (Session["KullaniciId"] is null)
            {
                //Giriş Yapmamışsa Giriş Yap Alanına Gönderildi
                return RedirectToAction("Index", "Login");
            }

            Guid kullaniciId = (Guid)Session["KullaniciId"];
            var kulDetay = ProfilManager.ProfilGetir(kullaniciId).Result;

            if (kulDetay is null)
            {
                var model = new KullaniciDetay();

                return View(model);
            }

            ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
            ViewBag.IlanTur = new SelectList(IlanManager.GetIlanTurler().ToList(), "Id", "Ad");
            ViewBag.Tur = new SelectList(IlanManager.GetHayvanTurler().ToList(), "Id", "Ad");
            ViewBag.Yas = new SelectList(IlanManager.GetHayvanYas().ToList(), "Id", "Ad");

            return View(kulDetay);
        }

        public ActionResult ProfilAyar(Guid kulId)
        {
            if (Session["KullaniciId"] is null || kulId.ToString() != Session["KullaniciId"].ToString())
            {
                //Giriş Yapmamışsa veya kullanıcı bilgileri eşleşmiyorsa Giriş Yap Alanına Gönderildi
                return RedirectToAction("Index", "Login");
            }

            var kulDetay = ProfilManager.ProfilGetir(kulId).Result;



            return View();
        }
    }
}