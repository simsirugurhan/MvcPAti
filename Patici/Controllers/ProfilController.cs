using Patici.EDMX;
using Patici.Manager;
using System;
using System.IO;
using System.Linq;
using System.Web;
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
                var kul = ProfilManager.GetKullanici(kullaniciId);
                var model = new KullaniciDetay();
                model.Kullanici = kul;

                ViewBag.Cins = new SelectList(IlanManager.GetCins().ToList(), "Id", "Ad");
                ViewBag.IlanTur = new SelectList(IlanManager.GetIlanTurler().ToList(), "Id", "Ad");
                ViewBag.Tur = new SelectList(IlanManager.GetHayvanTurler().ToList(), "Id", "Ad");
                ViewBag.Yas = new SelectList(IlanManager.GetHayvanYas().ToList(), "Id", "Ad");

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

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");

            if (kulDetay is null)
            {
                var kul = ProfilManager.GetKullanici(kulId);
                return View(kul);
            }

            return View(kulDetay.Kullanici);
        }

        [HttpPost]
        public ActionResult ProfilAyar(Kullanici model, HttpPostedFileBase profilFoto)
        {
            var kullanici = ProfilManager.PostProfil(model);
            var kulDetay = ProfilManager.ProfilGetir(kullanici.Id).Result;

            if (profilFoto != null)
            {
                var fotoformat = Path.GetExtension(profilFoto.FileName);
                var fotoad = Guid.NewGuid() + fotoformat;
                var fotoyol = Path.Combine(Server.MapPath("/Upload/Profil/" + fotoad));
                profilFoto.SaveAs(fotoyol);
                var yol = "/Upload/Profil/" + fotoad;

                ProfilManager.PostProfilFoto(kulDetay.Id, yol);
            }

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");

            return RedirectToAction("Index","Profil");
        }
    }
}