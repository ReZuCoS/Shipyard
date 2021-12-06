namespace Shipyard.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AccToBoat
    {
        [Key]
        public int ConnectionID { get; set; }

        public int AccessoryID { get; set; }

        public int BoatID { get; set; }

        public virtual Accessory Accessory { get; set; }

        public virtual Boat Boat { get; set; }
    }
}
