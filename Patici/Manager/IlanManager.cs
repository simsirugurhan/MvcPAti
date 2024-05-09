using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class IlanManager
    {
        private static Entities db = new Entities();

        #region Hayvan

        public static Hayvan PostHayvan(Guid TurID, string HayvanAciklama, string HayvanAd, Guid KulDetayID, bool Tasma, Guid YasID)
        {
            var hayvan = new Hayvan
            {
                Id = Guid.NewGuid(),
                TurID = TurID,
                Aciklama = HayvanAciklama,
                Ad = HayvanAd,
                KulDetayID = KulDetayID,
                Tasma = Tasma,
                Tarih = DateTime.Now,
                YasID = YasID,
                Sil = false
            };
            db.Hayvans.Add(hayvan);
            db.SaveChanges();

            return hayvan;
        }

        #endregion

        #region Hayvan Cinsler

        public static List<HayvanCin> GetCins() => db.HayvanCins.Where(x => !x.Sil).OrderBy(x => x.Ad).ToList();

        #endregion

        #region Hayvan Türler

        public static List<HayvanTur> GetHayvanTurler() => db.HayvanTurs.Where(x => !x.Sil).OrderBy(x => x.Ad).ToList();

        #endregion

        #region Hayvan Galeri 

        public static List<HayvanGaleri> GetHayvanGaleri(Guid hayvanId) => db.HayvanGaleris.Where(x => !x.Sil && x.HayvanID == hayvanId).OrderBy(x => x.Sira).ToList();

        public static List<HayvanGaleri> GetHayvanGaleriFromIlan(Guid ilanId)
        {
            var ilan = db.Ilans.FirstOrDefault(x => x.Id == ilanId && !x.Sil);
            if (ilan == null) return null;

            var galeri = db.HayvanGaleris.Where(x => !x.Sil && x.HayvanID == ilan.HayvanID).OrderBy(x => x.Sira).ToList();

            return galeri;
        }

        public static void PostIlanHayvanGaleri(Guid HayvanID, string Yol, int Sira)
        {
            var hayvanGaleri = new HayvanGaleri
            {
                Id = Guid.NewGuid(),
                HayvanID = HayvanID,
                Foto = Yol,
                Tarih = DateTime.Now,
                Sira = Sira,
                Sil = false
            };

            db.HayvanGaleris.Add(hayvanGaleri);
            db.SaveChanges();
        }

        #endregion

        #region Hayvan Yaş 

        public static List<HayvanYa> GetHayvanYas() => db.HayvanYas.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion

        #region İlanlar 

        public static Ilan GetIlan(Guid ilanId)
        {
            return db.Ilans
         .Include("KullaniciDetay.Kullanici")
         .FirstOrDefault(x => x.Id == ilanId && !x.Sil);
        }

        public static List<Ilan> GetIlanlarFromKulDetay(Guid kulDetayId)
        {
            return db.Ilans
         .Include("KullaniciDetay.Kullanici")
         .Where(x => x.KulDetayID == kulDetayId && !x.Sil)
         .OrderByDescending(x => x.Tarih)
         .ToList();
        }

        public static List<Ilan> GetSahiplendirmeIlanlar()
        {
            Guid id = Guid.Parse("192c5e81-8254-44d3-90c8-152adf501c49");
            return db.Ilans.Where(x => x.TurID == id && !x.Sil && !x.Tamamlandi).OrderByDescending(x => x.Tarih).ToList();
        }

        public static List<Ilan> GetKayipIlanlar()
        {
            Guid id = Guid.Parse("d581ab66-a7e4-4f1d-92f6-73c7c0ffc680");
            return db.Ilans.Where(x => x.TurID == id && !x.Sil && !x.Tamamlandi).OrderByDescending(x => x.Tarih).ToList();
        }

        public static List<Ilan> GetKayipIlanlarFromSearch(Guid? SehirID = null, Guid? CinsID = null)
        {
            Guid id = Guid.Parse("d581ab66-a7e4-4f1d-92f6-73c7c0ffc680");
            var query = db.Ilans.Where(x => x.TurID == id && !x.Sil && !x.Tamamlandi);

            // Şehir ID'sine göre filtreleme
            if (SehirID != null)
            {
                query = query.Where(x => x.KullaniciDetay.Kullanici.SehirID == SehirID);
            }

            // Cins ID'sine göre filtreleme
            if (CinsID != null)
            {
                query = query.Where(x => x.Hayvan.HayvanTur.HayCinsID == CinsID);
            }

            // Sonuçları tarihine göre azalan sırayla sırala
            var kayiplar = query.OrderByDescending(x => x.Tarih).ToList();

            // Eğer kayıplar listesi boş ise, boş bir liste dön
            return kayiplar.Count > 0 ? kayiplar : new List<Ilan>();
        }

        public static List<Ilan> GetSahiplendirmeIlanlarFromSearch(Guid? SehirID = null, Guid? CinsID = null)
        {
            Guid id = Guid.Parse("192c5e81-8254-44d3-90c8-152adf501c49");
            var query = db.Ilans.Where(x => x.TurID == id && !x.Sil && !x.Tamamlandi);

            // Şehir ID'sine göre filtreleme
            if (SehirID != null)
            {
                query = query.Where(x => x.KullaniciDetay.Kullanici.SehirID == SehirID);
            }

            // Cins ID'sine göre filtreleme
            if (CinsID != null)
            {
                query = query.Where(x => x.Hayvan.HayvanTur.HayCinsID == CinsID);
            }

            // Sonuçları tarihine göre azalan sırayla sırala
            var kayiplar = query.OrderByDescending(x => x.Tarih).ToList();

            // Eğer kayıplar listesi boş ise, boş bir liste dön
            return kayiplar.Count > 0 ? kayiplar : new List<Ilan>();
        }

        public static bool IlanSil(Guid ilanId)
        {
            var ilan = GetIlan(ilanId);
            if (ilan == null) return false;

            ilan.Sil = true;
            db.SaveChanges();

            return true;
        }

        public static bool IlanTamamla(Guid ilanId)
        {
            var ilan = GetIlan(ilanId);
            if (ilan == null) return false;

            ilan.Tamamlandi = true;
            db.SaveChanges();

            return true;
        }

        public static Ilan PostIlan(Guid HayvanID, Guid KulDetayID, Guid IlanTur)
        {
            var ilan = new Ilan
            {
                HayvanID = HayvanID,
                KulDetayID = KulDetayID,
                Tamamlandi = false,
                Sil = false,
                Id = Guid.NewGuid(),
                Tarih = DateTime.Now,
                TurID = IlanTur
            };
            db.Ilans.Add(ilan);
            db.SaveChanges();

            return ilan;
        }

        public static Ilan PostIlanAyar(Ilan model, Guid? IlanTur = null, Guid? YasID = null)
        {
            var ilan = db.Ilans.FirstOrDefault(x => x.Id == model.Id && !x.Sil);

            if (ilan == null) return null;

            ilan.Hayvan.Tasma = model.Hayvan.Tasma;

            if (!string.IsNullOrEmpty(model.Hayvan.Ad))
            {
                ilan.Hayvan.Ad = model.Hayvan.Ad;
            }

            if (model.Hayvan.TurID != Guid.Empty)
            {
                ilan.Hayvan.TurID = model.Hayvan.TurID;
            }

            if (model.TurID != Guid.Empty)
            {
                ilan.TurID = model.TurID;
            }

            if (model.Hayvan.YasID != Guid.Empty)
            {
                ilan.Hayvan.YasID = model.Hayvan.YasID;
            }

            if (!string.IsNullOrEmpty(model.Hayvan.Aciklama))
            {
                ilan.Hayvan.Aciklama = model.Hayvan.Aciklama;
            }

            db.SaveChanges();

            return ilan;
        }

        #endregion

        #region İlan Türler

        public static List<IlanTur> GetIlanTurler() => db.IlanTurs.Where(x => !x.Sil).OrderByDescending(x => x.Ad).ToList();

        #endregion
    }
}