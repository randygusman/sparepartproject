using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class loanListMDP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //const string connectionUri = "mongodb+srv://sample.host:27017/?connectTimeoutMS=60000&tls=true";
            const string connectionUri = "mongodb://lanius:laniuslab@172.16.104.34:27017/mes-epson?authSource=admin&readPreference=primary&directConnection=true&ssl=false";
        
            var client = new MongoClient(connectionUri);
        }

        public class Makers
        {
            public ObjectId Id { get; set; }
            public string Name { get; set; }
            public string Code { get; set; }
            public string Remarks { get; set; }

        }
    }
}