using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sparepartproject.Class
{
    public class SparepartVendor
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId Id { get; set; }

        public DateTime? deletedAt { get; set; }
        public DateTime? updatedAt { get; set; }
        public DateTime? createdAt { get; set; }
        public int? unitId { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId supplier { get; set; } // Hanya untuk SUB_KEEPING
        public int? sbq { get; set; }
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId currency { get; set; } // Hanya untuk SUB_KEEPING
        public decimal? price { get; set; }

        public int? createdBy { get; set; }
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId sparepart { get; set; } // Hanya untuk SUB_KEEPING
        public int? __v { get; set; }
        public int? leadTime{ get; set; }
    }
}