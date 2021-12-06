namespace Shipyard.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Contract
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Contract()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int ID { get; set; }

        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        public decimal DepositPayed { get; set; }

        public int OrderID { get; set; }

        public decimal TotalPrice { get; set; }

        public decimal? TotalPrice_inclVAT { get; set; }

        [Required]
        [StringLength(100)]
        public string ProductionProcess { get; set; }

        public virtual Order Order { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
