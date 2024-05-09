using Patici.EDMX;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Patici.Manager
{
    public class VeterinerManager
    {
        private static Entities db = new Entities();

        public static KullaniciDetay GetVeteriner(Guid kulDetayId) => db.KullaniciDetays.FirstOrDefault(x => x.TurID.ToString() == "7f184667-c12f-4733-8156-87c5378f4845" && x.Id == kulDetayId && !x.Sil);

        public static List<KullaniciDetay> GetVeterinerler() => db.KullaniciDetays.Where(x => x.TurID.ToString() == "7f184667-c12f-4733-8156-87c5378f4845" && !x.Sil).ToList();

        public static List<KullaniciDetay> GetVeterinerlerFromSearch(Guid? SehirID = null)
        {
            Guid veterinerTurID = new Guid("7f184667-c12f-4733-8156-87c5378f4845");

            var query = db.KullaniciDetays.Where(x => x.TurID == veterinerTurID && !x.Sil);

            if (SehirID != null)
            {
                query = query.Where(x => x.Kullanici.SehirID == SehirID);
            }

            return query.ToList();
        }
    }
}