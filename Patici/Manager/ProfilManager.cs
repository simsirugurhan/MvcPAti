using Patici.EDMX;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Patici.Manager
{
    public class ProfilManager
    {
        private static Entities db = new Entities();

        public static Kullanici GetKullanici(Guid kulId) => db.Kullanicis.FirstOrDefault(x => x.Id == kulId && !x.Sil);

        public static Task<KullaniciDetay> ProfilGetir(Guid kulId)
        {
            var kulDetay = db.KullaniciDetays.Include("FiyatAraligi").FirstOrDefault(x => x.KulID == kulId && !x.Sil);

            if (kulDetay is null) return Task.FromResult<KullaniciDetay>(null);

            return Task.FromResult<KullaniciDetay>(kulDetay);
        }

        public static Kullanici PostProfil(Kullanici model)
        {
            var kullanici = db.Kullanicis.FirstOrDefault(x => x.Id == model.Id);
            if (kullanici is null) return null;

            if (model.AdSoyad != null) kullanici.AdSoyad = model.AdSoyad;
            if (model.Email != null) kullanici.Email = model.Email;
            if (model.Parola != null) kullanici.Parola = model.Parola;
            if (model.SehirID != Guid.Empty) kullanici.SehirID = model.SehirID;
            if (model.Telefon != null) kullanici.Telefon = model.Telefon;

            db.SaveChanges();

            return kullanici;
        }

        public static void PostProfilFoto(Guid KulDetayID, string Yol)
        {
            var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.Id == KulDetayID && !x.Sil);
            if (kulDetay is null) return;

            kulDetay.ProfilFoto = Yol;
            db.SaveChanges();
        }
    }
}