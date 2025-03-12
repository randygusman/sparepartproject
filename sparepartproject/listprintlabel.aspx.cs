using MongoDB.Driver.Core.Misc;
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
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class listprintlabel : System.Web.UI.Page
    {
        string getUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //[SPI_getPartComing_printLabel]2


        public void updateStatusPrint(int id, string close, string takenBy, string model)
        {
            //bagian untuk delete data issued tersebut berdasarkan id issued
            string str = @"Data Source=172.16.111.174\SQLEXPRESS;Initial Catalog=sparepartworld;User ID=sa;Password=Itmaintenance4!";
            SqlConnection cn = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SPI_getPartComing_printLabel_updateStatus", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@dateclose", close);
            cmd.Parameters.AddWithValue("@takenBy", takenBy);
            cmd.Parameters.AddWithValue("@model", model);

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                //setelah data berhasil terdelete, lakukan update qty pada database
            }
            catch (Exception ex)
            {

            }
            cn.Close();
        }

        [WebMethod]
        public static List<listPrintLabel> GetEvents()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("SPI_getPartComing_printLabel", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);

            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {

            }

            return dt.AsEnumerable().Select(datarow =>
            new listprintlabel.listPrintLabel()
            {
                id = Convert.ToInt32(datarow["id"]),
                itemDescription = Convert.ToString(datarow["itemDescription"]),
                partcode = Convert.ToString(datarow["partcode"]),

                pic = Convert.ToString(datarow["pic"]),
                purpose = Convert.ToString(datarow["purpose"]),
                qtyNumber = Convert.ToInt32(datarow["qtyNumber"]),
                poNumber = Convert.ToString(datarow["poNumber"]),
                receivedSPI = Convert.ToDateTime(datarow["receivedSPI"]).ToString("MMM-dd yyyy"),
                apply = Convert.ToString(datarow["apply"]),
                model = Convert.ToString(datarow["originalModel"]),
            }).ToList();
        }

        public class listPrintLabel
        {
            public int id { get; set; }
            public string itemDescription { get; set; }
            public string partcode { get; set; }
            public string pic { get; set; }
            public string purpose { get; set; }
            public int qtyNumber { get; set; }
            public string poNumber { get; set; }
            public string receivedSPI { get; set; }
            public string model { get; set; }
            public string apply { get; set; }
        }

        public void print()
        {
            string ID;
            var a = tab_content.Value;
            var count = rowCount.Value;

            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');
            DateTime now = DateTime.Now;
            int ketetapan = items.Length;

            ExcelPackage.LicenseContext = LicenseContext.Commercial;
            ExcelPackage excel = new ExcelPackage();

            var workSheet = excel.Workbook.Worksheets.Add("Print Label");

            workSheet.Cells["C4"].Value = ": " + items[3];
            workSheet.Cells["C5"].Value = ": " + items[6];
            workSheet.Cells["C6"].Value = ": " + items[7] + "        (Due Date : " + Convert.ToDateTime(items[7]).AddDays(150).ToString("MMM-dd yyyy") + ")";
            List<int> listID = new List<int>();
            for (int i = 0; i < ketetapan; i += 10)
            {
                if (i == 0)
                {
                    workSheet.Cells[i + 8, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i + 8, 3].Value = items[i + 8];
                    workSheet.Cells[i + 8, 4].Value = items[i + 5];
                    //listID.Add(Convert.ToInt32(items[i]));
                }
                else if (i == 10)
                {
                    workSheet.Cells[i - 1, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i - 1, 3].Value = items[i + 8];
                    workSheet.Cells[i - 1, 4].Value = items[i + 5];
                    //listID.Add(Convert.ToInt32(items[i]));

                }
                else if (i == 20)
                {
                    workSheet.Cells[i - 10, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i - 10, 3].Value = items[i + 8];
                    workSheet.Cells[i - 10, 4].Value = items[i + 5];
                }
                else if (i == 30)
                {
                    workSheet.Cells[i - 19, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i - 19, 3].Value = items[i + 8];
                    workSheet.Cells[i - 19, 4].Value = items[i + 5];
                }
                else if (i == 40)
                {
                    workSheet.Cells[i - 28, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i - 28, 3].Value = items[i + 8];
                    workSheet.Cells[i - 28, 4].Value = items[i + 5];
                }
                else if (i == 50)
                {
                    workSheet.Cells[i - 37, 2].Value = items[i + 1] + " / " + items[i + 2];
                    workSheet.Cells[i - 37, 3].Value = items[i + 8];
                    workSheet.Cells[i - 37, 4].Value = items[i + 5];
                }

                //aktifkan ini jika harus delete item saat sudah di print label
                //updateStatusPrint(Convert.ToInt32(items[i]));

            }

            workSheet.Cells["A1"].Value = "IK SPAREPART INVENTORY";
            workSheet.Cells["A1"].Style.Font.Bold = true;
            workSheet.Cells["A1"].Style.Font.Size = 14;
            workSheet.Column(1).Width = 5;
            workSheet.Column(2).Width = 35;
            workSheet.Column(3).Width = 7;
            workSheet.Column(4).Width = 35;

            workSheet.Cells["A1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Cells["A1:D1"].Merge = true;

            workSheet.Cells["A2"].Value = "PART COMING ACTIVITY";
            workSheet.Cells["A2"].Style.Font.Bold = true;
            workSheet.Cells["A2"].Style.Font.Size = 12;
            workSheet.Cells["A2"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Cells["A2:D2"].Merge = true;

            workSheet.Cells["A2"].Style.Fill.PatternType = ExcelFillStyle.Solid;
            workSheet.Cells["A2"].Style.Fill.BackgroundColor.SetColor(Color.Yellow);

            workSheet.Cells["A4"].Value = "PO NO";
            workSheet.Cells["A5"].Value = "REQUESTER / ID NO";
            workSheet.Cells["A6"].Value = "SPI RECEIVED DATE";

            workSheet.Cells["A7"].Value = "NO";
            workSheet.Cells["B7"].Value = "ITEM / PARTCODE";
            workSheet.Cells["C7"].Value = "QTY";
            workSheet.Cells["D7"].Value = "APPLY / REASON";

            workSheet.Cells["A8"].Value = "1";
            workSheet.Cells["A9"].Value = "2";
            workSheet.Cells["A10"].Value = "3";
            workSheet.Cells["A11"].Value = "4";
            workSheet.Cells["A12"].Value = "5";
            workSheet.Cells["A13"].Value = "6";

            var colc = workSheet.Cells[7, 1, 13, 4];

            // Assign borders
            colc.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            colc.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            colc.Style.Border.Left.Style = ExcelBorderStyle.Thin;
            colc.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            excel.Workbook.Worksheets[0].View.ShowGridLines = false;


            workSheet.Row(7).Height = 40;
            workSheet.Row(8).Height = 40;
            workSheet.Row(9).Height = 40;
            workSheet.Row(10).Height = 40;
            workSheet.Row(11).Height = 40;
            workSheet.Row(12).Height = 40;
            workSheet.Row(13).Height = 40;

            workSheet.Cells["A7:D13"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Cells["A7:D13"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            workSheet.Cells["A7:D13"].Style.WrapText = true;

            var colc4 = workSheet.Cells[1, 1, 1, 4];
            colc4.Style.Border.Top.Style = ExcelBorderStyle.Thin;

            var colc2 = workSheet.Cells[1, 1, 6, 1];
            colc2.Style.Border.Left.Style = ExcelBorderStyle.Thin;

            var colc3 = workSheet.Cells[1, 4, 6, 4];
            colc3.Style.Border.Right.Style = ExcelBorderStyle.Thin;

            ////first you need to get reference to your workbook, but I assume you already have this
            ////...
            ////then you can add an information about desired print area
            //DefinedNames definedNames = new DefinedNames();
            //DefinedName printAreaDefName = new DefinedName() { Name = "_xlnm.Print_Area", LocalSheetId = (UInt32Value)0U };
            //printAreaDefName.Text = "Worksheet1!$A$1:$G$19";
            //definedNames.Append(printAreaDefName);
            ////then you should append the created element to your workbook
            ////...
            //workbook1.Append(definedNames);
            //printarea = 
            papersize = ePaperSize.A5;
            workSheet.PrinterSettings.PaperSize = papersize;
            workSheet.PrinterSettings.Orientation = eOrientation.Landscape;
            workSheet.PrinterSettings.FitToPage = true;
            workSheet.PrinterSettings.LeftMargin = Convert.ToDecimal(1.2);

            HttpCookie cookie = new HttpCookie("ExcelDownloadFlag");
            cookie.Value = "Flag";
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.AppendCookie(cookie);
            // end
            using (var memoryStream = new System.IO.MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=SPI Print Label Activity.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }


        }

        public ExcelRangeBase printarea { get; set; }
        public bool fittopage { get; set; }
        public ePaperSize papersize { get; set; }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            print();
        }

        public void closeActivity()
        {
            string ID;
            var a = tabcontentclose.Value;
            var count = rowCount.Value;


            string[] items = new string[] { "" };
            //somewhere in your code
            items = a.Split(',');
            DateTime now = DateTime.Now;
            int ketetapan = items.Length;

            string close = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd")).ToString();

            for (int i = 0; i < ketetapan; i += 12)
            //for (int i = 0; i < ketetapan; i += 10)
            {
                updateStatusPrint(Convert.ToInt32(items[i]), close, items[i + 9], items[i + 10]);
                sendEmail(items[i + 1], items[i + 2], items[i + 5], items[i + 6], items[i + 9], items[i + 10], items[i + 3]);
            }

        }

        public void sendEmail(string description, string partcode, string apply, string PIC, string takenBy, string model, string PONo)
        {
            string color1 = "green";

            SmtpClient client = new SmtpClient("mx.apo.epson.net");
            client.Port = 25;
            client.EnableSsl = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("peb.isdalert@sep.epson.com.sg", "");

            //
            MailMessage mail = new MailMessage("SPI_Part_Activity@sep.epson.com.sg", "eko.hartanto @sep.epson.com.sg,david.hermanto @sep.epson.com.sg,andre.hermawan @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,solfitrianto @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,cahyo.nugroho @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,didik.setyawan @sep.epson.com.sg,faishol.husni @sep.epson.com.sg,rifqi.usman @sep.epson.com.sg,wascadi @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg,sutarno@sep.epson.com.sg,bagus.setyawan@sep.epson.com.sg,PEB2122168@sep.epson.com.sg,ilham.mardhatillah@sep.epson.com.sg,randy.gusman@sep.epson.com.sg,loby.litanelaz@sep.epson.com.sg,sylfany.dellasagita@sep.epson.com.sg,wahyu.rukmana@sep.epson.com.sg,ely.budiono@sep.epson.com.sg,nanang.wahyunianto@sep.epson.com.sg,PEB2120128@sep.epson.com.sg,munjaroh@sep.epson.com.sg,PEB2111633@sep.epson.com.sg,mochammad.yusufaditya@sep.epson.com.sg,irfan.faisal@sep.epson.com.sg,PEB2120807@sep.epson.com.sg,muhammad.syahrul@sep.epson.com.sg");    //,andre.hermawan@sep.epson.com.sg   , andre.hermawan@sep.epson.com.sg,PEB2111659@sep.epson.com.sg"           //listName); ///*,andre.hermawan@sep.epson.com.sg amri.gunawan@sep.epson.com.sg*/
            string cc = "deni.ari@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg,tangguh.wisanto@sep.epson.com.sg"; //"agus.syaepuloh @sep.epson.com.sg, deni.ari @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,wascadi @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg"; //"nanang.setiawan@sep.epson.com.sg,mokhamat.ariyanto @sep.epson.com.sg,iktiyar.wicaksono @sep.epson.com.sg,gandhi.sucahyo@sep.epson.com.sg,natalia.jahja @sep.epson.com.sg";//"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"randy.gusman@sep.epson.com.sg";// 

            //MailMessage mail = new MailMessage("SPI_Part_Activity@sep.epson.com.sg", "randy.gusman@sep.epson.com.sg"); 
            //string cc = "randy.gusman@sep.epson.com.sg";

            mail.Subject = "[MTC-ENG] [IMPORTANT!] Pengambilan Part Activity";

            string textBody = "<span style='font-family: calibri; font-size:14px'>Dear All, <br><br>List part pada table di bawah ini, sudah diambil dari SPI <br><br>" + "<table style=\"text-align:center;font-family: calibri; font-size:25px; border:1px solid\" width = " + 900 + ">";
            textBody += "<tr bgcolor='" + color1 + "' style=\"padding:8px; border:1px solid\"><td style='font-family: calibri;border:1px solid; border-color:white white white white; font-size:26px; color:white;' colspan='2' ><center><b>SPI ANNOUNCEMENT</b></th></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr bgcolor='" + color1 + "' style=\"padding:8px; border:1px solid\"><td style='font-family: calibri;border:1px solid; border-color:white white white white; font-size:22px; color:white;' colspan='2' ><center><b>Activity Part di bawah ini sudah diambil</b></th></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";

            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Item Desc</b></td><td style=\"text-align:left;\">  &nbsp;&nbsp; :&nbsp; " + description + "</td></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Partcode</b></td><td style=\"text-align:left;\">  &nbsp;&nbsp; :&nbsp; " + partcode + "</td></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px; color:red;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Apply</b></td><td style=\"text-align:left; color:red;\"> &nbsp;&nbsp; :&nbsp;<b> " + apply + "</b></td></tr>";
            //textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  QTY</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + dt30.Rows[loopCount]["qtyNumber"] + " " + dt30.Rows[loopCount]["qtySatuan"] + "</td></tr>";
            //textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  PO Number</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + dt30.Rows[loopCount]["poNumber"] + "</td></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  PO No</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + PONo + "</td></tr>";

            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Order By</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + PIC + "</td></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Taken By</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + takenBy + "</td></tr>";

            //textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Order By</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + dt30.Rows[loopCount]["pic"] + "</td></tr>";
            //textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  SPI Received Date</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + Convert.ToDateTime(dt30.Rows[loopCount]["receivedSPI"]).ToString("MMM-dd yyyy") + "</td></tr>";
            textBody += "<tr><td style=\"text-align:left; width:280px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>  Model</b></td><td style=\"text-align:left;\"> &nbsp;&nbsp; :&nbsp; " + model + "</td></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "<tr></tr>";
            textBody += "</table>";
            textBody += "<br><br>Terimakasih atas perhatiannya.<br> <br> Best Regard’s<br>";
            textBody += "<span style='font-family: calibri; font-size:18px; color:blue'><b>SPI<br>";
            mail.Body = textBody;
            mail.IsBodyHtml = true;

            mail.CC.Add(cc);

            try
            {
                client.Send(mail);
                //Console.WriteLine("Mail Success '" + DateTime.Now + "'");
                //UpdateOpenData.update30Min(Convert.ToInt32(dt30.Rows[loopCount]["id"]));
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                //Console.ReadLine();
            }

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            closeActivity();
        }
    }


}