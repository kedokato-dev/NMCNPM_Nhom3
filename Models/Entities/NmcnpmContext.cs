using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class NmcnpmContext : DbContext
{
    public NmcnpmContext()
    {
    }

    public NmcnpmContext(DbContextOptions<NmcnpmContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblAccount> TblAccounts { get; set; }

    public virtual DbSet<TblBike> TblBikes { get; set; }

    public virtual DbSet<TblBikeBrand> TblBikeBrands { get; set; }

    public virtual DbSet<TblBikeDetail> TblBikeDetails { get; set; }

    public virtual DbSet<TblBikeType> TblBikeTypes { get; set; }

    public virtual DbSet<TblBill> TblBills { get; set; }

    public virtual DbSet<TblBillDetail> TblBillDetails { get; set; }

    public virtual DbSet<TblCreateBill> TblCreateBills { get; set; }

    public virtual DbSet<TblPermission> TblPermissions { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.

        => optionsBuilder.UseSqlServer("Data Source=.\\SQLEXPRESS;Initial Catalog=NMCNPM;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblAccount>(entity =>
        {
            entity.HasKey(e => e.PkIdUser).HasName("PK__tblAccou__35430B20B843047F");

            entity.ToTable("tblAccount");

            entity.Property(e => e.DDate).HasColumnName("dDate");
            entity.Property(e => e.SAccountName)
                .HasMaxLength(50)
                .HasColumnName("sAccountName");
            entity.Property(e => e.SPassword)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("sPassword");
            entity.Property(e => e.SPhoneNumber)
                .HasMaxLength(11)
                .HasColumnName("sPhoneNumber");
            entity.Property(e => e.SUserIdentification)
                .HasMaxLength(20)
                .HasColumnName("sUserIdentification");

            entity.HasOne(d => d.FkIdPermissionNavigation).WithMany(p => p.TblAccounts)
                .HasForeignKey(d => d.FkIdPermission)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tblAccount_tblPermission");
        });

        modelBuilder.Entity<TblBike>(entity =>
        {
            entity.HasKey(e => e.PkIdBike).HasName("PK__tblBike__BEC4EBB72EA820EF");

            entity.ToTable("tblBike");

            entity.Property(e => e.FDeposit).HasColumnName("fDeposit");
            entity.Property(e => e.FRentalPrice).HasColumnName("fRentalPrice");
            entity.Property(e => e.SCondition)
                .HasMaxLength(10)
                .HasColumnName("sCondition");
            entity.Property(e => e.SImage)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("sImage");
            entity.Property(e => e.SName)
                .HasMaxLength(20)
                .HasColumnName("sName");
            entity.Property(e => e.SStatus)
                .HasMaxLength(50)
                .HasColumnName("sStatus");

            entity.HasOne(d => d.FkIdBikeDetailNavigation).WithMany(p => p.TblBikes)
                .HasForeignKey(d => d.FkIdBikeDetail)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Bike_BikeDetail");
        });

        modelBuilder.Entity<TblBikeBrand>(entity =>
        {
            entity.HasKey(e => e.PkIdBikeBrand).HasName("PK__tblBikeB__02E62FE177056DA6");

            entity.ToTable("tblBikeBrand");

            entity.HasIndex(e => e.SName, "UQ__tblBikeB__79DF595972E72658").IsUnique();

            entity.Property(e => e.SName)
                .HasMaxLength(20)
                .HasColumnName("sName");
        });

        modelBuilder.Entity<TblBikeDetail>(entity =>
        {
            entity.HasKey(e => e.PkIdBikeDetail).HasName("PK__tblBikeD__9596CA937FA59D10");

            entity.ToTable("tblBikeDetail");

            entity.Property(e => e.FWeight)
                .HasColumnType("decimal(5, 2)")
                .HasColumnName("fWeight");
            entity.Property(e => e.SFrameSize)
                .HasMaxLength(50)
                .HasColumnName("sFrameSize");
            entity.Property(e => e.SMaterial)
                .HasMaxLength(100)
                .HasColumnName("sMaterial");

            entity.HasOne(d => d.FkIdBikeBrandNavigation).WithMany(p => p.TblBikeDetails)
                .HasForeignKey(d => d.FkIdBikeBrand)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_BikeDetail_BikeBrand");

            entity.HasOne(d => d.FkIdBikeTypeNavigation).WithMany(p => p.TblBikeDetails)
                .HasForeignKey(d => d.FkIdBikeType)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_BikeDetail_BikeType");
        });

        modelBuilder.Entity<TblBikeType>(entity =>
        {
            entity.HasKey(e => e.PkIdBikeType).HasName("PK__tblBikeT__A92939E0CE0177AB");

            entity.ToTable("tblBikeType");

            entity.HasIndex(e => e.SType, "UQ__tblBikeT__47012A9148DEE03F").IsUnique();

            entity.Property(e => e.SType)
                .HasMaxLength(20)
                .HasColumnName("sType");
        });

        modelBuilder.Entity<TblBill>(entity =>
        {
            entity.HasKey(e => e.PkBillCode).HasName("PK__tblBill__3E89B1B99B453D66");

            entity.ToTable("tblBill");

            entity.Property(e => e.DBeginTime)
                .HasColumnType("datetime")
                .HasColumnName("dBeginTime");
            entity.Property(e => e.DEndTime)
                .HasColumnType("datetime")
                .HasColumnName("dEndTime");
            entity.Property(e => e.FIncidentalCosts).HasColumnName("fIncidentalCosts");
            entity.Property(e => e.IStatus).HasColumnName("iStatus");
        });

        modelBuilder.Entity<TblBillDetail>(entity =>
        {
            entity.HasKey(e => new { e.FkIdBill, e.FkIdBike }).HasName("PK__tblBillD__D21248C9B5F86271");

            entity.ToTable("tblBillDetail");

            entity.HasOne(d => d.FkIdBikeNavigation).WithMany(p => p.TblBillDetails)
                .HasForeignKey(d => d.FkIdBike)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_BillDetail_Bike");

            entity.HasOne(d => d.FkIdBillNavigation).WithMany(p => p.TblBillDetails)
                .HasForeignKey(d => d.FkIdBill)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_BillDetail_Bill");
        });

        modelBuilder.Entity<TblCreateBill>(entity =>
        {
            entity.HasKey(e => new { e.FkIdUser, e.FkBillCode }).HasName("PK_HEHE");

            entity.ToTable("tblCreateBill");


            entity.HasOne(d => d.FkBillCodeNavigation).WithMany(p => p.TblCreateBills)
                .HasForeignKey(d => d.FkBillCode)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_CreateBill_Bill");

            entity.HasOne(d => d.FkIdUserNavigation).WithMany(p => p.TblCreateBills)
                .HasForeignKey(d => d.FkIdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_CreateBill_User");
        });

        modelBuilder.Entity<TblPermission>(entity =>
        {
            entity.HasKey(e => e.PkIdPermission).HasName("PK__tblPermi__DADB9652DD9531A3");

            entity.ToTable("tblPermission");

            entity.Property(e => e.SPermissionn)
                .HasMaxLength(10)
                .HasColumnName("sPermissionn");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
