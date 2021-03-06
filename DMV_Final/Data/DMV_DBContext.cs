// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using DMV_Final.Models;

#nullable disable

namespace DMV_Final.Data
{
    public partial class DMV_DBContext : DbContext
    {
        public DMV_DBContext()
        {
        }

        public DMV_DBContext(DbContextOptions<DMV_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Driver> Drivers { get; set; }
        public virtual DbSet<DriverVehicle> DriverVehicles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vehicle> Vehicles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Driver>(entity =>
            {
                entity.Property(e => e.DriverId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("driverID");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("firstName");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("lastName");

                entity.Property(e => e.SocialSecurity).HasColumnName("socialSecurity");
            });

            modelBuilder.Entity<DriverVehicle>(entity =>
            {
                entity.HasKey(e => new { e.DriverId, e.VehicleId });

                entity.ToTable("driverVehicle");

                entity.Property(e => e.DriverId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("driverID");

                entity.Property(e => e.VehicleId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("vehicleID");

                entity.HasOne(d => d.Driver)
                    .WithMany(p => p.DriverVehicles)
                    .HasForeignKey(d => d.DriverId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_driverVehicle_Drivers");

                entity.HasOne(d => d.Vehicle)
                    .WithMany(p => p.DriverVehicles)
                    .HasForeignKey(d => d.VehicleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_driverVehicle_Vehicles");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("userID");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("firstName");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("lastName");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Position)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("position");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("username");
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.Property(e => e.VehicleId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("vehicleID");

                entity.Property(e => e.Make)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("make");

                entity.Property(e => e.Model)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("model");

                entity.Property(e => e.PlateNumber).HasColumnName("plateNumber");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}