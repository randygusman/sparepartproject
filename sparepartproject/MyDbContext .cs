using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Microsoft.Graph.Models;
using sparepartproject.Model;

namespace sparepartproject
{
    public class MyDbContext : DbContext
    {
        public DbSet<sparepartproject.Model.Model> Models { get; set; }
        public DbSet<Sparepart> Spareparts { get; set; }
        public DbSet<Vendor> Vendors { get; set; }
        public DbSet<Maker> Makers { get; set; }
        public DbSet<Unit> Units { get; set; }
        public DbSet<Line> Lines { get; set; }
        public DbSet<Keeping> Keepings { get; set; }
        public DbSet<Subkeeping> Subkeepings { get; set; }
        public DbSet<Cell> Cells { get; set; }
        public DbSet<DailyIssued> DailyIssueds { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
        public DbSet<Loan> Loans { get; set; }

        // Pastikan menggunakan strategy inisialisasi yang benar agar tidak merubah database
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Bisa menambahkan konfigurasi lain jika perlu
        }

        public MyDbContext() : base("name=dashboardConnectionString")
        {
            // Menonaktifkan otomatis pembuatan atau modifikasi tabel
            Database.SetInitializer<MyDbContext>(null);
        }
    }
}