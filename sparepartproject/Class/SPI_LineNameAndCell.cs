using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class SPI_LineNameAndCell
{
    [WebMethod]
    public List<string> GetCountryNames()//(string term)
    {
        List<string> listCellName = new List<string>();
        string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SPI_getLineNameAndCell", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //SqlParameter parameter = new SqlParameter()
            //{
            //    ParameterName = "@term",
            //    Value = term
            //};
            //cmd.Parameters.Add(parameter);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                listCellName.Add(rdr["lineNameAndCell"].ToString());
            }
            return listCellName;
        }
    }
}
