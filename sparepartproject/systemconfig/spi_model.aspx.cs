using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Newtonsoft.Json;
using System.Web.Services;

namespace sparepartproject.systemconfig
{
    public partial class spi_model : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            // Hal pertama kali dibuka, kita load data
            //LoadData(1); // Default to page 1
            //}
        }

        [WebMethod]
        public static object GetModels(int pageNumber, string searchTerm = "")
        {
            int pageSize = 10;  // Jumlah data per halaman

            using (var context = new MyDbContext())
            {
                // Filter berdasarkan searchTerm jika ada
                var query = context.Models.AsQueryable();

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    // Menambahkan pencarian berdasarkan modelName
                    query = query.Where(m => m.ModelName.Contains(searchTerm));
                }

                // Menghitung total data setelah filter pencarian
                int totalRecords = query.Count();

                // Menghitung total halaman
                int totalPages = (int)Math.Ceiling(totalRecords / (double)pageSize);

                // Mengambil data model untuk halaman yang diminta
                var models = query
                             .OrderBy(m => m.Id)  // Urutkan berdasarkan Id
                             .Skip((pageNumber - 1) * pageSize)  // Skip data berdasarkan halaman
                             .Take(pageSize)  // Ambil data sebanyak pageSize
                             .ToList();

                // Mengembalikan data dalam format JSON yang terdiri dari data models dan totalPages
                return new
                {
                    data = models,
                    totalPages = totalPages
                };
            }
        }
    }
}
