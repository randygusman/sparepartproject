using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class loanlist_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string ProsesReturn(int id, string goodsCode, int qtyReturned)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            string result = "";

            try
            {
                // Query untuk update status menjadi "RETURNED" dan mengisi tanggal return
                string updateQuery = "UPDATE SPI_SparepartLoan SET status = 'RETURNED', returnedOn = @returnedOn WHERE id = @id AND status = 'LOANED'";

                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@returnedOn", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        // Update qty di tabel sparepart
                        string updateSparepartQuery = "UPDATE SPI_DatabasePart SET nowStock = nowStock + @qtyReturned WHERE goodsCode = @goodsCode";
                        using (SqlConnection sparepartConnection = new SqlConnection(connectionString))
                        using (SqlCommand sparepartCommand = new SqlCommand(updateSparepartQuery, sparepartConnection))
                        {
                            sparepartCommand.Parameters.AddWithValue("@qtyReturned", qtyReturned);
                            sparepartCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
                            sparepartConnection.Open();
                            sparepartCommand.ExecuteNonQuery();
                            sparepartConnection.Close();

                            result = "Sparepart berhasil dikembalikan.";
                        }
                    }
                    else
                    {
                        result = "Tidak ada data loan yang ditemukan untuk ID tersebut.";
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error
                Console.Error.WriteLine(ex.Message);
                result = "Terjadi kesalahan: " + ex.Message;
            }

            return result;
        }


    }
}