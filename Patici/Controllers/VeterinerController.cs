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
            return View();
        }
        
        public ActionResult Detay(int veterinerId)
        {
            //id gore getir
            return View();
        }
    }
}