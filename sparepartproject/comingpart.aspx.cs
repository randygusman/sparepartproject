using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static sparepartproject.mongoDB;
using MongoDB.Driver;
using Npgsql;
using System.Collections;
using Newtonsoft.Json.Bson;

namespace sparepartproject
{
    public partial class comingpart : System.Web.UI.Page
    {
        public static DateTime dueedate;
        public static string dueedate22;
        string getUsername;
        const string connString = "Data Source=172.16.111.174\\SQLEXPRESS; Initial Catalog = sparepartworld; User ID=sa; Pwd=Itmaintenance4!; connection timeout =3;";
        public static string dueDate = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            //else
            //{
            //    getUsername = Session["username"].ToString();

            //    var finalUser = login.getnama(getUsername).ToString();
            //    user.InnerText = finalUser.ToString();
            //}
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
        public static void insertExchange(float JPY, float IDR, float SGD)
        {
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn2 = new SqlConnection(str);
            SqlCommand cmd7 = new SqlCommand("SPI_updateExchangeRate", cn2);
            cmd7.Parameters.AddWithValue("@JPY", JPY);
            cmd7.Parameters.AddWithValue("@SGD", SGD);
            cmd7.Parameters.AddWithValue("@IDR", IDR);
            //var a = "pak tarno*";
            //var b = a.Replace("*", "p");

            cmd7.CommandType = CommandType.StoredProcedure;

            try
            {
                cn2.Open();
                cmd7.ExecuteNonQuery();
                cn2.Close();
                //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');", true);
            }
            catch (Exception ex)
            {

            }
        }

        [WebMethod]
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

        [WebMethod]
        public static void DeleteComingPart(int id)
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_deletePartComing", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@ID", id);
            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Delete Berhasil.');window.location ='comingpart.aspx';", true);
            }
            catch (Exception ex)
            {
                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        [WebMethod]
        public static void UpdateComingPart(int id, double originaprice, double usdprice, double totalprice)
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_updatePartComing_Price", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@ID", id);
            com.Parameters.AddWithValue("@originalPrice", originaprice);
            com.Parameters.AddWithValue("@usdprice", usdprice);
            com.Parameters.AddWithValue("@totalprice", totalprice);
            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Delete Berhasil.');window.location ='comingpart.aspx';", true);
            }
            catch (Exception ex)
            {
                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        public static void updatePartComing(int id)
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_updatePartComing", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@id", id);
            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Update Exchange Rate Berhasil. Silahkan lihat data pada table.');window.location ='expenseslist.aspx';", true);
            }
            catch (Exception ex)
            {
                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        [WebMethod] //method untuk mendapatkan data PM
        public static List<listComingPart> GetEvents()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("SPI_getPartComing", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);

            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {

            }

            //foreach (DataRow dr in dt.Rows)
            //{
            //    int GZA = (dr["GZA"] == DBNull.Value) ? 0 : Convert.ToInt32(dr["GZA"]);
            //    if (dr["SALARY"] != DBNull.Value)
            //    {
            //        dr["Actual_salary"] = Convert.ToInt32(dr["SALARY"]) - ((Convert.ToInt32(dr["SALARY"]) / 30) * GZA);
            //    }
            //}

            return dt.AsEnumerable().Select(datarow =>
            new comingpart.listComingPart()
            {
                id = Convert.ToInt32(datarow["id"]),
                itemDescription = Convert.ToString(datarow["itemDescription"]),
                partcode = Convert.ToString(datarow["partcode"]),
                vendor = Convert.ToString(datarow["vendor"]),
                //End = Convert.ToDateTime(datarow["End"]),
                groupName = Convert.ToString(datarow["groupName"]),
                costCenter = Convert.ToString(datarow["costCenter"]),
                profitCenter = Convert.ToString(datarow["profitCenter"]),

                pic = Convert.ToString(datarow["pic"]),
                purpose = Convert.ToString(datarow["purpose"]),
                qtyNumber = Convert.ToInt32(datarow["qtyNumber"]),
                //IsFullDay = false,
                qtySatuan = Convert.ToString(datarow["qtySatuan"]),

                originalCurrency = Convert.ToString(datarow["originalCurrency"]),
                originalPrice = Convert.ToDouble(datarow["originalPrice"]),
                usdPrice = Convert.ToDouble(datarow["usdPrice"]),
                totalPrice = Convert.ToDouble(datarow["totalPrice"]),
                poNumber = Convert.ToString(datarow["poNumber"]),
                dateOrder = Convert.ToString(datarow["do"]),
                receivedDateOrder = Convert.ToDateTime(datarow["receivedDO"]).ToString("MMM-dd yyyy"),
                receivedSPI = Convert.ToDateTime(datarow["receivedSPI"]).ToString("MMM-dd yyyy"),

                dueDate = Convert.ToString(datarow["dueDate"]),

                receivedPIC = Convert.ToString(datarow["receivedPIC"]),
                apply = Convert.ToString(datarow["apply"]),
                location = Convert.ToString(datarow["location"])

            }
            ).ToList();
        }


        [WebMethod]
        public static void insertPartComing(string itemDescription, string partcode, string vendor, string groupName, string costCenter, string profitCenter, int qty, string currency, float price, float usd, float sum, string po, string donumber, string purpose, string apply, string pic, DateTime receivedDO, DateTime receivedSPI, string receivedPIC, string status, string qtySatuan, string location, string originalModel, string _type)
        {

            if (purpose == "ACTIVITY")
            {
                dueDate = Convert.ToDateTime(receivedSPI).AddDays(150).ToString("yyyy-MM-dd");

            }
            else
            {
                dueDate = "-";
            }

            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn2 = new SqlConnection(str);
            SqlCommand cmd7 = new SqlCommand("[SPI_insertPartComing]", cn2);
            cmd7.Parameters.Add("@itemDescription", SqlDbType.VarChar).Value = itemDescription;
            cmd7.Parameters.Add("@partcode", SqlDbType.VarChar).Value = partcode;
            cmd7.Parameters.Add("@vendor", SqlDbType.VarChar).Value = vendor;
            cmd7.Parameters.Add("@groupName", SqlDbType.VarChar).Value = groupName;
            cmd7.Parameters.Add("@costCenter", SqlDbType.VarChar).Value = costCenter;
            cmd7.Parameters.Add("@profitCenter", SqlDbType.VarChar).Value = profitCenter;
            cmd7.Parameters.Add("@qty", SqlDbType.VarChar).Value = qty;
            cmd7.Parameters.Add("@currency", SqlDbType.VarChar).Value = currency;
            cmd7.Parameters.Add("@price", SqlDbType.VarChar).Value = price;
            cmd7.Parameters.Add("@usd", SqlDbType.VarChar).Value = usd;
            cmd7.Parameters.Add("@sum", SqlDbType.VarChar).Value = sum;
            cmd7.Parameters.Add("@po", SqlDbType.VarChar).Value = po;
            cmd7.Parameters.Add("@doNumber", SqlDbType.VarChar).Value = donumber;
            cmd7.Parameters.Add("@purpose", SqlDbType.VarChar).Value = purpose;
            cmd7.Parameters.Add("@apply", SqlDbType.VarChar).Value = apply;
            cmd7.Parameters.Add("@pic", SqlDbType.VarChar).Value = pic;
            cmd7.Parameters.Add("@receivedDO", SqlDbType.Date).Value = receivedDO;
            cmd7.Parameters.Add("@receivedSPI", SqlDbType.Date).Value = receivedSPI;
            cmd7.Parameters.Add("@dueDate", SqlDbType.VarChar).Value = dueDate;
            cmd7.Parameters.Add("@receivedPIC", SqlDbType.VarChar).Value = receivedPIC;
            cmd7.Parameters.Add("@status", SqlDbType.VarChar).Value = status;
            cmd7.Parameters.Add("@qtySatuan", SqlDbType.VarChar).Value = qtySatuan;
            cmd7.Parameters.Add("@location", SqlDbType.VarChar).Value = location;
            cmd7.Parameters.Add("@originalModel", SqlDbType.VarChar).Value = originalModel;

            cmd7.CommandType = CommandType.StoredProcedure;

            try
            {
                if(purpose == "ACTIVITY")
                {
                    cn2.Open();
                    cmd7.ExecuteNonQuery();
                    cn2.Close();
                }
                else
                {
                    cn2.Open();
                    cmd7.ExecuteNonQuery();
                    cn2.Close();

                    //penmbahan stock
                    SqlConnection cn3 = new SqlConnection(str);
                    SqlCommand cmd8 = new SqlCommand("[SPI_updateQty_PartComing]", cn3);
                    cmd8.Parameters.Add("@goodsName", SqlDbType.VarChar).Value = partcode;
                    cmd8.Parameters.Add("@nowStockUpdate", SqlDbType.VarChar).Value = qty;
                    cmd8.Parameters.Add("@type", SqlDbType.VarChar).Value = _type;
                    cmd8.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        cn3.Open();
                        cmd8.ExecuteNonQuery();
                        cn3.Close();
                    }
                    catch (Exception ex)
                    {

                    }
                }
                

                //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');", true);
            }
            catch (Exception ex)
            {

            }
        }

        public class listComingPart
        {
            public int id { get; set; }
            public string itemDescription { get; set; }

            public string partcode { get; set; }

            public string vendor { get; set; }
            public string groupName { get; set; }
            //public DateTime Start { get; set; }
            //public DateTime End { get; set; }
            public string costCenter { get; set; }
            public string profitCenter { get; set; }
            public string pic { get; set; }
            public string purpose { get; set; }
            public int qtyNumber { get; set; }
            public string qtySatuan { get; set; }
            public string originalCurrency { get; set; }
            public double originalPrice { get; set; }
            public double usdPrice { get; set; }
            public double totalPrice { get; set; }
            public string poNumber { get; set; }
            public string dateOrder { get; set; }
            public string receivedDateOrder { get; set; }
            public string receivedSPI { get; set; }
            public string receivedPIC { get; set; }
            public string dueDate { get; set; }
            public string apply { get; set; }
            public string location { get; set; }



            //public bool IsFullDay { get; set; }
            //public string Status { get; set; }
            //public string Random { get; set; }
            //public string ReasonPostponed { get; set; }
            //public string getFontColor { get; set; }
            //public string getMachine { get; set; }
        }

        [WebMethod]
        public static void sendMailPartComing(string datefrom, string dateto)
        {

            System.Data.DataTable dt = get4Mdata(datefrom, dateto);
            if (dt.Rows.Count > 0)
            {
                try
                {
                    int count = dt.Rows.Count; //,andre.hermawan@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg ,andre.hermawan@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg
                    List<int> list = dt.AsEnumerable()
                               .Select(r => r.Field<int>("id"))
                               .ToList();
                    //string toMail = "deni.ari@sep.epson.com.sg, adi.setiawan @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, mohamad.ikrom @sep.epson.com.sg, eko.hartanto @sep.epson.com.sg, solfitrianto @sep.epson.com.sg, suryono.talwibowo @sep.epson.com.sg, yanuar.andriansyah @sep.epson.com.sg, cahyo.nugroho @sep.epson.com.sg, dedy.nurrochman @sep.epson.com.sg, didik.setyawan @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg, rifqi.usman @sep.epson.com.sg, wascadi @sep.epson.com.sg, PEB2131972 @sep.epson.com.sg, mokhamad.ardian @sep.epson.com.sg, muhammad.yusuf @sep.epson.com.sg, nurmaki.elmadani @sep.epson.com.sg, welson @sep.epson.com.sg, joko.sulistiyo @sep.epson.com.sg, saikhu.rochman @sep.epson.com.sg, sunaryo @sep.epson.com.sg, edi.wiyono @sep.epson.com.sg, ahdiath.indrasetyadi @sep.epson.com.sg, trendy.lanang @sep.epson.com.sg, mega.apriyani @sep.epson.com.sg,randy.gusman @sep.epson.com.sg,sutarno@sep.epson.com.sg,dany.yunata@sep.epson.com.sg,amri.gunawan@sep.epson.com.sg,agung.sumbarra@sep.epson.com.sg,doan.nico@sep.epson.com.sg,samiudin@sep.epson.com.sg,rio.adhitama@sep.epson.com.sg,yuli.astrianik@sep.epson.com.sg,asdi.suhendra@sep.epson.com.sg,ari.setiyobudi@sep.epson.com.sg,hery.purwantoro@sep.epson.com.sg,romi.asmadi@sep.epson.com.sg,PEB2140722@sep.epson.com.sg,agus.pramudia@sep.epson.com.sg,bagas.cindarbumi@sep.epson.com.sg,sofwan.bayu@sep.epson.com.sg,septian.wibowo@sep.epson.com.sg,Muhammad.Isnaini@sep.epson.com.sg,PEB2140107@sep.epson.com.sg,dopi.eluri@sep.epson.com.sg,ahmad.setiyawan@sep.epson.com.sg,ahmad.sugiarto@sep.epson.com.sg,holden.simanjuntak@sep.epson.com.sg,PEB2111457@sep.epson.com.sg,PEB2122178@sep.epson.com.sg,zulhendy.masruddin@sep.epson.com.sg,rachmad.rizkybiantoro@sep.epson.com.sg,peb2111459@sep.epson.com.sg,khafid.masyudi@sep.epson.com.sg,PEB2111838@sep.epson.com.sg,PEB2111460@sep.epson.com.sg,januar.efendi@sep.epson.com.sg,yani.ariana@sep.epson.com.sg,PEB2140104@sep.epson.com.sg,PEB2101037@sep.epson.com.sg,PEB2110825@sep.epson.com.sg,PEB2111640@sep.epson.com.sg,nanang.wahyunianto@sep.epson.com.sg,wahyu.rukmana@sep.epson.com.sg,PEB2120127@sep.epson.com.sg,PEB2120620@sep.epson.com.sg,PEB2120717@sep.epson.com.sg,PEB2131878@sep.epson.com.sg,PEB2131967@sep.epson.com.sg,PEB2131971@sep.epson.com.sg,PEB2131973@sep.epson.com.sg,PEB2140074@sep.epson.com.sg,PEB2140253@sep.epson.com.sg,PEB2140717@sep.epson.com.sg,PEB2140719@sep.epson.com.sg,nurhuda@sep.epson.com.sg,PEB2141758@sep.epson.com.sg,agung.dwiprasetyo@sep.epson.com.sg,muamar.mursjid@sep.epson.com.sg,muhammad.syahrul@sep.epson.com.sg,teguh_trim@sep.epson.com.sg,PEB2101682@sep.epson.com.sg,PEB2110824@sep.epson.com.sg,PEB2110849@sep.epson.com.sg,PEB2111463@sep.epson.com.sg,PEB2111633@sep.epson.com.sg,PEB2120091@sep.epson.com.sg,PEB2120128@sep.epson.com.sg,PEB2120602@sep.epson.com.sg,PEB2131169@sep.epson.com.sg,PEB2141010@sep.epson.com.sg,PEB2142035@sep.epson.com.sg,ichwanul.muslimin@sep.epson.com.sg,mranu.robanny@sep.epson.com.sg,adi.bayusaputro@sep.epson.com.sg,fandy.fahrizalardimuhammad@sep.epson.com.sg,PEB2110851@sep.epson.com.sg,PEB2111468@sep.epson.com.sg,PEB2111661@sep.epson.com.sg,PEB2120126@sep.epson.com.sg,ibnu.sholihan@sep.epson.com.sg,alplinto.keliat@sep.epson.com.sg,PEB2111840@sep.epson.com.sg,PEB2120627@sep.epson.com.sg,PEB2120807@sep.epson.com.sg,PEB2141011@sep.epson.com.sg,henry.prasetyo@sep.epson.com.sg,PEB2110823@sep.epson.com.sg,PEB2110846@sep.epson.com.sg,PEB2110848@sep.epson.com.sg,PEB2110924@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,alvian@sep.epson.com.sg,PEB2120534@sep.epson.com.sg,PEB2140103@sep.epson.com.sg,angga.yudha@sep.epson.com.sg,PEB2131968@sep.epson.com.sg,ilyas.lukmanulhakim@sep.epson.com.sg,imam@sep.epson.com.sg,mohammad.faisal@sep.epson.com.sg,munjaroh@sep.epson.com.sg,denny.shalihat@sep.epson.com.sg,willi.hendrastaka@sep.epson.com.sg,PEB2101686@sep.epson.com.sg,lalang.kristiawan@sep.epson.com.sg,PEB2111646@sep.epson.com.sg,PEB2111781@sep.epson.com.sg,PEB2111835@sep.epson.com.sg,PEB2120629@sep.epson.com.sg,PEB2122168@sep.epson.com.sg,wahid.husin@sep.epson.com.sg,PEB2130706@sep.epson.com.sg,PEB2131118@sep.epson.com.sg,PEB2131121@sep.epson.com.sg,PEB2131876@sep.epson.com.sg,PEB2140718@sep.epson.com.sg,PEB2141007@sep.epson.com.sg,PEB2141759@sep.epson.com.sg,PEB2141821@sep.epson.com.sg,PEB2142072@sep.epson.com.sg,andika.putra@sep.epson.com.sg,mdehen.wijaya@sep.epson.com.sg,rizki.hamdani@sep.epson.com.sg,PEB2131970@sep.epson.com.sg,arius.kristanto@sep.epson.com.sg,munifatul.mustofiah@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg,ferdiansyah.marja@sep.epson.com.sg";
                    string toMail = "david.hermanto @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,eko.hartanto @sep.epson.com.sg,solfitrianto @sep.epson.com.sg,suryono.talwibowo@sep.epson.com.sg,cahyo.nugroho @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,didik.setyawan @sep.epson.com.sg,andre.hermawan @sep.epson.com.sg,faishol.husni@sep.epson.com.sg,rifqi.usman @sep.epson.com.sg,mochammad.yusufaditya@sep.epson.com.sg,wascadi @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg,ilham.mardhatillah@sep.epson.com.sg,randy.gusman @sep.epson.com.sg,khafid.masyudi @sep.epson.com.sg,PEB2140104 @sep.epson.com.sg,PEB2101037 @sep.epson.com.sg,PEB2110825 @sep.epson.com.sg,PEB2111640 @sep.epson.com.sg,nanang.wahyunianto @sep.epson.com.sg,wahyu.rukmana @sep.epson.com.sg,PEB2120127 @sep.epson.com.sg,bagus.setyawan@sep.epson.com.sg,PEB2122168@sep.epson.com.sg,PEB2120620 @sep.epson.com.sg,PEB2120717 @sep.epson.com.sg,PEB2131878 @sep.epson.com.sg,PEB2131967 @sep.epson.com.sg,PEB2131971 @sep.epson.com.sg,PEB2131973 @sep.epson.com.sg,PEB2140074 @sep.epson.com.sg,PEB2140253 @sep.epson.com.sg,ely.budiono@sep.epson.com.sg,PEB2140719 @sep.epson.com.sg,nurhuda @sep.epson.com.sg,PEB2141758 @sep.epson.com.sg,agung.dwiprasetyo @sep.epson.com.sg,muhammad.syahrul @sep.epson.com.sg,teguh_trim @sep.epson.com.sg,PEB2101682 @sep.epson.com.sg,PEB2110824 @sep.epson.com.sg,PEB2110849 @sep.epson.com.sg,PEB2111463 @sep.epson.com.sg,PEB2111633 @sep.epson.com.sg,PEB2120128 @sep.epson.com.sg,PEB2120602 @sep.epson.com.sg,PEB2131169 @sep.epson.com.sg,PEB2141010 @sep.epson.com.sg,PEB2142035 @sep.epson.com.sg,ichwanul.muslimin @sep.epson.com.sg,mranu.robanny @sep.epson.com.sg,PEB2110851 @sep.epson.com.sg,PEB2111468 @sep.epson.com.sg,PEB2111661 @sep.epson.com.sg,PEB2120126 @sep.epson.com.sg,ibnu.sholihan @sep.epson.com.sg,alplinto.keliat @sep.epson.com.sg,PEB2111840 @sep.epson.com.sg,PEB2120627 @sep.epson.com.sg,PEB2120807 @sep.epson.com.sg,PEB2141011 @sep.epson.com.sg,PEB2110823 @sep.epson.com.sg,PEB2110846 @sep.epson.com.sg,PEB2110848 @sep.epson.com.sg,eldiyudha.ryan@sep.epson.com.sg,dany.yunata@sep.epson.com.sg,PEB2110924 @sep.epson.com.sg,PEB2111659 @sep.epson.com.sg,alvian @sep.epson.com.sg,PEB2120534 @sep.epson.com.sg,PEB2140103 @sep.epson.com.sg,angga.yudha @sep.epson.com.sg,PEB2131968 @sep.epson.com.sg,ilyas.lukmanulhakim @sep.epson.com.sg,imam @sep.epson.com.sg,mohammad.faisal @sep.epson.com.sg,hasanal.fajri@sep.epson.com.sg,munjaroh @sep.epson.com.sg,denny.shalihat @sep.epson.com.sg,PEB2101686 @sep.epson.com.sg,lalang.kristiawan @sep.epson.com.sg,PEB2111646 @sep.epson.com.sg,PEB2111781 @sep.epson.com.sg,PEB2111835 @sep.epson.com.sg,PEB2120629 @sep.epson.com.sg,PEB2122168 @sep.epson.com.sg,wahid.husin @sep.epson.com.sg,PEB2130706 @sep.epson.com.sg,PEB2131118 @sep.epson.com.sg,PEB2131121 @sep.epson.com.sg,PEB2131876 @sep.epson.com.sg,PEB2140718 @sep.epson.com.sg,PEB2141007 @sep.epson.com.sg,PEB2141759 @sep.epson.com.sg,PEB2141821 @sep.epson.com.sg,PEB2142072 @sep.epson.com.sg,mdehen.wijaya @sep.epson.com.sg,PEB2131970 @sep.epson.com.sg,PEB2111659 @sep.epson.com.sg,ferdiansyah.marja @sep.epson.com.sg,tika.nuraeni@sep.epson.com.sg,nadhya.farishi@sep.epson.com.sg,marili.dewi@sep.epson.com.sg,loby.litanelaz@sep.epson.com.sg,sylfany.dellasagita@sep.epson.com.sg,muhammad.syahrul@sep.epson.com.sg,nanang.wahyunianto@sep.epson.com.sg,irfan.faisal@sep.epson.com.sg";
                    string cc = "hermawan@sep.epson.com.sg,deni.ari @sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg,tangguh.wisanto@sep.epson.com.sg"; //"agus.syaepuloh @sep.epson.com.sg, deni.ari @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,wascadi @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg"; //"nanang.setiawan@sep.epson.com.sg,mokhamat.ariyanto @sep.epson.com.sg,iktiyar.wicaksono @sep.epson.com.sg,gandhi.sucahyo@sep.epson.com.sg,natalia.jahja @sep.epson.com.sg";//"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"randy.gusman@sep.epson.com.sg";// 
                    SmtpClient client = new SmtpClient("mx.apo.epson.net");
                    client.Port = 25;
                    client.EnableSsl = false;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = true;
                    client.Credentials = new System.Net.NetworkCredential("SPI_PartComing@sep.epson.com.sg", "");

                    MailMessage mail = new MailMessage("SPI_PartComing@sep.epson.com.sg", toMail);
                    mail.Subject = "[MTC-ENG] INFO PART DATANG";

                    string textBody = "<span style='font-family: calibri; font-size:14px'><b>Dear All<b>,<br><br>Here we share Coming Part Consumption as of " + Convert.ToDateTime(datefrom).ToString("dd MMMM yyyy") + ".</b></span><br>";
                    textBody += "<span style='color:red; font-family: calibri; font-size:16px'>PLEASE TAKE OUT SOON FOR REQUESTER !</span></b><br><br><br>";

                    textBody += "<table style=\"text-align:center;font-family: calibri; font-size:11px\"width = " + 2400 + " cellpadding = " + 0 + " cellspacing =" + 0 + "><tr><td style=\"background-color:#305496;color:white;width:25px;border-left: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;border-right: 1px solid #000000;\"><center> <b>ID</b></center> </td><td style=\"background-color:#305496; color:white; width:250px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>ITEM DESCRIPTION</b></center> </td><td style=\"background-color:#305496;width:180px; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PARTCODE</b></center> </td><td style=\"background-color:#305496;width:180px;  color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>VENDOR</b></center> </td><td style=\"background-color:#305496; color:white;width:100px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>GROUP NAME</b></center> </td><td style=\"background-color:#305496; color:white;width:100px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>COST CENTER</b></center> </td><td style=\"width:100px;background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PROFIT CENTER</b></center> </td><td colspan=" + 2 + " style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>QTY</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CURRENCY</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PRICE</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>USD</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>SUM (USD)</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PO</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>DO NUMBER</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PURPOSE</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>APPLY</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>PIC</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>RECEIVED DO</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>RECEIVED SPI</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>DUE DATE</b></center> </td></tr>";
                    for (int i = 0; i < count; i++)
                    {
                        textBody += "<tr><td style=\"border-bottom: 1px solid #000000;border-left: 1px solid #000000;background-color:#305496; color:white;border-right: 1px solid #000000;\">" + dt.Rows[i][0].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][1].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][2].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][3].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][4].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][5].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][6].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;\">" + dt.Rows[i][9].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][10].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][11].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][12].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][13].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][14].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][15].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][16].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][8].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][20].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][7].ToString() + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + Convert.ToDateTime(dt.Rows[i][17]).ToString("yyyy-MM-dd") + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + Convert.ToDateTime(dt.Rows[i][18]).ToString("yyyy-MM-dd") + "</td>";
                        textBody += "<td style=\"border-bottom: 1px solid #000000; background-color:yellow; color:black;border-right: 1px solid #000000;\">" + dt.Rows[i][21].ToString() + "</td>"
                        //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][23].ToString() + "</td>"
                        +
                        "</tr>";
                        updatePartComing(Convert.ToInt32(dt.Rows[i][0]));
                    }
                    textBody += "</table>";
                    textBody += "<br/>";
                    textBody += "<br/>";
                    textBody += "<br/>";
                    textBody += "<span style='font-family: calibri;'>Thank you</span>";
                    textBody += "<br/>";
                    textBody += "<span style='font-family: calibri;'>SPI</span>";
                    mail.Body = textBody;

                    mail.IsBodyHtml = true;

                    mail.CC.Add(cc);

                    try
                    {
                        client.Send(mail);
                        mail.Dispose();
                    }
                    catch (Exception ex)
                    {

                    }
                }
                catch(Exception ex)
                {
                    return;
                }
                
            }
        }


        public static DataTable get4Mdata(string datefrom, string dateto)
        {

            using (var conn = new SqlConnection(connString))
            {
                using (var adapter = new SqlDataAdapter("[SPI_getPartComing_sendMail]", conn))
                {
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.SelectCommand.Parameters.Add("@receivedSPI", SqlDbType.VarChar).Value = datefrom;
                    adapter.SelectCommand.Parameters.Add("@receivedSPI2", SqlDbType.VarChar).Value = dateto;

                    using (var dataTable = new DataTable())
                    {
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
        }
        class getData
        {

        }

        //[WebMethod]
        public void exportExcel(string datefrom, string dateto)
        {
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();
            DateTime dateFrom1, dateFrom, dateFrom2, dateTo, dateTo1, dateTo2;
            int diff;
            //dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
            //dateFrom2 = Convert.ToDateTime(txtDateFrom.Text);
            //dateFrom = Convert.ToDateTime(txtDateFrom.Text);
            //dateTo = Convert.ToDateTime(txtDateTo.Text);
            //dateTo2 = Convert.ToDateTime(txtDateTo.Text);
            //dateTo1 = Convert.ToDateTime(txtDateTo.Text);
            //dateTo = dateTo.AddDays(1);
            //diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);
            //var until = diff + 2;
            //var fitt = 2 + diff;
            //if (diff == 0 || diff < 0)
            //{
            //    //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
            //    return;
            //}
            //else
            //{
            try
            {
                var workSheet = excel.Workbook.Worksheets.Add("Part Coming");
                workSheet.Cells[1, 1].Value = "Coming Part All";// +" "+ txtDateFrom.Text.ToString() + " " + txtDateTo.Text.ToString();

                workSheet.Cells["A3"].Value = "ID PART COMING";
                workSheet.Cells["B3"].Value = "ITEM DESCRIPTION";
                workSheet.Cells["C3"].Value = "PARTCODE";
                workSheet.Cells["D3"].Value = "VENDOR";
                workSheet.Cells["E3"].Value = "GROUP NAME";
                workSheet.Cells["F3"].Value = "COST CENTER";
                workSheet.Cells["G3"].Value = "PROFIT CENTER";
                workSheet.Cells["H3"].Value = "PIC";
                workSheet.Cells["I3"].Value = "PURPOSE";
                workSheet.Cells["J3"].Value = "QTY NUMBER";
                workSheet.Cells["K3"].Value = "";
                workSheet.Cells["L3"].Value = "ORIGINAL CURRENCY";
                workSheet.Cells["M3"].Value = "ORIGINAL PRICE";
                workSheet.Cells["N3"].Value = "USD PRICE";
                workSheet.Cells["O3"].Value = "TOTAL PRICE";
                workSheet.Cells["P3"].Value = "PO NUMBER";
                workSheet.Cells["Q3"].Value = "DO";
                workSheet.Cells["R3"].Value = "RECEIVED DO";
                workSheet.Cells["S3"].Value = "RECEIVED SPI";
                workSheet.Cells["T3"].Value = "RECEIVED PIC";
                workSheet.Cells["U3"].Value = "APPLY";
                workSheet.Cells["v3"].Value = "LOCATION";

                DataTable dt = PartComing.getPartComing_Export(datefrom, dateto);

                //TEMPAT MULAI ROW DATANYA
                int rowCount = 3;

                foreach (DataRow dr in dt.Rows)
                {
                    rowCount += 1;
                    for (int b = 1; b < dt.Columns.Count + 1; b++)
                    {
                        if (rowCount == 2)
                        {
                            workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;

                        }
                        workSheet.Cells[rowCount, b].Value = dr[b - 1];
                    }
                }

                workSheet.Column(18).Style.Numberformat.Format = "yyyy-MM-dd";
                workSheet.Column(19).Style.Numberformat.Format = "yyyy-MM-dd";

                for (int fit = 1; fit <= 26; fit++)
                {
                    workSheet.Column(fit).AutoFit();
                }

                //workSheet.Cells
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
            }
            // Append cookie
            HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
            cookie.Value = "Flag";
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.AppendCookie(cookie);
            // end
            using (var memoryStream = new System.IO.MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=SPI Coming Part " + txtDateFrom.Text.ToString() + " " + txtDateTo.Text.ToString() + " .xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportExcel(txtDateFrom.Text.ToString(), txtDateTo.Text.ToString());
        }


        public class Spareparts
        {
            [BsonId]
            [BsonRepresentation(MongoDB.Bson.BsonType.ObjectId)]
            public ObjectId _id { get; set; }

            public DateTime? deletedAt { get; set; }
            public DateTime? updatedAt { get; set; }
            public DateTime? createdAt { get; set; }
            public bool isActive { get; set; }
            public List<String> poAttchDocument { get; set; } = null;
            public List<String> attchDocument { get; set; } = null;
            public List<String> attchPicture { get; set; } = null;




            public string code { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public ObjectId maker { get; set; }
            public Int32? modelId { get; set; }
            public ObjectId keeping { get; set; }
            public ObjectId subKeeping { get; set; }
            public Int32? maxStock { get; set; }
            public Int32? minStock { get; set; }
            public Int32? minOrder { get; set; }
            public ObjectId categoryPart { get; set; }
            public ObjectId stockCategory { get; set; }
            public Int32? objectId { get; set; }
            public ObjectId objectGroupId { get; set; }
            public ObjectId movingStatus { get; set; }
            public Int32? lastUpdatedBy { get; set; }
            public string status { get; set; }
            public Int32? totalQuantity { get; set; }
            public Int32? createdBy { get; set; }
            public Int32? __v { get; set; }
            public Int32? nowStock { get; set; }
            public Int32? predictiveMaintenance { get; set; }
            public string remarks { get; set; }
            public Int32? stockistId { get; set; }
            public Int32? eoq { get; set; }
            public Int32? rop { get; set; }
            public Int32? safetyStock { get; set; }

            public string convertedKeeping { get; set; }
            public string convertedSubKeeping { get; set; }

            public string poGoods { get; set; }

        }

        public class Keeping
        {
            [BsonId]
            [BsonRepresentation(MongoDB.Bson.BsonType.ObjectId)]
            public ObjectId _id { get; set; }

            public DateTime? deletedAt { get; set; }
            public DateTime? updatedAt { get; set; }
            public DateTime? createdAt { get; set; }
          
            public string code { get; set; }
            public string name { get; set; }
            public ObjectId parent { get; set; }
            public string type { get; set; }
            public Int32? createdBy { get; set; }
            public Int32? __v { get; set; }



        }

        public class SubKeeping
        {
            public string subKeepig { get; set; }
            public string goodsDesc { get; set; }
            public string goodsCode { get; set; }
            public string goodsName { get; set; }

        }

        [WebMethod]
        public static List<Spareparts> getTransactionParts(string partcode)
        {
            //mongoDB section
            mongoClient = new MongoClient("mongodb://lanius:laniuslab@172.16.104.34:27017/");
            var database = mongoClient.GetDatabase("mes-epson");
            var Spareparts = database.GetCollection<Spareparts>("sparepartdatabases").AsQueryable<Spareparts>().Where(r => r.name == partcode).ToList();

            //return to front End
            return Spareparts.AsEnumerable().Select(datalist =>
            new Spareparts()
            {
                _id = datalist._id,
                code = datalist.code,
                name = datalist.name,
                keeping= datalist.keeping,
                subKeeping=datalist.subKeeping,
                convertedKeeping = datalist.keeping.ToString(),
                convertedSubKeeping = datalist.subKeeping.ToString(),
                description = datalist.description
            }
            ).ToList();

        }


        [WebMethod]
        public static List<Keeping> getKeeping(string keeping, string subkeeping)
        {
            //mongoDB section
            mongoClient = new MongoClient("mongodb://lanius:laniuslab@172.16.104.34:27017/");
            var database = mongoClient.GetDatabase("mes-epson");
            var Keepings_ = database.GetCollection<Keeping>("keepings").AsQueryable<Keeping>().Where(r => r.parent == new ObjectId(keeping) && r._id == new ObjectId(subkeeping)).ToList();

            //return to front End
            return Keepings_.AsEnumerable().Select(datalist =>
            new Keeping()
            {
                _id = datalist._id,
                code = datalist.code,
                name = datalist.name
            }
            ).ToList();

        }


        //SPI_DailyIssuedPart name = 

        //[WebMethod]
        //public static void getSubKeeping(string _goodsName)
        //{
        //    string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(web);
        //    SqlCommand com = new SqlCommand("SPI_getSubKeeping_bySparepartCode", con);

        //    com.CommandType = CommandType.StoredProcedure;

        //    com.Parameters.AddWithValue("@goodsName", _goodsName);
        //    try
        //    {
        //        con.Open();
        //        SqlDataReader dr;
        //        dr = com.ExecuteReader();

        //        con.Close();
        //        con.Open();

        //        //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Delete Berhasil.');window.location ='comingpart.aspx';", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
        //    }
        //    con.Close();
        //}

        [WebMethod]
        public static string getSubKeeping(string _goodsName, string _type)
        {
            List<SubKeeping> listSubKeeping = new List<SubKeeping>();
            SubKeeping _getSubKeeping = new SubKeeping();
            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getSubKeeping_bySparepartCode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //com.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@goodsName", _goodsName);
                cmd.Parameters.AddWithValue("@type", _type);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    
                    _getSubKeeping.subKeepig = rdr["subKeeping"].ToString();
                    _getSubKeeping.goodsDesc = rdr["goodsDesc"].ToString();
                    _getSubKeeping.goodsCode = rdr["goodsCode"].ToString();
                    _getSubKeeping.goodsName = rdr["goodsName"].ToString();
                    listSubKeeping.Add(_getSubKeeping);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(listSubKeeping);
            return json;


        }
    }
}