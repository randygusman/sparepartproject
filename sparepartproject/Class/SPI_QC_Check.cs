using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class SPI_QC_Check
{
    const string connString = "Data Source=172.16.111.174\\SQLEXPRESS; Initial Catalog = sparepartworld; User ID=sa; Pwd=Itmaintenance4!; connection timeout =3;";

    public static DataTable getQC_Check_Export(string dateFrom)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getQC_Check_Export]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static void updateApprove(int id)
    {
        string UpdateCommand = "SPI_updateNewQC_CheckReminder";
        using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
        using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
        {
            sqlRenameCommand.CommandType = CommandType.StoredProcedure;
            sqlRenameCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
            sqlConnectionCmdString.Open();
            sqlRenameCommand.ExecuteNonQuery();
        }
    }

    
    public static void updateReturn(int id)
    {
        string UpdateCommand = "SPI_rejectNewQC_CheckReminder";
        using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
        using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
        {
            sqlRenameCommand.CommandType = CommandType.StoredProcedure;
            sqlRenameCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
            sqlConnectionCmdString.Open();
            sqlRenameCommand.ExecuteNonQuery();
        }
    }
}
