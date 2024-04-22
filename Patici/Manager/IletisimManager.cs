using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Patici.Manager
{
    public class IletisimManager
    {
        private static Entities db = new Entities();

        public static Task<bool> MesajGonder(Iletisim iletisim)
        {
            var iltsm = new Iletisim
            {
                Id = Guid.NewGuid(),
                AdSoyad = iletisim.AdSoyad,
                Email = iletisim.Email,
                Tarih = DateTime.Now,
                Mesaj = iletisim.Mesaj,
                Sil = false
            };

            db.Iletisims.Add(iltsm);
            db.SaveChanges();

            if (Guid.Empty == iltsm.Id) return Task.FromResult(false);

            return Task.FromResult(true);
        }

    }
}