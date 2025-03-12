using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;

using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class ajaxcall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetAllEmployee()
        {
            List<employee.EmployeesRecord> employeelist = new List<employee.EmployeesRecord>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    employee.EmployeesRecord employee = new employee.EmployeesRecord();
                    employee.ID = Convert.ToInt32(rdr["ID"]);
                    employee.Name = rdr["Name"].ToString();
                    employee.Position = rdr["Position"].ToString();
                    employee.Office = rdr["Office"].ToString();
                    employee.Age = Convert.ToInt32(rdr["Age"]);
                    employee.Salary = Convert.ToInt32(rdr["Salary"]);

                    employeelist.Add(employee);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(employeelist);
            return json;
        }

        [WebMethod]
        public static string Testing()
        {
            //System.Threading.Thread.Sleep(5000);
            return "asdlasldalsdl";
        }
    }
}