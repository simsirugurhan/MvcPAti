﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Patici.EDMX
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<FiyatAraligi> FiyatAraligis { get; set; }
        public virtual DbSet<Hayvan> Hayvans { get; set; }
        public virtual DbSet<HayvanCin> HayvanCins { get; set; }
        public virtual DbSet<HayvanCinsiyet> HayvanCinsiyets { get; set; }
        public virtual DbSet<HayvanGaleri> HayvanGaleris { get; set; }
        public virtual DbSet<HayvanTur> HayvanTurs { get; set; }
        public virtual DbSet<HayvanYa> HayvanYas { get; set; }
        public virtual DbSet<Ilan> Ilans { get; set; }
        public virtual DbSet<IlanTur> IlanTurs { get; set; }
        public virtual DbSet<Iletisim> Iletisims { get; set; }
        public virtual DbSet<Kullanici> Kullanicis { get; set; }
        public virtual DbSet<KullaniciDetay> KullaniciDetays { get; set; }
        public virtual DbSet<KullaniciTur> KullaniciTurs { get; set; }
        public virtual DbSet<Otel> Otels { get; set; }
        public virtual DbSet<OtelGaleri> OtelGaleris { get; set; }
        public virtual DbSet<OtelTur> OtelTurs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}
