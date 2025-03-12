using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;


public class SPI_DatabasePart
{
    public class DatabaseParts
    {
        public string _goodsCode { get; set; }
        public string _goodsName { get; set; }
        public string _model { get; set; }
        public string _rackName { get; set; }
        public int _nowStock { get; set; }
        public int _minStock { get; set; }
        public int _minOrder { get; set; }
        public string _status { get; set; }
        public string _subKeeping { get; set; }
        public string _goodsDesc { get; set; }
        public string _maker { get; set; }
        public string _vendor { get; set; }
        public string _colour { get; set; }

        public string _attcFile_Picture { get; set; }

        public int _loanedQty { get; set; }
    }

    public class DatabasePartsMinimumStock
    {
        public string _goodsCode_minimumStock { get; set; }
        public string _goodsName_minimumStock { get; set; }
        public string _model_minimumStock { get; set; }
        public string _rackName_minimumStock { get; set; }
        public int _minStock_minimumStock { get; set; }
        public int _nowStock_minimumStock { get; set; }
        public int _minOrder_minimumStock { get; set; }
        public string _status_minimumStock { get; set; }

        public string _maker_minimumStock { get; set; }
    }

    public class DatabasePartsZeroStock
    {
        public string _goodsCode_zeroStock { get; set; }
        public string _goodsName_zeroStock { get; set; }
        public string _model_zeroStock { get; set; }
        public string _rackName_zeroStock { get; set; }
        public int _minStock_zeroStock { get; set; }
        public int _nowStock_zeroStock { get; set; }
        public int _minOrder_zeroStock { get; set; }
        public string _status_zeroStock { get; set; }

        public string _maker_zeroStock { get; set; }
    }

    public class getUpdate{
        

    }

    public static DataTable getDatabasePart()
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDatabasePart]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable checkDatabaseExist(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_checkDatabaseExist]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getDatabasePart_goodsCode(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getDatabasePart_goodsCode]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getLastUpdate()
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getLastUpdateDatabaseBy]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
}

public static class uploadSPIDatabasePart
{
    public static DataTable datatableDatabasePart(this ExcelPackage package)
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
            var newRow = table.NewRow(); ;
            foreach (var cell in row)
            {
                newRow[cell.Start.Column - 1] = cell.Text;
            }
            table.Rows.Add(newRow);
        }
        return table;
    }
}

public class Mahasiswa
{
    public string nama { get; set; }
    public string alamat { get; set; }
}

