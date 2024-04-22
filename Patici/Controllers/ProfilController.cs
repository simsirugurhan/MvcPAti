using Patici.EDMX;
using Patici.Manager;
using System;
using System.Collections.Generic;
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
                var model = new KullaniciDetay();

                return View(model);
            }

            return View(kulDetay);
        }
    }
}