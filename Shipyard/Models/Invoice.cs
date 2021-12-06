namespace Shipyard.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Invoice
    {
        public int ID { get; set; }

        public int ContractID { get; set; }

        public bool Setteled { get; set; }

        public decimal Sum { get; set; }

        public decimal? Sum_inclVAT { get; set; }

        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        public virtual Contract Contract { get; set; }
    }
}
