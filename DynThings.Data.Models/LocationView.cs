//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DynThings.Data.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LocationView
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LocationView()
        {
            this.LinkLocationsLocationViews = new HashSet<LinkLocationsLocationView>();
        }
    
        public long ID { get; set; }
        public string Title { get; set; }
        public bool IsActive { get; set; }
        public string OwnerID { get; set; }
        public long LocationViewTypeID { get; set; }
        public string X { get; set; }
        public string Y { get; set; }
        public string Z { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LinkLocationsLocationView> LinkLocationsLocationViews { get; set; }
        public virtual LocationViewType LocationViewType { get; set; }
    }
}