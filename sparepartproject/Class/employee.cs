using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class employee
{
    public static DataTable getEmployee(string emp_no)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_checkEmployee]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@empNo", emp_no);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public class EmployeesRecord
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Position { get; set; }
        public string Office { get; set; }
        public int Age { get; set; }
        public int Salary { get; set; }
    }
}
