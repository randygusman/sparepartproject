using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace sparepartproject
{
    public partial class dailyissuedpart : System.Web.UI.Page
    {
        string getUsername;
        public DataTable dt;// = SPI_DailyIssuedPart.getDailyIssued();
        public DataTable dtTop3;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                //Response.Redirect("Default.aspx");

            }
            else
            {
                if (Page.IsPostBack)
                {
                    BindTanggal();

                }
                else
                {
                    getUsername = Session["username"].ToString();
                    var date = DateTime.Now.ToString("yyyy-MM-dd");
                    //bindData();
                    //var finalUser = login.getnama(getUsername).ToString();
                    var finalUser = "GUEST";
                    user.InnerText = finalUser.ToString();
                }
            }
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            //upload();
            //bindData();
            //insertIssuedPart();
            deleteIssuedPart();
        }

        public void bindData()
        {
            
            DateTime from, to;
            string fromfix, tofix;
            //from = Convert.ToDateTime(txtTanggal.Text);
            //to = from.AddDays(1);
            //fromfix = from.ToString("yyyy-MM-dd");
            //tofix = to.ToString("yyyy-MM-dd");
            dt = SPI_DailyIssuedPart.getDailyIssued(/*fromfix, tofix*/);
        }

        //list untuk mendapatkan seluruh data daily issued dari database, procedure yang digunakan adalah SPI_getDailyIssuedPart
        [WebMethod]
        public static string getAllDailyIssued()
        {
            List<SPI_DailyIssuedPart.classDailyIssued> listDailyIssued = new List<SPI_DailyIssuedPart.classDailyIssued>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getDailyIssuedPart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_DailyIssuedPart.classDailyIssued dailyIssuedData = new SPI_DailyIssuedPart.classDailyIssued();
                    dailyIssuedData._SPI_IDIssued =  rdr["SPI_IDIssued"].ToString();
                    dailyIssuedData._goodsCode =  rdr["goodsCode"].ToString();
                    dailyIssuedData._goodsName =  rdr["goodsName"].ToString();
                    dailyIssuedData._model =  rdr["model"].ToString();
                    dailyIssuedData._qtyIssued =  rdr["qtyIssued"].ToString();
                    dailyIssuedData._issuedByID =  rdr["issuedBy_ID"].ToString();
                    dailyIssuedData._issuedByName =  rdr["issuedBy_Name"].ToString();
                    dailyIssuedData._IssuedDate = Convert.ToDateTime(rdr["IssuedDate"]).ToString("yyyy-MM-dd");
                    dailyIssuedData._lineName =  rdr["lineName"].ToString();
                    dailyIssuedData._cell =  rdr["cell"].ToString();
                    dailyIssuedData._minStock =  rdr["minStock"].ToString();
                    dailyIssuedData._nowStock =  rdr["nowStock"].ToString();
                    dailyIssuedData._reason =  rdr["reason"].ToString();
                    dailyIssuedData._maker =  rdr["maker"].ToString();

                    listDailyIssued.Add(dailyIssuedData);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(listDailyIssued);
            return json;
        }

        public void loadIssuedPartDataDetails()
        {
            //try
            //{

            //    DataTable dt = SPI_DailyIssuedPart.getDailyIssued_PartDetails(txtGoodsCodeIssuedPart.Text.ToString());
            //    if (dt.Rows.Count > 0)
            //    {
            //        txtGoodsNameIssuedPart.Text = dt.Rows[0]["goodsName"].ToString();
            //        //txtGoodsDescIssuedPart.Text = dt.Rows[0]["goodsDesc"].ToString();
            //        txtNowStockIssuedPart.Text = dt.Rows[0]["nowStock"].ToString();
            //        txtUnitPriceOrderPart.Text = dt.Rows[0]["unit_price"].ToString();
            //        txtMinStockIssuedPart.Text = dt.Rows[0]["minStock"].ToString();
            //        txtMinOrderissuedPart.Text = dt.Rows[0]["min_order"].ToString();
            //        //lblUnitPrice.InnerText = "" + dt.Rows[0]["unit_price"].ToString();
            //    }
            //    else
            //    {
            //        txtQtyIssued.Text = "";
            //        //lblQtyOrder.InnerText = "";
            //        //lblUnitPrice.InnerText = "";
            //        //lblTotalPrice.InnerText = "";
            //        //lblUnitPrice.InnerText = "";
            //        txtMinOrderissuedPart.Text = "";
            //        txtGoodsNameIssuedPart.Text = "";
            //        //txtGoodsDescIssuedPart.Text = "";
            //        txtNowStockIssuedPart.Text = "";
            //        txtUnitPriceOrderPart.Text = "";
            //        txtMinStockIssuedPart.Text = "";
            //        //txtMakerOrderPart.Text = "";
            //        txtQtyIssued.Enabled = false;
            //        btnOrder.Enabled = false;
            //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Goods Code tidak ditemukan. Silahkan register part terlebih dahulu.');", true);
            //    }
            //    //txtMakerOrderPart.Text = dt.Rows[0]["maker"].ToString();
            //}
            //catch (Exception ex)
            //{
            //    //lblUnitPrice.InnerText = "";
            //    txtMinOrderissuedPart.Text = "";
            //    txtGoodsNameIssuedPart.Text = "";
            //    //txtGoodsDescIssuedPart.Text = "";
            //    txtNowStockIssuedPart.Text = "";
            //    txtUnitPriceOrderPart.Text = "";
            //    txtMinStockIssuedPart.Text = "";
            //    //txtMakerOrderPart.Text = "";
            //    txtQtyIssued.Enabled = false;
            //    btnOrder.Enabled = false;
            //    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Error. Silahkan hubungi Adminn untuk troubleshoot.');", true);
            //}
        }

        protected void txtGoodsCodeIssuedPart_TextChanged(object sender, EventArgs e)
        {
            //loadIssuedPartDataDetails();
        }

        public void deleteIssuedPart()
        {
            int qtyIssued;
            string goodsCode;
            int nowStock;
            int finalStock;

            //get atau select data issued, untuk mengambil qty dan goodscode nya
            DataTable dt = SPI_DailyIssuedPart.SPI_GetIssuedData(Convert.ToInt32(hdIssuedID.Value));
            qtyIssued = Convert.ToInt32(dt.Rows[0]["qtyIssued"]);
            goodsCode = dt.Rows[0]["goodsCode"].ToString();

            //get atau select data dari database berdasarkan goodsCode yang didapat pada data diatas
            DataTable dt2 = SPI_DatabasePart.checkDatabaseExist(goodsCode);
            nowStock = Convert.ToInt32(dt2.Rows[0]["nowStock"]);

            //bagian untuk delete data issued tersebut berdasarkan id issued
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SPI_deleteIssuedPart", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", hdIssuedID.Value);

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                //buat logic disini jika tidak ada id di database maka bypass
                SqlCommand cmd5 = new SqlCommand("SPI_deletePreOrderQty", cn);
                cmd5.CommandType = CommandType.StoredProcedure;
                cmd5.Parameters.AddWithValue("@id", hdIssuedID.Value);
                cn.Open();
                cmd5.ExecuteNonQuery();
                cn.Close();
                //setelah data berhasil terdelete, lakukan update qty pada database
                try
                {
                    finalStock = qtyIssued + nowStock;
                    SqlCommand com2 = new SqlCommand("SPI_updateDatabaseQty", cn);

                    com2.CommandType = CommandType.StoredProcedure;

                    com2.Parameters.AddWithValue("@goodsCode", goodsCode);
                    com2.Parameters.AddWithValue("@nowStock", finalStock);

                    try
                    {
                        cn.Open();
                        SqlDataReader dr;
                        dr = com2.ExecuteReader();

                        System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Delete Data Issued Part Berhasil. Silahkan lihat Update Qty Terbaru pada Menu Database.');window.location ='dailyissuedpart.aspx';", true);
                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
                    }

                }
                catch
                {

                }

            }
            catch (Exception ex)
            {

            }
            cn.Close();
        }

        public void insertIssuedPart()
        {
            //int nowStock;
            //nowStock = Convert.ToInt32(txtNowStockIssuedPart.Text) - Convert.ToInt32(txtQtyIssued.Text);
            //string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            //SqlConnection con = new SqlConnection(web);
            //SqlCommand com = new SqlCommand("SPI_insertDailyIssuedPart", con);

            //com.CommandType = CommandType.StoredProcedure;

            //com.Parameters.AddWithValue("@goodsCode", txtGoodsCodeIssuedPart.Text);
            //com.Parameters.AddWithValue("@model", ddlModel.Text);
            //com.Parameters.AddWithValue("@qtyIssued", txtQtyIssued.Text);
            //com.Parameters.AddWithValue("@issuedBy_ID", txtIssuedByIssuedPart.Text);
            //com.Parameters.AddWithValue("@issuedDate", DateTime.Now);
            ////com.Parameters.AddWithValue("@minStock", txtMinStockIssuedPart.Text);            
            ////com.Parameters.AddWithValue("@nowStock", nowStock);
            //try
            //{
            //    con.Open();
            //    SqlDataReader dr;
            //    dr = com.ExecuteReader();

            //    con.Close();
            //    con.Open();

            //    SqlCommand com2 = new SqlCommand("[SPI_updateNowStock_PartDatabase]", con);
            //    com2.CommandType = CommandType.StoredProcedure;

            //    com2.Parameters.AddWithValue("@goodsCode", txtGoodsCodeIssuedPart.Text);
            //    com2.Parameters.AddWithValue("@nowStock", nowStock);
            //    dr = com2.ExecuteReader();


            //    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Issued Sparepart berhasil. Silahkan lihat data terbaru pada tabel');", true);
            //    bindData();

            //}
            //catch (Exception ex)
            //{
            //    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Issued Sparepart. Silahkan hubungi admin.');", true);
            //}

            //con.Close();
        }

        protected void txtTanggal_TextChanged(object sender, EventArgs e)
        {
            BindTanggal();
        }

        public void BindTanggal()
        {
            DateTime from, to;
            string fromfix, tofix;
            //from = Convert.ToDateTime(txtTanggal.Text);
            //to = from.AddDays(1);
            //fromfix = from.ToString("yyyy-MM-dd");
            //tofix = to.ToString("yyyy-MM-dd");
            dt = SPI_DailyIssuedPart.getDailyIssued(/*fromfix, tofix*/);
        }

        public void exportExcel()
        {
            if (txtDateFrom.Text == string.Empty || txtDateTo.Text == string.Empty)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Date from atau Date to tidak boleh kosong');", true);
            }
            else
            {
                ExcelPackage.LicenseContext = LicenseContext.Commercial;
                ExcelPackage excel = new ExcelPackage();
                DateTime dateFrom1, dateFrom, dateFrom2, dateTo, dateTo1, dateTo2;
                int diff;
                dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
                dateFrom2 = Convert.ToDateTime(txtDateFrom.Text);
                dateFrom = Convert.ToDateTime(txtDateFrom.Text);
                dateTo = Convert.ToDateTime(txtDateTo.Text);
                dateTo2 = Convert.ToDateTime(txtDateTo.Text);
                dateTo1 = Convert.ToDateTime(txtDateTo.Text);
                dateTo = dateTo.AddDays(1);
                diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);
                var until = diff + 2;
                var fitt = 2 + diff;
                if (diff == 0 || diff < 0)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
                    return;
                }
                else
                {
                    try
                    {
                        for (int i = 0; i <= diff; i++)
                        {
                            if (i == 0)
                            {
                                var workSheet = excel.Workbook.Worksheets.Add("SUMMARY");
                                workSheet.Cells[1, 1].Value = "Daily Issued Part Summary";
                                workSheet.Cells[5, 1].Value = "Model";
                                workSheet.Cells[52, 1].Value = "Model";

                                workSheet.Cells[4, 1].Value = "Qty Summary";
                                workSheet.Cells[51, 1].Value = "Cost Summary";

                                DataTable dt, dt2;
                                int rowCount = 0;
                                int rowCountdt = 0;
                                //looping untuk membuat sheet sesuai tanggal yang dipilih
                                for (int j = 0; j < diff; j++)
                                {
                                    //dateTo2 = dateFrom2.AddDays(1);
                                    dateTo2 = dateFrom2;
                                    dt = SPI_DailyIssuedPart.getDailyIssued_ExportSummary(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
                                    dt2 = SPI_DailyIssuedPart.getDailyIssued_ExportTotalCost(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
                                    rowCount = 5;
                                    rowCountdt = dt.Rows.Count; ;
                                    if (j == 0)
                                    {
                                        for (int k = 0; k < rowCountdt; k++)
                                        {
                                            workSheet.Cells[k + 6, 1].Value = dt.Rows[k]["model"].ToString();
                                            workSheet.Cells[k + 53, 1].Value = dt2.Rows[k]["model"].ToString();
                                        }
                                    }


                                    for (int l = 0; l < rowCountdt; l++)
                                    {
                                        workSheet.Cells[l + 6, 2 + j].Value = dt.Rows[l]["total"];
                                        workSheet.Cells[l + 53, 2 + j].Value = dt2.Rows[l]["total_cost"];
                                    }
                                    for (int fit = 1; fit <= until; fit++)
                                    {
                                        workSheet.Column(fit).AutoFit();
                                    }

                                    workSheet.Cells[5, j + 2].Value = dateFrom2.ToString("yyyy-MM-dd");
                                    workSheet.Cells[52, j + 2].Value = dateFrom2.ToString("yyyy-MM-dd");
                                    dateFrom2 = dateFrom2.AddDays(1);
                                }
                                //total ke samping
                                workSheet.Cells[5, 2 + diff].Value = "Total Qty";
                                workSheet.Cells[6, 2 + diff, 46, 2 + diff].FormulaR1C1 = "=SUM(RC[-" + diff + "]:RC[-1])";

                                workSheet.Cells[52, 2 + diff].Value = "Total Cost";
                                workSheet.Cells[53, 2 + diff, 95, 2 + diff].FormulaR1C1 = "=SUM(RC[-" + diff + "]:RC[-1])";
                                //total ke bawah

                                workSheet.Cells[rowCount+rowCountdt+1, 1].Value = "Total";
                                for (int o = 2; o < diff + 2; o++)
                                {
                                    workSheet.Cells[rowCount + rowCountdt + 1, o, rowCount + rowCountdt + 1, o].FormulaR1C1 = "=SUM(R6C" + o + ":R42C" + o + ")";
                                    workSheet.Cells[94, o, 94, o].FormulaR1C1 = "=SUM(R53C" + o + ":R83C" + o + ")";
                                }

                                workSheet.Cells[94, 1].Value = "Total";

                                workSheet.Row(5).Height = 25;
                                workSheet.Row(5).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                workSheet.Row(5).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                                workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                //workSheet.Column().AutoFit();

                                workSheet.Cells[5, 1, 5, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
                                workSheet.Cells[5, 1, 5, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
                                workSheet.Cells[5, 1, 5, until].Style.Font.Color.SetColor(Color.White);
                                workSheet.Cells[5, 1, 5, until].Style.Font.Bold = true;

                                var colB = workSheet.Cells[5, 1, rowCount + rowCountdt + 1, until];

                                // Assign borders
                                colB.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                                colB.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                                colB.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                                colB.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

                                workSheet.Row(52).Height = 25;
                                workSheet.Row(52).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                workSheet.Row(52).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                                workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                //workSheet.Column().AutoFit();

                                workSheet.Cells[52, 1, 52, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
                                workSheet.Cells[52, 1, 52, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
                                workSheet.Cells[52, 1, 52, until].Style.Font.Color.SetColor(Color.White);
                                workSheet.Cells[52, 1, 52, until].Style.Font.Bold = true;

                                var colc = workSheet.Cells[52, 1, 94, until];

                                // Assign borders
                                colc.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                                colc.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                                colc.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                                colc.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            }
                            else
                            {
                                var workSheet = excel.Workbook.Worksheets.Add(dateFrom.ToString("yyyy-MM-dd"));

                                //dateTo = dateFrom.AddDays(1);
                                dateTo = dateFrom;
                                DataTable dt = SPI_DailyIssuedPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));
                                workSheet.TabColor = System.Drawing.Color.Yellow;
                                workSheet.DefaultRowHeight = 12;
                                workSheet.Row(1).Height = 25;
                                workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                                workSheet.Row(1).Style.Font.Bold = true;

                                workSheet.Cells["A1:P1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                                workSheet.Cells["A1:P1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(79, 98, 40));
                                workSheet.Cells["A1:P1"].Style.Font.Color.SetColor(Color.White);

                                var colA = workSheet.Cells["A1:P100"];

                                // Assign borders
                                colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                                colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                                colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                                colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

                                int rowCount = 1;
                                foreach (DataRow dr in dt.Rows)
                                {
                                    rowCount += 1;
                                    for (int b = 1; b < dt.Columns.Count + 1; b++)
                                    {
                                        // Add the header the first time through 
                                        if (rowCount == 2)
                                        {
                                            workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;

                                        }
                                        workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                    }
                                }
                                for (int j = 1; j <= 20; j++)
                                {
                                    if (j == 8)
                                    {
                                        workSheet.Column(8).Style.Numberformat.Format = "yyyy-MM-dd";
                                    }
                                    workSheet.Cells["A1"].Value = "ID ISSUED";
                                    workSheet.Cells["B1"].Value = "GOODS NAME";
                                    workSheet.Cells["C1"].Value = "GOODS CODE";
                                    workSheet.Cells["D1"].Value = "MODEL";
                                    workSheet.Cells["E1"].Value = "QTY ISSUED";
                                    workSheet.Cells["F1"].Value = "ISSUED BY (ID)";
                                    workSheet.Cells["G1"].Value = "ISSUED BY (NAME)";
                                    workSheet.Cells["H1"].Value = "ISSUED DATE";
                                    workSheet.Cells["I1"].Value = "REASON";
                                    workSheet.Cells["J1"].Value = "LINE NAME";
                                    workSheet.Cells["K1"].Value = "CELL";
                                    workSheet.Cells["L1"].Value = "MAKER";
                                    workSheet.Cells["M1"].Value = "MIN STOCK";
                                    workSheet.Cells["N1"].Value = "NOW STOCK";

                                    workSheet.Cells["P1"].Value = "AMOUNT (USD)";


                                    workSheet.Cells["O1"].Value = "UNIT PRICE (USD)";
                                    workSheet.Cells["N2:O1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                                    workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                    workSheet.Column(j).AutoFit();
                                }
                                dt.Clear();
                                dateFrom = dateFrom.AddDays(1);
                            }


                        }

                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                    }
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
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Daily Issued Part " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }

        }

        //fix export
        //public void exportExcel()
        //{
        //    if (txtDateFrom.Text == string.Empty || txtDateTo.Text == string.Empty)
        //    {
        //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Date from atau Date to tidak boleh kosong');", true);
        //    }
        //    else
        //    {
        //        ExcelPackage.LicenseContext = LicenseContext.Commercial;
        //        ExcelPackage excel = new ExcelPackage();
        //        DateTime dateFrom1, dateFrom, dateFrom2, dateTo, dateTo1, dateTo2;
        //        int diff;
        //        dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
        //        dateFrom2 = Convert.ToDateTime(txtDateFrom.Text);
        //        dateFrom = Convert.ToDateTime(txtDateFrom.Text);
        //        dateTo = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo2 = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo1 = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo = dateTo.AddDays(1);
        //        diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);
        //        var until = diff + 2;
        //        var fitt = 2 + diff;
        //        if (diff == 0 || diff < 0)
        //        {
        //            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
        //            return;
        //        }
        //        else
        //        {
        //            try
        //            {
        //                for (int i = 0; i <= diff; i++)
        //                {
        //                    if (i == 0)
        //                    {
        //                        var workSheet = excel.Workbook.Worksheets.Add("SUMMARY");
        //                        workSheet.Cells[1, 1].Value = "Daily Issued Part Summary";
        //                        workSheet.Cells[5, 1].Value = "Model";
        //                        workSheet.Cells[52, 1].Value = "Model";

        //                        workSheet.Cells[4, 1].Value = "Qty Summary";
        //                        workSheet.Cells[51, 1].Value = "Cost Summary";

        //                        //looping untuk membuat sheet sesuai tanggal yang dipilih
        //                        for (int j = 0; j < diff; j++)
        //                        {
        //                            //dateTo2 = dateFrom2.AddDays(1);
        //                            dateTo2 = dateFrom2;
        //                            DataTable dt = SPI_DailyIssuedPart.getDailyIssued_ExportSummary(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
        //                            DataTable dt2 = SPI_DailyIssuedPart.getDailyIssued_ExportTotalCost(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
        //                            int rowCount = 5;
        //                            int rowCountdt = dt.Rows.Count; ;
        //                            if (j == 0)
        //                            {
        //                                for (int k = 0; k < rowCountdt; k++)
        //                                {
        //                                    workSheet.Cells[k + 6, 1].Value = dt.Rows[k]["model"].ToString();
        //                                    workSheet.Cells[k + 53, 1].Value = dt2.Rows[k]["model"].ToString();
        //                                }
        //                            }


        //                            for (int l = 0; l < rowCountdt; l++)
        //                            {
        //                                workSheet.Cells[l + 6, 2 + j].Value = dt.Rows[l]["total"];
        //                                workSheet.Cells[l + 53, 2 + j].Value = dt2.Rows[l]["total_cost"];
        //                            }
        //                            for (int fit = 1; fit <= until; fit++)
        //                            {
        //                                workSheet.Column(fit).AutoFit();
        //                            }

        //                            workSheet.Cells[5, j + 2].Value = dateFrom2.ToString("yyyy-MM-dd");
        //                            workSheet.Cells[52, j + 2].Value = dateFrom2.ToString("yyyy-MM-dd");
        //                            dateFrom2 = dateFrom2.AddDays(1);
        //                        }
        //                        //total ke samping
        //                        workSheet.Cells[5, 2 + diff].Value = "Total Qty";
        //                        workSheet.Cells[6, 2 + diff, 42, 2 + diff].FormulaR1C1 = "=SUM(RC[-" + diff + "]:RC[-1])";

        //                        workSheet.Cells[52, 2 + diff].Value = "Total Cost";
        //                        workSheet.Cells[53, 2 + diff, 83, 2 + diff].FormulaR1C1 = "=SUM(RC[-" + diff + "]:RC[-1])";
        //                        //total ke bawah

        //                        workSheet.Cells[47, 1].Value = "Total";
        //                        for (int o = 2; o < diff + 2; o++)
        //                        {
        //                            workSheet.Cells[47, o, 47, o].FormulaR1C1 = "=SUM(R6C" + o + ":R42C" + o + ")";
        //                            workSheet.Cells[93, o, 93, o].FormulaR1C1 = "=SUM(R53C" + o + ":R83C" + o + ")";
        //                        }

        //                        workSheet.Cells[93, 1].Value = "Total";

        //                        workSheet.Row(5).Height = 25;
        //                        workSheet.Row(5).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(5).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        //workSheet.Column().AutoFit();

        //                        workSheet.Cells[5, 1, 5, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells[5, 1, 5, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
        //                        workSheet.Cells[5, 1, 5, until].Style.Font.Color.SetColor(Color.White);
        //                        workSheet.Cells[5, 1, 5, until].Style.Font.Bold = true;

        //                        var colB = workSheet.Cells[5, 1, 47, until];

        //                        // Assign borders
        //                        colB.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

        //                        workSheet.Row(52).Height = 25;
        //                        workSheet.Row(52).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(52).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        //workSheet.Column().AutoFit();

        //                        workSheet.Cells[52, 1, 52, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells[52, 1, 52, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
        //                        workSheet.Cells[52, 1, 52, until].Style.Font.Color.SetColor(Color.White);
        //                        workSheet.Cells[52, 1, 52, until].Style.Font.Bold = true;

        //                        var colc = workSheet.Cells[52, 1, 93, until];

        //                        // Assign borders
        //                        colc.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        //                    }
        //                    else
        //                    {
        //                        var workSheet = excel.Workbook.Worksheets.Add(dateFrom.ToString("yyyy-MM-dd"));

        //                        //dateTo = dateFrom.AddDays(1);
        //                        dateTo = dateFrom;
        //                        DataTable dt = SPI_DailyIssuedPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));
        //                        workSheet.TabColor = System.Drawing.Color.Yellow;
        //                        workSheet.DefaultRowHeight = 12;
        //                        workSheet.Row(1).Height = 25;
        //                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Row(1).Style.Font.Bold = true;

        //                        workSheet.Cells["A1:P1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells["A1:P1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(79, 98, 40));
        //                        workSheet.Cells["A1:P1"].Style.Font.Color.SetColor(Color.White);

        //                        var colA = workSheet.Cells["A1:P100"];

        //                        // Assign borders
        //                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

        //                        int rowCount = 1;
        //                        foreach (DataRow dr in dt.Rows)
        //                        {
        //                            rowCount += 1;
        //                            for (int b = 1; b < dt.Columns.Count + 1; b++)
        //                            {
        //                                // Add the header the first time through 
        //                                if (rowCount == 2)
        //                                {
        //                                    workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;

        //                                }
        //                                workSheet.Cells[rowCount, b].Value = dr[b - 1];
        //                            }
        //                        }
        //                        for (int j = 1; j <= 20; j++)
        //                        {
        //                            if (j == 8)
        //                            {
        //                                workSheet.Column(8).Style.Numberformat.Format = "yyyy-MM-dd";
        //                            }
        //                            workSheet.Cells["A1"].Value = "ID ISSUED";
        //                            workSheet.Cells["B1"].Value = "GOODS NAME";
        //                            workSheet.Cells["C1"].Value = "GOODS CODE";
        //                            workSheet.Cells["D1"].Value = "MODEL";
        //                            workSheet.Cells["E1"].Value = "QTY ISSUED";
        //                            workSheet.Cells["F1"].Value = "ISSUED BY (ID)";
        //                            workSheet.Cells["G1"].Value = "ISSUED BY (NAME)";
        //                            workSheet.Cells["H1"].Value = "ISSUED DATE";
        //                            workSheet.Cells["I1"].Value = "REASON";
        //                            workSheet.Cells["J1"].Value = "LINE NAME";
        //                            workSheet.Cells["K1"].Value = "CELL";
        //                            workSheet.Cells["L1"].Value = "MAKER";
        //                            workSheet.Cells["M1"].Value = "MIN STOCK";
        //                            workSheet.Cells["N1"].Value = "NOW STOCK";

        //                            workSheet.Cells["P1"].Value = "AMOUNT (USD)";


        //                            workSheet.Cells["O1"].Value = "UNIT PRICE (USD)";
        //                            workSheet.Cells["N2:O1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
        //                            workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                            workSheet.Column(j).AutoFit();
        //                        }
        //                        dt.Clear();
        //                        dateFrom = dateFrom.AddDays(1);
        //                    }


        //                }

        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
        //            }
        //            catch (Exception ex)
        //            {
        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
        //            }
        //        }
        //        // Append cookie
        //        HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
        //        cookie.Value = "Flag";
        //        cookie.Expires = DateTime.Now.AddDays(1);
        //        Response.AppendCookie(cookie);
        //        // end
        //        using (var memoryStream = new System.IO.MemoryStream())
        //        {
        //            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //            Response.AddHeader("content-disposition", "attachment; filename=SPI Daily Issued Part " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
        //            excel.SaveAs(memoryStream);
        //            memoryStream.WriteTo(Response.OutputStream);
        //            Response.Flush();
        //            Response.End();
        //        }
        //    }

        //}

        //public void exportExcel()
        //{
        //    if (txtDateFrom.Text == string.Empty || txtDateTo.Text == string.Empty)
        //    {
        //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Date from atau Date to tidak boleh kosong');", true);
        //    }
        //    else
        //    {
        //        ExcelPackage.LicenseContext = LicenseContext.Commercial;
        //        ExcelPackage excel = new ExcelPackage();
        //        DateTime dateFrom1, dateFrom, dateFrom2, dateTo, dateTo1, dateTo2;
        //        int diff;
        //        dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
        //        dateFrom2 = Convert.ToDateTime(txtDateFrom.Text);
        //        dateFrom = Convert.ToDateTime(txtDateFrom.Text);
        //        dateTo = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo2 = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo1 = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo = dateTo.AddDays(1);
        //        diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);
        //        var until = diff + 2;
        //        var fitt = 2 + diff;
        //        if (diff == 0 || diff < 0)
        //        {
        //            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
        //            return;
        //        }
        //        else
        //        {
        //            try
        //            {
        //                for (int i = 0; i <= diff; i++)
        //                {
        //                    if (i == 0)
        //                    {
        //                        var workSheet = excel.Workbook.Worksheets.Add("SUMMARY");
        //                        workSheet.Cells[1, 1].Value = "Daily Issued Part Summary";
        //                        workSheet.Cells[5, 1].Value = "Model";
        //                        workSheet.Cells[46, 1].Value = "Model";

        //                        workSheet.Cells[4, 1].Value = "Qty Summary";
        //                        workSheet.Cells[45, 1].Value = "Cost Summary";

        //                        //looping untuk membuat sheet sesuai tanggal yang dipilih
        //                        for (int j = 0; j < diff; j++)
        //                        {
        //                            //dateTo2 = dateFrom2.AddDays(1);
        //                            dateTo2 = dateFrom2;
        //                            DataTable dt = SPI_DailyIssuedPart.getDailyIssued_ExportSummary(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
        //                            DataTable dt2 = SPI_DailyIssuedPart.getDailyIssued_ExportTotalCost(dateFrom2.ToString("yyyy-MM-dd"), dateTo2.ToString("yyyy-MM-dd"));
        //                            int rowCount = 5;
        //                            int rowCountdt = dt.Rows.Count; ;
        //                            if (j == 0)
        //                            {
        //                                for (int k = 0; k < rowCountdt; k++)
        //                                {
        //                                    workSheet.Cells[k + 6, 1].Value = dt.Rows[k]["model"].ToString();
        //                                    workSheet.Cells[k + 47, 1].Value = dt2.Rows[k]["model"].ToString();
        //                                }
        //                            }


        //                            for (int l = 0; l < rowCountdt; l++)
        //                            {
        //                                workSheet.Cells[l + 6, 2+j].Value = dt.Rows[l]["total"];
        //                                workSheet.Cells[l + 47, 2 + j].Value = dt2.Rows[l]["total_cost"];
        //                            }
        //                            for(int fit = 1; fit <= until; fit++)
        //                            {
        //                                workSheet.Column(fit).AutoFit();
        //                            }

        //                            workSheet.Cells[5,j+2].Value = dateFrom2.ToString("yyyy-MM-dd");
        //                            workSheet.Cells[46, j + 2].Value = dateFrom2.ToString("yyyy-MM-dd");
        //                            dateFrom2 = dateFrom2.AddDays(1);
        //                        }
        //                        //total ke samping
        //                        workSheet.Cells[5, 2 + diff].Value ="Total Qty";      
        //                        workSheet.Cells[6, 2 + diff,42,2+diff].FormulaR1C1 = "=SUM(RC[-"+diff+"]:RC[-1])";

        //                        workSheet.Cells[46, 2 + diff].Value = "Total Cost";
        //                        workSheet.Cells[47, 2 + diff, 83, 2 + diff].FormulaR1C1 = "=SUM(RC[-" + diff + "]:RC[-1])";
        //                        //total ke bawah

        //                        workSheet.Cells[43, 1].Value = "Total";
        //                        for(int o = 2; o < diff + 2; o++)
        //                        {
        //                            workSheet.Cells[43, o, 43, o].FormulaR1C1 = "=SUM(R6C"+o+":R42C"+o+")";
        //                            workSheet.Cells[84, o, 84, o].FormulaR1C1 = "=SUM(R47C" + o + ":R83C" + o + ")";
        //                        }

        //                        workSheet.Cells[84, 1].Value = "Total";

        //                        workSheet.Row(5).Height = 25;
        //                        workSheet.Row(5).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(5).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        //workSheet.Column().AutoFit();

        //                        workSheet.Cells[5, 1, 5, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells[5, 1, 5, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
        //                        workSheet.Cells[5, 1, 5, until].Style.Font.Color.SetColor(Color.White);
        //                        workSheet.Cells[5, 1, 5, until].Style.Font.Bold = true;

        //                        var colB = workSheet.Cells[5,1,43,until];

        //                        // Assign borders
        //                        colB.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colB.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

        //                        workSheet.Row(46).Height = 25;
        //                        workSheet.Row(46).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(46).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Cells["b6:AB1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        //workSheet.Column().AutoFit();

        //                        workSheet.Cells[46, 1, 46, until].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells[46, 1, 46, until].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(82, 82, 82));
        //                        workSheet.Cells[46, 1, 46, until].Style.Font.Color.SetColor(Color.White);
        //                        workSheet.Cells[46, 1, 46, until].Style.Font.Bold = true;

        //                        var colc = workSheet.Cells[46, 1, 84, until];

        //                        // Assign borders
        //                        colc.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colc.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        //                    }
        //                    else
        //                    {
        //                        var workSheet = excel.Workbook.Worksheets.Add(dateFrom.ToString("yyyy-MM-dd"));

        //                        //dateTo = dateFrom.AddDays(1);
        //                        dateTo = dateFrom;
        //                        DataTable dt = SPI_DailyIssuedPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));
        //                        workSheet.TabColor = System.Drawing.Color.Yellow;
        //                        workSheet.DefaultRowHeight = 12;
        //                        workSheet.Row(1).Height = 25;
        //                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                        workSheet.Row(1).Style.Font.Bold = true;

        //                        workSheet.Cells["A1:P1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                        workSheet.Cells["A1:P1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(79, 98, 40));
        //                        workSheet.Cells["A1:P1"].Style.Font.Color.SetColor(Color.White);

        //                        var colA = workSheet.Cells["A1:P100"];

        //                        // Assign borders
        //                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

        //                        int rowCount = 1;
        //                        foreach (DataRow dr in dt.Rows)
        //                        {
        //                            rowCount += 1;
        //                            for (int b = 1; b < dt.Columns.Count + 1; b++)
        //                            {
        //                                // Add the header the first time through 
        //                                if (rowCount == 2)
        //                                {
        //                                    workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;

        //                                }
        //                                workSheet.Cells[rowCount, b].Value = dr[b - 1];
        //                            }
        //                        }
        //                        for (int j = 1; j <= 20; j++)
        //                        {
        //                            if (j == 8)
        //                            {
        //                                workSheet.Column(8).Style.Numberformat.Format = "yyyy-MM-dd";
        //                            }
        //                            workSheet.Cells["A1"].Value = "ID ISSUED";
        //                            workSheet.Cells["B1"].Value = "GOODS NAME";
        //                            workSheet.Cells["C1"].Value = "GOODS CODE";
        //                            workSheet.Cells["D1"].Value = "MODEL";
        //                            workSheet.Cells["E1"].Value = "QTY ISSUED";
        //                            workSheet.Cells["F1"].Value = "ISSUED BY (ID)";
        //                            workSheet.Cells["G1"].Value = "ISSUED BY (NAME)";
        //                            workSheet.Cells["H1"].Value = "ISSUED DATE";
        //                            workSheet.Cells["I1"].Value = "REASON";
        //                            workSheet.Cells["J1"].Value = "LINE NAME";
        //                            workSheet.Cells["K1"].Value = "CELL";
        //                            workSheet.Cells["L1"].Value = "MAKER";
        //                            workSheet.Cells["M1"].Value = "MIN STOCK";
        //                            workSheet.Cells["N1"].Value = "NOW STOCK";

        //                            workSheet.Cells["P1"].Value = "AMOUNT (USD)";


        //                            workSheet.Cells["O1"].Value = "UNIT PRICE (USD)";
        //                            workSheet.Cells["N2:O1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
        //                            workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                            workSheet.Column(j).AutoFit();
        //                        }
        //                        dt.Clear();
        //                        dateFrom = dateFrom.AddDays(1);
        //                    }


        //                }

        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
        //            }
        //            catch (Exception ex)
        //            {
        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
        //            }
        //        }
        //        // Append cookie
        //        HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
        //        cookie.Value = "Flag";
        //        cookie.Expires = DateTime.Now.AddDays(1);
        //        Response.AppendCookie(cookie);
        //        // end
        //        using (var memoryStream = new System.IO.MemoryStream())
        //        {
        //            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //            Response.AddHeader("content-disposition", "attachment; filename=SPI Daily Issued Part " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
        //            excel.SaveAs(memoryStream);
        //            memoryStream.WriteTo(Response.OutputStream);
        //            Response.Flush();
        //            Response.End();
        //        }
        //    }

        //}

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportExcel();
        }


     

        protected void txtIssuedByIssuedPart_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtGoodsCodeOrGoodsName_TextChanged(object sender, EventArgs e)
        {

            //StringBuilder sb = new StringBuilder();
            //try
            //{
            //    if (ddlGoodsCodeOrGoodsName.Text == "Goods Code")
            //    {
            //        dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsCode(txtGoodsCodeOrGoodsName.Text.ToString());
            //    }
            //    else
            //    {

            //        dtTop3 = SPI_DailyIssuedPart.SPI_getTop3Sparepart_GoodsName(txtGoodsCodeOrGoodsName.Text.ToString());
            //    }
            //    if (dtTop3.Rows.Count > 0)
            //    {
            //        sb.AppendLine("<table class=\"table table-sm table-hover\" style=\"font-size: .7rem; font-family: monsterrat; cursor: pointer;\" id=\"tabel3Parts\">");
            //        sb.AppendLine("<thead>");
            //        sb.AppendLine("<tr>");
            //        sb.AppendLine("<th>Name</th>");
            //        sb.AppendLine("<th>Age</th>");
            //        sb.AppendLine("</tr>");
            //        sb.AppendLine("</thead>");
            //        sb.AppendLine("<tfoot>");
            //        sb.AppendLine("<tr>");
            //        sb.AppendLine("<td>Total</td>");
            //        sb.AppendLine("<td>2</td>");
            //        sb.AppendLine("</tr>");
            //        sb.AppendLine("</tfoot>");
            //        sb.AppendLine("<tbody>");
            //        sb.AppendLine("<tr>");
            //        sb.AppendLine("<td>Jane</td>");
            //        sb.AppendLine("<td>45</td>");
            //        sb.AppendLine("</tr>");
            //        sb.AppendLine("<tr>");
            //        sb.AppendLine("<td>John</td>");
            //        sb.AppendLine("<td>20</td>");
            //        sb.AppendLine("</tr>");
            //        sb.AppendLine("</tbody>");
            //        sb.AppendLine("</table>");

            //        lblTable.Text = sb.ToString();
            //        HtmlTableRow tRow = new HtmlTableRow();

            //        HtmlTableCell tb = new HtmlTableCell();
            //        for (int i = 0; i < dtTop3.Rows.Count; i++)
            //        {

            //            tb.InnerText = dtTop3.Rows[i][0].ToString();
            //            tRow.Controls.Add(tb);
            //        }

            //        tabel3Parts.Rows.Add(tRow);
            //    }
            //}
            //catch (Exception ex)
            //{

            //}
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int qtyIssued, idIssued;
            string goodsCode;
            int nowStock, newStock, diff;
            int finalStock;

            //get atau select data issued, untuk mengambil qty dan goodscode nya
            DataTable dt = SPI_DailyIssuedPart.SPI_GetIssuedData(Convert.ToInt32(hdIssuedID.Value));
            qtyIssued = Convert.ToInt32(dt.Rows[0]["qtyIssued"]);
            goodsCode = dt.Rows[0]["goodsCode"].ToString();
            idIssued = Convert.ToInt32(hdIssuedID.Value);

            //get atau select data dari database berdasarkan goodsCode yang didapat pada data diatas
            DataTable dt2 = SPI_DatabasePart.checkDatabaseExist(goodsCode);
            nowStock = Convert.ToInt32(dt2.Rows[0]["nowStock"]);
            newStock = Convert.ToInt32(txtQtyIssued.Text);
            //pengecekan stock
            if (newStock > qtyIssued)
            {
                diff = newStock - qtyIssued;
                finalStock = nowStock - diff;
            }
            else
            {
                diff = qtyIssued - newStock;
                finalStock = nowStock + diff;
            }



            //bagian untuk delete data issued tersebut berdasarkan id issued
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";

            try
            {

                SqlConnection cn = new SqlConnection(str);
                SqlCommand com2 = new SqlCommand("SPI_updateDatabaseQty_OnDailyIssuedTable", cn);
                com2.CommandType = CommandType.StoredProcedure;
                com2.Parameters.AddWithValue("@id", idIssued);
                com2.Parameters.AddWithValue("@nowStock", newStock);
                cn.Open();
                com2.ExecuteNonQuery();
                cn.Close();
                SqlCommand com4 = new SqlCommand("SPI_updatePreOrderQty", cn);
                com4.CommandType = CommandType.StoredProcedure;
                com4.Parameters.AddWithValue("@id", idIssued);
                com4.Parameters.AddWithValue("@qty", newStock);
                cn.Open();
                com4.ExecuteNonQuery();
                cn.Close();
                SqlCommand com3 = new SqlCommand("SPI_updateDatabaseQty", cn);
                com3.CommandType = CommandType.StoredProcedure;
                com3.Parameters.AddWithValue("@goodsCode", goodsCode);
                com3.Parameters.AddWithValue("@nowStock", finalStock);
                cn.Open();
                com3.ExecuteNonQuery();
                cn.Close();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Update Data Issued Part Berhasil. Silahkan lihat Update Qty Terbaru pada Menu Database.');window.location ='dailyissuedpart.aspx';", true);
                //Response.Redirect("dailyissuedpart.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}

