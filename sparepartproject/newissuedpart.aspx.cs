using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;

namespace sparepartproject
{
    public partial class newissuedpart : System.Web.UI.Page
    {
        string getUsername;
        public DataTable dtTop3;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            //else
            //{



            //    //var lines = File.ReadAllLines("D:\\login.txt");

            //    //for (int i = 0; i <= lines.Length; i++)
            //    //{
            //    //    var fields = lines[i].Split(' ');
            //    //    if (getUsername == fields[0])
            //    //    {
            //    //        dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsCode("sdgdsfsd");
            //    //        var finalUser = login.getnama(getUsername).ToString();
            //    //        user.InnerText = finalUser.ToString();
            //    //        return;
            //    //    }
            //    //    else
            //    //    {
            //    //        btnOrder.Visible = false;
            //    //        var finalUser = login.getnama(getUsername).ToString();
            //    //        user.InnerText = finalUser.ToString();
            //    //        dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsCode("sdgdsfsd");
            //    //        return;
            //    //    }
            //    //}
            //}

            //getUsername = "GUEST";
            //var finalUser = login.getnama(getUsername).ToString();
            user.InnerText = "GUEST";
            dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsCode("sdgdsfsd");

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            try
            {
                if (ddlGoodsCodeOrGoodsName.Text == "Goods Code")
                {
                    dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsCode(txtGoodsCodeOrGoodsName.Text.ToString());
                    colTable.Style.Add("display", "block");
                }
                else
                {

                    dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsName(txtGoodsCodeOrGoodsName.Text.ToString());
                    colTable.Style.Add("display", "block");
                }

                //txtGoodsCodeIssuedPart.Text = string.Empty;
                //txtGoodsNameIssuedPart.Text = string.Empty;
                //txtNowStockIssuedPart.Text = string.Empty;
                //txtMinStockIssuedPart.Text = string.Empty;
                ////txtGoodsCodeOrGoodsName.Text = string.Empty;
                //txtQtyIssued.Text = string.Empty;
                //if (dtTop3.Rows.Count > 0)
                //{

                //}
            }
            catch (Exception ex)
            {

            }
        }

        public void insertIssuedPart()
        {
            string ID;
            var a = tab_content.Value;
            var count = rowCount.Value;


            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');
            DateTime now = DateTime.Now;
            int ketetapan = items.Length;

            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_insertDailyIssuedPart", con);

            com.CommandType = CommandType.StoredProcedure;
            if (ketetapan == 1)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Tidak ada data SparePart di list table yang akan di Issued. Silahkan masukkan data SparePart terlebih dahulu.');", true);
            }
            else
            {
                for (int i = 0; i < ketetapan; i += 12)
                {
                    //ID = items[i + 8].ToString();
                    ID = items[i + 9].ToString();
                    if (ID.Length == 10)
                    {
                        ID = ID.Substring(3);
                    }
                    else
                        if (ID.Length == 7)
                    {

                    }
                    //string dateIssued = items[i + 10].ToString();
                    var reason = items[i + 8].ToString();
                    string fixReason = reason.Replace(",", ";");
                    com.Parameters.AddWithValue("@goodsCode", items[i]);
                    com.Parameters.AddWithValue("@goodsName", items[i + 1]);
                    com.Parameters.AddWithValue("@model", items[i + 5]);
                    com.Parameters.AddWithValue("@qtyIssued", items[i + 4]);
                    com.Parameters.AddWithValue("@issuedBy_ID", ID);
                    com.Parameters.AddWithValue("@issuedDate", items[i + 10]);
                    com.Parameters.AddWithValue("@reason", fixReason);
                    com.Parameters.AddWithValue("@line", items[i + 6]);
                    com.Parameters.AddWithValue("@cell", items[i + 7]);
                    string goodsCode = items[i].ToString();
                    try
                    {
                        com.Dispose();
                        con.Open();
                        SqlDataReader dr;
                        dr = com.ExecuteReader();

                        con.Close();

                        com.Parameters.Clear();

                        con.Open();

                        SqlCommand com2 = new SqlCommand("[SPI_updateNowStock_PartDatabase]", con);
                        com2.CommandType = CommandType.StoredProcedure;
                        int now_stock, min_stock = 0;

                        now_stock = Convert.ToInt32(items[i + 3]) - Convert.ToInt32(items[i + 4]);
                        min_stock = Convert.ToInt32(items[i + 2]);

                        //if (now_stock < 0)
                        //{
                        //    now_stock = 0;
                        //}
                        //else
                        //{

                        //}

                        com2.Parameters.AddWithValue("@goodsCode", items[i]);
                        com2.Parameters.AddWithValue("@nowStock", now_stock);
                        dr = com2.ExecuteReader();
                        com2.Parameters.Clear();
                        con.Close();

                        //jika setelah issued, now stock lebih kecil dari min stock, maka auto masukkan data ke pre order part
                        if (now_stock < min_stock)
                        {

                            DataTable dt = SPI_OrderPart.SPI_checkGoodsCode_PreOrderPart(goodsCode);
                            if (dt.Rows.Count > 0)
                            {
                                //disni harusnya update qty pre order part jika sudah ada auto order sebelumnya
                            }
                            else


                            {
                                DataTable dt6 = SPI_Expenses.SPI_checkGoodsCode_PreExpenses(goodsCode);
                                if (dt6.Rows.Count > 0)
                                {
                                }
                                else
                                {
                                    SqlCommand com3 = new SqlCommand("[SPI_insertOrderPart_Pre]", con);
                                    com3.CommandType = CommandType.StoredProcedure;
                                    //var _goodsCode = items[i].ToString();
                                    //var _goodsName = items[i + 1].ToString();
                                    //var _goodsDesc = items[i].ToString();
                                    //var _nowStock = now_stock;
                                    //var _minStock = items[i+2].ToString();
                                    //var _preOrderQty = items[i].ToString();
                                    //var _model = items[i].ToString();

                                    com3.Parameters.AddWithValue("@goodsCode", items[i]);
                                    com3.Parameters.AddWithValue("@goodsName", items[i + 1]);
                                    com3.Parameters.AddWithValue("@goodsDesc", items[i]);
                                    com3.Parameters.AddWithValue("@nowStock", now_stock);
                                    com3.Parameters.AddWithValue("@minStock", items[i + 2]);
                                    com3.Parameters.AddWithValue("@minOrder", 1);
                                    com3.Parameters.AddWithValue("@preOrderQty", items[i + 4]);
                                    com3.Parameters.AddWithValue("@model", items[i + 5]);
                                    com3.Parameters.AddWithValue("@datetime", now);
                                    try
                                    {
                                        con.Open();
                                        //SqlDataReader dr;
                                        dr = com3.ExecuteReader();

                                        con.Close();
                                        con.Open();

                                        //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');window.location ='expenses.aspx';", true);
                                        com3.Parameters.Clear();
                                    }
                                    catch (Exception ex)
                                    {
                                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data now qty < min qty). Silahkan hubungi admin.');", true);
                                    }
                                    con.Close();
                                }

                            }


                        }

                        System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "window.location ='newissuedpart.aspx';", true);
                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Issued Sparepart. Silahkan hubungi admin.');", true);
                    }
                }
            }
            System.Threading.Thread.Sleep(1000);
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            insertIssuedPart();
        }

        //protected void txtGoodsCodeIssuedPart_TextChanged(object sender, EventArgs e)
        //{

        //}

        //not use
        public void loadIssuedPartDataDetails()
        {
            try
            {

                //DataTable dt = SPI_DailyIssuedPart.getDailyIssued_PartDetails(txtGoodsCodeIssuedPart.Text.ToString());
                //if (dt.Rows.Count > 0)
                //{
                //    txtGoodsNameIssuedPart.Text = dt.Rows[0]["goodsName"].ToString();
                //    txtGoodsDescIssuedPart.Text = dt.Rows[0]["goodsDesc"].ToString();
                //    txtNowStockIssuedPart.Text = dt.Rows[0]["nowStock"].ToString();
                //    txtUnitPriceOrderPart.Text = dt.Rows[0]["unit_price"].ToString();
                //    txtMinStockIssuedPart.Text = dt.Rows[0]["minStock"].ToString();
                //    txtMinOrderissuedPart.Text = dt.Rows[0]["min_order"].ToString();
                //}
                //else
                //{
                //    txtQtyIssued.Text = "";
                //    txtMinOrderissuedPart.Text = "";
                //    txtGoodsNameIssuedPart.Text = "";
                //    txtGoodsDescIssuedPart.Text = "";
                //    txtNowStockIssuedPart.Text = "";
                //    txtUnitPriceOrderPart.Text = "";
                //    txtMinStockIssuedPart.Text = "";
                //    txtQtyIssued.Enabled = false;
                //    btnOrder.Enabled = false;
                //    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Goods Code tidak ditemukan. Silahkan register part terlebih dahulu.');", true);
                //}
            }
            catch (Exception ex)
            {
                //txtMinOrderissuedPart.Text = "";
                //txtGoodsNameIssuedPart.Text = "";
                //txtGoodsDescIssuedPart.Text = "";
                //txtNowStockIssuedPart.Text = "";
                //txtUnitPriceOrderPart.Text = "";
                //txtMinStockIssuedPart.Text = "";
                //txtQtyIssued.Enabled = false;
                //btnOrder.Enabled = false;
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Error. Silahkan hubungi Adminn untuk troubleshoot.');", true);
            }
        }

        //[WebMethod]
        //public static List<PIC> GetPICSuggestions(string query)
        //{
        //    List<PIC> suggestions = new List<PIC>();

        //    // Koneksi ke database SQL Server
        //    string connectionString = "dashboardConnectionStringName";  // Ganti dengan connection string Anda
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        try
        //        {
        //            conn.Open();
        //            string sql = "SELECT TOP 5 Name FROM m_employee_macheng WHERE emp_name LIKE @query + '%'";
        //            using (SqlCommand cmd = new SqlCommand(sql, conn))
        //            {
        //                cmd.Parameters.AddWithValue("@query", query);
        //                SqlDataReader reader = cmd.ExecuteReader();

        //                while (reader.Read())
        //                {
        //                    suggestions.Add(new PIC { Name = reader["emp_name"].ToString() });
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            // Handle error
        //            Console.WriteLine(ex.Message);
        //        }
        //    }

        //    return suggestions;
        //}


    }
}