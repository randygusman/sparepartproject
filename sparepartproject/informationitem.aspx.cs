using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class informationitem : System.Web.UI.Page
    {
        const string connString = "Data Source=172.16.111.174\\SQLEXPRESS; Initial Catalog = sparepartworld; User ID=sa; Pwd=Itmaintenance4!; connection timeout =3;";
        public DateTime nextyear;
        protected void Page_Load(object sender, EventArgs e)
        {

            BindGrid();BindGrid2();BindGridDelete();
            if (Page.IsPostBack)
            {
                BindGrid();
                BindGrid2();
                BindGridDelete();
            }
        }

        public void upload()
        {
            string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);
            string contentType = fileUpload1.PostedFile.ContentType;
            using (Stream fs = fileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))                                              
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into MTC_iteminformation(model,purposeBy,proposedby,line,cell,pic,itemInformation,cause,datetime,fileName,contenttype,attachment,reason) values (@model,@purposeBy,@proposedby,@line,@cell,@pic,@itemInformation,@cause,@datetime,@fileName, @contentType, @attachment,@reason)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@model", ddlModel.SelectedValue);
                            cmd.Parameters.AddWithValue("@purposeBy", txtPurposeBy.Text.ToString());
                            cmd.Parameters.AddWithValue("@proposedBy", txtPurposeBy.Text.ToString());
                            cmd.Parameters.AddWithValue("@line", txtLine.Text.ToString());
                            cmd.Parameters.AddWithValue("@cell", txtCell.Text.ToString());
                            cmd.Parameters.AddWithValue("@pic", txtPIC.Text.ToString());
                            cmd.Parameters.AddWithValue("@itemInformation", txtActivityInformation.Text.ToString());
                            cmd.Parameters.AddWithValue("@cause", txtCause.Text.ToString());
                            cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                            cmd.Parameters.AddWithValue("@fileName", filename);
                            cmd.Parameters.AddWithValue("@contentType", contentType);
                            cmd.Parameters.AddWithValue("@attachment", bytes);
                            cmd.Parameters.AddWithValue("@reason", txtReason.Text.ToString());
                            try
                            {
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                                BindGrid();
                                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Upload Item Berhasil.');", true);
                            }
                            catch (Exception ex)
                            {

                            }

                        }
                    }
                }
            }
        }

        public void insertInformationItem()
        {
            // Read the file and convert it to Byte Array
            string filePath = fileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".xls":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".xlsx":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {
                Stream fs = fileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(web);
                SqlCommand com = new SqlCommand("MTC_insertInformationItem", con);

                com.CommandType = CommandType.StoredProcedure;


                com.Parameters.AddWithValue("@model", ddlModel.SelectedValue);
                com.Parameters.AddWithValue("@purpose", txtPurposeBy.Text.ToString());
                com.Parameters.AddWithValue("@proposedBy", "TEST");
                com.Parameters.AddWithValue("@line", txtLine.Text.ToString());
                com.Parameters.AddWithValue("@cell", Convert.ToInt32(txtCell.Text));
                com.Parameters.AddWithValue("@pic", txtPIC.Text.ToString());
                com.Parameters.AddWithValue("@itemInformation", txtActivityInformation.Text.ToString());
                com.Parameters.AddWithValue("@cause", txtCause.Text.ToString());
                com.Parameters.AddWithValue("@attachment", bytes);
                com.Parameters.AddWithValue("@contentType", contenttype);
                com.Parameters.AddWithValue("@fileName", filename);
                try
                {
                    //com.Dispose();
                    con.Open();
                    SqlDataReader dr;
                    dr = com.ExecuteReader();

                    con.Close();

                    com.Parameters.Clear();

                    //con.Open();
                }
                catch (Exception ex)
                {

                }
            }
            else
            {

            }


        }


        public void insertFileReportcontactor()
        {
            // Read the file and convert it to Byte Array
            string filePath = fileuploadcontactor.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".xls":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".xlsx":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {
                Stream fs = fileuploadcontactor.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                string web = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(web);
                SqlCommand com = new SqlCommand("MTC_insertContactorReport", con);

                com.CommandType = CommandType.StoredProcedure;


                com.Parameters.AddWithValue("@idContactor", hdID.Value);
                com.Parameters.AddWithValue("@attachment", bytes);
                com.Parameters.AddWithValue("@contentType", contenttype);
                com.Parameters.AddWithValue("@fileName", filename);
                try
                {
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
            else
            {

            }


        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            //insertInformationItem();
            upload();
        }


        [WebMethod]
        public static string getInformationItem()

        {
            //System.Threading.Thread.Sleep(1000);
            List<itemInformation.getInformationItem> expenseslist = new List<itemInformation.getInformationItem>();

            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("MTC_getInformationItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    itemInformation.getInformationItem exp = new itemInformation.getInformationItem();

                    exp._model = rdr["model"].ToString();
                    exp._purposeBy = rdr["purposeBy"].ToString();
                    exp._proposedBy = rdr["proposedBy"].ToString();
                    exp._line = rdr["line"].ToString();
                    exp._cell = Convert.ToInt32(rdr["cell"]);
                    exp._pic = rdr["pic"].ToString();
                    exp._informationItem = rdr["itemInformation"].ToString();
                    exp._cause = rdr["cause"].ToString();
                    exp._dateTime = rdr["dateTime"].ToString();
                    exp._attachment = (byte[])rdr["attachment"];
                    expenseslist.Add(exp);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(employeelist));
            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(expenseslist);
            return json;
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string contentType, fileName;
            string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select  attachment, filename, contentType from machineContactor_filereport where idContactor=@id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["attachment"];
                        contentType = sdr["contentType"].ToString();
                        fileName = sdr["filename"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM machineContactor WHERE status='CLOSE'";
                    //cmd.CommandText = "SELECT b.ID, a.assetNo,a.machineNo,a.serialnomc,b.lastChangeDate,b.model,b.line,b.typecontactor,b.contactorcapacity,b.contactortypebefore,b.contactortypeafter,b.year,b.status FROM [sparepartworld].[dbo].[machineMaster] a JOIN machineContactor b on a.assetNo = b.assetno and b.status='CLOSE'";

                    cmd.Connection = con;
                    con.Open();
                    gvExpenses_Activity.DataSource = cmd.ExecuteReader();
                    gvExpenses_Activity.DataBind();
                    con.Close();
                }
            }
        }

        private void BindGrid2()
        {
            string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //cmd.CommandText = "SELECT b.ID, a.assetNo,a.machineNo,a.serialnomc,b.lastChangeDate,b.model,b.line,b.typecontactor,b.contactorcapacity,b.contactortypebefore,b.contactortypeafter,b.year,b.status FROM [sparepartworld].[dbo].[machineMaster] a JOIN machineContactor b on a.assetNo = b.assetno and b.status='OPEN'";
                    cmd.CommandText = "SELECT * FROM machineContactor WHERE status='OPEN'";

                    cmd.Connection = con;
                    con.Open();
                    gvOpen.DataSource = cmd.ExecuteReader();
                    gvOpen.DataBind();
                    con.Close();
                }
            }
        }

        private void BindGridDelete()
        {
            string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT b.ID, a.assetNo,a.machineNo,a.serialnomc,b.lastChangeDate,b.model,b.line,b.typecontactor,b.contactorcapacity,b.contactortypebefore,b.contactortypeafter,b.year,b.status,b.remark FROM [sparepartworld].[dbo].[machineMaster] a JOIN machineContactor b on a.assetNo = b.assetno and b.status='DELETED'";

                    cmd.Connection = con;
                    con.Open();
                    gvHistory.DataSource = cmd.ExecuteReader();
                    gvHistory.DataBind();
                    con.Close();
                }
            }
        }

        private void BindGridCustomDate()
        {
            string constr = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    if (ddlModelSearch.SelectedValue == "ALL")
                    {
                        cmd.CommandText = "select id, model, dateTime, line, cell, PIC, cause, itemInformation, dateTime,purposeBy,reason from MTC_iteminformation where datetime between @datefrom and @dateto";
                        cmd.Connection = con;
                        //cmd.Parameters.AddWithValue("@model", ddlModelSearch.SelectedValue);
                        cmd.Parameters.AddWithValue("@dateFrom", dateFrom.Text);
                        cmd.Parameters.AddWithValue("@dateto", dateTo.Text);
                    }
                    else
                    {
                        cmd.CommandText = "select id, model, dateTime, line, cell, PIC, cause, itemInformation, dateTime,purposeBy,reason from MTC_iteminformation where model=@model and datetime between @datefrom and @dateto";
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@model", ddlModelSearch.SelectedValue);
                        cmd.Parameters.AddWithValue("@dateFrom", dateFrom.Text);
                        cmd.Parameters.AddWithValue("@dateto", dateTo.Text);
                    }
                    
                    //cmd.Connection = con;
                    //cmd.Parameters.AddWithValue("@model", ddlModelSearch.SelectedValue);
                    //cmd.Parameters.AddWithValue("@dateFrom", dateFrom.Text);
                    //cmd.Parameters.AddWithValue("@dateto", dateTo.Text);
                    con.Open();
                    gvExpenses_Activity.DataSource = cmd.ExecuteReader();
                    gvExpenses_Activity.DataBind();
                    con.Close();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridCustomDate();
        }

        public void exportExcel()
        {
            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();
            DateTime dateFrom1, dateFromm, dateFrom2, dateToo, dateTo1, dateTo2;
            int diff;
            dateFrom1 = Convert.ToDateTime(dateFrom.Text);
            dateFrom2 = Convert.ToDateTime(dateFrom.Text);
            dateFromm = Convert.ToDateTime(dateFrom.Text);
            dateToo = Convert.ToDateTime(dateTo.Text);
            dateTo2 = Convert.ToDateTime(dateTo.Text);
            dateTo1 = Convert.ToDateTime(dateTo.Text);
            dateToo = dateToo.AddDays(1);
            diff = Convert.ToInt32((dateToo - dateFromm).TotalDays);
            var until = diff + 2;
            var fitt = 2 + diff;
            for (int i = 0; i <= diff; i++)
            {
                var workSheet = excel.Workbook.Worksheets.Add(dateFromm.ToString("yyyy-MM-dd"));
                DataTable dt;
                //dateToo = dateFromm.AddDays(1);
                if (ddlModelSearch.SelectedValue == "ALL")
                {
                    dt = itemInformation.getInformationItem_ExportSummary(dateFromm.ToString("yyyy-MM-dd"));
                }
                else
                {
                    dt = itemInformation.getInformationItem_ExportSummaryModel(dateFromm.ToString("yyyy-MM-dd"),ddlModelSearch.SelectedValue.ToString());
                }
                
                var a = dt.Rows.Count;
                workSheet.TabColor = System.Drawing.Color.Yellow;
                workSheet.DefaultRowHeight = 12;
                workSheet.Row(1).Height = 25;
                workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Row(1).Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                workSheet.Row(1).Style.Font.Bold = true;

                workSheet.Cells["A1:J1"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                workSheet.Cells["A1:J1"].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(79, 98, 40));
                workSheet.Cells["A1:J1"].Style.Font.Color.SetColor(Color.White);

                var colA = workSheet.Cells["A1:J100"];

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
                        workSheet.Column(2).Style.Numberformat.Format = "yyyy-MM-dd";
                    }
                    workSheet.Cells["A1"].Value = "ID";
                    workSheet.Cells["B1"].Value = "DATE";
                    workSheet.Cells["C1"].Value = "MODEL";
                    workSheet.Cells["D1"].Value = "LINE";
                    workSheet.Cells["E1"].Value = "CELL";
                    workSheet.Cells["F1"].Value = "ITEM INFORMATION";
                    workSheet.Cells["G1"].Value = "CAUSE";
                    workSheet.Cells["H1"].Value = "REASON";
                    workSheet.Cells["I1"].Value = "PROPOSED BY";
                    workSheet.Cells["J1"].Value = "PIC";
                    workSheet.Column(j).AutoFit();
                }
                workSheet.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(3).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(4).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(5).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(9).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                workSheet.Column(10).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;


                workSheet.Column(2).AutoFit();
                dt.Clear();
                dateFromm = dateFromm.AddDays(1);
            }
            

            

            using (var memoryStream = new System.IO.MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=MTC Information Item " + dateFrom1.ToString("yyyy-MM-dd") + " " + dateTo1.ToString("yyyy-MM-dd") + " .xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportExcel();
        }

        public static void updateContactor(string id, string model, string line, string typeContactor, string contactorCapacity,string contactorTypeBefore, string contactorTypeAfter)
        {
            string UpdateCommand = "updateClosedContactor";
            using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
            using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
            {
                sqlRenameCommand.CommandType = CommandType.StoredProcedure;
                sqlRenameCommand.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                sqlRenameCommand.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                sqlRenameCommand.Parameters.Add("@line", SqlDbType.VarChar).Value = line;
                sqlRenameCommand.Parameters.Add("@contactorType", SqlDbType.VarChar).Value = typeContactor;
                sqlRenameCommand.Parameters.Add("@contactorCapacity", SqlDbType.VarChar).Value = contactorCapacity;
                sqlRenameCommand.Parameters.Add("@contactorTypeBefore", SqlDbType.VarChar).Value = contactorTypeBefore;
                sqlRenameCommand.Parameters.Add("@contactorTypeAfter", SqlDbType.VarChar).Value = contactorTypeAfter;
                
                sqlConnectionCmdString.Open();
                sqlRenameCommand.ExecuteNonQuery();
            }
        }

        public static DataTable getOpenContactorData()
        {

            using (var conn = new SqlConnection(connString))
            {
                using (var adapter = new SqlDataAdapter("[SPI_getContactorNext30Days]", conn))
                {
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    using (var dataTable = new DataTable())
                    {
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
        }
        
        public void sendMailPartComing()
        {

            System.Data.DataTable dt = getOpenContactorData();
            if (dt.Rows.Count > 0)
            {
                int count = dt.Rows.Count; //,andre.hermawan@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg ,andre.hermawan@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg
                //List<int> list = dt.AsEnumerable()
                //           .Select(r => r.Field<int>("id"))
                //           .ToList();
                //string toMail =  "deni.ari@sep.epson.com.sg, adi.setiawan @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, mohamad.ikrom @sep.epson.com.sg, eko.hartanto @sep.epson.com.sg, solfitrianto @sep.epson.com.sg, suryono.talwibowo @sep.epson.com.sg, yanuar.andriansyah @sep.epson.com.sg, cahyo.nugroho @sep.epson.com.sg, dedy.nurrochman @sep.epson.com.sg, didik.setyawan @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg, rifqi.usman @sep.epson.com.sg, wascadi @sep.epson.com.sg, PEB2131972 @sep.epson.com.sg, mokhamad.ardian @sep.epson.com.sg, muhammad.yusuf @sep.epson.com.sg, nurmaki.elmadani @sep.epson.com.sg, welson @sep.epson.com.sg, joko.sulistiyo @sep.epson.com.sg, saikhu.rochman @sep.epson.com.sg, sunaryo @sep.epson.com.sg, edi.wiyono @sep.epson.com.sg, ahdiath.indrasetyadi @sep.epson.com.sg, trendy.lanang @sep.epson.com.sg, mega.apriyani @sep.epson.com.sg,randy.gusman @sep.epson.com.sg,sutarno@sep.epson.com.sg,dany.yunata@sep.epson.com.sg,amri.gunawan@sep.epson.com.sg,agung.sumbarra@sep.epson.com.sg,doan.nico@sep.epson.com.sg,samiudin@sep.epson.com.sg,rio.adhitama@sep.epson.com.sg,yuli.astrianik@sep.epson.com.sg,asdi.suhendra@sep.epson.com.sg,ari.setiyobudi@sep.epson.com.sg,hery.purwantoro@sep.epson.com.sg,romi.asmadi@sep.epson.com.sg,PEB2140722@sep.epson.com.sg,agus.pramudia@sep.epson.com.sg,bagas.cindarbumi@sep.epson.com.sg,sofwan.bayu@sep.epson.com.sg,septian.wibowo@sep.epson.com.sg,Muhammad.Isnaini@sep.epson.com.sg,PEB2140107@sep.epson.com.sg,dopi.eluri@sep.epson.com.sg,ahmad.setiyawan@sep.epson.com.sg,ahmad.sugiarto@sep.epson.com.sg,holden.simanjuntak@sep.epson.com.sg,PEB2111457@sep.epson.com.sg,PEB2122178@sep.epson.com.sg,zulhendy.masruddin@sep.epson.com.sg,rachmad.rizkybiantoro@sep.epson.com.sg,peb2111459@sep.epson.com.sg,khafid.masyudi@sep.epson.com.sg,PEB2111838@sep.epson.com.sg,PEB2111460@sep.epson.com.sg,januar.efendi@sep.epson.com.sg,yani.ariana@sep.epson.com.sg,PEB2140104@sep.epson.com.sg,PEB2101037@sep.epson.com.sg,PEB2110825@sep.epson.com.sg,PEB2111640@sep.epson.com.sg,nanang.wahyunianto@sep.epson.com.sg,wahyu.rukmana@sep.epson.com.sg,PEB2120127@sep.epson.com.sg,PEB2120620@sep.epson.com.sg,PEB2120717@sep.epson.com.sg,PEB2131878@sep.epson.com.sg,PEB2131967@sep.epson.com.sg,PEB2131971@sep.epson.com.sg,PEB2131973@sep.epson.com.sg,PEB2140074@sep.epson.com.sg,PEB2140253@sep.epson.com.sg,PEB2140717@sep.epson.com.sg,PEB2140719@sep.epson.com.sg,nurhuda@sep.epson.com.sg,PEB2141758@sep.epson.com.sg,agung.dwiprasetyo@sep.epson.com.sg,muamar.mursjid@sep.epson.com.sg,muhammad.syahrul@sep.epson.com.sg,teguh_trim@sep.epson.com.sg,PEB2101682@sep.epson.com.sg,PEB2110824@sep.epson.com.sg,PEB2110849@sep.epson.com.sg,PEB2111463@sep.epson.com.sg,PEB2111633@sep.epson.com.sg,PEB2120091@sep.epson.com.sg,PEB2120128@sep.epson.com.sg,PEB2120602@sep.epson.com.sg,PEB2131169@sep.epson.com.sg,PEB2141010@sep.epson.com.sg,PEB2142035@sep.epson.com.sg,ichwanul.muslimin@sep.epson.com.sg,mranu.robanny@sep.epson.com.sg,adi.bayusaputro@sep.epson.com.sg,fandy.fahrizalardimuhammad@sep.epson.com.sg,PEB2110851@sep.epson.com.sg,PEB2111468@sep.epson.com.sg,PEB2111661@sep.epson.com.sg,PEB2120126@sep.epson.com.sg,ibnu.sholihan@sep.epson.com.sg,alplinto.keliat@sep.epson.com.sg,PEB2111840@sep.epson.com.sg,PEB2120627@sep.epson.com.sg,PEB2120807@sep.epson.com.sg,PEB2141011@sep.epson.com.sg,henry.prasetyo@sep.epson.com.sg,PEB2110823@sep.epson.com.sg,PEB2110846@sep.epson.com.sg,PEB2110848@sep.epson.com.sg,PEB2110924@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,alvian@sep.epson.com.sg,PEB2120534@sep.epson.com.sg,PEB2140103@sep.epson.com.sg,angga.yudha@sep.epson.com.sg,PEB2131968@sep.epson.com.sg,ilyas.lukmanulhakim@sep.epson.com.sg,imam@sep.epson.com.sg,mohammad.faisal@sep.epson.com.sg,munjaroh@sep.epson.com.sg,denny.shalihat@sep.epson.com.sg,willi.hendrastaka@sep.epson.com.sg,PEB2101686@sep.epson.com.sg,lalang.kristiawan@sep.epson.com.sg,PEB2111646@sep.epson.com.sg,PEB2111781@sep.epson.com.sg,PEB2111835@sep.epson.com.sg,PEB2120629@sep.epson.com.sg,PEB2122168@sep.epson.com.sg,wahid.husin@sep.epson.com.sg,PEB2130706@sep.epson.com.sg,PEB2131118@sep.epson.com.sg,PEB2131121@sep.epson.com.sg,PEB2131876@sep.epson.com.sg,PEB2140718@sep.epson.com.sg,PEB2141007@sep.epson.com.sg,PEB2141759@sep.epson.com.sg,PEB2141821@sep.epson.com.sg,PEB2142072@sep.epson.com.sg,andika.putra@sep.epson.com.sg,mdehen.wijaya@sep.epson.com.sg,rizki.hamdani@sep.epson.com.sg,PEB2131970@sep.epson.com.sg,arius.kristanto@sep.epson.com.sg,munifatul.mustofiah@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg,ferdiansyah.marja@sep.epson.com.sg";
                string toMail = "david.hermanto@sep.epson.com.sg,wascadi@sep.epson.com.sg,mohamad.ikrom@sep.epson.com.sg,dedy.nurrochman@sep.epson.com.sg,suryono.talwibowo@sep.epson.com.sg,PEB2131972@sep.epson.com.sg,adi.setiawan@sep.epson.com.sg,didik.setyawan@sep.epson.com.sg,faishol.husni@sep.epson.com.sg,rifqi.usman@sep.epson.com.sg,yanuar.andriansyah@sep.epson.com.sg,solfitrianto@sep.epson.com.sg,cahyo.nugroho@sep.epson.com.sg,khafid.masyudi@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,munifatul.mustofiah@sep.epson.com.sg,nadhya.farishi@sep.epson.com.sg,randy.gusman@sep.epson.com.sg"; //"deni.ari @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,david.hermanto @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,eko.hartanto @sep.epson.com.sg,solfitrianto @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,yanuar.andriansyah @sep.epson.com.sg,cahyo.nugroho @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,didik.setyawan @sep.epson.com.sg,andre.hermawan @sep.epson.com.sg,faishol.husni@sep.epson.com.sg,rifqi.usman @sep.epson.com.sg,wascadi @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg,randy.gusman @sep.epson.com.sg,amri.gunawan @sep.epson.com.sg,khafid.masyudi @sep.epson.com.sg,PEB2140104 @sep.epson.com.sg,PEB2101037 @sep.epson.com.sg,PEB2110825 @sep.epson.com.sg,PEB2111640 @sep.epson.com.sg,nanang.wahyunianto @sep.epson.com.sg,wahyu.rukmana @sep.epson.com.sg,PEB2120127 @sep.epson.com.sg,PEB2120620 @sep.epson.com.sg,PEB2120717 @sep.epson.com.sg,PEB2131878 @sep.epson.com.sg,PEB2131967 @sep.epson.com.sg,PEB2131971 @sep.epson.com.sg,PEB2131973 @sep.epson.com.sg,PEB2140074 @sep.epson.com.sg,PEB2140253 @sep.epson.com.sg,PEB2140717 @sep.epson.com.sg,PEB2140719 @sep.epson.com.sg,nurhuda @sep.epson.com.sg,PEB2141758 @sep.epson.com.sg,agung.dwiprasetyo @sep.epson.com.sg,muhammad.syahrul @sep.epson.com.sg,teguh_trim @sep.epson.com.sg,PEB2101682 @sep.epson.com.sg,PEB2110824 @sep.epson.com.sg,PEB2110849 @sep.epson.com.sg,PEB2111463 @sep.epson.com.sg,PEB2111633 @sep.epson.com.sg,PEB2120091 @sep.epson.com.sg,PEB2120128 @sep.epson.com.sg,PEB2120602 @sep.epson.com.sg,PEB2131169 @sep.epson.com.sg,PEB2141010 @sep.epson.com.sg,PEB2142035 @sep.epson.com.sg,ichwanul.muslimin @sep.epson.com.sg,mranu.robanny @sep.epson.com.sg,PEB2110851 @sep.epson.com.sg,PEB2111468 @sep.epson.com.sg,PEB2111661 @sep.epson.com.sg,PEB2120126 @sep.epson.com.sg,ibnu.sholihan @sep.epson.com.sg,alplinto.keliat @sep.epson.com.sg,PEB2111840 @sep.epson.com.sg,PEB2120627 @sep.epson.com.sg,PEB2120807 @sep.epson.com.sg,PEB2141011 @sep.epson.com.sg,PEB2110823 @sep.epson.com.sg,PEB2110846 @sep.epson.com.sg,PEB2110848 @sep.epson.com.sg,PEB2110924 @sep.epson.com.sg,PEB2111659 @sep.epson.com.sg,alvian @sep.epson.com.sg,PEB2120534 @sep.epson.com.sg,PEB2140103 @sep.epson.com.sg,angga.yudha @sep.epson.com.sg,PEB2131968 @sep.epson.com.sg,ilyas.lukmanulhakim @sep.epson.com.sg,imam @sep.epson.com.sg,mohammad.faisal @sep.epson.com.sg,munjaroh @sep.epson.com.sg,denny.shalihat @sep.epson.com.sg,willi.hendrastaka @sep.epson.com.sg,PEB2101686 @sep.epson.com.sg,lalang.kristiawan @sep.epson.com.sg,PEB2111646 @sep.epson.com.sg,PEB2111781 @sep.epson.com.sg,PEB2111835 @sep.epson.com.sg,PEB2120629 @sep.epson.com.sg,PEB2122168 @sep.epson.com.sg,wahid.husin @sep.epson.com.sg,PEB2130706 @sep.epson.com.sg,PEB2131118 @sep.epson.com.sg,PEB2131121 @sep.epson.com.sg,PEB2131876 @sep.epson.com.sg,PEB2140718 @sep.epson.com.sg,PEB2141007 @sep.epson.com.sg,PEB2141759 @sep.epson.com.sg,PEB2141821 @sep.epson.com.sg,PEB2142072 @sep.epson.com.sg,andika.putra @sep.epson.com.sg,mdehen.wijaya @sep.epson.com.sg,PEB2131970 @sep.epson.com.sg,munifatul.mustofiah @sep.epson.com.sg,wan.tinafridayanti @sep.epson.com.sg,wan.tinafridayanti @sep.epson.com.sg,PEB2111659 @sep.epson.com.sg,andre.hermawan @sep.epson.com.sg,ferdiansyah.marja @sep.epson.com.sg,tika.nuraeni@sep.epson.com.sg,nadhya.farishi@sep.epson.com.sg,marili.dewi@sep.epson.com.sg,munifatul.mustofiah@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg";
                string cc = "agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg,deni.ari@sep.epson.com.sg,eko.hartanto@sep.epson.com.sg,tika.nuraeni@sep.epson.com.sg";// "andre.hermawan@sep.epson.com.sg"; //"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"agus.syaepuloh @sep.epson.com.sg, deni.ari @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,wascadi @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg"; //"nanang.setiawan@sep.epson.com.sg,mokhamat.ariyanto @sep.epson.com.sg,iktiyar.wicaksono @sep.epson.com.sg,gandhi.sucahyo@sep.epson.com.sg,natalia.jahja @sep.epson.com.sg";//"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"randy.gusman@sep.epson.com.sg";// 
                SmtpClient client = new SmtpClient("mx.apo.epson.net");
                client.Port = 25;
                client.EnableSsl = false;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = true;
                client.Credentials = new System.Net.NetworkCredential("SPI_ContactorReminder@sep.epson.com.sg", "");

                MailMessage mail = new MailMessage("SPI_ContactorReminder@sep.epson.com.sg", toMail);
                mail.Subject = "CHANGE CONTACTOR REMINDER";

                string textBody = "<span style='font-family: calibri; font-size:14px'><b>Dear All<b>,<br><br>Below list of Contactor need to be change in the next 30 days. <br>";
                textBody += "<span style='color:red; font-family: calibri; font-size:16px'>PLEASE FOLLOW UP.</span></b><br><br><br>";

                textBody += "<table style=\"text-align:center;font-family: calibri; font-size:11px\"width = " + 2400 + " cellpadding = " + 0 + " cellspacing =" + 0 + "><tr><td style=\"background-color:#305496;color:white;width:150px;border-left: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;border-right: 1px solid #000000;\"><center> <b>ASSET NO</b></center> </td><td style=\"background-color:#305496;width:180px; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>MACHINE NO</b></center> </td><td style=\"background-color:#305496;width:180px;  color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>SERIAL NUMBER</b></center> </td><td style=\"background-color:#305496; color:white;width:100px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>MODEL</b></center> </td><td style=\"background-color:#305496; color:white;width:100px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>LINE</b></center> </td><td style=\"width:100px;background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CONTACTOR TYPE</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CAPACITY</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CONTACTOR TYPE (BEFORE)</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CONTACTOR TYPE (AFTER)</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>LAST CHANGE DATE</b></center> </td><td style=\"background-color:#305496; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>CURRENT DUE DATE</b></center> </td></tr>";
                for (int i = 0; i < count; i++)
                {
                    textBody += "<tr><td style=\"border-bottom: 1px solid #000000;border-left: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][1].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][12].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][13].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][2].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][3].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][4].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][5].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][6].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][7].ToString() + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + Convert.ToDateTime(dt.Rows[i][10]).ToString("dd-MMM yyyy") + "</td>";
                    textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + Convert.ToDateTime(dt.Rows[i][8]).ToString("dd-MMM yyyy") + "</td>"
                    //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + dt.Rows[i][23].ToString() + "</td>"
                    +
                    "</tr>";
                }
                textBody += "</table>";
                textBody += "<br/>";
                textBody += "<br/>";
                textBody += "<span style='font-family: calibri;'>Please close Contactor after update  <a href='http://172.16.111.174:9090/informationitem.aspx'>here</a>.</span>";

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


        }

        public void insert2year(string assetno, string model, string line, string typeContactor, string contactorCapacity, string contactorTypeBefore, string contactorTypeAfter,DateTime year, DateTime next2years,string machineno, string serialnomc)
        {
            DateTime todayyear = year;
            DateTime today = DateTime.Now;
            int yearrr = Convert.ToDateTime(year).Year + 3;
            string fixnextyear = "" + yearrr + "-01-01";
            nextyear = Convert.ToDateTime(fixnextyear);// Convert.ToDateTime(DateTime.Now).AddYears(2);

            string UpdateCommand = "SPI_insertNextTwoYearContactor";
            using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
            using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
            {
                sqlRenameCommand.CommandType = CommandType.StoredProcedure;
                sqlRenameCommand.Parameters.Add("@assetno", SqlDbType.VarChar).Value = assetno;
                sqlRenameCommand.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                sqlRenameCommand.Parameters.Add("@line", SqlDbType.VarChar).Value = line;
                sqlRenameCommand.Parameters.Add("@typeContactor", SqlDbType.VarChar).Value = typeContactor;
                sqlRenameCommand.Parameters.Add("@contactorCapacity", SqlDbType.VarChar).Value = contactorCapacity;
                sqlRenameCommand.Parameters.Add("@contactorTypeBefore", SqlDbType.VarChar).Value = contactorTypeBefore;
                sqlRenameCommand.Parameters.Add("@contactorTypeAfter", SqlDbType.VarChar).Value = contactorTypeAfter;
                sqlRenameCommand.Parameters.Add("@year", SqlDbType.Date).Value = nextyear;
                sqlRenameCommand.Parameters.Add("@status", SqlDbType.VarChar).Value = "OPEN";
                sqlRenameCommand.Parameters.Add("@lastchage", SqlDbType.Date).Value = today;
                sqlRenameCommand.Parameters.Add("@machineno", SqlDbType.VarChar).Value = machineno;
                sqlRenameCommand.Parameters.Add("@serialnomc", SqlDbType.VarChar).Value = serialnomc;

                sqlConnectionCmdString.Open();
                sqlRenameCommand.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static void delete(int id, string remarks)
        {
            string UpdateCommand = "SPI_updateDeleteContactor";
            using (SqlConnection sqlConnectionCmdString = new SqlConnection(connString))
            using (SqlCommand sqlRenameCommand = new SqlCommand(UpdateCommand, sqlConnectionCmdString))
            {
                sqlRenameCommand.CommandType = CommandType.StoredProcedure;
                sqlRenameCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
                sqlRenameCommand.Parameters.Add("@remarks", SqlDbType.VarChar).Value = remarks;

                sqlConnectionCmdString.Open();
                sqlRenameCommand.ExecuteNonQuery();
            }
        }
        



        public void updateContactor()
        {
            try
            {
                updateContactor(hdID.Value.ToString(), ddlModell.Text.ToString(), ddlLine.Text.ToString(),txtContactorType.Text.ToString(),txtContactorCapacity.Text.ToString(),txtContactorTypeBefore.Text.ToString(),txtContactorTypeAfter.Text.ToString());
                insertFileReportcontactor();
                DateTime now = DateTime.Now;
                DateTime now1 = DateTime.Now;
                now = now.AddYears(2);
                insert2year(hdAssetNo.Value, ddlModell.Text.ToString(), ddlLine.Text.ToString(), txtContactorType.Text.ToString(), txtContactorCapacity.Text.ToString(), txtContactorTypeBefore.Text.ToString(), txtContactorTypeAfter.Text.ToString(),now1,now,hdMachineNo.Value.ToString(),hdSerialNo.Value.ToString());

                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Data Contactor berhasil diupdate.');", true);

            }
            catch (Exception ex)
            {

            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            updateContactor();
            BindGrid();
            BindGrid2();
        }

        protected void btnTestMail_Click(object sender, EventArgs e)
        {
            sendMailPartComing();
        }
    }

}