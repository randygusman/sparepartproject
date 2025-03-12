using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Default.aspx");

            //}
            //else
            //{
            //    string username = Session["username"].ToString();
            //}
        }

        // Ganti dengan koneksi ke database SQL Server Anda
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;


        [WebMethod]
        public static string GetTotalSparepart()
        {
            int totalSparepart = 0;
            string query = "SELECT COUNT(*) FROM SPI_DatabasePart";  // Ganti nama tabel dan field sesuai database Anda

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                connection.Open();
                totalSparepart = (int)cmd.ExecuteScalar();  // Ambil hasil COUNT dari query
            }

            return totalSparepart.ToString();
        }

        [WebMethod]
        public static string GetTotalSparepart_Zero()
        {
            int totalSparepart_zero = 0;
            string query = "SELECT COUNT(*) FROM SPI_DatabasePart where nowStock = 0";  // Ganti nama tabel dan field sesuai database Anda

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                connection.Open();
                totalSparepart_zero = (int)cmd.ExecuteScalar();  // Ambil hasil COUNT dari query
            }

            return totalSparepart_zero.ToString();
        }

        [WebMethod]
        public static string GetZeroStockPercentage()
        {
            double zeroStockPercentage = 0;
            string totalQuery = "SELECT COUNT(*) FROM SPI_DatabasePart";  // Total sparepart
            string zeroStockQuery = "SELECT COUNT(*) FROM SPI_DatabasePart WHERE NowStock = 0";  // Sparepart dengan stok 0

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand totalCmd = new SqlCommand(totalQuery, connection);
                SqlCommand zeroStockCmd = new SqlCommand(zeroStockQuery, connection);
                connection.Open();

                int totalSparepart = (int)totalCmd.ExecuteScalar();  // Total sparepart
                int zeroStockSparepart = (int)zeroStockCmd.ExecuteScalar();  // Sparepart dengan stok 0

                if (totalSparepart > 0)
                {
                    zeroStockPercentage = (double)zeroStockSparepart / totalSparepart * 100;  // Hitung persentase
                }
            }

            return zeroStockPercentage.ToString("0.00");  // Mengembalikan nilai persentase dengan 2 desimal
        }
    }
}