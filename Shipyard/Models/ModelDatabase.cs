using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Shipyard.Models
{
    public partial class ModelDatabase : DbContext
    {
        public ModelDatabase()
            : base("name=ModelDatabase")
        {
        }

        public virtual DbSet<Accessory> Accessories { get; set; }
        public virtual DbSet<AccToBoat> AccToBoats { get; set; }
        public virtual DbSet<Boat> Boats { get; set; }
        public virtual DbSet<Contract> Contracts { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Partner> Partners { get; set; }
        public virtual DbSet<SalesPerson> SalesPersons { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Accessory>()
                .Property(e => e.Price)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.AccToBoats)
                .WithRequired(e => e.Accessory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Accessory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Boat>()
                .Property(e => e.BasePrice)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Boat>()
                .HasMany(e => e.AccToBoats)
                .WithRequired(e => e.Boat)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Contract>()
                .Property(e => e.DepositPayed)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Contract>()
                .Property(e => e.TotalPrice)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Contract>()
                .Property(e => e.TotalPrice_inclVAT)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Contract>()
                .HasMany(e => e.Invoices)
                .WithRequired(e => e.Contract)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.Sum)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.Sum_inclVAT)
                .HasPrecision(15, 2);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Contracts)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Partner>()
                .HasMany(e => e.Accessories)
                .WithRequired(e => e.Partner)
                .HasForeignKey(e => e.ParthnerID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SalesPerson>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.SalesPerson)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserType>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.UserType1)
                .HasForeignKey(e => e.UserType)
                .WillCascadeOnDelete(false);
        }
    }
}
