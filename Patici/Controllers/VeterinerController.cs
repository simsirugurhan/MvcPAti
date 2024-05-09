using Patici.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Patici.Controllers
{
    public class VeterinerController : Controller
    {
        // GET: Veteriner
        public ActionResult Index()
        {
            var veterinerler = VeterinerManager.GetVeterinerler();

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");

            return View(veterinerler);
        }

        [HttpPost]
        public ActionResult Index(Guid? SehirID = null)
        {
            var veterinerler = VeterinerManager.GetVeterinerlerFromSearch(SehirID);

            if (veterinerler.Count == 0)
            {
                ViewBag.Mesaj = "Aradığınız kriterlere uygun veteriner bulunamadı!";
            }

            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");

            return View(veterinerler);
        }
    }
}