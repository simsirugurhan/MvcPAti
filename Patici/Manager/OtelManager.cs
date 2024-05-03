using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class OtelManager
    {
        private static Entities db = new Entities();

        #region Fiyat Aralığı

        public static List<FiyatAraligi> GetFiyat() => db.FiyatAraligis.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion

        #region Otel Galeri

        public static List<OtelGaleri> GetOtelGaleri(Guid otelId) => db.OtelGaleris.Where(x => !x.Sil && x.OtelID == otelId).OrderBy(x => x.Sira).ToList();

        #endregion

        #region Otel Tür

        public static string GetOtelTur(Guid otelId)
        {
            var deger = db.OtelTurs
                .Where(x => !x.Sil && x.OtelID == otelId)
                .OrderBy(x => x.HayvanTur.Ad)
                .Select(x => x.HayvanTur.Ad)
                .ToList();

            return string.Join(", ", deger);
        }

        #endregion
    }
}