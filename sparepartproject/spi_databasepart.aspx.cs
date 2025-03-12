using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.Services;
using OfficeOpenXml;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using OfficeOpenXml.Style;
using Microsoft.Kiota.Abstractions;
using MongoDB.Driver.Core.Configuration;

namespace sparepartproject
{
    public partial class spi_databasepart : System.Web.UI.Page
    {
        public DataTable dt;
        public SqlConnection _con;
        string getUsername;
        string getRole;
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

            //    getRole = login.getrolee(getUsername).ToString();
            //    user.InnerText = finalUser.ToString();

            //    // Periksa apakah pesan error sudah ada di Session
            //    if (Session["ErrorMessage"] == null && getRole != "ADMIN")
            //    {
            //        // Hanya simpan pesan dan redirect jika belum ada pesan error
            //        Session["ErrorMessage"] = "Anda tidak memiliki izin untuk mengakses halaman ini.";
            //        Response.Redirect(Request.RawUrl); // Redirect ke halaman yang sama
            //    }
            //    else
            //    {
            //        getUpdate();
            //    }
            //}
            getUpdate();
        }


        public void bindData()
        {
            dt = SPI_DatabasePart.getDatabasePart();


        }

        public void getUpdate()
        {
            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getLastUpdateDatabaseBy", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    lblUpdate.InnerHtml = "Last Update on " + Convert.ToDateTime(rdr["updateTime"]).ToString("dd - MMM - yyyy   HH:mm:ss") + "<br/> by : " + rdr["updateBy"].ToString() + "<br/> File Name : " + rdr["fileName"].ToString(); ;
                }
            }
        }

        [WebMethod]
        public static string getAllSparepart()
        {
            List<SPI_DatabasePart.DatabaseParts> sparepartlist = new List<SPI_DatabasePart.DatabaseParts>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getDatabasePart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_DatabasePart.DatabaseParts spareapart = new SPI_DatabasePart.DatabaseParts();
                    spareapart._goodsCode = rdr["goodsCode"].ToString();
                    spareapart._goodsName = rdr["goodsName"].ToString();
                    spareapart._maker = rdr["maker"].ToString();
                    spareapart._model = rdr["model"].ToString();
                    //spareapart._rackName = rdr["keeping"].ToString();
                    spareapart._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    spareapart._subKeeping = rdr["subKeeping"].ToString();
                    spareapart._goodsDesc = rdr["goodsDesc"].ToString();
                    //spareapart._minOrder = Convert.ToInt32(rdr["minOrder"]);
                    //spareapart._minStock = Convert.ToInt32(rdr["minStock"]);
                    spareapart._status = rdr["stockCategory"].ToString();

                    sparepartlist.Add(spareapart);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(sparepartlist);
            return json;


        }

        [WebMethod]
        public static string getAllSparepartMinimumStock()
        {
            List<SPI_DatabasePart.DatabasePartsMinimumStock> sparepartlist = new List<SPI_DatabasePart.DatabasePartsMinimumStock>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getDatabasePart_MinimumStock", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_DatabasePart.DatabasePartsMinimumStock sparepartMinStck = new SPI_DatabasePart.DatabasePartsMinimumStock();
                    sparepartMinStck._goodsCode_minimumStock = rdr["goodsCode"].ToString();
                    sparepartMinStck._goodsName_minimumStock = rdr["goodsName"].ToString();
                    sparepartMinStck._maker_minimumStock = rdr["maker"].ToString();
                    sparepartMinStck._model_minimumStock = rdr["model"].ToString();
                    sparepartMinStck._rackName_minimumStock = rdr["keeping"].ToString();
                    sparepartMinStck._minStock_minimumStock = Convert.ToInt32(rdr["minStock"]);
                    sparepartMinStck._nowStock_minimumStock = Convert.ToInt32(rdr["nowStock"]);
                    sparepartMinStck._minOrder_minimumStock = Convert.ToInt32(rdr["minOrder"]);
                    sparepartMinStck._status_minimumStock = rdr["stockCategory"].ToString();

                    sparepartlist.Add(sparepartMinStck);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(sparepartlist);
            return json;
        }


        [WebMethod]
        public static string getAllSparepartZeroStock()
        {
            List<SPI_DatabasePart.DatabasePartsZeroStock> sparepartlistZero = new List<SPI_DatabasePart.DatabasePartsZeroStock>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SPI_getDatabasePart_ZeroStock", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    SPI_DatabasePart.DatabasePartsZeroStock sparepartZeroStck = new SPI_DatabasePart.DatabasePartsZeroStock();
                    sparepartZeroStck._goodsCode_zeroStock = rdr["goodsCode"].ToString();
                    sparepartZeroStck._goodsName_zeroStock = rdr["goodsName"].ToString();
                    sparepartZeroStck._maker_zeroStock = rdr["maker"].ToString();
                    sparepartZeroStck._model_zeroStock = rdr["model"].ToString();
                    sparepartZeroStck._rackName_zeroStock = rdr["keeping"].ToString();
                    sparepartZeroStck._minStock_zeroStock = Convert.ToInt32(rdr["minStock"]);
                    sparepartZeroStck._nowStock_zeroStock = Convert.ToInt32(rdr["nowStock"]);
                    sparepartZeroStck._minOrder_zeroStock = Convert.ToInt32(rdr["minOrder"]);
                    sparepartZeroStck._status_zeroStock = rdr["stockCategory"].ToString();

                    sparepartlistZero.Add(sparepartZeroStck);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(sparepartlistZero);
            return json;
        }

        public void delete()
        {
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SPI_deleteDatabasePart", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch (Exception ex)
            {

            }
        }
        //public void upload()
        //{
        //    if (IsPostBack && Upload.HasFile)
        //    {
        //        if (Path.GetExtension(Upload.FileName).Equals(".xlsx"))
        //        {
        //            try
        //            {
        //                delete();

        //                DataTable dtUpdateUpload = new DataTable();
        //                dtUpdateUpload.Columns.Add("id");
        //                dtUpdateUpload.Columns.Add("fileName");
        //                dtUpdateUpload.Columns.Add("updateTime");
        //                dtUpdateUpload.Columns.Add("updateBy");

        //                var excel = new ExcelPackage(Upload.FileContent);
        //                var dt = excel.SPI_File_ToDataTable();
        //                var table = "SPI_DatabasePart";
        //                using (var conn = new SqlConnection(@"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;uid=sa;password=Itmaintenance4!;"))
        //                {
        //                    var bulkCopy = new SqlBulkCopy(conn);
        //                    bulkCopy.DestinationTableName = table;
        //                    conn.Open();
        //                    var schema = conn.GetSchema("Columns", new[] { null, null, table, null });
        //                    foreach (DataColumn sourceColumn in dt.Columns)
        //                    {
        //                        if (sourceColumn.ColumnName == "lastUpdateDate")
        //                        {

        //                        }
        //                        else
        //                        if (sourceColumn.ColumnName == "insert_date")
        //                        {

        //                        }
        //                        else
        //                        {
        //                            foreach (DataRow row in schema.Rows)
        //                            {
        //                                if (string.Equals(sourceColumn.ColumnName, (string)row["COLUMN_NAME"], StringComparison.OrdinalIgnoreCase))
        //                                {
        //                                    bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, (string)row["COLUMN_NAME"]);
        //                                    break;
        //                                }
        //                            }
        //                        }
        //                    }
        //                    bulkCopy.WriteToServer(dt);
        //                    bulkCopy.ColumnMappings.Clear();
        //                    DataRow _ravi = dtUpdateUpload.NewRow();
        //                    _ravi["id"] = null;
        //                    _ravi["fileName"] = Upload.FileName.ToString();
        //                    _ravi["updateTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        //                    _ravi["updateBy"] = user.InnerText.ToString();

        //                    dtUpdateUpload.Rows.Add(_ravi);

        //                    foreach (DataColumn col in dtUpdateUpload.Columns)
        //                    {
        //                        bulkCopy.ColumnMappings.Add(col.ColumnName, col.ColumnName);
        //                    }
        //                    bulkCopy.BulkCopyTimeout = 600;
        //                    bulkCopy.DestinationTableName = "SPI_UpdateDatabaseTime";

        //                    bulkCopy.WriteToServer(dtUpdateUpload);
        //                    bulkCopy.ColumnMappings.Clear();
        //                    System.Threading.Thread.Sleep(2000);
        //                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Upload berhasil. Silahkan lihat data pada table');", true);
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
        //                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Cannot Delete Exception Message: " + ex.Message.Replace("'", "").Replace("\"", "") + "');", true);
        //                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Cannot Delete Exception Message: " + ex.Message.Replace("'", "").Replace("\"", "") + "');", true);
        //            }
        //        }
        //        else
        //        {
        //            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File salah, mohon periksa kembali file Anda.');", true);
        //            return;
        //        }
        //    }
        //    else
        //    {


        //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File kosong, mohon pilih file terlebih dahulu.');", true);
        //    }
        //}

        public void upload()
        {
            if (IsPostBack && Upload.HasFile)
            {
                if (Path.GetExtension(Upload.FileName).Equals(".xlsx", StringComparison.OrdinalIgnoreCase))
                {
                    try
                    {
                        delete();

                        DataTable dtUpdateUpload = new DataTable();
                        dtUpdateUpload.Columns.Add("fileName");
                        dtUpdateUpload.Columns.Add("updateTime");
                        dtUpdateUpload.Columns.Add("updateBy");

                        var excel = new ExcelPackage(Upload.FileContent);
                        var dt = excel.SPI_File_ToDataTable();

                        // Pembersihan data di Excel
                        CleanData(dt);

                        var table = "SPI_DatabasePart";
                        using (var conn = new SqlConnection(@"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;uid=sa;password=Itmaintenance4!;"))
                        {
                            conn.Open();

                            // Bulk copy untuk SPI_DatabasePart
                            using (var bulkCopy = new SqlBulkCopy(conn))
                            {
                                bulkCopy.DestinationTableName = table;

                                // Mendapatkan schema tabel
                                var schema = conn.GetSchema("Columns", new[] { null, null, table, null });

                                List<string> schemaColumns = new List<string>();
                                foreach (DataRow row in schema.Rows)
                                {
                                    schemaColumns.Add(row["COLUMN_NAME"].ToString());
                                }

                                // Menambahkan pemetaan kolom antara DataTable dan Tabel di Database
                                foreach (DataColumn sourceColumn in dt.Columns)
                                {
                                    if (sourceColumn.ColumnName == "lastUpdateDate" || sourceColumn.ColumnName == "insert_date")
                                    {
                                        // Skip kolom yang tidak perlu
                                        continue;
                                    }

                                    // Pastikan kolom tersebut ada di schema
                                    if (schemaColumns.Contains(sourceColumn.ColumnName))
                                    {
                                        bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, sourceColumn.ColumnName);
                                    }
                                    else
                                    {
                                        // Debugging: Tampilkan kolom yang tidak ditemukan
                                        Console.WriteLine($"Column '{sourceColumn.ColumnName}' not found in schema.");
                                    }
                                }

                                // Memasukkan data ke dalam database menggunakan BulkCopy
                                bulkCopy.WriteToServer(dt);
                            }

                            // Memasukkan informasi upload ke dalam tabel lain (SPI_UpdateDatabaseTime)
                            DataRow _ravi = dtUpdateUpload.NewRow();
                            _ravi["fileName"] = Upload.FileName;
                            _ravi["updateTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            _ravi["updateBy"] = A1.InnerText.ToString();

                            dtUpdateUpload.Rows.Add(_ravi);

                            // Bulk copy untuk SPI_UpdateDatabaseTime
                            using (var bulkCopyUpdate = new SqlBulkCopy(conn))
                            {
                                bulkCopyUpdate.DestinationTableName = "SPI_UpdateDatabaseTime";

                                // Menambahkan pemetaan kolom untuk SPI_UpdateDatabaseTime
                                foreach (DataColumn col in dtUpdateUpload.Columns)
                                {
                                    bulkCopyUpdate.ColumnMappings.Add(col.ColumnName, col.ColumnName);
                                }

                                // Menulis data ke SPI_UpdateDatabaseTime
                                bulkCopyUpdate.WriteToServer(dtUpdateUpload);
                            }

                            // Beri jeda sebelum menampilkan alert
                            System.Threading.Thread.Sleep(2000);
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Upload berhasil. Silahkan lihat data pada table');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                    }
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File salah, mohon periksa kembali file Anda.');", true);
                    return;
                }
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('File kosong, mohon pilih file terlebih dahulu.');", true);
            }
        }


        // Fungsi untuk membersihkan data dari karakter kontrol yang tidak valid
        public void CleanData(DataTable dt)
        {
            foreach (DataColumn column in dt.Columns)
            {
                // Menghapus karakter non-printable atau karakter kontrol
                foreach (DataRow row in dt.Rows)
                {
                    row[column] = CleanString(row[column].ToString());
                }
            }
        }

        // Fungsi untuk membersihkan karakter kontrol
        public string CleanString(string input)
        {
            return new string(input.Where(c => !char.IsControl(c)).ToArray());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            upload();
            //bindData();
            getUpdate();
        }

        protected void btnInsertDataOnebyOne_Click(object sender, EventArgs e)
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            DataTable dt = SPI_DatabasePart.checkDatabaseExist(txtGoodsCodeOnebyOne.Text.ToString());
            if (dt.Rows.Count > 0)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('SPI Goods Code " + txtGoodsCodeOnebyOne.Text + " sudah digunakan.');", true);
            }
            else
            {
                SqlCommand com = new SqlCommand("SPI_insertDatabasePart", con);

                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@goodsCode", txtGoodsCodeOnebyOne.Text);
                com.Parameters.AddWithValue("@goodsName", txtGoodsNameOneByOne.Text);
                com.Parameters.AddWithValue("@goodsDesc", txtGoodsDescOneByOne.Text);
                com.Parameters.AddWithValue("@currency", txtCurrencyOneByOne.Text);
                com.Parameters.AddWithValue("@goodsUnit", txtGoodsUnitOneByOne.Text);
                com.Parameters.AddWithValue("@unitPrice", txtUnitPriceOneByOne.Text);
                com.Parameters.AddWithValue("@maker", txtMakerOneByOne.Text);
                com.Parameters.AddWithValue("@minOrder", txtMinimumOrderOneByOne.Text);
                com.Parameters.AddWithValue("@model", txtModelOneByOne.Text);
                com.Parameters.AddWithValue("@suppName", txtSupplierNameOneByOne.Text);
                com.Parameters.AddWithValue("@rackName", txtRackNameOneByOne.Text);
                com.Parameters.AddWithValue("@maxStock", txtMaximumStockOneByOne.Text);
                com.Parameters.AddWithValue("@minStock", txtMinimumStockOneByOne.Text);
                com.Parameters.AddWithValue("@nowStock", txtNowStockOneByOne.Text);
                com.Parameters.AddWithValue("@stockCategory", txtStockCategoryOneByOne.Text);
                com.Parameters.AddWithValue("@lineCell", txtLineCellOneByOne.Text);
                com.Parameters.AddWithValue("@lastUpdateBy", A1.InnerText);
                try
                {
                    con.Open();
                    SqlDataReader dr;
                    dr = com.ExecuteReader();

                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Upload data berhasil. Silahkan lihat data terbaru pada tabel');", true);
                    bindData();
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal upload. Silahkan hubungi admin.');", true);
                }

                con.Close();

            }
        }

        protected void btnOrderfromDatabase_Click(object sender, EventArgs e)
        {
            var a = tab_content.Value;

            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');
            string goodsCode = hdGoodsCode.Value;
            if (items[3] == "SPAREPART")
            {
                DataTable dt = SPI_OrderPart.SPI_checkGoodsCode_PreOrderPart(goodsCode);
                if (dt.Rows.Count > 0)
                {
                    //disni harusnya update qty pre order part jika sudah ada auto order sebelumnya
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Order Sparepart, Data Order Sudah Ada.');", true);
                }
                else
                {
                    ORDERFROMDB();
                }
            }
            else
            {
                ORDERFROMDB();
            }
        }

        public void exportExcel()
        {

            

            //// Append cookie
            //HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
            //cookie.Value = "Flag";
            //cookie.Expires = DateTime.Now.AddDays(1);
            //Response.AppendCookie(cookie);
            //// end
            //using (var memoryStream = new System.IO.MemoryStream())
            //{
            //    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //    Response.AddHeader("content-disposition", "attachment; filename=SPI Daily Issued Part " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
            //    excel.SaveAs(memoryStream);
            //    memoryStream.WriteTo(Response.OutputStream);
            //    Response.Flush();
            //    Response.End();
            //}


        }

        // Mengambil data dari database SQL Server
        private DataTable GetDataFromDatabase()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection("Data Source=172.16.111.174\\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!;Connection Timeout = 20"))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT * FROM SPI_DatabasePart"; // Ganti dengan query Anda
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    // Tangani error
                    Response.Write("Terjadi kesalahan: " + ex.Message);
                }
            }

            return dt;
        }

        public void ORDERFROMDB()
        {
            var a = tab_content.Value;

            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');

            int ketetapan = items.Length;

            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com4 = new SqlCommand("SPI_insertOrderPart", con);
            string goodsCode = hdGoodsCode.Value;
            com4.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < ketetapan; i += 5)
            {
                com4.Parameters.AddWithValue("@goodsCode", hdGoodsCode.Value);
                com4.Parameters.AddWithValue("@goodsName", txtGoodsCodeOrder.Text.ToString());
                com4.Parameters.AddWithValue("@goodsDesc", txtGoodsCodeOrder.Text.ToString());
                com4.Parameters.AddWithValue("@nowStock", txtGoodsCodeOrder.Text.ToString());
                com4.Parameters.AddWithValue("@minStock", txtMinStockOrder.Text.ToString());
                com4.Parameters.AddWithValue("@minOrder", txtMinOrderOrder.Text.ToString());
                com4.Parameters.AddWithValue("@qtyOrder", items[i]);
                com4.Parameters.AddWithValue("@orderToModel", items[i + 1]);
                com4.Parameters.AddWithValue("@pic", items[i + 2]);
                com4.Parameters.AddWithValue("@typeOrder", "Below Stock");
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
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
                }

                con.Close();
                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Sparepart berhasil. Silahkan lihat data pada Menu Expenses.');window.location ='expenses.aspx';", true);

            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            // Ambil data dari database
            DataTable dt = GetDataFromDatabase();

            if (dt != null && dt.Rows.Count > 0)
            {
                // Set response header untuk file Excel
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=SPI Database Part.xlsx");

                ExcelPackage.LicenseContext = LicenseContext.Commercial;
                //ExcelPackage excel = new ExcelPackage();
                // Gunakan EPPlus untuk membuat Excel
                using (var package = new ExcelPackage())
                {
                    // Buat worksheet baru
                    var worksheet = package.Workbook.Worksheets.Add("Data");

                    // Masukkan data ke worksheet
                    worksheet.Cells["A1"].LoadFromDataTable(dt, true);

                    // Set format untuk lebar kolom otomatis
                    worksheet.Cells.AutoFitColumns();

                    // Kirim file Excel ke response stream
                    Response.BinaryWrite(package.GetAsByteArray());
                    Response.End();
                }
            }
            else
            {
                // Jika data tidak ada
                Response.Write("Tidak ada data untuk diunduh.");
            }
        }
    }
}