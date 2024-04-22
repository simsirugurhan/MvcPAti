using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Patici.Manager
{
    public class IlanManager
    {
        private static Entities db = new Entities();

        #region Türler

        public static List<HayvanCin> GetCins() => db.HayvanCins.Where(x => !x.Sil).OrderBy(x => x.Ad).ToList();

        #endregion
    }
}