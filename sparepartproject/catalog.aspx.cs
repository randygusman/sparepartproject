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
using Newtonsoft.Json;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Net.Mail;

namespace sparepartproject
{
    public partial class catalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string getAllSparepart(int page, int pageSize, string search = "")
        {
            // Menyusun list untuk menyimpan data sparepart
            List<SPI_DatabasePart.DatabaseParts> sparepartlist = new List<SPI_DatabasePart.DatabaseParts>();

            // Mendapatkan connection string dari web.config
            string CS = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                // Menyiapkan command untuk stored procedure
                SqlCommand cmd = new SqlCommand("SPI_getDatabasePart4", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Menambahkan parameter untuk paging dan pencarian
                cmd.Parameters.AddWithValue("@Page", page);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);
                cmd.Parameters.AddWithValue("@Search", search); // Menambahkan parameter pencarian

                // Membuka koneksi
                con.Open();

                // Menjalankan query dan membaca data
                SqlDataReader rdr = cmd.ExecuteReader();

                // Membaca hasil dari query
                while (rdr.Read())
                {
                    SPI_DatabasePart.DatabaseParts spareapart = new SPI_DatabasePart.DatabaseParts();

                    int _nowStock_ = Convert.ToInt32(rdr["nowStock"]);
                    int _minStock_ = Convert.ToInt32(rdr["minStock"]);

                    if ( _nowStock_> _minStock_)
                    {
                        spareapart._colour = "Green";
                    }else if(_nowStock_ == _minStock_)
                    {
                        spareapart._colour = "Light Green";
                    }
                    else if (_nowStock_ < _minStock_ && _nowStock_ != 0)
                    {
                        spareapart._colour = "Yellow";
                    }
                    else if (_nowStock_ == 0)
                    {
                        spareapart._colour = "Black";
                    }

                    spareapart._goodsCode = rdr["goodsCode"].ToString();
                    spareapart._goodsName = rdr["goodsName"].ToString();
                    spareapart._maker = rdr["maker"].ToString();
                    spareapart._model = rdr["model"].ToString();
                    spareapart._nowStock = Convert.ToInt32(rdr["nowStock"]);
                    spareapart._subKeeping = rdr["subKeeping"].ToString();
                    spareapart._goodsDesc = rdr["goodsDesc"].ToString();
                    spareapart._status = rdr["stockCategory"].ToString();
                    spareapart._vendor = rdr["suppName"].ToString();
                    spareapart._attcFile_Picture = rdr["attcFile_Picture"].ToString();

                    // Menambahkan informasi peminjaman (jumlah yang dipinjam) ke objek sparepart
                    // Mengambil jumlah yang dipinjam
                    spareapart._loanedQty = rdr.IsDBNull(rdr.GetOrdinal("loanedQty")) ? 0 : Convert.ToInt32(rdr["loanedQty"]);

                    // Menambahkan data sparepart ke list
                    sparepartlist.Add(spareapart);
                }
            }

            // Mengembalikan data dalam format JSON
            return JsonConvert.SerializeObject(sparepartlist);
        }


        [WebMethod]
        public static bool InsertIssuedPart(string goodsName, string goodsCode, string qtyIssued, string issuedBy, string reason, string lineName, string cellName, string model, string issuedByAccount)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            // Mengubah qtyIssued ke integer
            int qty = Convert.ToInt32(qtyIssued);
            int nowStock = 0; // Variabel untuk menyimpan nilai stock setelah dikurangi
            int minStock = 0; // Variabel untuk menyimpan nilai minStock
            string goodsDesc_ = "";

            // Insert data ke tabel dailyIssued
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    // Membuka koneksi
                    con.Open();

                    // Insert data ke tabel dailyIssued
                    string insertQuery = "INSERT INTO SPI_DailyIssuedSparepart (goodsName, goodsCode, qtyIssued, issuedBy_ID, issuedDate, reason, lineName, cell, model, issuedBy_Name, issuedByAccount) VALUES (@goodsName, @goodsCode, @qtyIssued, @issuedBy, @issuedDate, @reason, @lineName, @cellName, @model, @issuedBy_Name, @issuedByAccount)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@goodsName", goodsName);
                        cmd.Parameters.AddWithValue("@goodsCode", goodsCode);
                        cmd.Parameters.AddWithValue("@qtyIssued", qty);
                        cmd.Parameters.AddWithValue("@issuedBy", issuedBy);
                        cmd.Parameters.AddWithValue("@issuedBy_Name", issuedBy);
                        cmd.Parameters.AddWithValue("@issuedDate", DateTime.Now.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@reason", reason.ToUpper());
                        cmd.Parameters.AddWithValue("@lineName", lineName);
                        cmd.Parameters.AddWithValue("@cellName", cellName);
                        cmd.Parameters.AddWithValue("@model", model);
                        cmd.Parameters.AddWithValue("@issuedByAccount", issuedByAccount);
                        cmd.ExecuteNonQuery();
                    }

                    // Mengurangi stok dari tabel sparepart berdasarkan goodsCode
                    string updateQuery = "UPDATE SPI_DatabasePart SET nowStock = nowStock - @qtyIssued WHERE goodsCode = @goodsCode";
                    using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, con))
                    {
                        cmdUpdate.Parameters.AddWithValue("@qtyIssued", qty);
                        cmdUpdate.Parameters.AddWithValue("@goodsCode", goodsCode);
                        cmdUpdate.ExecuteNonQuery();
                    }

                    // Mengambil nilai nowStock dan minStock setelah stok dikurangi
                    string selectQuery = "SELECT nowStock, minStock, goodsDesc FROM SPI_DatabasePart WHERE goodsCode = @goodsCode";
                    using (SqlCommand cmdSelect = new SqlCommand(selectQuery, con))
                    {
                        cmdSelect.Parameters.AddWithValue("@goodsCode", goodsCode);
                        using (SqlDataReader reader = cmdSelect.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nowStock = Convert.ToInt32(reader["nowStock"]);
                                minStock = Convert.ToInt32(reader["minStock"]);
                                goodsDesc_ = reader["goodsDesc"].ToString();
                            }
                        }
                    }

                    // Cek apakah nowStock setelah dikurangi lebih kecil atau sama dengan minStock
                    if (nowStock <= minStock)
                    {
                        // Insert data ke tabel pre_order
                        string insertPreOrderQuery = "INSERT INTO SPI_Pre_OrderPart (goodsCode, goodsName, goodsDesc, nowStock, minStock, minOrder, preOrderQty, model, datePreOrder, SPI_IDissued) " +
                                                     "VALUES (@goodsCode, @goodsName, @goodsDesc, @nowStock, @minStock, @minOrder, @preOrderQty, @model, @datePreOrder, @SPI_IDissued)";
                        using (SqlCommand cmdInsertPreOrder = new SqlCommand(insertPreOrderQuery, con))
                        {
                            cmdInsertPreOrder.Parameters.AddWithValue("@goodsCode", goodsCode);
                            cmdInsertPreOrder.Parameters.AddWithValue("@goodsName", goodsName);
                            cmdInsertPreOrder.Parameters.AddWithValue("@goodsDesc", goodsDesc_); // Isi sesuai kebutuhan
                            cmdInsertPreOrder.Parameters.AddWithValue("@nowStock", nowStock);  // Stok yang sudah dikurangi
                            cmdInsertPreOrder.Parameters.AddWithValue("@minStock", minStock);
                            cmdInsertPreOrder.Parameters.AddWithValue("@minOrder", 1);  // Misal minOrder = 1
                            cmdInsertPreOrder.Parameters.AddWithValue("@preOrderQty", qty); // Jumlah yang dipesan
                            cmdInsertPreOrder.Parameters.AddWithValue("@model", model);
                            cmdInsertPreOrder.Parameters.AddWithValue("@datePreOrder", DateTime.Now);
                            cmdInsertPreOrder.Parameters.AddWithValue("@SPI_IDissued", ""); // Isi dengan ID yang sesuai jika diperlukan
                            cmdInsertPreOrder.ExecuteNonQuery();
                        }
                    }

                    return true; // Return true jika berhasil
                }
                catch (Exception ex)
                {
                    // Log error atau kirim email notifikasi kesalahan
                    return false; // Return false jika ada error
                }
                finally
                {
                    con.Close();
                }
            }
        }


        //[WebMethod]
        //public static string SimpanDataLoan(string goodsName, string goodsCode, int qtyIssued, string issuedBy, string reason, string lineName, string cellName, string model, string issuedByAccount, string picture)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
        //    string result = "";

        //    try
        //    {
        //        // Tentukan folder path fisik di server (D:/Picture SPI yang terhubung ke /picture di IIS)
        //        string folderPath = @"D:\Picture SPI Loan\";

        //        // Pastikan folder fisik ada, jika tidak, buat folder
        //        if (!Directory.Exists(folderPath))
        //        {
        //            Directory.CreateDirectory(folderPath);
        //        }

        //        // Tentukan file path untuk gambar berdasarkan goodsCode
        //        string filePath = Path.Combine(folderPath, goodsCode.ToUpper() + "loan" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg");

        //        File.WriteAllBytes(filePath, Convert.FromBase64String(picture));


        //        // Membuat URL gambar untuk disimpan ke database
        //        string imageUrl = "http://172.16.111.174:9090/pictureloan/" + goodsCode.ToUpper() + "loan"+ DateTime.Now.ToString("yyyyMMddHHmmss") +".jpg";

        //        // Simpan data ke database
        //        string query = "INSERT INTO SPI_SparepartLoan (goodsCode, model, line, cell, issuedBy, issuedQty, issuedOn, issuedByAccount, imageApproval, reason, status) " +
        //                       "VALUES (@goodsCode, @model, @line, @cell, @issuedBy, @issuedQty, @issuedOn, @issuedByAccount, @imageApproval, @reason, @status)";

        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            command.Parameters.AddWithValue("@goodsCode", goodsCode);
        //            command.Parameters.AddWithValue("@model", model);
        //            command.Parameters.AddWithValue("@line", lineName);
        //            command.Parameters.AddWithValue("@cell", cellName);
        //            command.Parameters.AddWithValue("@issuedBy", issuedBy);
        //            command.Parameters.AddWithValue("@issuedQty", qtyIssued);
        //            command.Parameters.AddWithValue("@issuedOn", DateTime.Now);
        //            command.Parameters.AddWithValue("@issuedByAccount", issuedByAccount);
        //            command.Parameters.AddWithValue("@imageApproval", imageUrl); // Simpan URL gambar
        //            command.Parameters.AddWithValue("@reason", reason); // Simpan URL gambar
        //            command.Parameters.AddWithValue("@status", "LOANED"); // Simpan URL gambar

        //            connection.Open();
        //            command.ExecuteNonQuery();
        //            connection.Close();
        //        }

        //        // Mengurangi stok dari tabel sparepart berdasarkan goodsCode
        //        string updateQuery = "UPDATE SPI_DatabasePart SET nowStock = nowStock - @qtyIssued WHERE goodsCode = @goodsCode";
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, connection))
        //        {
        //            cmdUpdate.Parameters.AddWithValue("@qtyIssued", qtyIssued);
        //            cmdUpdate.Parameters.AddWithValue("@goodsCode", goodsCode);
        //            connection.Open();
        //            cmdUpdate.ExecuteNonQuery();
        //            connection.Close();
        //        }

        //        result = "Data berhasil di Loan.";
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log error
        //        Console.Error.WriteLine(ex.Message);
        //        result = "Terjadi kesalahan: " + ex.Message;
        //    }

        //    return result;
        //}
        [WebMethod]
        public static string SimpanDataLoan(string goodsName, string goodsCode, int qtyIssued, string issuedBy, string reason, string lineName, string cellName, string model, string issuedByAccount, string picture)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
            string result = "";

            try
            {
                // Tentukan folder path fisik di server (D:/Picture SPI yang terhubung ke /picture di IIS)
                string folderPath = @"D:\Picture SPI Loan\";

                // Pastikan folder fisik ada, jika tidak, buat folder
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Tentukan file path untuk gambar atau PDF berdasarkan goodsCode
                string filePath = "";
                string fileExtension = "";
                string mimeType = "";

                // Periksa jenis file yang diunggah
                if (picture.StartsWith("data:image/"))
                {
                    // File gambar
                    fileExtension = ".jpg";
                    mimeType = "image/jpeg";
                    // Hilangkan header dan ambil base64 string
                    picture = picture.Substring("data:image/jpeg;base64,".Length); // sesuaikan dengan jenis gambar yang mungkin
                }
                else if (picture.StartsWith("data:application/pdf"))
                {
                    // File PDF
                    fileExtension = ".pdf";
                    mimeType = "application/pdf";
                    // Hilangkan header dan ambil base64 string
                    picture = picture.Substring("data:application/pdf;base64,".Length);
                }
                else
                {
                    throw new Exception("Jenis file tidak valid.");
                }

                filePath = Path.Combine(folderPath, goodsCode.ToUpper() + "loan" + DateTime.Now.ToString("yyyyMMddHHmmss") + fileExtension);

                // Simpan file ke server
                byte[] bytes = Convert.FromBase64String(picture);
                File.WriteAllBytes(filePath, bytes);

                // Membuat URL file untuk disimpan ke database
                string fileUrl = "http://172.16.111.174:9090/pictureloan/" + Path.GetFileName(filePath);

                // Simpan data ke database
                string query = "INSERT INTO SPI_SparepartLoan (goodsCode, model, line, cell, issuedBy, issuedQty, issuedOn, issuedByAccount, imageApproval, reason, status) " +
                               "VALUES (@goodsCode, @model, @line, @cell, @issuedBy, @issuedQty, @issuedOn, @issuedByAccount, @imageApproval, @reason, @status)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@goodsCode", goodsCode);
                    command.Parameters.AddWithValue("@model", model);
                    command.Parameters.AddWithValue("@line", lineName);
                    command.Parameters.AddWithValue("@cell", cellName);
                    command.Parameters.AddWithValue("@issuedBy", issuedBy);
                    command.Parameters.AddWithValue("@issuedQty", qtyIssued);
                    command.Parameters.AddWithValue("@issuedOn", DateTime.Now);
                    command.Parameters.AddWithValue("@issuedByAccount", issuedByAccount);
                    command.Parameters.AddWithValue("@imageApproval", fileUrl); // Simpan URL file
                    command.Parameters.AddWithValue("@reason", reason.ToUpper());
                    command.Parameters.AddWithValue("@status", "LOANED");

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // Mengurangi stok dari tabel sparepart berdasarkan goodsCode
                string updateQuery = "UPDATE SPI_DatabasePart SET nowStock = nowStock - @qtyIssued WHERE goodsCode = @goodsCode";
                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, connection))
                {
                    cmdUpdate.Parameters.AddWithValue("@qtyIssued", qtyIssued);
                    cmdUpdate.Parameters.AddWithValue("@goodsCode", goodsCode);
                    connection.Open();
                    cmdUpdate.ExecuteNonQuery();
                    connection.Close();
                }

                //string ccTambahan = "";

                //if (model == "DEVICE")
                //{
                //    ccTambahan = ",maruli.valentino@sep.epson.com.sg,ahmad.syarifuddin@sep.epson.com.sg";
                //}else if (model == "FA")
                //{
                //    ccTambahan = ",randy.gusman@sep.epson.com.sg";
                //}else if(model == "MOLDING")
                //{
                //    ccTambahan = ",makmuri@sep.epson.com.sg";
                //}else if (model == "FFD")
                //{
                //    ccTambahan = ",widi.hidayat@sep.epson.com.sg";
                //}

                ////kirim email
                ////string toMail = "deni.ari@sep.epson.com.sg, adi.setiawan @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, mohamad.ikrom @sep.epson.com.sg, eko.hartanto @sep.epson.com.sg, solfitrianto @sep.epson.com.sg, suryono.talwibowo @sep.epson.com.sg, yanuar.andriansyah @sep.epson.com.sg, cahyo.nugroho @sep.epson.com.sg, dedy.nurrochman @sep.epson.com.sg, didik.setyawan @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg, rifqi.usman @sep.epson.com.sg, wascadi @sep.epson.com.sg, PEB2131972 @sep.epson.com.sg, mokhamad.ardian @sep.epson.com.sg, muhammad.yusuf @sep.epson.com.sg, nurmaki.elmadani @sep.epson.com.sg, welson @sep.epson.com.sg, joko.sulistiyo @sep.epson.com.sg, saikhu.rochman @sep.epson.com.sg, sunaryo @sep.epson.com.sg, edi.wiyono @sep.epson.com.sg, ahdiath.indrasetyadi @sep.epson.com.sg, trendy.lanang @sep.epson.com.sg, mega.apriyani @sep.epson.com.sg,randy.gusman @sep.epson.com.sg,sutarno@sep.epson.com.sg,dany.yunata@sep.epson.com.sg,amri.gunawan@sep.epson.com.sg,agung.sumbarra@sep.epson.com.sg,doan.nico@sep.epson.com.sg,samiudin@sep.epson.com.sg,rio.adhitama@sep.epson.com.sg,yuli.astrianik@sep.epson.com.sg,asdi.suhendra@sep.epson.com.sg,ari.setiyobudi@sep.epson.com.sg,hery.purwantoro@sep.epson.com.sg,romi.asmadi@sep.epson.com.sg,PEB2140722@sep.epson.com.sg,agus.pramudia@sep.epson.com.sg,bagas.cindarbumi@sep.epson.com.sg,sofwan.bayu@sep.epson.com.sg,septian.wibowo@sep.epson.com.sg,Muhammad.Isnaini@sep.epson.com.sg,PEB2140107@sep.epson.com.sg,dopi.eluri@sep.epson.com.sg,ahmad.setiyawan@sep.epson.com.sg,ahmad.sugiarto@sep.epson.com.sg,holden.simanjuntak@sep.epson.com.sg,PEB2111457@sep.epson.com.sg,PEB2122178@sep.epson.com.sg,zulhendy.masruddin@sep.epson.com.sg,rachmad.rizkybiantoro@sep.epson.com.sg,peb2111459@sep.epson.com.sg,khafid.masyudi@sep.epson.com.sg,PEB2111838@sep.epson.com.sg,PEB2111460@sep.epson.com.sg,januar.efendi@sep.epson.com.sg,yani.ariana@sep.epson.com.sg,PEB2140104@sep.epson.com.sg,PEB2101037@sep.epson.com.sg,PEB2110825@sep.epson.com.sg,PEB2111640@sep.epson.com.sg,nanang.wahyunianto@sep.epson.com.sg,wahyu.rukmana@sep.epson.com.sg,PEB2120127@sep.epson.com.sg,PEB2120620@sep.epson.com.sg,PEB2120717@sep.epson.com.sg,PEB2131878@sep.epson.com.sg,PEB2131967@sep.epson.com.sg,PEB2131971@sep.epson.com.sg,PEB2131973@sep.epson.com.sg,PEB2140074@sep.epson.com.sg,PEB2140253@sep.epson.com.sg,PEB2140717@sep.epson.com.sg,PEB2140719@sep.epson.com.sg,nurhuda@sep.epson.com.sg,PEB2141758@sep.epson.com.sg,agung.dwiprasetyo@sep.epson.com.sg,muamar.mursjid@sep.epson.com.sg,muhammad.syahrul@sep.epson.com.sg,teguh_trim@sep.epson.com.sg,PEB2101682@sep.epson.com.sg,PEB2110824@sep.epson.com.sg,PEB2110849@sep.epson.com.sg,PEB2111463@sep.epson.com.sg,PEB2111633@sep.epson.com.sg,PEB2120091@sep.epson.com.sg,PEB2120128@sep.epson.com.sg,PEB2120602@sep.epson.com.sg,PEB2131169@sep.epson.com.sg,PEB2141010@sep.epson.com.sg,PEB2142035@sep.epson.com.sg,ichwanul.muslimin@sep.epson.com.sg,mranu.robanny@sep.epson.com.sg,adi.bayusaputro@sep.epson.com.sg,fandy.fahrizalardimuhammad@sep.epson.com.sg,PEB2110851@sep.epson.com.sg,PEB2111468@sep.epson.com.sg,PEB2111661@sep.epson.com.sg,PEB2120126@sep.epson.com.sg,ibnu.sholihan@sep.epson.com.sg,alplinto.keliat@sep.epson.com.sg,PEB2111840@sep.epson.com.sg,PEB2120627@sep.epson.com.sg,PEB2120807@sep.epson.com.sg,PEB2141011@sep.epson.com.sg,henry.prasetyo@sep.epson.com.sg,PEB2110823@sep.epson.com.sg,PEB2110846@sep.epson.com.sg,PEB2110848@sep.epson.com.sg,PEB2110924@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,alvian@sep.epson.com.sg,PEB2120534@sep.epson.com.sg,PEB2140103@sep.epson.com.sg,angga.yudha@sep.epson.com.sg,PEB2131968@sep.epson.com.sg,ilyas.lukmanulhakim@sep.epson.com.sg,imam@sep.epson.com.sg,mohammad.faisal@sep.epson.com.sg,munjaroh@sep.epson.com.sg,denny.shalihat@sep.epson.com.sg,willi.hendrastaka@sep.epson.com.sg,PEB2101686@sep.epson.com.sg,lalang.kristiawan@sep.epson.com.sg,PEB2111646@sep.epson.com.sg,PEB2111781@sep.epson.com.sg,PEB2111835@sep.epson.com.sg,PEB2120629@sep.epson.com.sg,PEB2122168@sep.epson.com.sg,wahid.husin@sep.epson.com.sg,PEB2130706@sep.epson.com.sg,PEB2131118@sep.epson.com.sg,PEB2131121@sep.epson.com.sg,PEB2131876@sep.epson.com.sg,PEB2140718@sep.epson.com.sg,PEB2141007@sep.epson.com.sg,PEB2141759@sep.epson.com.sg,PEB2141821@sep.epson.com.sg,PEB2142072@sep.epson.com.sg,andika.putra@sep.epson.com.sg,mdehen.wijaya@sep.epson.com.sg,rizki.hamdani@sep.epson.com.sg,PEB2131970@sep.epson.com.sg,arius.kristanto@sep.epson.com.sg,munifatul.mustofiah@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,wan.tinafridayanti@sep.epson.com.sg,PEB2111659@sep.epson.com.sg,andre.hermawan@sep.epson.com.sg,ferdiansyah.marja@sep.epson.com.sg";
                //string toMail = "rizky.afdhal@sep.epson.com.sg";
                //string cc = "andre.hermawan@sep.epson.com.sg" + ccTambahan; //"agus.syaepuloh @sep.epson.com.sg, deni.ari @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,wascadi @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg"; //"nanang.setiawan@sep.epson.com.sg,mokhamat.ariyanto @sep.epson.com.sg,iktiyar.wicaksono @sep.epson.com.sg,gandhi.sucahyo@sep.epson.com.sg,natalia.jahja @sep.epson.com.sg";//"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"randy.gusman@sep.epson.com.sg";// 
                ////string cc = "hermawan@sep.epson.com.sg,deni.ari @sep.epson.com.sg,andre.hermawan@sep.epson.com.sg" + ccTambahan; //"agus.syaepuloh @sep.epson.com.sg, deni.ari @sep.epson.com.sg, david.hermanto @sep.epson.com.sg, andre.hermawan @sep.epson.com.sg,adi.setiawan @sep.epson.com.sg,wascadi @sep.epson.com.sg,mohamad.ikrom @sep.epson.com.sg,suryono.talwibowo @sep.epson.com.sg,dedy.nurrochman @sep.epson.com.sg,PEB2131972 @sep.epson.com.sg"; //"nanang.setiawan@sep.epson.com.sg,mokhamat.ariyanto @sep.epson.com.sg,iktiyar.wicaksono @sep.epson.com.sg,gandhi.sucahyo@sep.epson.com.sg,natalia.jahja @sep.epson.com.sg";//"agus.syaepuloh@sep.epson.com.sg,nanang.setiawan@sep.epson.com.sg"; //"randy.gusman@sep.epson.com.sg";// 
                //SmtpClient client = new SmtpClient("mx.apo.epson.net");
                //client.Port = 25;
                //client.EnableSsl = false;
                //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client.UseDefaultCredentials = true;
                //client.Credentials = new System.Net.NetworkCredential("SPI_PartLoan@sep.epson.com.sg", "");

                //MailMessage mail = new MailMessage("SPI_PartLoan@sep.epson.com.sg", toMail);
                //mail.Subject = "[MTC-ENG] INFO LOAN PART";

                //string textBody = "<span style='font-family: calibri; font-size:14px'><b>Dear All<b>,<br><br>Here we share Loan Part information : </b></span><br>";
                

                //textBody += "<table style=\"text-align:center;font-family: calibri; font-size:11px\"width = " + 2400 + " cellpadding = " + 0 + " cellspacing =" + 0 + "><tr><td style=\"background-color:#305496;color:white;width:25px;border-left: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;border-right: 1px solid #000000;\"><center> <b>Goods Code</b></center> </td><td style=\"background-color:#305496; color:white; width:250px;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>Loan to Model</b></center> </td><td style=\"background-color:#305496;width:180px; color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>Loan By</b></center> </td><td style=\"background-color:#305496;width:180px;  color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>Loan Qty</b></center> </td><td style=\"background-color:#305496;width:180px;  color:white;border-right: 1px solid #000000;border-top: 1px solid #000000;border-bottom: 1px solid #000000;\"><center> <b>Project Name</b></center> </td></tr>";
                //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + goodsCode + "</td>";
                //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + model + "</td>";
                //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + issuedBy + "</td>";
                //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + qtyIssued + "</td>";
                //textBody += "<td style=\"border-bottom: 1px solid #000000;border-right: 1px solid #000000;\">" + reason + "</td>";

                //textBody += "</table>";
                //textBody += "<br/>";
                //textBody += "<br/>";
                //textBody += "<br/>";
                //textBody += "<span style='font-family: calibri;'>Thank you</span>";
                //textBody += "<br/>";
                //textBody += "<span style='font-family: calibri;'>SPI</span>";
                //mail.Body = textBody;

                //mail.IsBodyHtml = true;

                //mail.CC.Add(cc);

                //try
                //{
                //    client.Send(mail);
                //    mail.Dispose();
                //}
                //catch (Exception ex)
                //{

                //}

                result = "Data berhasil di Loan.";
            }
            catch (Exception ex)
            {
                // Log error
                Console.Error.WriteLine(ex.Message);
                result = "Terjadi kesalahan: " + ex.Message;
            }

            return result;
        }


    }
}