//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DynThings.WebPortal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CssIcon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CssIcon()
        {
            this.Endpoints = new HashSet<Endpoint>();
        }
    
        public long ID { get; set; }
        public string Title { get; set; }
        public string Css { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Endpoint> Endpoints { get; set; }
    }
}
