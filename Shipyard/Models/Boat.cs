namespace Shipyard.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Boat
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Boat()
        {
            AccToBoats = new HashSet<AccToBoat>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Model { get; set; }

        [Required]
        [StringLength(50)]
        public string BoatType { get; set; }

        public int NumberOfRowers { get; set; }

        public bool Mast { get; set; }

        [Required]
        [StringLength(50)]
        public string Colour { get; set; }

        [Required]
        [StringLength(50)]
        public string Wood { get; set; }

        public decimal BasePrice { get; set; }

        public int VAT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AccToBoat> AccToBoats { get; set; }
    }
}
