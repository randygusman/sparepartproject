using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace sparepartproject
{
    public partial class expenseslist_uncounting : System.Web.UI.Page
    {
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
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_Uncounting", con);
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
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_Oversea_Uncounting", con);
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
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_CancelData_Uncounting", con);
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
        public static string getAllNewExpenses_Coming()
        {
            //System.Threading.Thread.Sleep(1000);
            List<SPI_Expenses.getNewData> expenseslist = new List<SPI_Expenses.getNewData>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getExpensesListNew_Coming_Uncounting", con);
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

        protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            int qty;
            decimal amount, final;
            amount = 0;
            amount = Convert.ToDecimal(txtUnitPrice.Text);
            qty = Convert.ToInt32(txtQty.Text);
            final = qty * amount;
            txtAmount.Text = ddlCurrency.Text.ToString() + " " + final.ToString();
            hdAmount.Value = ddlCurrency.Text.ToString() + " " + final.ToString();
            calculateAmountUSD();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            updateExpenses();
        }

        public void updateExpenses()
        {
            try
            {
                SPI_Expenses.updateExpenses(hdExpensesID.Value, ddlCurrency.Text.ToString(), txtAmount.Text, Convert.ToDecimal(hdAmountUSD.Value), Convert.ToDecimal(hdUnitPrice.Value), txtQuotNo.Text.ToString(), txtPartName.Text.ToString(), txtPartCode.Text.ToString(), txtMaker.Text.ToString(), txtVendor.Text.ToString(), ddlUnit.SelectedValue.ToString(), Convert.ToInt32(txtLeadTime.Text), Convert.ToInt32(txtQty.Text), txtRemarks.Text.ToString(), txtPRNo.Text.ToString(), txtPONo.Text.ToString(), ddlCostCenter.SelectedValue.ToString(), ddlProfitCenters.SelectedValue.ToString());
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Data Currency, Amount, Amount USD dan Unit Price berhasil diupdate.');", true);
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            cancel();
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
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Cancel Data berhasil.');window.location ='expenseslist_uncounting.aspx#cancel';", true);

            }
            catch (Exception ex)
            {

            }
        }
    }
}