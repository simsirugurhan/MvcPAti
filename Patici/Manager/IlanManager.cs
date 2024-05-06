using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class IlanManager
    {
        private static Entities db = new Entities();

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

        #endregion

        #region Hayvan Yaş 

        public static List<HayvanYa> GetHayvanYas() => db.HayvanYas.Where(x => !x.Sil).OrderBy(x => x.Sira).ToList();

        #endregion

        #region İlanlar 

        public static List<Ilan> GetIlan(Guid ilanId) => db.Ilans.Where(x => x.Id == ilanId && !x.Sil).OrderByDescending(x => x.Tarih).ToList();

        public static List<Ilan> GetIlanlarFromKulDetay(Guid kulDetayId) => db.Ilans.Where(x => x.KulDetayID == kulDetayId && !x.Sil).OrderByDescending(x => x.Tarih).ToList();

        public static List<Ilan> GetSahiplendirmeIlanlar() => db.Ilans.Where(x => x.Id.ToString() == "192c5e81-8254-44d3-90c8-152adf501c49" && !x.Sil && !x.Tamamlandi).OrderByDescending(x => x.Tarih).ToList();

        public static List<Ilan> GetKayipIlanlar() => db.Ilans.Where(x => x.Id.ToString() == "d581ab66-a7e4-4f1d-92f6-73c7c0ffc680" && !x.Sil && !x.Tamamlandi).OrderByDescending(x => x.Tarih).ToList();

        public static List<Ilan> GetKayipIlanlarFromSearch(Guid? SehirID = null, Guid? CinsID = null)
        {
            var query = db.Ilans.Where(x => x.Id.ToString() == "d581ab66-a7e4-4f1d-92f6-73c7c0ffc680" && !x.Sil && !x.Tamamlandi);

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
            var query = db.Ilans.Where(x => x.Id.ToString() == "192c5e81-8254-44d3-90c8-152adf501c49" && !x.Sil && !x.Tamamlandi);

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

        #endregion

        #region İlan Türler

        public static List<IlanTur> GetIlanTurler() => db.IlanTurs.Where(x => !x.Sil).OrderByDescending(x => x.Ad).ToList();

        #endregion
    }
}