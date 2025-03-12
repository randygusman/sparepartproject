using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sparepartproject
{
    public class SubKeeping
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        public string name { get; set; }
        public string code { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId parent { get; set; } // Menunjukkan ID parent
        public string type { get; set; }
        public int createdBy { get; set; }
    }
}