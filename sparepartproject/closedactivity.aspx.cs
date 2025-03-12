using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class closedactivity : System.Web.UI.Page
    {
        string getUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public class listClosedActivity
        {
            public int id { get; set; }
            public string itemDescription { get; set; }
            public string partcode { get; set; }
            public string pic { get; set; }
            public string purpose { get; set; }
            public int qtyNumber { get; set; }
            public string poNumber { get; set; }
            public string receivedSPI { get; set; }
            public string apply { get; set; }
            public string dateClosed { get; set; }
            public string takenBy { get; set; }
            public string model { get; set; }
            public string location { get; set; }
        }

        [WebMethod]
        public static List<listClosedActivity> GetEvents()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("SPI_getPartComing_closedActivity", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);

            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {

            }

            return dt.AsEnumerable().Select(datarow =>
            new listClosedActivity()
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
                dateClosed = Convert.ToString(datarow["dateClose"]),
                takenBy = Convert.ToString(datarow["takenBy"]),
                model = Convert.ToString(datarow["modelName"]),
                location = Convert.ToString(datarow["location"]),
                //dateClosed = Convert.ToDateTime(datarow["dateClose"]).ToString("MMM-dd yyyy")
                //buat colom dateclosed 

            }
            ).ToList();
        }
    }
}