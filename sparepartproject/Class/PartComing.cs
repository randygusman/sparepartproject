using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class PartComing
{

    public static DataTable getPartComing_Export(string dateFrom, string dateTo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getPartComing_ExportExcel]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@from", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@to", dateTo);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
}
