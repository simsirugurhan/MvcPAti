using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class IlanManager
    {
        private static Entities db = new Entities();

        #region Türler

        public static List<HayvanCin> GetCins() => db.HayvanCins.Where(x => !x.Sil).OrderBy(x => x.Ad).ToList();

        #endregion

        #region Hayvan Galeri 

        public static List<HayvanGaleri> GetHayvanGaleri(Guid hayvanId) => db.HayvanGaleris.Where(x => !x.Sil && x.HayvanID == hayvanId).OrderBy(x => x.Sira).ToList();

        #endregion
    }
}