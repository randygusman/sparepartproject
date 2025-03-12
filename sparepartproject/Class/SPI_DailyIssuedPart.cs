using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class SPI_DailyIssuedPart
{
    public static DataTable getDailyIssued(/*string from, string to*/)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDailyIssuedPart]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //da.SelectCommand.Parameters.AddWithValue("@tanggal", from);
        //da.SelectCommand.Parameters.AddWithValue("@tanggalto", to);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public class classDailyIssued
    {
        public string _SPI_IDIssued { get; set; }
        public string _goodsCode { get; set; }
        public string _goodsName { get; set; }
        public string _model { get; set; }
        public string _qtyIssued { get; set; }
        public string _issuedByID { get; set; }
        public string _issuedByName { get; set; }
        public string _IssuedDate { get; set; }

        public string _lineName { get; set; }
        public string _cell { get; set; }
        public string _minStock { get; set; }
        public string _nowStock { get; set; }
        public string _reason { get; set; }
        public string _maker { get; set; }
    }

    public static DataTable getDailyIssued_PartDetails(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getIsuuedPart_PartDetails]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getDailyIssued_Export(string dateFrom, string dateTo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDailyIssuedPart_Export]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@dateto", dateTo);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getDailyIssued_ExportSummary(string dateFrom, string dateTo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDailyIssuedPart_ExportSummary]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@dateto", dateTo);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    

    public static DataTable getDailyIssued_ExportTotalCost(string dateFrom, string dateTo)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDailyIssuedPart_ExportTotalCost]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@dateto", dateTo);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable SPI_getTop3Sparepart_GoodsName(string goodsName)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getTop3Sparepart_GoodsName]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsName", goodsName);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable SPI_getTop3Sparepart_GoodsCode(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getTop3Sparepart_GoodsCode]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable SPI_GetIssuedData(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getIsuedPart_DeletePart_PartDetails]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
}

public static class ExcelPackageExtensions
{
    public static DataTable SPI_File_ToDataTable(this ExcelPackage package)
    {
        ExcelPackage.LicenseContext = LicenseContext.Commercial;
        ExcelWorksheet workSheet = package.Workbook.Worksheets.First();
        DataTable table = new DataTable();
        foreach (var firstRowCell in workSheet.Cells[1, 1, 1, workSheet.Dimension.End.Column])
        {
            table.Columns.Add(firstRowCell.Text);
        }
        for (var rowNumber = 2; rowNumber <= workSheet.Dimension.End.Row; rowNumber++)
        {
            var row = workSheet.Cells[rowNumber, 1, rowNumber, workSheet.Dimension.End.Column];
            var newRow = table.NewRow();
            foreach (var cell in row)
            {
                newRow[cell.Start.Column - 1] = cell.Text;
            }
            table.Rows.Add(newRow);
        }
        return table;
    }   
}
