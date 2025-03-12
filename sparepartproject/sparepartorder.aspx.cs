using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using OfficeOpenXml.Style;
using System.Drawing;
using System.ComponentModel;
using OfficeOpenXml;
using System.IO;

namespace sparepartproject
{
    public partial class sparepartorder : System.Web.UI.Page
    {
        string getUsername;
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            bindData();
            
        }

        public void loadPartDataDetails()
        {
            try
            {
                DataTable dt = SPI_OrderPart.getDatabasePart_goodsCode(txtGoodsCodeOrderPart.Text.ToString());
                if (dt.Rows.Count > 0)
                {
                    txtGoodsNameOrderPart.Text = dt.Rows[0]["goodsName"].ToString();
                    txtGoodsDescOrderPart.Text = dt.Rows[0]["goodsDesc"].ToString();
                    txtNowStockOrderPart.Text = dt.Rows[0]["nowStock"].ToString();
                    txtUnitPriceOrderPart.Text = dt.Rows[0]["unit_price"].ToString();
                    txtMinStockOrderPart.Text = dt.Rows[0]["minStock"].ToString();
                    txtMinOrderOrderPart2.Text = dt.Rows[0]["min_order"].ToString();
                    //lblUnitPrice.InnerText = "" + dt.Rows[0]["unit_price"].ToString();
                }
                else
                {
                    txtQtyOrder.Text = "";
                    //lblQtyOrder.InnerText = "";
                    ////lblUnitPrice.InnerText = "";
                    //lblTotalPrice.InnerText = "";
                    //lblUnitPrice.InnerText = "";
                    txtMinOrderOrderPart2.Text = "";
                    txtGoodsNameOrderPart.Text = "";
                    txtGoodsDescOrderPart.Text = "";
                    txtNowStockOrderPart.Text = "";
                    txtUnitPriceOrderPart.Text = "";
                    txtMinStockOrderPart.Text = "";
                    //txtMakerOrderPart.Text = "";
                    txtQtyOrder.Enabled = false;
                    btnOrder.Enabled = false;
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Goods Code tidak ditemukan. Silahkan register part terlebih dahulu.');", true);
                }
                //txtMakerOrderPart.Text = dt.Rows[0]["maker"].ToString();
            }
            catch (Exception ex)
            {
                //lblUnitPrice.InnerText = "";
                txtMinOrderOrderPart2.Text = "";
                txtGoodsNameOrderPart.Text = "";
                txtGoodsDescOrderPart.Text = "";
                txtNowStockOrderPart.Text = "";
                txtUnitPriceOrderPart.Text = "";
                txtMinStockOrderPart.Text = "";
                //txtMakerOrderPart.Text = "";
                txtQtyOrder.Enabled = false;
                btnOrder.Enabled = false;
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oops Error. Silahkan hubungi Adminn untuk troubleshoot.');", true);
            }
        }

        protected void txtGoodsCodeOrderPart_TextChanged(object sender, EventArgs e)
        {
            loadPartDataDetails();
        }

        protected void txtQtyOrder_TextChanged(object sender, EventArgs e)
        {
            decimal unitPrice, orderQty, hasil;
            unitPrice = Convert.ToDecimal(txtUnitPriceOrderPart.Text);
            orderQty = Convert.ToDecimal(txtQtyOrder.Text);
            hasil = unitPrice * orderQty;
        }

        public void insertOrder_Part()
        {
            var a = tab_content_manual.Value;

            string[] items = new string[] { "" }; ;
            //somewhere in your code
            items = a.Split(',');

            int ketetapan = items.Length;
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_insertOrderPart", con);

            com.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ketetapan; i += 3)
            {
                com.Parameters.AddWithValue("@goodsCode", txtGoodsCodeOrderPart.Text.ToString());
                com.Parameters.AddWithValue("@goodsName", txtGoodsNameOrderPart.Text);
                com.Parameters.AddWithValue("@goodsDesc", txtGoodsDescOrderPart.Text);
                com.Parameters.AddWithValue("@nowStock", txtNowStockOrderPart.Text);
                com.Parameters.AddWithValue("@minStock", txtMinStockOrderPart.Text);
                com.Parameters.AddWithValue("@minOrder", txtMinOrderOrderPart2.Text);
                com.Parameters.AddWithValue("@qtyOrder", items[i]);
                com.Parameters.AddWithValue("@orderToModel", items[i + 1]);
                try
                {     
                    con.Open();
                    SqlDataReader dr;
                    dr = com.ExecuteReader();

                    con.Close();
                    con.Open();
                    com.Dispose();
                    com.Parameters.Clear();
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
                }
                con.Close();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');window.location ='expenses.aspx';", true);
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            insertOrder_Part();
        }

        public void bindData()
        {
            dt = SPI_OrderPart.getPre_OrderPart();
        }

        protected void btnOrderNow_Click(object sender, EventArgs e)
        {
            var rowValue = row_value.Value;
        }
        public void insertOrder_Part_FromTransaction()
        {
            var a = tab_content.Value;

            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');

            int ketetapan = items.Length;

            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com4 = new SqlCommand("SPI_insertOrderPart", con);

            com4.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ketetapan; i += 5)
            {
                int total, nowStock, qty, MaxStock;
                nowStock = Convert.ToInt32(hdNowStock.Value);
                qty = Convert.ToInt32(items[i]);
                MaxStock = Convert.ToInt32(hdMaxStock.Value);
                total = qty + nowStock;
                if (total > MaxStock)
                {
                    //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart Gagal. Qty Order tidak boleh melebihi Max Stock. Mohon melakukan order ulang.');", true);
                    System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart Gagal. Qty Order tidak boleh melebihi Max Stock. Mohon melakukan order ulang.');window.location ='sparepartorder.aspx';", true);
                }
                else
                {
                    com4.Parameters.AddWithValue("@goodsCode", hdGoodsCode.Value);
                    com4.Parameters.AddWithValue("@goodsName", hdGoodsName.Value);
                    com4.Parameters.AddWithValue("@goodsDesc", hdGoodsDesc.Value);
                    com4.Parameters.AddWithValue("@nowStock", hdNowStock.Value);
                    com4.Parameters.AddWithValue("@minStock", hdMinStock.Value);
                    com4.Parameters.AddWithValue("@minOrder", hdMinOrder.Value);
                    com4.Parameters.AddWithValue("@qtyOrder", items[i]);
                    com4.Parameters.AddWithValue("@orderToModel", items[i + 1]);
                    com4.Parameters.AddWithValue("@pic", items[i + 2]);
                    com4.Parameters.AddWithValue("@typeOrder", "Transaction");
                    com4.Parameters.AddWithValue("@category", items[i + 3]);
                    try
                    {

                        con.Open();
                        SqlDataReader dr;
                        dr = com4.ExecuteReader();
                        con.Close();
                        com4.Dispose();
                        com4.Parameters.Clear();

                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal. Hubungi admin.');", true);
                    }

                    con.Close();

                    //untuk delete data pre order, sebelumnya kode ini diluar perulangan for karena dulunya ada kemungkinan banyak order untuk satu goods code yang sama
                    string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
                    SqlConnection cn2 = new SqlConnection(str);
                    SqlCommand cmd7 = new SqlCommand("[SPI_deletePreOrder]", cn2);
                    cmd7.Parameters.Add("@ID", SqlDbType.Int);
                    cmd7.Parameters["@ID"].Value = hdPreOrderID.Value;
                    cmd7.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        cn2.Open();
                        cmd7.ExecuteNonQuery();
                        cn2.Close();
                        System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');", true);
                    }
                    catch (Exception ex)
                    {

                    }
                    con.Open();
                    bindData();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            insertOrder_Part_FromTransaction();
        }

        public void deletePreOrder()
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_deletePreOrder", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ID", hdPreOrderID.Value);

            try
            {
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Delete Pre Order Data Berhasil');window.location ='sparepartorder.aspx';", true);
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Gagal delete data, mohon hubungi vendor.');window.location ='sparepartorder.aspx';", true);
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            deletePreOrder();
        }

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
        //        DateTime dateFrom1, dateFrom, dateTo, dateTo1;
        //        int diff;
        //        dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
        //        dateFrom = Convert.ToDateTime(txtDateFrom.Text);
        //        dateTo = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo1 = Convert.ToDateTime(txtDateTo.Text);
        //        dateTo = dateTo.AddDays(1);
        //        diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);

        //        if (diff == 0 || diff < 0)
        //        {
        //            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
        //            return;
        //        }
        //        else
        //        {
        //            try
        //            {
        //                for (int i = 1; i <= diff; i++)
        //                {
        //                    var workSheet = excel.Workbook.Worksheets.Add(dateFrom.ToString("yyyy-MM-dd"));

        //                    dateTo = dateFrom.AddDays(1);
        //                    DataTable dt = SPI_DailyIssuedPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));
        //                    workSheet.TabColor = System.Drawing.Color.Yellow;
        //                    workSheet.DefaultRowHeight = 12;
        //                    workSheet.Row(1).Height = 25;
        //                    workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                    workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        //                    workSheet.Row(1).Style.Font.Bold = true;

        //                    workSheet.Cells["A1:O1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
        //                    workSheet.Cells["A1:O1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(79, 98, 40));
        //                    workSheet.Cells["A1:O1"].Style.Font.Color.SetColor(Color.White);

        //                    var colA = workSheet.Cells["A1:O70"];

        //                    // Assign borders
        //                    colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        //                    colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        //                    colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        //                    colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

        //                    int rowCount = 1;
        //                    foreach (DataRow dr in dt.Rows)
        //                    {
        //                        rowCount += 1;
        //                        for (int b = 1; b < dt.Columns.Count + 1; b++)
        //                        {
        //                            // Add the header the first time through 
        //                            if (rowCount == 2)
        //                            {
        //                                workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;

        //                            }
        //                            workSheet.Cells[rowCount, b].Value = dr[b - 1];
        //                        }
        //                    }
        //                    for (int j = 1; j <= 20; j++)
        //                    {
        //                        if (j == 8)
        //                        {
        //                            workSheet.Column(8).Style.Numberformat.Format = "yyyy-MM-dd HH:mm:ss";
        //                        }
        //                        workSheet.Cells["A1"].Value = "ID ISSUED";
        //                        workSheet.Cells["B1"].Value = "GOODS NAME";
        //                        workSheet.Cells["C1"].Value = "GOODS CODE";
        //                        workSheet.Cells["D1"].Value = "MODEL";
        //                        workSheet.Cells["E1"].Value = "QTY ISSUED";
        //                        workSheet.Cells["F1"].Value = "ISSUED BY (ID)";
        //                        workSheet.Cells["G1"].Value = "ISSUED BY (NAME)";
        //                        workSheet.Cells["H1"].Value = "ISSUED DATE";
        //                        workSheet.Cells["I1"].Value = "REASON";
        //                        workSheet.Cells["J1"].Value = "LINE NAME";
        //                        workSheet.Cells["K1"].Value = "CELL";
        //                        workSheet.Cells["L1"].Value = "MIN STOCK";
        //                        workSheet.Cells["M1"].Value = "NOW STOCK";

        //                        workSheet.Cells["O1"].Value = "AMOUNT (USD)";


        //                        workSheet.Cells["N1"].Value = "UNIT PRICE (USD)";
        //                        workSheet.Cells["N2:O1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
        //                        workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //                        workSheet.Column(j).AutoFit();
        //                    }
        //                    dt.Clear();
        //                    dateFrom = dateFrom.AddDays(1);

        //                }

        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
        //            }
        //            catch (Exception ex)
        //            {
        //                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
        //            }
        //        }
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

        public void exportExcel()
        {
            if (txtDateFrom.Text == string.Empty || txtDateTo.Text == string.Empty)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Date from atau Date to tidak boleh kosong');", true);
            }
            else
            {
                ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.Commercial;
                ExcelPackage excel = new ExcelPackage();
                DateTime dateFrom1, dateFrom, dateTo, dateTo1;
                int diff;
                dateFrom1 = Convert.ToDateTime(txtDateFrom.Text);
                dateFrom = Convert.ToDateTime(txtDateFrom.Text);
                dateTo = Convert.ToDateTime(txtDateTo.Text);
                dateTo1 = Convert.ToDateTime(txtDateTo.Text);
                dateTo = dateTo.AddDays(1);
                diff = Convert.ToInt32((dateTo - dateFrom).TotalDays);

                if (diff == 0 || diff < 0)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Pilihan Date From dan Date To tidak sesuai. Mohon Export ulang.');", true);
                    return;
                }
                else
                {
                    try
                    {
                        //for (int i = 1; i <= diff; i++)
                        //{
                        var workSheet = excel.Workbook.Worksheets.Add("Pre Order Part");//(dateFrom.ToString("yyyy-MM-dd"));

                        //dateTo = dateFrom.AddDays(1);
                        DataTable dt = SPI_OrderPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));
                        //DataTable dt = SPI_OrderPart.getDailyIssued_Export(dateFrom.ToString("yyyy-MM-dd"), dateTo.ToString("yyyy-MM-dd"));

                        if (dt.Rows.Count == 0)
                        {
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Tidak ada data yang ditemukan.');", true);
                        }

                        workSheet.TabColor = System.Drawing.Color.Yellow;
                        workSheet.DefaultRowHeight = 12;
                        workSheet.Row(1).Height = 25;
                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        workSheet.Row(1).Style.Font.Bold = true;

                        workSheet.Cells["A1:M1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        workSheet.Cells["A1:M1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(146, 208, 80));
                        workSheet.Cells["A1:M1"].Style.Font.Color.SetColor(Color.DarkBlue);

                        var colA = workSheet.Cells["A1:M200"];

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
                                // Menambahkan header pertama kali pada baris 1
                                if (rowCount == 2)
                                {
                                    workSheet.Cells[1, b].Value = dt.Columns[b - 1].ColumnName;
                                }

                                // Menulis data ke worksheet pada baris berikutnya
                                workSheet.Cells[rowCount, b].Value = dr[b - 1];
                            }
                        }
                        for (int j = 1; j <= 20; j++)
                        {
                            if (j == 8)
                            {
                                //workSheet.Column(11).Style.Numberformat.Format = "yyyy-MM-dd HH:mm:ss";
                            }
                            workSheet.Cells["A1"].Value = "SPI CODE";
                            workSheet.Cells["B1"].Value = "PART CODE";
                            workSheet.Cells["C1"].Value = "PART NAME";
                            workSheet.Cells["D1"].Value = "MAKER";
                            workSheet.Cells["E1"].Value = "MODEL";
                            workSheet.Cells["F1"].Value = "ORDER QTY";
                            workSheet.Cells["G1"].Value = "UNIT PRICE";
                            workSheet.Cells["H1"].Value = "CURRENCY";
                            workSheet.Cells["I1"].Value = "TOTAL";
                            workSheet.Cells["J1"].Value = "STOCK";
                            workSheet.Cells["K1"].Value = "CATEGORY";
                            workSheet.Cells["L1"].Value = "MIN STOCK";
                            workSheet.Cells["M1"].Value = "MAX STOCK";

                            workSheet.Cells["G2:G1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                            workSheet.Cells["I2:I1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                            workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                            workSheet.Column(j).AutoFit();
                            workSheet.Cells["A1:K1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Cells["F2:F1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Cells["A2:A1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Cells["F2:F1000"].Style.Font.Color.SetColor(Color.Red);
                            workSheet.Cells["j2:j1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                            workSheet.Cells["k2:k1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Cells["L2:M1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Cells["L2:M1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            //workSheet.Cells["I2:I1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                        }
                        dt.Clear();
                        dateFrom = dateFrom.AddDays(1);

                        //}

                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                    }
                }
                using (var memoryStream = new System.IO.MemoryStream())
                {
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Pre Order Sparepart " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportExcel();
        }
    }
}