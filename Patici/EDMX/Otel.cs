//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Otel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Otel()
        {
            this.OtelGaleris = new HashSet<OtelGaleri>();
            this.OtelTurs = new HashSet<OtelTur>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid KulDetayID { get; set; }
        public bool Yayin { get; set; }
        public bool Sil { get; set; }
    
        public virtual KullaniciDetay KullaniciDetay { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OtelGaleri> OtelGaleris { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OtelTur> OtelTurs { get; set; }
    }
}
