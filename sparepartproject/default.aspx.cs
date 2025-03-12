using System;
using System.Configuration;
using System.Data.SqlClient;
using System.DirectoryServices;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace sparepartproject
{
    public partial class _default : System.Web.UI.Page
    {
        //protected bool isPageVisited = false;

        //public string LoginUser(string username, string password)
        //{
        //    DirectoryEntry dE = new DirectoryEntry("LDAP://APO.epson.net/dc=APO,dc=epson,dc=net", txtEmail.Value.ToString(), txtPassword.Value.ToString());
        //    try
        //    {
        //        DirectorySearcher ds = new DirectorySearcher(dE);
        //        ds.FindOne();
        //        Response.Redirect("home.aspx",false);

        //    }
        //    catch (Exception ex)
        //    {
        //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Wrong username or password');", true);
        //        wrong.Style.Add("visibility", "visible");
        //    }
        //    return username;
        //}

        //protected void Unnamed1_Click(object sender, EventArgs e)
        //{
        //    Session["username"] = txtEmail.Value;
        //    Session["password"] = txtPassword.Value;
        //    LoginUser(txtEmail.Value.ToString(), txtPassword.Value.ToString());
        //}

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["isPageVisited"] == null)
        //    {
        //        //now loading for the first time so set the variable
        //        Session["isPageVisited"] = true;
        //    }
        //    else
        //    { isPageVisited = true; }
        //}

        protected bool isPageVisited = false;

        [WebMethod]
        public static string LoginUser(string username, string password)
        {
            DirectoryEntry dE = new DirectoryEntry("LDAP://APO.epson.net/dc=APO,dc=epson,dc=net", username, password);
            try
            {
                DirectorySearcher ds = new DirectorySearcher(dE);
                ds.FindOne();

                // Dapatkan role dan nama dari database
                var userData = GetUserDataFromDatabase(username);

                if (userData.Role == "")
                {
                    return new JavaScriptSerializer().Serialize(new { success = false, message = "User belum di register." });
                }
                // Jika login berhasil, kembalikan JSON dengan status success, username, role, dan nama
                return new JavaScriptSerializer().Serialize(new { success = true, username = username, role = userData.Role, name = userData.Name });
            }
            catch (Exception ex)
            {
                // Jika login gagal, kembalikan JSON dengan status error dan pesan error
                return new JavaScriptSerializer().Serialize(new { success = false, message = "Wrong username or password." });
            }
        }

        // Class untuk menyimpan data pengguna (role dan nama)
        public class UserData
        {
            public string Role { get; set; }
            public string Name { get; set; }
        }

        private static UserData GetUserDataFromDatabase(string username)
        {
            UserData userData = new UserData();
            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionStringName"].ConnectionString;
            string query = "SELECT sparepartRole, emp_name FROM m_employee_macheng WHERE emp_no = @username";

            using (SqlConnection connection = new SqlConnection(CS))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Substring username sebelum digunakan sebagai parameter
                    string empNo = username.Substring(3, 7);
                    command.Parameters.AddWithValue("@username", empNo);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userData.Role = reader["sparepartRole"] != DBNull.Value ? reader["sparepartRole"].ToString() : "";
                            userData.Name = reader["emp_name"] != DBNull.Value ? reader["emp_name"].ToString() : "";
                        }
                        else
                        {
                            // Handle jika data tidak ditemukan untuk username ini
                            userData.Role = "";
                            userData.Name = "";
                        }
                    }
                }
            }

            return userData;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isPageVisited"] == null)
            {
                Session["isPageVisited"] = true;
            }
            else
            {
                isPageVisited = true;
            }
        }
    }
}