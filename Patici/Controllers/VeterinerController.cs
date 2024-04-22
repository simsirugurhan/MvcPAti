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
            ViewBag.Sehir = new SelectList(LoginManager.GetSehir().ToList(), "Id", "Ad");

            return View();
        }
    }
}