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
using OfficeOpenXml;
using System.Drawing;
using System.IO;

namespace sparepartproject
{
    public partial class qcreminder_insertnew : System.Web.UI.Page
    {
        DataTable dt;
        string getUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                getUsername = Session["username"].ToString();
                if (!IsPostBack)
                {
                    gvDataProgress.DataBind();
                    var finalUser = login.getnama(getUsername).ToString();
                    user.InnerText = finalUser.ToString();
                }
                else
                {
                    ScriptManager sm = ScriptManager.GetCurrent(this.Page);
                    sm.RegisterAsyncPostBackControl(btnOrder);
                    var finalUser = login.getnama(getUsername).ToString();
                    user.InnerText = finalUser.ToString();
                }

                //var lines = File.ReadAllLines("D:\\loginQC.txt");

                //for (int i = 0; i <= lines.Length; i++)
                //{
                //    var fields = lines[i].Split(' ');
                //    if (getUsername == fields[0])
                //    {
                //        var finalUser = login.getnama(getUsername).ToString();
                //        user.InnerText = finalUser.ToString();
                //        return;
                //    }
                //    else
                //    {
                //        //btnNewOrder.Visible = false;
                //        btnOrder.Visible = false;
                //        btnApproved2.Visible = false;
                //        btnApprovedd.Visible = false;
                //        btnExport.Visible = false;
                //        btnReturn.Visible = false;
                //        var finalUser = login.getnama(getUsername).ToString();
                //        user.InnerText = finalUser.ToString();
                //        return;
                //    }
                //}
            }


            
        }

        public void getEmp()
        {
            try
            {
                //dt = employee.getEmployee(txtEmployeNo.Text.ToString());
                //if (dt.Rows.Count > 0)
                //{
                //    //.InnerText = dt.Rows[0][1].ToString();
                //    btnOrder.Enabled = true;
                //}
                //else
                //{
                //    //lblEmp.InnerText = "NO DATA";
                //    btnOrder.Enabled = false;
                //}
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }

        protected void txtEmployeNo_TextChanged(object sender, EventArgs e)
        {
            //getEmp(); 
        }

        public void insertQC_Data()
        {
            string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(web);
            SqlCommand com = new SqlCommand("SPI_insertNewQC_CheckReminder", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@goodsName", txtGoodsName.Text.ToString());
            com.Parameters.AddWithValue("@model", ddlModel.Text);
            com.Parameters.AddWithValue("@insertDate", txtTanggal.Text);
            com.Parameters.AddWithValue("@orderBy", ddlSpv.Text.ToString());
            com.Parameters.AddWithValue("@qty", txtQty.Text);
            com.Parameters.AddWithValue("@unit", txtQty.Text);
            com.Parameters.AddWithValue("@purpose", txtPurpose.Text);
            com.Parameters.AddWithValue("@status", "PROGRESS");
            com.Parameters.AddWithValue("@po_number", txtPOnumber.Text);
            try
            {
                con.Open();
                SqlDataReader dr;
                dr = com.ExecuteReader();

                con.Close();
                con.Open();

                System.Web.UI.ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertscript", "alert('Insert Data QC Check Reminder Berhasil. Silahkan lihat data pada table.');window.location ='qcreminder_insertnew.aspx';", true);
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Gagal Insert Data QC Check Reminder. Silahkan hubungi admin.');", true);
            }
            con.Close();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            insertQC_Data();
        }

        protected void asdasd_Click(object sender, EventArgs e)
        {
            Approve();
        }

        public void Approve()
        {
            string b;
            int a;
            string ID = "";

            try
            {
                for (int i = 0; i < gvDataProgress.Rows.Count; i++)
                {
                    if ((gvDataProgress.Rows[i].FindControl("CheckBox2") as CheckBox) != null && (gvDataProgress.Rows[i].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        a = Convert.ToInt32(gvDataProgress.Rows[i].Cells[0].Text);
                        SPI_QC_Check.updateApprove(a);
                    }
                }
                gvDataProgress.DataBind();
                gvCompleteData.DataBind();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Sukses approve data. Silahkan lihat data di Tab Completed.');", true);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Approve gagal. Silahkan hubungi admin.');", true);
            }
        }

        public void Approve2()
        {
            string b;
            int a;
            string ID = "";

            try
            {
                for (int i = 0; i < gvReturn.Rows.Count; i++)
                {
                    if ((gvReturn.Rows[i].FindControl("CheckBox2") as CheckBox) != null && (gvReturn.Rows[i].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        a = Convert.ToInt32(gvReturn.Rows[i].Cells[0].Text);
                        SPI_QC_Check.updateApprove(a);
                    }
                }
                gvReturn.DataBind();
                gvCompleteData.DataBind();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Sukses approve data. Silahkan lihat data di Tab Completed.');", true);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Approve gagal. Silahkan hubungi admin.');", true);
            }
        }

        public void Return()
        {
            string b;
            int a;
            string ID = "";

            try
            {
                for (int i = 0; i < gvDataProgress.Rows.Count; i++)
                {
                    if ((gvDataProgress.Rows[i].FindControl("CheckBox2") as CheckBox) != null && (gvDataProgress.Rows[i].FindControl("CheckBox2") as CheckBox).Checked)
                    {
                        a = Convert.ToInt32(gvDataProgress.Rows[i].Cells[0].Text);
                        SPI_QC_Check.updateReturn(a);
                    }
                }
                gvDataProgress.DataBind();
                gvCompleteData.DataBind();
                gvReturn.DataBind();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Sukses Return data. Silahkan lihat data di Tab Return.');", true);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Approve gagal. Silahkan hubungi admin.');", true);
            }
        }

        public void Export()
        {
            if (txtDateFrom.Text == string.Empty || txtDateTo.Text == string.Empty)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Date from atau Date to tidak boleh kosong');", true);
            }
            else
            {
                ExcelPackage.LicenseContext = LicenseContext.Commercial;
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
                        for (int i = 1; i <= diff; i++)
                        {
                            var workSheet = excel.Workbook.Worksheets.Add(dateFrom.ToString("dd"));

                            //dateTo = dateFrom.AddDays(1);
                            DataTable dt = SPI_QC_Check.getQC_Check_Export(dateFrom.ToString("yyyy-MM-dd"));
                            //workSheet.TabColor = System.Drawing.Color.Yellow;
                            workSheet.DefaultRowHeight = 12;
                            workSheet.Row(6).Height = 25;
                            workSheet.Row(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                            workSheet.Row(6).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                            workSheet.Row(6).Style.Font.Bold = true;
                            //Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#B7DEE8");
                            workSheet.Cells["A6:K6"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                            workSheet.Cells["A6:K6"].Style.Fill.BackgroundColor.SetColor(Color.DarkBlue);
                            workSheet.Cells["A6:K6"].Style.Font.Color.SetColor(Color.White);
                            workSheet.View.ShowGridLines = false;

                            var colA = workSheet.Cells["A6:K70"];

                            // Assign borders
                            colA.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                            colA.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                            colA.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                            colA.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;

                            //penambahan script 
                            int rowCount = 6;
                            foreach (DataRow dr in dt.Rows)
                            {
                                rowCount += 1;
                                for (int b = 1; b < dt.Columns.Count + 1; b++)
                                {
                                    // Add the header the first time through 
                                    if (rowCount == 7)
                                    {
                                        workSheet.Cells[6, b].Value = dt.Columns[b - 1].ColumnName;
                                    }
                                    workSheet.Cells[rowCount, b].Value = dr[b - 1];
                                }
                            }
                            for (int j = 1; j <= 20; j++)
                            {
                                if (j == 4)
                                {
                                    workSheet.Column(4).Style.Numberformat.Format = "yyyy-MM-dd";
                                }else
                                if (j == 11)
                                {
                                    workSheet.Column(11).Style.Numberformat.Format = "yyyy-MM-dd";
                                }
                                workSheet.Column(j).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                                workSheet.Column(j).AutoFit();
                            }
                            dt.Clear();
                            workSheet.Column(1).Width = 10;
                            workSheet.Column(2).Width = 40;
                            workSheet.Column(3).Width = 15;

                            workSheet.Column(4).Width = 15;

                            workSheet.Column(5).Width = 25;
                            workSheet.Column(6).Width = 30;
                            workSheet.Column(7).Width = 10;
                            workSheet.Column(8).Width = 10;
                            workSheet.Column(9).Width = 40;
                            workSheet.Column(10).Width = 20;
                            workSheet.Column(11).Width = 20;
                            dateFrom = dateFrom.AddDays(1);
                            workSheet.Cells["A1:A1"].Value = "PT. Epson Batam";
                            workSheet.Cells["A2:A2"].Value = "Machinery Engineering";
                            workSheet.Cells["A3:A3"].Value = "Sparepart Inventory";
                            workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                            workSheet.Row(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                            workSheet.Row(3).Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                            workSheet.Row(1).Style.Font.Bold = true;
                            workSheet.Row(2).Style.Font.Bold = true;
                            workSheet.Row(3).Style.Font.Bold = true;

                            workSheet.Cells["A6:A6"].Value = "ID";
                            workSheet.Cells["B6:B6"].Value = "Goods Name";
                            workSheet.Cells["C6:C6"].Value = "Model";

                            workSheet.Cells["D6:D6"].Value = "Insert Date";
                            workSheet.Cells["E6:E6"].Value = "PO Number";
                            workSheet.Cells["F6:F6"].Value = "Order By";

                            workSheet.Cells["G6:G6"].Value = "Qty";
                            workSheet.Cells["H6:H6"].Value = "Unit";
                            workSheet.Cells["I6:I6"].Value = "Purpose";

                            workSheet.Cells["J6:J6"].Value = "Status";
                            workSheet.Cells["K6:K6"].Value = "Complete Date";

                        }
                        //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Export Data berhasil. Silahkan lihat pada Download tab atau Download Folder pada Komputer masing-masing.');", true);
                    }
                    catch (Exception ex)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Oopss.. Export data gagal. Silahkan hubungi admin.');", true);
                    }
                    using (var memoryStream = new System.IO.MemoryStream())
                    {
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment; filename=QC Check Reminder.xlsx");
                        excel.SaveAs(memoryStream);
                        memoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }

        protected void asd_Click(object sender, EventArgs e)
        {
            Export();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Return();
        }

        protected void btnApproved2_Click(object sender, EventArgs e)
        {
            Approve2() ;
        }
    }
}
