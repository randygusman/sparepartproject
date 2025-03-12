using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sparepartproject.Class
{
    public class Keeping
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        public DateTime? deletedAt { get; set; }
        public DateTime? updatedAt { get; set; }
        public DateTime? createdAt { get; set; }
        public string name { get; set; }
        public string code { get; set; }

        public string type { get; set; } // "KEEPING" atau "SUB_KEEPING"

        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId parent { get; set; } // Hanya untuk SUB_KEEPING

        public int createdBy { get; set; }
        public int __v { get; set; }
        public string remarks { get; set; }

    }
}