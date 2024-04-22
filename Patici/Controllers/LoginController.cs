using Patici.EDMX;
using Patici.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Patici.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            var model = new Kullanici();

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(Kullanici kullanici, bool BeniHatirla = false)
        {
            var yanit = LoginManager.GirisYap(kullanici).Result;

            if (yanit != null)
            {
                ViewBag.KulID = yanit.Id;
                ViewBag.BeniHatirla = BeniHatirla;

                FormsAuthentication.SignOut();
                FormsAuthentication.SetAuthCookie(yanit.Id.ToString(), BeniHatirla);

                return Redirect("/Home/Index");
            }

            ViewBag.Hata = "Kullanıcı adı veya şifre hatalı!";

            return View();
        }

        public ActionResult KayitOl()
        {
            var model = new Kullanici();

            return View(model);
        }

        [HttpPost]
        public ActionResult KayitOl(Kullanici kullanici)
        {
            //var login = new LoginManager();
            var kul = LoginManager.Kaydol(kullanici);

            if (kul != null)
            {
                ViewBag.KulID = kul.Id;
                FormsAuthentication.SignOut();

                //profil sayfasına at
                return Redirect("/Home/Index");
            }

            return View();
        }
    }
}