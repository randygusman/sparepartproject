using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using System.Web.UI.WebControls;
using MongoDB.Bson;
using System.Collections.ObjectModel;
using MongoDB.Bson.Serialization.Attributes;
using System.Net;
using Microsoft.Graph.Models;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using static sparepartproject.mongoDB;
using Newtonsoft.Json;
using Npgsql;
using System.Data.Common;

namespace sparepartproject
{
    public partial class mongoDB : System.Web.UI.Page
    {
        public static string connectionString = "Server=172.16.104.34;Port=5432;Username=lanius;Password=laniuslab;Database=data-core;Pooling=true;Timeout=300;CommandTimeout=300;KeepAlive=300;";
        public static MongoClient mongoClient;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static List<TransactionParts> getTransactionParts()
        {
            //mongoDB section
            mongoClient = new MongoClient("mongodb://lanius:laniuslab@172.16.104.34:27017/");
            var database = mongoClient.GetDatabase("mes-epson");
            var transactionParts = database.GetCollection<TransactionParts>("transactionparts").AsQueryable<TransactionParts>().Where(r => r.type == "LOANED" && r.status == "Waiting").ToList();
            List<Profile> listProfile = new List<Profile>();

            //postgreSQL section
            var dataSource = NpgsqlDataSource.Create(connectionString);

            try
            {
                using (var cmd = dataSource.CreateCommand("SELECT * from \"Profiles\""))
                using (var reader = cmd.ExecuteReader())
                {
                    var dt = new DataTable();

                    if (reader.Read())
                    {
                        dt.Load(reader);
                    }

                    for (int i = 0; i <= dt.Rows.Count; i++)
                    {
                        listProfile.Add(new Profile()
                        {
                            Name = dt.Rows[i]["fullName"].ToString(),
                            id = Convert.ToInt32(dt.Rows[i]["userId"]),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            //join postrgreSQL List with MongoDB List to get every id Approver Name
            for(int transactionPartCount=0; transactionPartCount<transactionParts.Count; transactionPartCount++)
            {
                for(int listProfileCount = 0; listProfileCount < listProfile.Count; listProfileCount++)
                {
                    if (transactionParts[transactionPartCount].approverSpv.id == listProfile[listProfileCount].id)
                    {
                        transactionParts[transactionPartCount].approverSpv.Name = listProfile[listProfileCount].Name;
                    }
                     if(transactionParts[transactionPartCount].approverManager.id == listProfile[listProfileCount].id)
                    {
                        transactionParts[transactionPartCount].approverManager.Name = listProfile[listProfileCount].Name;
                    } if (transactionParts[transactionPartCount].approverGMManager.id == listProfile[listProfileCount].id)
                    {
                        transactionParts[transactionPartCount].approverGMManager.Name = listProfile[listProfileCount].Name;
                    } if (transactionParts[transactionPartCount].employeeId == listProfile[listProfileCount].id)
                    {
                        transactionParts[transactionPartCount].requestedBy = listProfile[listProfileCount].Name;
                    }
                }
            }

            //return to front End
            return transactionParts.AsEnumerable().Select(datalist =>
            new TransactionParts()
            {
                _id = datalist._id,
                employeeId = datalist.employeeId,
                reqNo = datalist.reqNo,
                requestedBy = datalist.requestedBy,
                approverSpv = datalist.approverSpv,
                approverManager = datalist.approverManager,
                approverGMManager = datalist.approverGMManager,
                reqDate = Convert.ToDateTime(datalist.reqDate)
            }
            ).ToList(); 
        }

        public class TransactionParts
        {
            [BsonId]
            [BsonRepresentation(MongoDB.Bson.BsonType.ObjectId)]
            public ObjectId _id { get; set; }

            public DateTime? deletedAt { get; set; }
            public bool isAccuracy { get; set; }
            public DateTime? expiredAt { get; set; }
            public string reqNo { get; set; }
            public DateTime? reqDate { get; set; }
            public Int32? employeeId { get; set; }
            public Int32? stockistId { get; set; }
            public string remarks { get; set; }
            public string issuedBy { get; set; }
            public DateTime? returnDate { get; set; }
            public Int32? createdBy { get; set; }
            public string type { get; set; }
            public string status { get; set; }
            public DateTime? updatedAt { get; set; }
            public DateTime? createdAt { get; set; }
            public DateTime? pickUpDate { get; set; }
            public DateTime? actualReturnDate { get; set; }
            public DateTime? transactionDate { get; set; }
            public Int32? __v { get; set; }

            public List<DataAtTheTime> dataAtTheTime { get; set; } = null;


            public ApproverSpv approverSpv { get; set; }
            public ApproverManager approverManager { get; set; }
            public ApproverGMManager approverGMManager { get; set; }

            public List<ObjectId> cartItems { get; set; }

            public string requestedBy { get; set; }

        }

        [BsonNoId]
        public class ApproverSpv
        {
            [BsonIgnoreIfNull]
            public int id { get; set; }
            public bool isApproved { get; set; }
            public string Name { get; set; }
        }

        [BsonNoId]
        public class ApproverManager
        {
            public Int32 id { get; set; }
            public bool isApproved { get; set; }
            public string Name { get; set; }

        }

        [BsonNoId]
        public class ApproverGMManager
        {
            public int id { get; set; }
            public bool isApproved { get; set; }
            public string Name { get; set; }
        }
        public class DataAtTheTime
        {
            [BsonIgnoreIfNull]
            public ObjectId? currency { get; set; }

            [BsonIgnoreIfNull]
            public ObjectId? sparepartVendor { get; set; }
            public int? modelId { get; set; }
            public Int32? usdConvertion { get; set; }
            public double? price { get; set; }
            public Int32? leadTime { get; set; }
            public Int32? quantity { get; set; }
        }
        public class Profile
        {
            public int id { get; set; }
            public string Name { get; set; }
        }
    }
}