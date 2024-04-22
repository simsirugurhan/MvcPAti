using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Patici.Manager
{
    public class LoginManager
    {
        private static Entities db = new Entities();

        public static Task<Kullanici> GirisYap(Kullanici kullanici)
        {
            kullanici.Parola = SifreCrypto.Encrypt(kullanici.Parola);

            var deger = db.Kullanicis.FirstOrDefault(s =>
                s.Email == kullanici.Email && kullanici.Sil != true && s.Parola == kullanici.Parola);

            if (deger == null || deger.Sil == true) return Task.FromResult<Kullanici>(null);

            return Task.FromResult(deger);
        }

        public static Task<Kullanici> Kaydol(Kullanici kullanici)
        {
            var model = db.Kullanicis.FirstOrDefault(x => x.Email == kullanici.Email);
            if (model != null) return Task.FromResult<Kullanici>(null);

            kullanici.Parola = SifreCrypto.Encrypt(kullanici.Parola);
            Kullanici deger = new Kullanici
            {
                Id = Guid.NewGuid(),
                SehirID = kullanici.SehirID,
                AdSoyad = kullanici.AdSoyad,
                Email = kullanici.Email,
                Parola = kullanici.Parola,
                Tarih = DateTime.Now,
                Telefon = kullanici.Telefon,
                Sil = false
            };

            db.Kullanicis.Add(deger);
            db.SaveChanges();

            return Task.FromResult(deger);
        }

        #region Şehirler

        public static List<Sehir> GetSehir() => db.Sehirs.Where(x => !x.Sil).OrderBy(x => x.Plaka).ToList();
        
        #endregion
    }
}