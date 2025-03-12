using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace sparepartproject
{
    public class MyDBContext2 : DbContext
    {
        public DbSet<SPIEmployee> Employees { get; set; }

        // Pastikan menggunakan strategy inisialisasi yang benar agar tidak merubah database
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Bisa menambahkan konfigurasi lain jika perlu
        }

        public MyDBContext2() : base("name=dashboardConnectionStringName")
        {
            // Menonaktifkan otomatis pembuatan atau modifikasi tabel
            Database.SetInitializer<MyDBContext2>(null);
        }
    }
}