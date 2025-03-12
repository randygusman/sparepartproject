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
using System.Web.Services;

namespace sparepartproject
{
    public partial class expenses : System.Web.UI.Page
    {
        string getUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void Export()
        {
            string b;
            int a;
            string ID = "";

            try
            {
                for (int i = 0; i < gvExpenses.Rows.Count; i++)
                {
                    if ((gvExpenses.Rows[i].FindControl("CheckBox2") as CheckBox) != null && (gvExpenses.Rows[i].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        a = Convert.ToInt32(gvExpenses.Rows[i].Cells[1].Text);
                    }
                }
                gvExpenses.DataBind();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Sukses approve data. Silahkan lihat data di Tab Completed.');", true);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Approve gagal. Silahkan hubungi admin.');", true);
            }
        }

        public void exportToExcel()
        {
            List<string> sheets = new List<string>();
            sheets.Add("LOCAL");
            sheets.Add("OVERSEA");
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();

            var dt = new DataTable();
            dt.Columns.Add("no", typeof(Int32));
            dt.Columns.Add("maker", typeof(string));
            dt.Columns.Add("goodsName", typeof(string));
            dt.Columns.Add("goodsDesc", typeof(string));
            dt.Columns.Add("desc", typeof(string));
            dt.Columns.Add("qtyOrder", typeof(Int32));
            dt.Columns.Add("model", typeof(string));
            dt.Columns.Add("vendor", typeof(string));

            var dt2 = new DataTable();
            dt2.Columns.Add("no", typeof(Int32));
            dt2.Columns.Add("maker", typeof(string));
            dt2.Columns.Add("goodsName", typeof(string));
            dt2.Columns.Add("goodsDesc", typeof(string));
            dt2.Columns.Add("desc", typeof(string));
            dt2.Columns.Add("qtyOrder", typeof(Int32));
            dt2.Columns.Add("model", typeof(string));
            dt2.Columns.Add("vendor", typeof(string));
            var noLocal = 1;
            var noOversea = 1;

            int count = 0;
            for (int g = 0; g < gvExpenses.Rows.Count; g++)
            {
                if ((gvExpenses.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpenses.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                {
                    count += 1;
                }
            }

            if (count == 0)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Mohon pilih data Pre Expenses Part yang akan di Export.');", true);
            }
            else
            {
                for (int g = 0; g < gvExpenses.Rows.Count; g++)
                {
                    if ((gvExpenses.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpenses.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        noLocal = 1;
                        
                        var maker = gvExpenses.Rows[g].Cells[9].Text.ToString();
                        var desc = "";
                        var goodsCode = gvExpenses.Rows[g].Cells[2].Text.ToString();
                        var goodsName = gvExpenses.Rows[g].Cells[1].Text.ToString();
                        var goodsDesc = gvExpenses.Rows[g].Cells[3].Text.ToString();
                        var qty = gvExpenses.Rows[g].Cells[7].Text;
                        var pic = gvExpenses.Rows[g].Cells[10].Text;
                        var category = gvExpenses.Rows[g].Cells[12].Text;
                        var id = gvExpenses.Rows[g].Cells[0].Text;
                        //for find textbox

                        var type = gvExpenses.Rows[g].Cells[13].FindControl("ddlDropDown") as DropDownList;
                        var vendor2 = type.SelectedValue.ToString();
                        var model = gvExpenses.Rows[g].Cells[8].Text;
                        goodsDesc = goodsDesc.ToUpper();
                        goodsName = goodsName.ToUpper();

                        if (vendor2 == "LOCAL")
                        {
                            dt.Rows.Add(noLocal, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noLocal += 1;
                        }
                        else
                        {
                            dt2.Rows.Add(noOversea, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noOversea += 1;
                        }

                        string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(web);
                        SqlCommand com = new SqlCommand("SPI_insertExpensesList", con);
                        com.CommandType = CommandType.StoredProcedure;

                        com.Parameters.AddWithValue("@goodsCode", goodsCode);
                        com.Parameters.AddWithValue("@goodsName", goodsName);
                        com.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        com.Parameters.AddWithValue("@model", model);
                        com.Parameters.AddWithValue("@qtyOrder", qty);
                        com.Parameters.AddWithValue("@pic", pic);
                        com.Parameters.AddWithValue("@category", category);
                        com.Parameters.AddWithValue("@type", vendor2);
                        com.Parameters.AddWithValue("@typePart", "Sparepart");

                        try
                        {
                            //com.Dispose();
                            con.Open();
                            SqlDataReader dr;
                            dr = com.ExecuteReader();


                            SPI_Expenses.updatePreExpenses(Convert.ToInt32(id));

                            con.Close();

                            com.Parameters.Clear();
                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD')", true);

                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD');window.location ='expenses.aspx';", true);

                        }
                        catch (Exception ex)
                        {
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Export. Silahkan hubungi admin.');", true);
                        }

                    }

                }

                try
                {
                    for (int i = 0; i <= 1; i++)
                    {
                        var workSheet = excel.Workbook.Worksheets.Add(sheets[i].ToString());
                        workSheet.TabColor = System.Drawing.Color.Yellow;
                        workSheet.DefaultRowHeight = 12;
                        workSheet.Row(1).Height = 15;
                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Row(1).Style.Font.Bold = true;
                        workSheet.Cells["A1:A1"].Value = "No.";
                        workSheet.Cells["B1:B1"].Value = "Brand";
                        workSheet.Cells["C1:C1"].Value = "Part Code";
                        workSheet.Cells["D1:D1"].Value = "Description Name";
                        workSheet.Cells["E1:E1"].Value = "Specification";
                        workSheet.Cells["F1:F1"].Value = "Quantity";
                        workSheet.Cells["G1:G1"].Value = "Remarks";
                        workSheet.Cells["A1:G1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        workSheet.Cells["A1:G1"].Style.Fill.BackgroundColor.SetColor(0, 169, 208, 142);
                        workSheet.Column(1).Width = 17;

                        int rowCountExcel = 2;
                        int colcountExcel = 2;
                        int colcountdt = 0;


                        int rowCount = 1;
                        int rowCountOVERSEA = 1;
                        if (i == 0)
                        {
                            foreach (DataRow dr in dt.Rows)
                            {
                                rowCount += 1;
                                for (int b = 1; b < dt.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                }
                            }
                        }
                        else
                        {
                            foreach (DataRow dr in dt2.Rows)
                            {
                                rowCountOVERSEA += 1;
                                for (int b = 1; b < dt2.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCountOVERSEA, b].Value = dr[b - 1];
                                }
                            }
                        }

                        for (int j = 1; j <= 7; j++)
                        {
                            workSheet.Column(j).AutoFit();
                        }
                        workSheet.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        //workSheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                        var colA = workSheet.Cells["A1:G30"];

                        // Assign borders
                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        excel.Workbook.Worksheets[i].View.ShowGridLines = false;
                        workSheet.Cells["A1:G1"].AutoFilter = true;
                    }
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                }

                using (var memoryStream = new System.IO.MemoryStream())
                {
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Pre Expenses Sparepart Order.xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    //Response.AddHeader("Downloading File...", "3; url=expenses.aspx");
                    Response.Flush();
                    Response.End();

                }
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportToExcel();
            
        }


        [WebMethod]
        public static void insertManualOrder(string goodsName, string goodsDesc, string maker, string qty, string model, string pic, string category, string typePart)//ambil plan qty dari table awal, masukkan ke URL parameter
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_insertManualOrderPart_Expenses", con);

            com.CommandType = CommandType.StoredProcedure;


            com.Parameters.AddWithValue("@goodsName", goodsName);
            com.Parameters.AddWithValue("@goodsDesc", goodsDesc);
            com.Parameters.AddWithValue("@maker", maker);
            com.Parameters.AddWithValue("@qty", qty);
            com.Parameters.AddWithValue("@model", model);
            com.Parameters.AddWithValue("@pic", pic);
            com.Parameters.AddWithValue("@category", category);
            com.Parameters.AddWithValue("@typePart", typePart);

            try
            {
                com.Dispose();
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                com.Parameters.Clear();
            }
            catch (Exception ex)
            {

            }
        }


        public void insertManualO_rder()
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_insertManualOrderPart_Expenses", con);

            com.CommandType = CommandType.StoredProcedure;

            ////com.Parameters.AddWithValue("@goodsName", txtPartName.Text.ToString());
            ////com.Parameters.AddWithValue("@goodsDesc", txtGoodsDesc.Text);
            ////com.Parameters.AddWithValue("@maker", txtMaker.Text);
            ////com.Parameters.AddWithValue("@vendor", ddlVendor.Text.ToString());
            //com.Parameters.AddWithValue("@unit", txtQty.Text);
            //com.Parameters.AddWithValue("@qty", txtQty.Text);
            //com.Parameters.AddWithValue("@model", ddlModel.Text);
            //com.Parameters.AddWithValue("@pic", txtPIC.Text);
            //com.Parameters.AddWithValue("@category", ddlCategory.Text.ToString());
            //com.Parameters.AddWithValue("@typePart", ddlModel.Text);

            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Order Part Berhasil. Silahkan lihat data pada Tabel.');window.location ='expenses.aspx';", true);
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Order. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            //insertManualOrder();
        }


        public void exportToExcel_Activity()
        {
            List<string> sheets = new List<string>();
            sheets.Add("LOCAL");
            sheets.Add("OVERSEA");
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();

            var dt = new DataTable();
            dt.Columns.Add("no", typeof(Int32));
            dt.Columns.Add("maker", typeof(string));
            dt.Columns.Add("goodsName", typeof(string));
            dt.Columns.Add("goodsDesc", typeof(string));
            dt.Columns.Add("desc", typeof(string));
            dt.Columns.Add("qtyOrder", typeof(Int32));
            dt.Columns.Add("model", typeof(string));
            dt.Columns.Add("vendor", typeof(string));

            var dt2 = new DataTable();
            dt2.Columns.Add("no", typeof(Int32));
            dt2.Columns.Add("maker", typeof(string));
            dt2.Columns.Add("goodsName", typeof(string));
            dt2.Columns.Add("goodsDesc", typeof(string));
            dt2.Columns.Add("desc", typeof(string));
            dt2.Columns.Add("qtyOrder", typeof(Int32));
            dt2.Columns.Add("model", typeof(string));
            dt2.Columns.Add("vendor", typeof(string));
            var noLocal = 1;
            var noOversea = 1;

            int count = 0;
            for (int g = 0; g < gvExpenses_Activity.Rows.Count; g++)
            {
                if ((gvExpenses_Activity.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpenses_Activity.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                {
                    count += 1;
                }
            }

            if (count == 0)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Mohon pilih data Pre Expenses Part yang akan di Export.');", true);
            }
            else
            {
                for (int g = 0; g < gvExpenses_Activity.Rows.Count; g++)
                {
                    if ((gvExpenses_Activity.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpenses_Activity.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        noLocal = 1;

                        var maker = gvExpenses_Activity.Rows[g].Cells[9].Text.ToString();
                        var desc = "";
                        var goodsCode = gvExpenses_Activity.Rows[g].Cells[2].Text.ToString();
                        var goodsName = gvExpenses_Activity.Rows[g].Cells[1].Text.ToString();
                        var goodsDesc = gvExpenses_Activity.Rows[g].Cells[3].Text.ToString();
                        var qty = gvExpenses_Activity.Rows[g].Cells[7].Text;
                        var pic = gvExpenses_Activity.Rows[g].Cells[10].Text;
                        var category = gvExpenses_Activity.Rows[g].Cells[12].Text;

                        var id = gvExpenses_Activity.Rows[g].Cells[0].Text;
                        //for find textbox

                        var type = gvExpenses_Activity.Rows[g].Cells[13].FindControl("ddlDropDown") as DropDownList;
                        var vendor2 = type.SelectedValue.ToString();
                        var model = gvExpenses_Activity.Rows[g].Cells[8].Text;
                        goodsDesc = goodsDesc.ToUpper();
                        goodsName = goodsName.ToUpper();

                        if (vendor2 == "LOCAL")
                        {
                            dt.Rows.Add(noLocal, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noLocal += 1;
                        }
                        else
                        {
                            dt2.Rows.Add(noOversea, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noOversea += 1;
                        }

                        string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(web);
                        SqlCommand com = new SqlCommand("SPI_insertExpensesList", con);
                        com.CommandType = CommandType.StoredProcedure;

                        com.Parameters.AddWithValue("@goodsCode", goodsCode);
                        com.Parameters.AddWithValue("@goodsName", goodsName);
                        com.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        com.Parameters.AddWithValue("@model", model);
                        com.Parameters.AddWithValue("@qtyOrder", qty);
                        com.Parameters.AddWithValue("@pic", pic);
                        com.Parameters.AddWithValue("@category", category);
                        com.Parameters.AddWithValue("@type", vendor2);
                        com.Parameters.AddWithValue("@typePart", "Activity");

                        try
                        {
                            //com.Dispose();
                            con.Open();
                            SqlDataReader dr;
                            dr = com.ExecuteReader();


                            SPI_Expenses.updatePreExpenses(Convert.ToInt32(id));

                            con.Close();

                            com.Parameters.Clear();
                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD')", true);

                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD');window.location ='expenses.aspx';", true);

                        }
                        catch (Exception ex)
                        {
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Export. Silahkan hubungi admin.');", true);
                        }

                    }

                }

                try
                {
                    for (int i = 0; i <= 1; i++)
                    {
                        var workSheet = excel.Workbook.Worksheets.Add(sheets[i].ToString());
                        workSheet.TabColor = System.Drawing.Color.Yellow;
                        workSheet.DefaultRowHeight = 12;
                        workSheet.Row(1).Height = 15;
                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Row(1).Style.Font.Bold = true;
                        workSheet.Cells["A1:A1"].Value = "No.";
                        workSheet.Cells["B1:B1"].Value = "Brand";
                        workSheet.Cells["C1:C1"].Value = "Part Code";
                        workSheet.Cells["D1:D1"].Value = "Description Name";
                        workSheet.Cells["E1:E1"].Value = "Specification";
                        workSheet.Cells["F1:F1"].Value = "Quantity";
                        workSheet.Cells["G1:G1"].Value = "Remarks";
                        workSheet.Cells["A1:G1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        workSheet.Cells["A1:G1"].Style.Fill.BackgroundColor.SetColor(0, 169, 208, 142);
                        workSheet.Column(1).Width = 17;

                        int rowCountExcel = 2;
                        int colcountExcel = 2;
                        int colcountdt = 0;


                        int rowCount = 1;
                        int rowCountOVERSEA = 1;

                        if (i == 0)
                        {
                            foreach (DataRow dr in dt.Rows)
                            {
                                rowCount += 1;
                                for (int b = 1; b < dt.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                }
                            }
                        }
                        else
                        {
                            foreach (DataRow dr in dt2.Rows)
                            {
                                rowCountOVERSEA += 1;
                                for (int b = 1; b < dt2.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCountOVERSEA, b].Value = dr[b - 1];
                                }
                            }
                        }

                        for (int j = 1; j <= 7; j++)
                        {
                            workSheet.Column(j).AutoFit();
                        }
                        workSheet.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        //workSheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                        var colA = workSheet.Cells["A1:G30"];

                        // Assign borders
                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        excel.Workbook.Worksheets[i].View.ShowGridLines = false;
                        workSheet.Cells["A1:G1"].AutoFilter = true;
                    }
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                }

                using (var memoryStream = new System.IO.MemoryStream())
                {
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Pre Expenses Activity Sparepart Order.xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    //Response.AddHeader("Downloading File...", "3; url=expenses.aspx");
                    Response.Flush();
                    Response.End();

                }
            }
        }

        protected void btnExport_Activity_Click(object sender, EventArgs e)
        {
            exportToExcel_Activity();
        }

        protected void btnSparepartUncountng_Click(object sender, EventArgs e)
        {
            exportToExcel_SparepartUncount();
        }

        public void exportToExcel_SparepartUncount()
        {
            List<string> sheets = new List<string>();
            sheets.Add("LOCAL");
            sheets.Add("OVERSEA");
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();

            var dt = new DataTable();
            dt.Columns.Add("no", typeof(Int32));
            dt.Columns.Add("maker", typeof(string));
            dt.Columns.Add("goodsName", typeof(string));
            dt.Columns.Add("goodsDesc", typeof(string));
            dt.Columns.Add("desc", typeof(string));
            dt.Columns.Add("qtyOrder", typeof(Int32));
            dt.Columns.Add("model", typeof(string));
            dt.Columns.Add("vendor", typeof(string));

            var dt2 = new DataTable();
            dt2.Columns.Add("no", typeof(Int32));
            dt2.Columns.Add("maker", typeof(string));
            dt2.Columns.Add("goodsName", typeof(string));
            dt2.Columns.Add("goodsDesc", typeof(string));
            dt2.Columns.Add("desc", typeof(string));
            dt2.Columns.Add("qtyOrder", typeof(Int32));
            dt2.Columns.Add("model", typeof(string));
            dt2.Columns.Add("vendor", typeof(string));
            var noLocal = 1;
            var noOversea = 1;

            int count = 0;
            for (int g = 0; g < gvExpensesUncountingPart.Rows.Count; g++)
            {
                if ((gvExpensesUncountingPart.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpensesUncountingPart.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                {
                    count += 1;
                }
            }

            if (count == 0)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Mohon pilih data Pre Expenses Part yang akan di Export.');", true);
            }
            else
            {
                for (int g = 0; g < gvExpensesUncountingPart.Rows.Count; g++)
                {
                    if ((gvExpensesUncountingPart.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvExpensesUncountingPart.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        noLocal = 1;

                        var maker = gvExpensesUncountingPart.Rows[g].Cells[9].Text.ToString();
                        var desc = "";
                        var goodsCode = gvExpensesUncountingPart.Rows[g].Cells[2].Text.ToString();
                        var goodsName = gvExpensesUncountingPart.Rows[g].Cells[1].Text.ToString();
                        var goodsDesc = gvExpensesUncountingPart.Rows[g].Cells[3].Text.ToString();
                        var qty = gvExpensesUncountingPart.Rows[g].Cells[7].Text;
                        var pic = gvExpensesUncountingPart.Rows[g].Cells[10].Text;
                        var category = gvExpensesUncountingPart.Rows[g].Cells[12].Text;
                        var id = gvExpensesUncountingPart.Rows[g].Cells[0].Text;
                        var purpose = gvExpensesUncountingPart.Rows[g].Cells[0].Text;
                        //for find textbox

                        var type = gvExpensesUncountingPart.Rows[g].Cells[13].FindControl("ddlDropDown") as DropDownList;
                        var vendor2 = type.SelectedValue.ToString();
                        var model = gvExpensesUncountingPart.Rows[g].Cells[8].Text;
                        goodsDesc = goodsDesc.ToUpper();
                        goodsName = goodsName.ToUpper();

                        if (vendor2 == "LOCAL")
                        {
                            dt.Rows.Add(noLocal, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noLocal += 1;
                        }
                        else
                        {
                            dt2.Rows.Add(noOversea, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noOversea += 1;
                        }

                        string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(web);
                        SqlCommand com = new SqlCommand("SPI_insertExpensesList", con);
                        com.CommandType = CommandType.StoredProcedure;

                        com.Parameters.AddWithValue("@goodsCode", goodsCode);
                        com.Parameters.AddWithValue("@goodsName", goodsName);
                        com.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        com.Parameters.AddWithValue("@model", model);
                        com.Parameters.AddWithValue("@qtyOrder", qty);
                        com.Parameters.AddWithValue("@pic", pic);
                        com.Parameters.AddWithValue("@category", category);
                        com.Parameters.AddWithValue("@type", vendor2);
                        com.Parameters.AddWithValue("@typePart", "Uncounting Sparepart");

                        try
                        {
                            //com.Dispose();
                            con.Open();
                            SqlDataReader dr;
                            dr = com.ExecuteReader();


                            SPI_Expenses.updatePreExpenses(Convert.ToInt32(id));

                            con.Close();

                            com.Parameters.Clear();
                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD')", true);

                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD');window.location ='expenses.aspx';", true);

                        }
                        catch (Exception ex)
                        {
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Export. Silahkan hubungi admin.');", true);
                        }

                    }

                }

                try
                {
                    for (int i = 0; i <= 1; i++)
                    {
                        var workSheet = excel.Workbook.Worksheets.Add(sheets[i].ToString());
                        workSheet.TabColor = System.Drawing.Color.Yellow;
                        workSheet.DefaultRowHeight = 12;
                        workSheet.Row(1).Height = 15;
                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Row(1).Style.Font.Bold = true;
                        workSheet.Cells["A1:A1"].Value = "No.";
                        workSheet.Cells["B1:B1"].Value = "Brand";
                        workSheet.Cells["C1:C1"].Value = "Part Code";
                        workSheet.Cells["D1:D1"].Value = "Description Name";
                        workSheet.Cells["E1:E1"].Value = "Specification";
                        workSheet.Cells["F1:F1"].Value = "Quantity";
                        workSheet.Cells["G1:G1"].Value = "Remarks";
                        workSheet.Cells["A1:G1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        workSheet.Cells["A1:G1"].Style.Fill.BackgroundColor.SetColor(0, 169, 208, 142);
                        workSheet.Column(1).Width = 17;

                        int rowCountExcel = 2;
                        int colcountExcel = 2;
                        int colcountdt = 0;


                        int rowCount = 1;
                        int rowCountOVERSEA = 1;
                        if (i == 0)
                        {
                            foreach (DataRow dr in dt.Rows)
                            {
                                rowCount += 1;
                                for (int b = 1; b < dt.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                }
                            }
                        }
                        else
                        {
                            foreach (DataRow dr in dt2.Rows)
                            {
                                rowCountOVERSEA += 1;
                                for (int b = 1; b < dt2.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCountOVERSEA, b].Value = dr[b - 1];
                                }
                            }
                        }

                        for (int j = 1; j <= 7; j++)
                        {
                            workSheet.Column(j).AutoFit();
                        }
                        workSheet.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        //workSheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                        var colA = workSheet.Cells["A1:G30"];

                        // Assign borders
                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        excel.Workbook.Worksheets[i].View.ShowGridLines = false;
                        workSheet.Cells["A1:G1"].AutoFilter = true;
                    }
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                }

                using (var memoryStream = new System.IO.MemoryStream())
                {
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Pre Expenses Uncounting Part Order.xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    //Response.AddHeader("Downloading File...", "3; url=expenses.aspx");
                    Response.Flush();
                    Response.End();

                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            exportToExcel_Uncounting_Activity();
        }

        public void exportToExcel_Uncounting_Activity()
        {
            List<string> sheets = new List<string>();
            sheets.Add("LOCAL");
            sheets.Add("OVERSEA");
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();

            var dt = new DataTable();
            dt.Columns.Add("no", typeof(Int32));
            dt.Columns.Add("maker", typeof(string));
            dt.Columns.Add("goodsName", typeof(string));
            dt.Columns.Add("goodsDesc", typeof(string));
            dt.Columns.Add("desc", typeof(string));
            dt.Columns.Add("qtyOrder", typeof(Int32));
            dt.Columns.Add("model", typeof(string));
            dt.Columns.Add("vendor", typeof(string));

            var dt2 = new DataTable();
            dt2.Columns.Add("no", typeof(Int32));
            dt2.Columns.Add("maker", typeof(string));
            dt2.Columns.Add("goodsName", typeof(string));
            dt2.Columns.Add("goodsDesc", typeof(string));
            dt2.Columns.Add("desc", typeof(string));
            dt2.Columns.Add("qtyOrder", typeof(Int32));
            dt2.Columns.Add("model", typeof(string));
            dt2.Columns.Add("vendor", typeof(string));
            var noLocal = 1;
            var noOversea = 1;

            int count = 0;
            for (int g = 0; g < gvUncountingAct.Rows.Count; g++)
            {
                if ((gvUncountingAct.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvUncountingAct.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                {
                    count += 1;
                }
            }

            if (count == 0)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Mohon pilih data Pre Expenses Part yang akan di Export.');", true);
            }
            else
            {
                for (int g = 0; g < gvUncountingAct.Rows.Count; g++)
                {
                    if ((gvUncountingAct.Rows[g].FindControl("CheckBox2") as CheckBox) != null && (gvUncountingAct.Rows[g].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        noLocal = 1;

                        var maker = gvUncountingAct.Rows[g].Cells[9].Text.ToString();
                        var desc = "";
                        var goodsCode = gvUncountingAct.Rows[g].Cells[2].Text.ToString();
                        var goodsName = gvUncountingAct.Rows[g].Cells[1].Text.ToString();
                        var goodsDesc = gvUncountingAct.Rows[g].Cells[3].Text.ToString();
                        var qty = gvUncountingAct.Rows[g].Cells[7].Text;
                        var pic = gvUncountingAct.Rows[g].Cells[10].Text;
                        var category = gvUncountingAct.Rows[g].Cells[12].Text;

                        var id = gvUncountingAct.Rows[g].Cells[0].Text;
                        //for find textbox

                        var type = gvUncountingAct.Rows[g].Cells[13].FindControl("ddlDropDown") as DropDownList;
                        var vendor2 = type.SelectedValue.ToString();
                        var model = gvUncountingAct.Rows[g].Cells[8].Text;
                        goodsDesc = goodsDesc.ToUpper();
                        goodsName = goodsName.ToUpper();

                        if (vendor2 == "LOCAL")
                        {
                            dt.Rows.Add(noLocal, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noLocal += 1;
                        }
                        else
                        {
                            dt2.Rows.Add(noOversea, maker, goodsName, goodsDesc, desc, qty, model, vendor2);
                            noOversea += 1;
                        }

                        string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(web);
                        SqlCommand com = new SqlCommand("SPI_insertExpensesList", con);
                        com.CommandType = CommandType.StoredProcedure;

                        com.Parameters.AddWithValue("@goodsCode", goodsCode);
                        com.Parameters.AddWithValue("@goodsName", goodsName);
                        com.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        com.Parameters.AddWithValue("@model", model);
                        com.Parameters.AddWithValue("@qtyOrder", qty);
                        com.Parameters.AddWithValue("@pic", pic);
                        com.Parameters.AddWithValue("@category", category);
                        com.Parameters.AddWithValue("@type", vendor2);
                        com.Parameters.AddWithValue("@typePart", "Uncounting Activity");

                        try
                        {
                            //com.Dispose();
                            con.Open();
                            SqlDataReader dr;
                            dr = com.ExecuteReader();


                            SPI_Expenses.updatePreExpenses(Convert.ToInt32(id));

                            con.Close();

                            com.Parameters.Clear();
                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD')", true);

                            //System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Download Excel berhasil. Silahkan open file Excel pada folder DOWNLOAD');window.location ='expenses.aspx';", true);

                        }
                        catch (Exception ex)
                        {
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Export. Silahkan hubungi admin.');", true);
                        }

                    }

                }

                try
                {
                    for (int i = 0; i <= 1; i++)
                    {
                        var workSheet = excel.Workbook.Worksheets.Add(sheets[i].ToString());
                        workSheet.TabColor = System.Drawing.Color.Yellow;
                        workSheet.DefaultRowHeight = 12;
                        workSheet.Row(1).Height = 15;
                        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Row(1).Style.Font.Bold = true;
                        workSheet.Cells["A1:A1"].Value = "No.";
                        workSheet.Cells["B1:B1"].Value = "Brand";
                        workSheet.Cells["C1:C1"].Value = "Part Code";
                        workSheet.Cells["D1:D1"].Value = "Description Name";
                        workSheet.Cells["E1:E1"].Value = "Specification";
                        workSheet.Cells["F1:F1"].Value = "Quantity";
                        workSheet.Cells["G1:G1"].Value = "Remarks";
                        workSheet.Cells["A1:G1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        workSheet.Cells["A1:G1"].Style.Fill.BackgroundColor.SetColor(0, 169, 208, 142);
                        workSheet.Column(1).Width = 17;

                        int rowCountExcel = 2;
                        int colcountExcel = 2;
                        int colcountdt = 0;


                        int rowCount = 1;
                        int rowCountOVERSEA = 1;

                        if (i == 0)
                        {
                            foreach (DataRow dr in dt.Rows)
                            {
                                rowCount += 1;
                                for (int b = 1; b < dt.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                }
                            }
                        }
                        else
                        {
                            foreach (DataRow dr in dt2.Rows)
                            {
                                rowCountOVERSEA += 1;
                                for (int b = 1; b < dt2.Columns.Count; b++)
                                {
                                    workSheet.Cells[rowCountOVERSEA, b].Value = dr[b - 1];
                                }
                            }
                        }

                        for (int j = 1; j <= 7; j++)
                        {
                            workSheet.Column(j).AutoFit();
                        }
                        workSheet.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        //workSheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        workSheet.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                        var colA = workSheet.Cells["A1:G30"];

                        // Assign borders
                        colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        excel.Workbook.Worksheets[i].View.ShowGridLines = false;
                        workSheet.Cells["A1:G1"].AutoFilter = true;
                    }
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                }
                catch (Exception ex)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                }

                using (var memoryStream = new System.IO.MemoryStream())
                {
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=SPI Pre Expenses Uncounting Part Activity Order.xlsx");
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    //Response.AddHeader("Downloading File...", "3; url=expenses.aspx");
                    Response.Flush();
                    Response.End();

                }
            }
        }
    }
}