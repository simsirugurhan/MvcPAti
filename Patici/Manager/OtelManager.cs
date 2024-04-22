using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Patici.Manager
{
    public class OtelManager
    {
        private static Entities db = new Entities();

        #region Fiyat Aralığı

        public static List<FiyatAraligi> GetFiyat() => db.FiyatAraligis.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion
    }
}