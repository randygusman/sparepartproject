using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class login
{
    public static DataTable getLogin(string apo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getUsername]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("@id", SqlDbType.VarChar).Value = apo;
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getRole(string apo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getUsername_Role]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("@id", SqlDbType.VarChar).Value = apo;
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    

    public static string getnama(string username)
    {
        string a = username.Substring(3, 7);

        DataTable dt = getLogin(a);
        string b = dt.Rows[0][0].ToString();
       
        //username = dt.Columns[0].ToString();
        return b;
    }

    public static string getrolee(string username)
    {
        string a = username.Substring(3, 7);

        DataTable dt = getRole(a);
        string b = dt.Rows[0][0].ToString();

        //username = dt.Columns[0].ToString();
        return b;
    }

}

public class koneksi
{
    public SqlConnection conn;

    public void open_connection()
    {
        try
        {
            conn = new SqlConnection(@"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;uid=sa;password=Itmaintenance4!;");

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {

        }
    }

    public void msgbox()
    {

    }
}