using Microsoft.Graph.Models;
using Newtonsoft.Json;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class expenseslist : System.Web.UI.Page
    {
        string getUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static string getAllNewExpenses()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData> expenseslist = new List<SPI_Expenses.getNewData>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getNewData exp = new SPI_Expenses.getNewData();
                    exp._expensesID = Convert.ToInt32(rdr["ID"]);
                    exp._partCode = rdr["goodsName"].ToString();
                    exp._descriptionName = rdr["goodsDesc"].ToString();
                    exp._orderQty = Convert.ToInt32(rdr["qtyOrder"]);
                    //exp._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    //exp._minStock = Convert.ToInt32(rdr["minStock"]);
                    if (rdr.IsDBNull(rdr.GetOrdinal("leadTime")))
                        exp._leadTime = 0;
                    else
                        exp._leadTime = Convert.ToInt32(rdr["leadTime"]);
                    exp._ordertoModel = rdr["ordertoModel"].ToString();
                    exp._orderDate = rdr["insertDate"].ToString();
                    //exp._currency = rdr["currency"].ToString();
                    exp._maker = rdr["maker"].ToString();
                    exp._suppName = rdr["VENDOR"].ToString();
                    exp._unit = rdr["unit"].ToString();
                    exp._PIC = rdr["PIC"].ToString();
                    exp._category = rdr["category"].ToString();
                    exp._currency = rdr["currency"].ToString();
                    if (rdr.IsDBNull(rdr.GetOrdinal("amount")))
                        exp._amount = "";
                    else
                        exp._amount = rdr["amount"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("amountUSD")))
                        exp._amountUSD = 0;
                    else
                        exp._amountUSD = Convert.ToDecimal(rdr["amountUSD"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("price")))
                        exp._price = 0;
                    else
                        exp._price = Convert.ToDecimal(rdr["price"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedDate")))
                        exp._receivedDate = "";
                    else
                        exp._receivedDate = rdr["receivedDate"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedQty")))
                        exp._receivedQty = "";
                    else
                        exp._receivedQty = rdr["receivedQty"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("balance")))
                        exp._balance = "";
                    else
                        exp._balance = rdr["balance"].ToString();


                    exp._quotationNo = rdr["quotationNo"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PRno")))
                        exp._PRno = "";
                    else
                        exp._PRno = rdr["PRno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("POno")))
                        exp._POno = "";
                    else
                        exp._POno = rdr["POno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("prDate")))
                        exp._PRdate = "";
                    else
                        exp._PRdate = rdr["prDate"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("poDate")))
                        exp._POdate = "";
                    else
                        exp._POdate = rdr["poDate"].ToString();


                    if (rdr.IsDBNull(rdr.GetOrdinal("costCenter")))
                        exp._costCenter = "";
                    else
                        exp._costCenter = rdr["costCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("profitCenter")))
                        exp._profitCenter = "";
                    else
                        exp._profitCenter = rdr["profitCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("category")))
                        exp._category = "";
                    else
                        exp._category = rdr["category"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("status")))
                        exp._status = "";
                    else
                        exp._status = rdr["status"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PIC")))
                        exp._PIC = "";
                    else
                        exp._PIC = rdr["PIC"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purpose")))
                        exp._purpose = "";
                    else
                        exp._purpose = rdr["purpose"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purposeRemark")))
                        exp._purposeRemark = "";
                    else
                        exp._purposeRemark = rdr["purposeRemark"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("target")))
                        exp._target = "";
                    else
                        exp._target = rdr["target"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("month")))
                        exp._month = "";
                    else
                        exp._month = rdr["month"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlDateRemaining")))
                        exp._controlDateRemaining = "";
                    else
                        exp._controlDateRemaining = rdr["controlDateRemaining"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("rangeReceive")))
                        exp._rangeReceive = "";
                    else
                        exp._rangeReceive = rdr["rangeReceive"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlMonthly")))
                        exp._controlMonthly = "";
                    else
                        exp._controlMonthly = rdr["controlMonthly"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("statusMonthly")))
                        exp._statusMonthly = "";
                    else
                        exp._statusMonthly = rdr["statusMonthly"].ToString();

                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }


        [WebMethod]
        public static string getAllNewExpenses_Oversea()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData> expenseslist = new List<SPI_Expenses.getNewData>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_Oversea", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getNewData exp = new SPI_Expenses.getNewData();
                    exp._expensesID = Convert.ToInt32(rdr["ID"]);
                    exp._partCode = rdr["goodsName"].ToString();
                    exp._descriptionName = rdr["goodsDesc"].ToString();
                    exp._orderQty = Convert.ToInt32(rdr["qtyOrder"]);
                    //exp._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    //exp._minStock = Convert.ToInt32(rdr["minStock"]);
                    if (rdr.IsDBNull(rdr.GetOrdinal("leadTime")))
                        exp._leadTime = 0;
                    else
                        exp._leadTime = Convert.ToInt32(rdr["leadTime"]);
                    exp._ordertoModel = rdr["ordertoModel"].ToString();
                    exp._orderDate = rdr["insertDate"].ToString();
                    //exp._currency = rdr["currency"].ToString();
                    exp._maker = rdr["maker"].ToString();
                    exp._suppName = rdr["VENDOR"].ToString();
                    //exp._unit = rdr["goodsUnit"].ToString();
                    exp._PIC = rdr["PIC"].ToString();
                    exp._category = rdr["category"].ToString();
                    exp._currency = rdr["currency"].ToString();
                    if (rdr.IsDBNull(rdr.GetOrdinal("amount")))
                        exp._amount = "";
                    else
                        exp._amount = rdr["amount"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("amountUSD")))
                        exp._amountUSD = 0;
                    else
                        exp._amountUSD = Convert.ToDecimal(rdr["amountUSD"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("price")))
                        exp._price = 0;
                    else
                        exp._price = Convert.ToDecimal(rdr["price"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedDate")))
                        exp._receivedDate = "";
                    else
                        exp._receivedDate = rdr["receivedDate"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedQty")))
                        exp._receivedQty = "";
                    else
                        exp._receivedQty = rdr["receivedQty"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("balance")))
                        exp._balance = "";
                    else
                        exp._balance = rdr["balance"].ToString();


                    exp._quotationNo = rdr["quotationNo"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PRno")))
                        exp._PRno = "";
                    else
                        exp._PRno = rdr["PRno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("POno")))
                        exp._POno = "";
                    else
                        exp._POno = rdr["POno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("prDate")))
                        exp._PRdate = "";
                    else
                        exp._PRdate = rdr["prDate"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("poDate")))
                        exp._POdate = "";
                    else
                        exp._POdate = rdr["poDate"].ToString();


                    if (rdr.IsDBNull(rdr.GetOrdinal("costCenter")))
                        exp._costCenter = "";
                    else
                        exp._costCenter = rdr["costCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("profitCenter")))
                        exp._profitCenter = "";
                    else
                        exp._profitCenter = rdr["profitCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("category")))
                        exp._category = "";
                    else
                        exp._category = rdr["category"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("status")))
                        exp._status = "";
                    else
                        exp._status = rdr["status"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PIC")))
                        exp._PIC = "";
                    else
                        exp._PIC = rdr["PIC"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purpose")))
                        exp._purpose = "";
                    else
                        exp._purpose = rdr["purpose"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purposeRemark")))
                        exp._purposeRemark = "";
                    else
                        exp._purposeRemark = rdr["purposeRemark"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("target")))
                        exp._target = "";
                    else
                        exp._target = rdr["target"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("month")))
                        exp._month = "";
                    else
                        exp._month = rdr["month"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlDateRemaining")))
                        exp._controlDateRemaining = "";
                    else
                        exp._controlDateRemaining = rdr["controlDateRemaining"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("rangeReceive")))
                        exp._rangeReceive = "";
                    else
                        exp._rangeReceive = rdr["rangeReceive"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlMonthly")))
                        exp._controlMonthly = "";
                    else
                        exp._controlMonthly = rdr["controlMonthly"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("statusMonthly")))
                        exp._statusMonthly = "";
                    else
                        exp._statusMonthly = rdr["statusMonthly"].ToString();


                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }

        [WebMethod]
        public static string getAllNewExpenses_Cancel()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData> expenseslist = new List<SPI_Expenses.getNewData>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_CancelData", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getNewData exp = new SPI_Expenses.getNewData();
                    exp._expensesID = Convert.ToInt32(rdr["ID"]);
                    exp._partCode = rdr["goodsName"].ToString();
                    exp._descriptionName = rdr["goodsDesc"].ToString();
                    exp._orderQty = Convert.ToInt32(rdr["qtyOrder"]);
                    exp._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    exp._minStock = Convert.ToInt32(rdr["minStock"]);
                    exp._ordertoModel = rdr["ordertoModel"].ToString();
                    exp._orderDate = rdr["insertDate"].ToString();
                    //exp._currency = rdr["currency"].ToString();
                    exp._maker = rdr["maker"].ToString();
                    exp._suppName = rdr["VENDOR"].ToString();
                    exp._unit = rdr["goodsUnit"].ToString();
                    exp._PIC = rdr["PIC"].ToString();
                    exp._category = rdr["category"].ToString();
                    exp._currency = rdr["currency"].ToString();
                    if (rdr.IsDBNull(rdr.GetOrdinal("amount")))
                        exp._amount = "";
                    else
                        exp._amount = rdr["amount"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("amountUSD")))
                        exp._amountUSD = 0;
                    else
                        exp._amountUSD = Convert.ToDecimal(rdr["amountUSD"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("price")))
                        exp._price = 0;
                    else
                        exp._price = Convert.ToDecimal(rdr["price"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedDate")))
                        exp._receivedDate = "";
                    else
                        exp._receivedDate = rdr["receivedDate"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedQty")))
                        exp._receivedQty = "";
                    else
                        exp._receivedQty = rdr["receivedQty"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("balance")))
                        exp._balance = "";
                    else
                        exp._balance = rdr["balance"].ToString();


                    exp._quotationNo = rdr["quotationNo"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PRno")))
                        exp._PRno = "";
                    else
                        exp._PRno = rdr["PRno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("POno")))
                        exp._POno = "";
                    else
                        exp._POno = rdr["POno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("prDate")))
                        exp._PRdate = "";
                    else
                        exp._PRdate = rdr["prDate"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("poDate")))
                        exp._POdate = "";
                    else
                        exp._POdate = rdr["poDate"].ToString();


                    if (rdr.IsDBNull(rdr.GetOrdinal("costCenter")))
                        exp._costCenter = "";
                    else
                        exp._costCenter = rdr["costCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("profitCenter")))
                        exp._profitCenter = "";
                    else
                        exp._profitCenter = rdr["profitCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("category")))
                        exp._category = "";
                    else
                        exp._category = rdr["category"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("status")))
                        exp._status = "";
                    else
                        exp._status = rdr["status"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PIC")))
                        exp._PIC = "";
                    else
                        exp._PIC = rdr["PIC"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purpose")))
                        exp._purpose = "";
                    else
                        exp._purpose = rdr["purpose"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purposeRemark")))
                        exp._purposeRemark = "";
                    else
                        exp._purposeRemark = rdr["purposeRemark"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("target")))
                        exp._target = "";
                    else
                        exp._target = rdr["target"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("month")))
                        exp._month = "";
                    else
                        exp._month = rdr["month"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlDateRemaining")))
                        exp._controlDateRemaining = "";
                    else
                        exp._controlDateRemaining = rdr["controlDateRemaining"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("rangeReceive")))
                        exp._rangeReceive = "";
                    else
                        exp._rangeReceive = rdr["rangeReceive"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlMonthly")))
                        exp._controlMonthly = "";
                    else
                        exp._controlMonthly = rdr["controlMonthly"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("statusMonthly")))
                        exp._statusMonthly = "";
                    else
                        exp._statusMonthly = rdr["statusMonthly"].ToString();

                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }

        [WebMethod]
        public static string getAllNewExpenses_Coming()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData> expenseslist = new List<SPI_Expenses.getNewData>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_Coming", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getNewData exp = new SPI_Expenses.getNewData();
                    exp._expensesID = Convert.ToInt32(rdr["ID"]);
                    exp._partCode = rdr["goodsName"].ToString();
                    exp._descriptionName = rdr["goodsDesc"].ToString();
                    exp._orderQty = Convert.ToInt32(rdr["qtyOrder"]);
                    //exp._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    //exp._minStock = Convert.ToInt32(rdr["minStock"]);
                    if (rdr.IsDBNull(rdr.GetOrdinal("leadTime")))
                        exp._leadTime = 0;
                    else
                        exp._leadTime = Convert.ToInt32(rdr["leadTime"]);
                    exp._ordertoModel = rdr["ordertoModel"].ToString();
                    exp._orderDate = rdr["insertDate"].ToString();
                    //exp._currency = rdr["currency"].ToString();
                    exp._maker = rdr["maker"].ToString();
                    exp._suppName = rdr["VENDOR"].ToString();
                    //exp._unit = rdr["goodsUnit"].ToString();
                    exp._PIC = rdr["PIC"].ToString();
                    exp._category = rdr["category"].ToString();
                    exp._currency = rdr["currency"].ToString();
                    if (rdr.IsDBNull(rdr.GetOrdinal("amount")))
                        exp._amount = "";
                    else
                        exp._amount = rdr["amount"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("amountUSD")))
                        exp._amountUSD = 0;
                    else
                        exp._amountUSD = Convert.ToDecimal(rdr["amountUSD"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("price")))
                        exp._price = 0;
                    else
                        exp._price = Convert.ToDecimal(rdr["price"]); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedDate")))
                        exp._receivedDate = "";
                    else
                        exp._receivedDate = rdr["receivedDate"].ToString(); ;

                    if (rdr.IsDBNull(rdr.GetOrdinal("receivedQty")))
                        exp._receivedQty = "";
                    else
                        exp._receivedQty = rdr["receivedQty"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("balance")))
                        exp._balance = "";
                    else
                        exp._balance = rdr["balance"].ToString();


                    exp._quotationNo = rdr["quotationNo"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PRno")))
                        exp._PRno = "";
                    else
                        exp._PRno = rdr["PRno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("POno")))
                        exp._POno = "";
                    else
                        exp._POno = rdr["POno"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("prDate")))
                        exp._PRdate = "";
                    else
                        exp._PRdate = rdr["prDate"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("poDate")))
                        exp._POdate = "";
                    else
                        exp._POdate = rdr["poDate"].ToString();


                    if (rdr.IsDBNull(rdr.GetOrdinal("costCenter")))
                        exp._costCenter = "";
                    else
                        exp._costCenter = rdr["costCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("profitCenter")))
                        exp._profitCenter = "";
                    else
                        exp._profitCenter = rdr["profitCenter"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("category")))
                        exp._category = "";
                    else
                        exp._category = rdr["category"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("status")))
                        exp._status = "";
                    else
                        exp._status = rdr["status"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("PIC")))
                        exp._PIC = "";
                    else
                        exp._PIC = rdr["PIC"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purpose")))
                        exp._purpose = "";
                    else
                        exp._purpose = rdr["purpose"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("purposeRemark")))
                        exp._purposeRemark = "";
                    else
                        exp._purposeRemark = rdr["purposeRemark"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("target")))
                        exp._target = "";
                    else
                        exp._target = rdr["target"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("month")))
                        exp._month = "";
                    else
                        exp._month = rdr["month"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlDateRemaining")))
                        exp._controlDateRemaining = "";
                    else
                        exp._controlDateRemaining = rdr["controlDateRemaining"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("rangeReceive")))
                        exp._rangeReceive = "";
                    else
                        exp._rangeReceive = rdr["rangeReceive"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("controlMonthly")))
                        exp._controlMonthly = "";
                    else
                        exp._controlMonthly = rdr["controlMonthly"].ToString();

                    if (rdr.IsDBNull(rdr.GetOrdinal("statusMonthly")))
                        exp._statusMonthly = "";
                    else
                        exp._statusMonthly = rdr["statusMonthly"].ToString();


                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }

        [WebMethod]
        public static string getExchangeRate()
        {
            List<SPI_Expenses.getExchangeRate_> exchangeratee = new List<SPI_Expenses.getExchangeRate_>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExchangeRate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getExchangeRate_ exp = new SPI_Expenses.getExchangeRate_();
                    exp._JPY = Convert.ToDecimal(rdr["JPY"]);
                    exp._IDR = Convert.ToDecimal(rdr["IDR"]);
                    exp._SGD = Convert.ToDecimal(rdr["SGD"]);

                    exchangeratee.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(exchangeratee);
            return json;

        }


        [WebMethod]
        public static string getAllExpensesQuotationNumber()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData_QuotNo> expenseslist = new List<SPI_Expenses.getNewData_QuotNo>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_QuotationOK", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getNewData_QuotNo exp = new SPI_Expenses.getNewData_QuotNo();
                    exp._expensesID = Convert.ToInt32(rdr["ID"]);
                    exp._partCode = rdr["goodsName"].ToString();
                    exp._descriptionName = rdr["goodsDesc"].ToString();
                    exp._orderQty = Convert.ToInt32(rdr["qtyOrder"]);
                    exp._ordertoModel = rdr["ordertoModel"].ToString();
                    exp._orderDate = rdr["insertDate"].ToString();
                    //exp._currency = rdr["currency"].ToString();
                    exp._maker = rdr["maker"].ToString();
                    exp._suppName = rdr["VENDOR"].ToString();
                    exp._unit = rdr["goodsUnit"].ToString();
                    exp._quotNo = rdr["quotationNo"].ToString();

                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }

        public void QuotationOK()
        {
            try
            {
                SPI_Expenses.updateQuotationOK(hdExpensesID.Value, txtQuotNo.Text.ToString());
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Data Quotation Number berhasil diupdate.');", true);

            }
            catch (Exception ex)
            {

            }

            // SPI_QC_Check.updateApprove(a);
        }

        public void updateExpenses()
        {
            try
            {
                SPI_Expenses.updateExpenses(hdExpensesID.Value, ddlCurrency.Text.ToString(), txtAmount.Text, Convert.ToDecimal(hdAmountUSD.Value), Convert.ToDecimal(hdUnitPrice.Value), txtQuotNo.Text.ToString(), txtPartName.Text.ToString(),txtPartCode.Text.ToString(),txtMaker.Text.ToString(),txtVendor.Text.ToString(),ddlUnit.SelectedValue.ToString(),Convert.ToInt32(txtLeadTime.Text),Convert.ToInt32(txtQty.Text),txtRemarks.Text.ToString(),txtPRNo.Text.ToString(),txtPONo.Text.ToString(),ddlCostCenter.SelectedValue.ToString(),ddlProfitCenters.SelectedValue.ToString());
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Data Currency, Amount, Amount USD dan Unit Price berhasil diupdate.');", true);

            }
            catch (Exception ex)
            {

            }
        }

        public void insertExchangeRate()
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_updateExchangeRate", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@JPY", txtJPY.Text);
            com.Parameters.AddWithValue("@SGD", txtSGD.Text);
            com.Parameters.AddWithValue("@IDR", txtIDR.Text);
            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Update Exchange Rate Berhasil. Silahkan lihat data pada table.');window.location ='expenseslist.aspx';", true);
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //QuotationOK();
            updateExpenses();
        }

        protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
        {
            int qty;
            decimal amount, final;
            amount = Convert.ToDecimal(txtUnitPrice.Text);
            qty = Convert.ToInt32(txtQty.Text);
            final = qty * amount;
            txtAmount.Text = ddlCurrency.Text.ToString() + " " + final.ToString();
            hdAmount.Value = ddlCurrency.Text.ToString() + " " + final.ToString(); ;
            hdUnitPrice.Value = txtUnitPrice.Text;
            //txtAmountUSD.Text = "USD" + " " + final.ToString();
            calculateAmountUSD();
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            int qty;
            decimal amount, final;
            amount = 0;
            amount = Convert.ToDecimal(txtUnitPrice.Text);
            qty = Convert.ToInt32(txtQty.Text);
            final = qty * amount;
            txtAmount.Text = ddlCurrency.Text.ToString() + " " + final.ToString();
            hdAmount.Value = ddlCurrency.Text.ToString() + " " + final.ToString(); ;
            //txtAmountUSD.Text = "USD" + " " + final.ToString();
            calculateAmountUSD();
        }

        protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            int qty;
            decimal amount, final;
            amount = 0;
            amount = Convert.ToDecimal(txtUnitPrice.Text);
            qty = Convert.ToInt32(txtQty.Text);
            final = qty * amount;
            txtAmount.Text = ddlCurrency.Text.ToString() + " " + final.ToString();
            hdAmount.Value= ddlCurrency.Text.ToString() + " " + final.ToString(); ;
            //txtAmountUSD.Text = "USD" + " " + final.ToString();
            calculateAmountUSD();
            //if (Page.IsPostBack)
            //{
            //    calculateAmountUSD();
            //}
            //calculateAmountUSD();
        }

        public void calculateAmountUSD()
        {
            decimal JPY, IDR, SGD;
            decimal preTotal, grandTotal;
            JPY = Convert.ToDecimal(hdnJPY.Value);
            IDR = Convert.ToDecimal(hdnIDR.Value);
            SGD = Convert.ToDecimal(hdnSGD.Value);

            if (ddlCurrency.SelectedValue == "JPY")
            {
                preTotal = Convert.ToInt32(txtQty.Text) * Convert.ToDecimal(txtUnitPrice.Text);
                grandTotal = preTotal / JPY;
                txtAmountUSD.Text = grandTotal.ToString("0.00");
                hdAmountUSD.Value = grandTotal.ToString("0.00");
            }
            else if (ddlCurrency.SelectedValue == "IDR")
            {
                preTotal = Convert.ToInt32(txtQty.Text) * Convert.ToDecimal(txtUnitPrice.Text);
                grandTotal = preTotal / IDR;
                txtAmountUSD.Text = grandTotal.ToString("0.00");
                hdAmountUSD.Value = grandTotal.ToString("0.00");
            }
            else if (ddlCurrency.SelectedValue == "SGD")
            {
                preTotal = Convert.ToInt32(txtQty.Text) * Convert.ToDecimal(txtUnitPrice.Text);
                grandTotal = preTotal / SGD;
                txtAmountUSD.Text = grandTotal.ToString("0.00");
                hdAmountUSD.Value = grandTotal.ToString("0.00");
            }
            else if (ddlCurrency.SelectedValue == "USD")
            {
                preTotal = Convert.ToInt32(txtQty.Text) * Convert.ToDecimal(txtUnitPrice.Text);
                txtAmountUSD.Text = preTotal.ToString();
                hdAmountUSD.Value = preTotal.ToString();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            insertExchangeRate();
        }

        public static string getExchangeRate2()
        {

            List<SPI_Expenses.getExchangeRate_> exchangeratee = new List<SPI_Expenses.getExchangeRate_>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExchangeRate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_Expenses.getExchangeRate_ exp = new SPI_Expenses.getExchangeRate_();
                    exp._JPY = Convert.ToDecimal(rdr["JPY"]);
                    exp._IDR = Convert.ToDecimal(rdr["IDR"]);
                    exp._SGD = Convert.ToDecimal(rdr["SGD"]);


                    exchangeratee.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(exchangeratee);
            return json;
        }

        public void cancel()
        {
            //bagian untuk cancel data
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn = new SqlConnection(str);
            try
            {
                cn.Open();
                SqlCommand com2 = new SqlCommand("SPI_getExpensesListNew_Cancel", cn);

                com2.CommandType = CommandType.StoredProcedure;

                com2.Parameters.AddWithValue("@ID", hdExpensesID.Value);
                SqlDataReader dr;
                dr = com2.ExecuteReader();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Cancel Data berhasil.');window.location ='expenseslist.aspx#cancel';", true);

            }
            catch (Exception ex)
            {

            }
        }

        public void cancel_ComingCancel()
        {
            //bagian untuk cancel data
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn = new SqlConnection(str);
            try
            {
                cn.Open();
                SqlCommand com2 = new SqlCommand("SPI_getExpensesListNew_Cancel", cn);

                com2.CommandType = CommandType.StoredProcedure;

                com2.Parameters.AddWithValue("@ID", hdExpID_ComingCancel.Value);
                SqlDataReader dr;
                dr = com2.ExecuteReader();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Cancel Data berhasil.');window.location ='expenseslist.aspx#cancel';", true);

            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            cancel();
        }

        protected void btnCancelOrder_ComingCancel_Click(object sender, EventArgs e)
        {
            cancel_ComingCancel();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string dateFrom = txtDateFrom.Text;
            string dateTo = txtDateTo.Text;
            string type = ddlType.SelectedValue;

            exportToExcel(dateFrom, dateTo, type);
        }

        public void exportToExcel(string dateFrom, string dateTo, string type)
        {
            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListExport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dateFrom", DateTime.Parse(dateFrom));
                cmd.Parameters.AddWithValue("@dateTo", DateTime.Parse(dateTo));
                cmd.Parameters.AddWithValue("@type", type);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(rdr);

                string fileName = "ExpensesList_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xlsx";
                ExcelPackage.LicenseContext = LicenseContext.Commercial;

                ExcelPackage excel = new ExcelPackage();
                ExcelWorksheet worksheet = excel.Workbook.Worksheets.Add("Expenses List");
                worksheet.Cells.LoadFromDataTable(dt, true);

                // Append cookie
                HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
                cookie.Value = "Flag";
                cookie.Expires = DateTime.Now.AddDays(1);
                Response.AppendCookie(cookie);
                // end

                Response.Clear();
                Response.BufferOutput = true;
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);

                using (var memoryStream = new System.IO.MemoryStream())
                {
                    excel.SaveAs(memoryStream);
                    memoryStream.Position = 0;
                    Response.OutputStream.Write(memoryStream.GetBuffer(), 0, (int)memoryStream.Length);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}