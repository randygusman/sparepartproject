using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class SPI_OrderPart
{
    public static DataTable getDatabasePart_goodsCode(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getOrderPart_PartDetails]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable SPI_checkGoodsCode_PreOrderPart(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_checkGoodsCode_PreOrderPart]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }


    public static DataTable getPre_OrderPart()
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getPre_OrderPart]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getDailyIssued_Export(string dateFrom, string dateTo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getOrderPart_Export]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@dateto", dateTo);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
}
