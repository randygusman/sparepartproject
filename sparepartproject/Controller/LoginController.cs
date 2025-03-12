using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.DirectoryServices;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class LoginController : ApiController
    {
        [HttpPost]
        [Route("api/login")] // Rute API
        public IHttpActionResult LoginUser([FromBody] LoginRequest request)
        {
            string username = request.Username;
            string password = request.Password;

            DirectoryEntry dE = new DirectoryEntry("LDAP://APO.epson.net/dc=APO,dc=epson,dc=net", username, password);
            try
            {
                DirectorySearcher ds = new DirectorySearcher(dE);
                ds.FindOne();

                //// Dapatkan role dan nama dari database
                //var userData = GetUserDataFromDatabase(username);

                //if (userData.Role == "")
                //{
                //    return Ok(new { success = false, message = "User belum di register." });
                //}

                //// Jika login berhasil, kembalikan JSON dengan status success, username, role, dan nama
                //return Ok(new { success = true, username = username, role = userData.Role, name = userData.Name });


                //var userData = GetUserDataFromDatabase(username);

                //if (userData.Role == "")
                //{
                //    return Ok(new { success = false, message = "User belum di register." });
                //}

                // Jika login berhasil, kembalikan JSON dengan status success, username, role, dan nama
                return Ok(new { success = true, username = username});
            }
            catch (Exception ex)
            {
                // Jika login gagal, kembalikan JSON dengan status error dan pesan error
                return Ok(new { success = false, message = "Wrong username or password." });
            }
        }

        // Struktur untuk request
        public class LoginRequest
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }

        private dynamic GetUserDataFromDatabase(string username)
        {
            // Informasi koneksi ke database (ganti dengan yang sesuai)
            string connectionString = "Data Source=172.16.111.174\\SQLEXPRESS;Initial Catalog=dashboard;User ID=sa;Password=Itmaintenance4!;Connection Timeout = 20";

            // Query SQL untuk mendapatkan data pengguna
            string sqlQuery = "SELECT emp_no,emp_name,sparepartRole FROM [dashboard].[dbo].[m_employee_macheng] where emp_no = @Username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        // Tambahkan parameter untuk mencegah SQL injection
                        command.Parameters.AddWithValue("@Username", username.Substring(3,7));

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Ambil data dari reader
                                string role = reader["sparepartRole"].ToString();
                                string name = reader["emp_name"].ToString();

                                // Kembalikan data pengguna
                                return new { Role = role, Name = name };
                            }
                            else
                            {
                                // Jika pengguna tidak ditemukan, kembalikan nilai default atau null
                                return new { Role = "", Name = "" };
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Tangani kesalahan (misalnya, log kesalahan)
                    Console.WriteLine("Error: " + ex.Message);
                    return new { Role = "", Name = "" }; // Atau lempar exception lagi, tergantung kebutuhan
                }
            }
        }
    }
}
