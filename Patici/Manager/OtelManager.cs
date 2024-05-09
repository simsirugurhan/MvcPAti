using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Patici.Manager
{
    public class OtelManager
    {
        private static Entities db = new Entities();

        #region Otel

        public static Otel GetOtel(Guid otelId) => db.Otels.FirstOrDefault(x => x.Id == otelId && !x.Sil);

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
                    oteller = oteller.Where(x => !db.OtelTarihs.Any(o => o.OtelID == x.Id && DbFunctions.TruncateTime(o.KapaliTarih) >= DbFunctions.TruncateTime(girisTarihDt) && DbFunctions.TruncateTime(o.KapaliTarih) <= DbFunctions.TruncateTime(cikisTarihDt) && !o.Sil));
                }
            }

            if (FiyatID != null)
            {
                oteller = oteller.Where(x => x.KullaniciDetay.FiyatID == FiyatID);
            }

            if (CinsID != null)
            {
                oteller = oteller.Where(x => db.OtelTurs.Any(o => o.OtelID == x.Id && o.HayCinsID == CinsID));
            }

            var sonucListesi = oteller.ToList();
            return sonucListesi.Any() ? sonucListesi : new List<Otel>();
        }

        public static Otel PostOtelAyar(Otel model, Guid[] CinsID = null, string[] kapaliGunler = null)
        {
            var otel = db.Otels.FirstOrDefault(x => x.Id == model.Id && !x.Sil);
            if (otel == null) return null;

            otel.Yayin = model.Yayin;
            db.SaveChanges();

            if (!string.IsNullOrEmpty(model.KullaniciDetay.Aciklama))
            {
                var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.Id == otel.KulDetayID);
                kulDetay.Aciklama = model.KullaniciDetay.Aciklama;
                db.SaveChanges();
            }

            if (!string.IsNullOrEmpty(model.KullaniciDetay.Belge))
            {
                var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.Id == otel.KulDetayID);
                kulDetay.Belge = model.KullaniciDetay.Belge;
                db.SaveChanges();
            }

            if (model.KullaniciDetay.FiyatID.HasValue)
            {
                var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.Id == otel.KulDetayID);
                kulDetay.FiyatID = model.KullaniciDetay.FiyatID;
                db.SaveChanges();
            }

            if (!string.IsNullOrEmpty(model.KullaniciDetay.AdSoyad))
            {
                var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.Id == otel.KulDetayID);
                kulDetay.AdSoyad = model.KullaniciDetay.AdSoyad;
                db.SaveChanges();
            }

            if (CinsID != null && CinsID.Length > 0)
            {
                foreach (var c in CinsID)
                {
                    var otelTur = new OtelTur
                    {
                        Id = Guid.NewGuid(),
                        HayCinsID = c,
                        OtelID = otel.Id,
                        Sil = false
                    };
                    db.OtelTurs.Add(otelTur);
                    db.SaveChanges();
                }
            }

            if (kapaliGunler != null && kapaliGunler.Length > 0)
            {
                foreach (var t in kapaliGunler)
                {
                    DateTime tarih;
                    if (DateTime.TryParse(t, out tarih))
                    {
                        var otelTarih = new OtelTarih
                        {
                            Id = Guid.NewGuid(),
                            KapaliTarih = tarih,
                            OtelID = otel.Id,
                            Sil = false
                        };
                        db.OtelTarihs.Add(otelTarih);
                        db.SaveChanges();
                    }
                }
            }

            return otel;
        }

        public static bool OtelSil(Guid otelId)
        {
            var otel = GetOtel(otelId);
            if (otel == null) return false;

            otel.Sil = true;
            db.SaveChanges();

            return true;
        }

        #endregion

        #region Fiyat Aralığı

        public static List<FiyatAraligi> GetFiyat() => db.FiyatAraligis.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion

        #region Otel Galeri

        public static List<OtelGaleri> GetOtelGaleri(Guid otelId) => db.OtelGaleris.Where(x => !x.Sil && x.OtelID == otelId).OrderBy(x => x.Sira).ToList();

        public static List<OtelGaleri> GetOtelGaleriFromKulDetay(Guid kulDetayId) => db.OtelGaleris.Where(x => !x.Sil && x.KulDetayID == kulDetayId).OrderBy(x => x.Sira).ToList();

        public static void PostOtelGaleri(Guid KulDetayID, Guid OtelID, string Yol, int Sira)
        {
            var otelGaleri = new OtelGaleri
            {
                Id = Guid.NewGuid(),
                Foto = Yol,
                KulDetayID = KulDetayID,
                OtelID = OtelID,
                Sira = Sira,
                Sil = false
            };

            db.OtelGaleris.Add(otelGaleri);
            db.SaveChanges();
        }

        #endregion

        #region Otel Tür

        public static string GetOtelTur(Guid otelId)
        {
            var deger = db.OtelTurs
                .Where(x => !x.Sil && x.OtelID == otelId)
                .OrderBy(x => x.HayvanCin.Ad)
                .Select(x => x.HayvanCin.Ad)
                .ToList();

            return string.Join(", ", deger);
        }

        #endregion

        #region Otel Tarihler 

        public static List<string> GetKapaliTarihler(Guid otelId)
        {
            var tarihler = db.OtelTarihs
                             .Where(x => x.OtelID == otelId && x.KapaliTarih >= DateTime.Now)
                             .Select(t => t.KapaliTarih)
                             .ToList();

            return tarihler.Select(t => t.ToString("yyyy-MM-dd")).ToList();
        }


        #endregion
    }
}