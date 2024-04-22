using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Patici.Manager
{
    public class ProfilManager
    {
        private static Entities db = new Entities();

        public static Task<KullaniciDetay> ProfilGetir(Guid kulId)
        {
            var kulDetay = db.KullaniciDetays.FirstOrDefault(x => x.KulID == kulId && !x.Sil);

            if (kulDetay is null) return Task.FromResult<KullaniciDetay>(null);

            return Task.FromResult<KullaniciDetay>(kulDetay);
        }
    }
}