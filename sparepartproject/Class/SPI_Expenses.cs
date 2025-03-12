using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class SPI_Expenses
{
    const string connString = "Data Source=172.16.111.174\\SQLEXPRESS; Initial Catalog = sparepartworld; User ID=sa; Pwd=Itmaintenance4!; connection timeout =3;";

    public static void updatePreExpenses(int id)
    {
        string UpdateCommand = "SPI_updatePreExpenses";
        using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
        using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
        {
            sqlRenameCommand.CommandType = CommandType.StoredProcedure;
            sqlRenameCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
            sqlConnectionCmdString.Open();
            sqlRenameCommand.ExecuteNonQuery();
        }
    }

    public class getNewData
    {
        public int _expensesID { get; set; }
        public string _partCode { get; set; }
        public string _descriptionName { get; set; }
        public int _orderQty { get; set; }
        public int _nowStock { get; set; }
        public int _minStock { get; set; }
        public string _ordertoModel { get; set; }
        public string _orderDate { get; set; }

        public string _currency { get; set; }
        public string _maker{ get; set; }

        public string _suppName { get; set; } //vendor
        public string _unit { get; set; }
        public string _PIC { get; set; }
        public string _category { get; set; }

        public string _status { get; set; }
        public decimal _price { get; set; }
        public string _amount { get; set; }
        public decimal _amountUSD { get; set; }

        public string _receivedDate { get; set; }

        public string _receivedQty { get; set; }
        public string _balance { get; set; }
        public int _leadTime { get; set; }

        public string _quotationNo { get; set; }
        public string _PRno { get; set; }
        public string _POno { get; set; }

        public string _PRdate { get; set; }
        public string _POdate { get; set; }

        public string _costCenter { get; set; }

        public string _profitCenter { get; set; }

        public string _purpose { get; set; }

        public string _purposeRemark { get; set; }

        public string _target { get; set; }

        public string _month { get; set; }

        public string _controlDateRemaining { get; set; }

        public string _rangeReceive { get; set; }

        public string _controlMonthly { get; set; }
        public string _statusMonthly { get; set; }
        public int _qty { get; set; }

        //public string _price { get; set; }
    }

    public class getExchangeRate_
    {
        public decimal _SGD { get; set; }
        public decimal _IDR { get; set; }
        public decimal _JPY { get; set; }

        //public string _price { get; set; }
    }


    public class getNewData_QuotNo
    {
        public int _expensesID { get; set; }
        public string _partCode { get; set; }
        public string _descriptionName { get; set; }
        public int _orderQty { get; set; }
        public string _ordertoModel { get; set; }
        public string _orderDate { get; set; }

        public string _currency { get; set; }
        public string _maker { get; set; }

        public string _suppName { get; set; } //vendor
        public string _unit { get; set; }
        public string _quotNo { get; set; }
        //public string _price { get; set; }
    }

    public class getExchageRate22
    {
        public int _expensesID { get; set; }
        public string _partCode { get; set; }
        public string _descriptionName { get; set; }
        public int _orderQty { get; set; }
        public string _ordertoModel { get; set; }
        public string _orderDate { get; set; }

        public string _currency { get; set; }
        public string _maker { get; set; }

        public string _suppName { get; set; } //vendor
        public string _unit { get; set; }
        public string _quotNo { get; set; }
        
        //public string _price { get; set; }
    }

    public static void updateQuotationOK(string id, string quotNumber)
    {
        string UpdateCommand = "SPI_updateExpensesQuotationOK";
        using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
        using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
        {
            sqlRenameCommand.CommandType = CommandType.StoredProcedure;
            sqlRenameCommand.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
            sqlRenameCommand.Parameters.Add("@quotNo", SqlDbType.VarChar).Value = quotNumber;
            sqlConnectionCmdString.Open();
            sqlRenameCommand.ExecuteNonQuery();
        }
    }

    public static void updateExpenses(string id, string currency, string amount, decimal amountUSD, decimal price, string quotNo, string goodsName, string goodsDesc, string maker, string vendor, string unit, int leadTime,int qty, string purpose, string PRno, string POno, string costCenter, string profitCenter)
    {
        string UpdateCommand = "SPI_updateExpenses_";
        using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
        using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
        {
            sqlRenameCommand.CommandType = CommandType.StoredProcedure;
            sqlRenameCommand.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
            sqlRenameCommand.Parameters.Add("@currency", SqlDbType.VarChar).Value = currency;
            sqlRenameCommand.Parameters.Add("@amount", SqlDbType.VarChar).Value = amount;
            sqlRenameCommand.Parameters.Add("@amountUSD", SqlDbType.Decimal).Value = amountUSD;
            sqlRenameCommand.Parameters.Add("@price", SqlDbType.Decimal).Value = price;
            sqlRenameCommand.Parameters.Add("@quotNo", SqlDbType.VarChar).Value = quotNo;
            sqlRenameCommand.Parameters.Add("@goodsName", SqlDbType.VarChar).Value = goodsName;
            sqlRenameCommand.Parameters.Add("@goodsDesc", SqlDbType.VarChar).Value = goodsDesc;
            sqlRenameCommand.Parameters.Add("@maker", SqlDbType.VarChar).Value = maker;
            sqlRenameCommand.Parameters.Add("@vendor", SqlDbType.VarChar).Value = vendor;
            sqlRenameCommand.Parameters.Add("@unit", SqlDbType.VarChar).Value = unit;
            sqlRenameCommand.Parameters.Add("@leadTime", SqlDbType.Int).Value = leadTime;
            sqlRenameCommand.Parameters.Add("@qty", SqlDbType.Int).Value = qty;
            sqlRenameCommand.Parameters.Add("@purpose", SqlDbType.VarChar).Value = purpose;
            sqlRenameCommand.Parameters.Add("@prNo", SqlDbType.VarChar).Value = PRno;
            sqlRenameCommand.Parameters.Add("@poNo", SqlDbType.VarChar).Value = POno;
            sqlRenameCommand.Parameters.Add("@costCenter", SqlDbType.VarChar).Value = costCenter;
            sqlRenameCommand.Parameters.Add("@profitCenter", SqlDbType.VarChar).Value = profitCenter;

            sqlConnectionCmdString.Open();
            sqlRenameCommand.ExecuteNonQuery();
        }
    }


    public static DataTable getExchangeRate()
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_getExchangeRate]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable SPI_checkGoodsCode_PreExpenses(string goodsCode)
    {
        SqlDataAdapter da = new SqlDataAdapter("[SPI_checkGoodsCode_PreExpenses]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@goodsCode", goodsCode);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    

    public class BlogSites
    {
        public decimal _SGD { get; set; }
        public decimal _JPY { get; set; }
        public decimal _IDR { get; set; }
    }
}
