
using Newtonsoft.Json;
using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tavis.UriTemplates;

namespace sparepartproject
{
    public partial class registernew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Gantilah dengan connection string Anda sendiri
        public static string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;


        [WebMethod]
        public static List<string> GetGoodsCodeSuggestions(string prefixText)
        {
            List<string> goodsCodes = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            // Query database untuk mencari kode barang yang cocok dengan prefixText
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT GoodsCode FROM SPI_DatabasePart WHERE GoodsCode LIKE @prefixText ORDER BY GoodsCode desc";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@prefixText", "%" + prefixText + "%");
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        goodsCodes.Add(reader["GoodsCode"].ToString());
                    }
                }
            }

            return goodsCodes;
        }

        [WebMethod]
        public static string GetSuppliers()
        {
            List<string> suppliers = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT vendor_name FROM SPI_Vendor order by vendor_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    suppliers.Add(reader["vendor_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(suppliers);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetCurrency()
        {
            List<string> currencies = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Currency order by currency_code asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    currencies.Add(reader["currency_code"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(currencies);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetMaker()
        {
            List<string> makers = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Maker order by nama_maker asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    makers.Add(reader["nama_maker"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(makers);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetModel()
        {
            List<string> models = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Model order by model asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    models.Add(reader["model"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(models);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetUnit()
        {
            List<string> units = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Unit order by unit_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    units.Add(reader["unit_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(units);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetKeeping()
        {
            List<string> keepings = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_Keeping order by cabinet_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    keepings.Add(reader["cabinet_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(keepings);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetSubKeeping(string cabinet)
        {
            List<string> drawers = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_SubKeeping where cabinet_name = '" + cabinet + "' order by drawer_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    drawers.Add(reader["drawer_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(drawers);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetCategoryPart()
        {
            List<string> categoryparts = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT * FROM SPI_CategoryPart order by category_part desc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    categoryparts.Add(reader["category_part"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(categoryparts);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetEmployee()
        {
            List<string> employees = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionStringName"].ConnectionString;

            string query = "SELECT emp_name FROM m_employee_macheng order by emp_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    employees.Add(reader["emp_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(employees);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetLineName()
        {
            List<string> lines = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT line_name FROM SPI_LineName order by line_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    lines.Add(reader["line_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(lines);
            return jsonResponse;
        }

        [WebMethod]
        public static string GetCell()
        {
            List<string> cells = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            string query = "SELECT cell_name FROM SPI_Cell order by cell_name asc"; // Gantilah dengan nama tabel supplier Anda

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    // Menambahkan setiap nama vendor ke dalam list suppliers
                    cells.Add(reader["cell_name"].ToString());
                }
            }

            // Mengonversi list supplier menjadi format JSON yang benar
            var jsonResponse = new JavaScriptSerializer().Serialize(cells);
            return jsonResponse;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UploadPicture(string goodsCode, string stockistName, string goodsName, string goodsDesc,
                                   string currency, string goodsUnit, string unitPrice, string maker,
                                   string model, string suppName, string keeping, string subKeeping,
                                   string maxStock, string minStock, string nowStock, string minOrder,
                                   string categoryPart, string poDoc, string stockCategory, string movingStatus,
                                   string remark,
                                   string predictiveMaintenance, string poGoods, string picture)
        {
            try
            {
                // Debugging: Print the received parameters
                System.Diagnostics.Debug.WriteLine("GoodsCode: " + goodsCode);
                System.Diagnostics.Debug.WriteLine("StockistName: " + stockistName);
                System.Diagnostics.Debug.WriteLine("Picture: " + picture);

                // Tentukan folder path fisik di server (D:/Picture SPI yang terhubung ke /picture di IIS)
                string folderPath = @"D:\Picture SPI\"; // Path sesuai dengan lokasi folder di server Anda

                // Pastikan folder fisik ada, jika tidak, buat folder
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Tentukan file path untuk gambar berdasarkan goodsCode
                string filePath = Path.Combine(folderPath, goodsCode.ToUpper() + ".jpg");

                // Simpan gambar ke server dalam bentuk file binary
                File.WriteAllBytes(filePath, Convert.FromBase64String(picture));

                // Membuat URL gambar untuk disimpan ke database
                string imageUrl = "http://172.16.111.174:9090/picture/" + goodsCode.ToUpper() + ".jpg";

                // Simpan data ke database (Contoh query insert)
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = @"INSERT INTO SPI_DatabasePart 
                            (stockistName, goodsCode, goodsName, goodsDesc, currency, goodsUnit, 
                             unit_price, maker, model, suppName, keeping, subKeeping, maxStock, minStock, nowStock, 
                             minOrder, categoryPart, [PO Doc], attcFile_Picture, stockCategory, movingStatus, 
                             remark, predictiveMaintenance, poGoods)
                             VALUES 
                            (@stockistName, @goodsCode, @goodsName, @goodsDesc, @currency, @goodsUnit, 
                            @unitPrice, @maker, @model, @suppName, @keeping, @subKeeping, @maxStock, @minStock, @nowStock, 
                            @minOrder, @categoryPart, @poDoc, @attcFile_Picture, @stockCategory, @movingStatus, @remark, @predictiveMaintenance, @poGoods)";

                    using (var command = new SqlCommand(query, connection))
                    {
                        // Set parameters
                        command.Parameters.AddWithValue("@stockistName", stockistName);
                        command.Parameters.AddWithValue("@goodsCode", goodsCode.ToUpper());
                        command.Parameters.AddWithValue("@goodsName", goodsName);
                        command.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        command.Parameters.AddWithValue("@currency", currency);
                        command.Parameters.AddWithValue("@goodsUnit", goodsUnit);
                        command.Parameters.AddWithValue("@unitPrice", unitPrice);
                        command.Parameters.AddWithValue("@maker", maker);
                        command.Parameters.AddWithValue("@model", model);
                        command.Parameters.AddWithValue("@suppName", suppName);
                        command.Parameters.AddWithValue("@keeping", keeping);
                        command.Parameters.AddWithValue("@subKeeping", subKeeping);
                        command.Parameters.AddWithValue("@maxStock", maxStock);
                        command.Parameters.AddWithValue("@minStock", minStock);
                        command.Parameters.AddWithValue("@nowStock", nowStock);
                        command.Parameters.AddWithValue("@minOrder", minOrder);
                        command.Parameters.AddWithValue("@categoryPart", categoryPart);
                        command.Parameters.AddWithValue("@poDoc", poDoc);
                        command.Parameters.AddWithValue("@attcFile_Picture", imageUrl);  // URL gambar yang akan disimpan
                        command.Parameters.AddWithValue("@stockCategory", stockCategory);
                        command.Parameters.AddWithValue("@movingStatus", movingStatus);
                        command.Parameters.AddWithValue("@remark", remark);
                        command.Parameters.AddWithValue("@predictiveMaintenance", predictiveMaintenance);
                        command.Parameters.AddWithValue("@poGoods", poGoods);
                        //command.Parameters.AddWithValue("@insert_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

                        // Execute the insert command
                        command.ExecuteNonQuery();
                    }
                }

                // Return success message
                return "Data successfully saved and image uploaded to " + imageUrl;
            }
            catch (Exception ex)
            {
                // Return error message
                return "Error: " + ex.Message;
            }
        }



        // Simpan data ke database
        private static void SaveToDatabase(string goodsCode, string goodsName, string goodsDesc, string imageUrl)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO SPI_DatabasePart (GoodsCode, GoodsName, GoodsDesc, ImageUrl) VALUES (@GoodsCode, @GoodsName, @GoodsDesc, @ImageUrl)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@GoodsCode", goodsCode);
                cmd.Parameters.AddWithValue("@GoodsName", goodsName);
                cmd.Parameters.AddWithValue("@GoodsDesc", goodsDesc);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetGoodsData(string goodsCode)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;
                string query = "SELECT * FROM SPI_DatabasePart WHERE GoodsCode = @GoodsCode";
                var goodsData = new Dictionary<string, string>();  // Menyimpan hasil data dalam dictionary untuk di-serialize.

                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@GoodsCode", goodsCode.ToUpper());
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Mengambil data dari database dan menambahkannya ke dictionary
                        goodsData.Add("stockistName", reader["stockistName"].ToString());
                        goodsData.Add("goodsName", reader["goodsName"].ToString());
                        goodsData.Add("goodsDesc", reader["goodsDesc"].ToString());
                        goodsData.Add("currency", reader["currency"].ToString());
                        goodsData.Add("goodsUnit", reader["goodsUnit"].ToString());
                        goodsData.Add("unitPrice", reader["unit_price"].ToString());
                        goodsData.Add("maker", reader["maker"].ToString());
                        goodsData.Add("model", reader["model"].ToString());
                        goodsData.Add("suppName", reader["suppName"].ToString());
                        goodsData.Add("keeping", reader["keeping"].ToString());
                        goodsData.Add("subKeeping", reader["subKeeping"].ToString());
                        goodsData.Add("maxStock", reader["maxStock"].ToString());
                        goodsData.Add("minStock", reader["minStock"].ToString());
                        goodsData.Add("nowStock", reader["nowStock"].ToString());
                        goodsData.Add("minOrder", reader["minOrder"].ToString());
                        goodsData.Add("categoryPart", reader["categoryPart"].ToString());
                        goodsData.Add("poDoc", reader["PO Doc"].ToString());
                        goodsData.Add("stockCategory", reader["stockCategory"].ToString());
                        goodsData.Add("movingStatus", reader["movingStatus"].ToString());
                        goodsData.Add("remark", reader["remark"].ToString());
                        goodsData.Add("predictiveMaintenance", reader["predictiveMaintenance"].ToString());
                        goodsData.Add("poGoods", reader["poGoods"].ToString());
                        goodsData.Add("attcFile_Picture", reader["attcFile_Picture"].ToString());  // Gambar URL
                    }
                }

                // Men-serialize dictionary menjadi JSON
                var jsonResponse = new JavaScriptSerializer().Serialize(goodsData);
                return jsonResponse;
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string EditSparepart(string goodsCode, string picture, string oldImageUrl,
                                       string stockistName, string goodsName, string goodsDesc,
                                       string currency, string goodsUnit, string unitPrice, string maker,
                                       string model, string suppName, string keeping, string subKeeping,
                                       string maxStock, string minStock, string nowStock, string minOrder,
                                       string categoryPart, string poDoc, string stockCategory, string movingStatus,
                                       string remark, string predictiveMaintenance, string poGoods,
                                       string username, string role)
        {
            // Inisialisasi Dictionary untuk menyimpan parameter untuk logging
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("goodsCode", goodsCode);
            parameters.Add("picture", picture);
            parameters.Add("oldImageUrl", oldImageUrl);
            parameters.Add("stockistName", stockistName);
            parameters.Add("goodsName", goodsName);
            parameters.Add("goodsDesc", goodsDesc);
            parameters.Add("currency", currency);
            parameters.Add("goodsUnit", goodsUnit);
            parameters.Add("unitPrice", unitPrice);
            parameters.Add("maker", maker);
            parameters.Add("model", model);
            parameters.Add("suppName", suppName);
            parameters.Add("keeping", keeping);
            parameters.Add("subKeeping", subKeeping);
            parameters.Add("maxStock", maxStock);
            parameters.Add("minStock", minStock);
            parameters.Add("nowStock", nowStock);
            parameters.Add("minOrder", minOrder);
            parameters.Add("categoryPart", categoryPart);
            parameters.Add("poDoc", poDoc);
            parameters.Add("stockCategory", stockCategory);
            parameters.Add("movingStatus", movingStatus);
            parameters.Add("remark", remark);
            parameters.Add("predictiveMaintenance", predictiveMaintenance);
            parameters.Add("poGoods", poGoods);
            parameters.Add("username", username);
            parameters.Add("role", role);

            string connectionString = ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString;

            try
            {
                // 1. Ambil Data Lama
                Sparepart oldData = GetDataSparepart(goodsCode, connectionString);

                // ... Kode validasi dan penyimpanan gambar ...
                // Jika picture bernilai null, gunakan gambar lama
                string imageUrl = oldImageUrl;

                // Jika ada gambar baru yang di-upload, simpan gambar baru ke server
                if (!string.IsNullOrEmpty(picture))
                {
                    // Tentukan folder path fisik di server (D:/Picture SPI yang terhubung ke /picture di IIS)
                    string folderPath = @"D:\Picture SPI\"; // Path sesuai dengan lokasi folder di server Anda

                    // Pastikan folder fisik ada, jika tidak, buat folder
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // Tentukan file path untuk gambar berdasarkan goodsCode
                    string filePath = Path.Combine(folderPath, goodsCode.ToUpper() + ".jpg");

                    // Simpan gambar ke server dalam bentuk file binary
                    File.WriteAllBytes(filePath, Convert.FromBase64String(picture));

                    // Membuat URL gambar untuk disimpan ke database
                    imageUrl = "http://172.16.111.174:9090/picture/" + goodsCode.ToUpper() + ".jpg";
                }

                // 2. Update data sparepart di database
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = @"UPDATE SPI_DatabasePart SET
                                 stockistName = @stockistName,
                                 goodsName = @goodsName,
                                 goodsDesc = @goodsDesc,
                                 currency = @currency,
                                 goodsUnit = @goodsUnit,
                                 unit_price = @unitPrice,
                                 maker = @maker,
                                 model = @model,
                                 suppName = @suppName,
                                 keeping = @keeping,
                                 subKeeping = @subKeeping,
                                 maxStock = @maxStock,
                                 minStock = @minStock,
                                 nowStock = @nowStock,
                                 minOrder = @minOrder,
                                 categoryPart = @categoryPart,
                                 [PO Doc] = @poDoc,
                                 attcFile_Picture = @attcFile_Picture, 
                                 stockCategory = @stockCategory,
                                 movingStatus = @movingStatus,
                                 remark = @remark,
                                 predictiveMaintenance = @predictiveMaintenance,
                                 poGoods = @poGoods
                                 WHERE goodsCode = @goodsCode";

                    using (var command = new SqlCommand(query, connection))
                    {
                        // Set parameters
                        command.Parameters.AddWithValue("@stockistName", stockistName);
                        command.Parameters.AddWithValue("@goodsCode", goodsCode.ToUpper());
                        command.Parameters.AddWithValue("@goodsName", goodsName);
                        command.Parameters.AddWithValue("@goodsDesc", goodsDesc);
                        command.Parameters.AddWithValue("@currency", currency);
                        command.Parameters.AddWithValue("@goodsUnit", goodsUnit);
                        command.Parameters.AddWithValue("@unitPrice", Convert.ToDouble(unitPrice)); // Gunakan nilai yang sudah divalidasi
                        command.Parameters.AddWithValue("@maker", maker);
                        command.Parameters.AddWithValue("@model", model);
                        command.Parameters.AddWithValue("@suppName", suppName);
                        command.Parameters.AddWithValue("@keeping", keeping);
                        command.Parameters.AddWithValue("@subKeeping", subKeeping);
                        command.Parameters.AddWithValue("@maxStock", maxStock);
                        command.Parameters.AddWithValue("@minStock", minStock);
                        command.Parameters.AddWithValue("@nowStock", nowStock);
                        command.Parameters.AddWithValue("@minOrder", minOrder);
                        command.Parameters.AddWithValue("@categoryPart", categoryPart);
                        command.Parameters.AddWithValue("@poDoc", poDoc);
                        command.Parameters.AddWithValue("@attcFile_Picture", imageUrl);  // URL gambar baru atau gambar lama
                        command.Parameters.AddWithValue("@stockCategory", stockCategory);
                        command.Parameters.AddWithValue("@movingStatus", movingStatus);
                        command.Parameters.AddWithValue("@remark", remark);
                        command.Parameters.AddWithValue("@predictiveMaintenance", predictiveMaintenance);
                        command.Parameters.AddWithValue("@poGoods", poGoods);

                        // Execute the update command
                        command.ExecuteNonQuery();
                    }
                }

                // 3. Bandingkan Data dan Buat Catatan Audit
                List<AuditRecord> auditRecords = GetAuditRecords(oldData,
                                                                goodsCode,
                                                                stockistName, goodsName, goodsDesc,
                                                                currency, goodsUnit, unitPrice, maker,
                                                                model, suppName, keeping, subKeeping,
                                                                maxStock, minStock, nowStock, minOrder,
                                                                categoryPart, poDoc, stockCategory, movingStatus,
                                                                remark, predictiveMaintenance, poGoods, username, role, imageUrl);

                // 4. Masukkan Catatan Audit ke Tabel SPI_AuditLog
                InsertAuditRecords(auditRecords, connectionString);

                // Return success message
                return "Data successfully updated.";
            }
            catch (Exception ex)
            {
                // Log error yang lebih detail (ke file/database)
                LogError("Terjadi kesalahan umum.", parameters, ex);
                // Return error message
                return "Error: Terjadi kesalahan saat memperbarui data."; // Pesan umum ke klien
            }
        }

        private static void LogError(string message, Dictionary<string, string> parameters = null, Exception ex = null)
        {

            string logMessage = $"{DateTime.Now}: {message}";
            if (parameters != null)
            {
                logMessage += "\nParameters:\n";
                foreach (var kvp in parameters)
                {
                    logMessage += $"  {kvp.Key}: {kvp.Value}\n";
                }
            }
            if (ex != null)
            {
                logMessage += $"\nException: {ex.ToString()}";
            }

            Console.WriteLine(logMessage);
        }

        // Fungsi untuk memasukkan catatan audit ke tabel SPI_AuditLog
        private static void InsertAuditRecords(List<AuditRecord> auditRecords, string connectionString)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"INSERT INTO SPI_AuditLog (Username, Role, ChangeTime, TableName, ColumnName, OldValue, NewValue, EventType, goodsCode)
                         VALUES (@Username, @Role, @ChangeTime, @TableName, @ColumnName, @OldValue, @NewValue, @EventType, @GoodsCode)";

                foreach (var record in auditRecords)
                {
                    using (var command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", record.Username);
                        command.Parameters.AddWithValue("@Role", record.Role);
                        command.Parameters.AddWithValue("@ChangeTime", record.ChangeTime);
                        command.Parameters.AddWithValue("@TableName", record.TableName);
                        command.Parameters.AddWithValue("@ColumnName", record.ColumnName);
                        command.Parameters.AddWithValue("@OldValue", record.OldValue ?? (object)DBNull.Value); // Tangani nilai NULL
                        command.Parameters.AddWithValue("@NewValue", record.NewValue ?? (object)DBNull.Value); // Tangani nilai NULL
                        command.Parameters.AddWithValue("@EventType", record.EventType);
                        command.Parameters.AddWithValue("@GoodsCode", record.GoodsCode);

                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        // Fungsi untuk mengambil data sparepart sebelum perubahan
        private static Sparepart GetDataSparepart(string goodsCode, string connectionString)
        {
            Sparepart data = null;
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM SPI_DatabasePart WHERE goodsCode = @goodsCode";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@goodsCode", goodsCode);
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            data = new Sparepart
                            {
                                GoodsCode = reader["goodsCode"].ToString(),
                                StockistName = reader["stockistName"].ToString(),
                                GoodsName = reader["goodsName"].ToString(),
                                GoodsDesc = reader["goodsDesc"].ToString(),
                                Currency = reader["currency"].ToString(),
                                GoodsUnit = reader["goodsUnit"].ToString(),
                                UnitPrice = Convert.ToDouble(reader["unit_price"]),
                                Maker = reader["maker"].ToString(),
                                Model = reader["model"].ToString(),
                                SuppName = reader["suppName"].ToString(),
                                Keeping = reader["keeping"].ToString(),
                                SubKeeping = reader["subKeeping"].ToString(),
                                MaxStock = Convert.ToInt32(reader["maxStock"]),
                                MinStock = Convert.ToInt32(reader["minStock"]),
                                NowStock = Convert.ToInt32(reader["nowStock"]),
                                MinOrder = Convert.ToInt32(reader["minOrder"]),
                                CategoryPart = reader["categoryPart"].ToString(),
                                PoDoc = reader["PO Doc"] == DBNull.Value ? null : reader["PO Doc"].ToString(), // Perbaikan: tangani NULL
                                AttcFilePicture = reader["attcFile_Picture"].ToString(),

                                StockCategory = reader["stockCategory"].ToString(),
                                MovingStatus = reader["movingStatus"].ToString(),
                                Remark = reader["remark"].ToString(),
                                PredictiveMaintenance = Convert.ToInt32(reader["predictiveMaintenance"]),
                                PoGoods = reader["poGoods"].ToString()
                            };
                        }
                    }
                }
            }
            return data;
        }


        // Fungsi untuk membuat daftar catatan audit
        private static List<AuditRecord> GetAuditRecords(Sparepart oldData,
                                                       string goodsCode,
                                                       string stockistName, string goodsName, string goodsDesc,
                                                       string currency, string goodsUnit, string unitPrice, string maker,
                                                       string model, string suppName, string keeping, string subKeeping,
                                                       string maxStock, string minStock, string nowStock, string minOrder,
                                                       string categoryPart, string poDoc, string stockCategory, string movingStatus,
                                                       string remark, string predictiveMaintenance, string poGoods, string username, string role, string imageUrl)
        {
            List<AuditRecord> auditRecords = new List<AuditRecord>();

            if (oldData == null)
            {
                return auditRecords; // Atau lempar kesalahan, tergantung kebutuhan Anda
            }

            if (oldData.StockistName != stockistName)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "stockistName",
                    OldValue = oldData.StockistName,
                    NewValue = stockistName,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.GoodsName != goodsName)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "goodsName",
                    OldValue = oldData.GoodsName,
                    NewValue = goodsName,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.GoodsDesc != goodsDesc)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "goodsDesc",
                    OldValue = oldData.GoodsDesc,
                    NewValue = goodsDesc,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.Currency != currency)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "currency",
                    OldValue = oldData.Currency,
                    NewValue = currency,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.GoodsUnit != goodsUnit)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "goodsUnit",
                    OldValue = oldData.GoodsUnit,
                    NewValue = goodsUnit,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.UnitPrice != Convert.ToDouble(unitPrice))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "unitPrice",
                    OldValue = Convert.ToDouble(oldData.UnitPrice).ToString(),
                    NewValue = unitPrice,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.Maker != maker)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "maker",
                    OldValue = oldData.Maker,
                    NewValue = maker,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.Model != model)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "model",
                    OldValue = oldData.Model,
                    NewValue = model,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.SuppName != suppName)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "suppName",
                    OldValue = oldData.SuppName,
                    NewValue = suppName,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.Keeping != keeping)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "keeping",
                    OldValue = oldData.Keeping,
                    NewValue = keeping,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.SubKeeping != subKeeping)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "subKeeping",
                    OldValue = oldData.SubKeeping,
                    NewValue = subKeeping,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.MaxStock != Convert.ToInt32(maxStock))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "maxStock",
                    OldValue = Convert.ToInt32(oldData.MaxStock).ToString(),
                    NewValue = maxStock,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.MinStock != Convert.ToInt32(minStock))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "minStock",
                    OldValue = Convert.ToInt32(oldData.MinStock).ToString(),
                    NewValue = minStock,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.NowStock != Convert.ToInt32(nowStock))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "nowStock",
                    OldValue = Convert.ToInt32(oldData.NowStock).ToString(),
                    NewValue = nowStock,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.MinOrder != Convert.ToInt32(oldData.MinOrder))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "minOrder",
                    OldValue = Convert.ToInt32(oldData.MinOrder).ToString(),
                    NewValue = minOrder,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.CategoryPart != categoryPart)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "categoryPart",
                    OldValue = oldData.CategoryPart,
                    NewValue = categoryPart,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.PoDoc != poDoc)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "poDoc",
                    OldValue = oldData.PoDoc,
                    NewValue = poDoc,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.StockCategory != stockCategory)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "stockCategory",
                    OldValue = oldData.StockCategory,
                    NewValue = stockCategory,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.MovingStatus != movingStatus)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "movingStatus",
                    OldValue = oldData.MovingStatus,
                    NewValue = movingStatus,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.Remark != remark)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "remark",
                    OldValue = oldData.Remark,
                    NewValue = remark,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.PredictiveMaintenance != Convert.ToInt32(predictiveMaintenance))
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "predictiveMaintenance",
                    OldValue = Convert.ToInt32(oldData.PredictiveMaintenance).ToString(),
                    NewValue = predictiveMaintenance,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            if (oldData.PoGoods != poGoods)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "poGoods",
                    OldValue = oldData.PoDoc,
                    NewValue = poGoods,
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            // Periksa apakah gambar telah diganti
            if (!string.IsNullOrEmpty(imageUrl) && oldData.AttcFilePicture != imageUrl)
            {
                auditRecords.Add(new AuditRecord
                {
                    Username = username,
                    Role = role,
                    ChangeTime = DateTime.Now,
                    TableName = "SPI_DatabasePart",
                    ColumnName = "AttcFilePicture",
                    OldValue = oldData.AttcFilePicture,
                    NewValue = imageUrl, // Simpan oldImageUrl sebagai nilai baru karena ini adalah URL gambar yang baru diupload
                    EventType = "UPDATE",
                    GoodsCode = goodsCode
                });
            }

            return auditRecords;
        }



        public class AuditRecord
        {
            public string Username { get; set; }
            public string Role { get; set; }
            public DateTime ChangeTime { get; set; }
            public string TableName { get; set; }
            public string ColumnName { get; set; }
            public string OldValue { get; set; }
            public string NewValue { get; set; }
            public string EventType { get; set; }
            public string GoodsCode { get; set; }
        }

    }
}

