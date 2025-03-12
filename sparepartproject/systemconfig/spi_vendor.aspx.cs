using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject.systemconfig
{
    public partial class spi_vendor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetLocations()
        {
            List<string> locations = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Location order by location_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    locations.Add(reader["location_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(locations);
            return jsonResponse;
        }
    }
}