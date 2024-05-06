using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class OtelManager
    {
        private static Entities db = new Entities();

        #region Otel

        public static List<Otel> GetOteller() => db.Otels.Where(x => !x.Sil && x.Yayin).ToList();

        public static Otel GetOtelFromKulDetay(Guid kulDetayId) => db.Otels.FirstOrDefault(x => x.KulDetayID == kulDetayId && !x.Sil);

        public static List<Otel> GetOtellerFromSearch(Guid? SehirID = null, string girisTarih = null, string cikisTarih = null, Guid? FiyatID = null, Guid? CinsID = null)
        {
            var oteller = db.Otels.Where(x => !x.Sil && x.Yayin).AsQueryable();

            if (SehirID != null)
            {
                oteller = oteller.Where(x => x.KullaniciDetay.Kullanici.SehirID == SehirID);
            }

            if (!string.IsNullOrEmpty(girisTarih) && !string.IsNullOrEmpty(cikisTarih))
            {
                if (DateTime.TryParse(girisTarih, out DateTime girisTarihDt) && DateTime.TryParse(cikisTarih, out DateTime cikisTarihDt))
                {
                    oteller = oteller.Where(x => !db.OtelTarihs.Any(o => o.OtelID == x.Id && o.KapaliTarih.Date >= girisTarihDt.Date && o.KapaliTarih.Date <= cikisTarihDt.Date && !o.Sil));
                }
            }

            if (FiyatID != null)
            {
                oteller = oteller.Where(x => x.KullaniciDetay.FiyatID == FiyatID);
            }

            if (CinsID != null)
            {
                oteller = oteller.Where(x => db.OtelTurs.Any(o => o.OtelID == x.Id && o.HayvanTur.HayCinsID == CinsID));
            }

            var sonucListesi = oteller.ToList();
            return sonucListesi.Any() ? sonucListesi : new List<Otel>();
        }

        #endregion

        #region Fiyat Aralığı

        public static List<FiyatAraligi> GetFiyat() => db.FiyatAraligis.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion

        #region Otel Galeri

        public static List<OtelGaleri> GetOtelGaleri(Guid otelId) => db.OtelGaleris.Where(x => !x.Sil && x.OtelID == otelId).OrderBy(x => x.Sira).ToList();

        public static List<OtelGaleri> GetOtelGaleriFromKulDetay(Guid kulDetayId) => db.OtelGaleris.Where(x => !x.Sil && x.KulDetayID == kulDetayId).OrderBy(x => x.Sira).ToList();

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