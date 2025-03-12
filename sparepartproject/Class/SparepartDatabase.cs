using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sparepartproject.Class
{
    public class SparepartDatabase
    {
        public ObjectId Id { get; set; }
        public DateTime? deletedAt { get; set; }
        public DateTime? updatedAt { get; set; }
        public DateTime? createdAt { get; set; }
        public List<String> poAttchDocument { get; set; }
        public List<String> attchDocument { get; set; }
        public List<String> attchPicture { get; set; }
        public bool isActive { get; set; }

        public string code { get; set; }
        public string name { get; set; }
        public string description { get; set; }

        public ObjectId maker { get; set; }
        public int? modelId { get; set; }
        public ObjectId keeping { get; set; }
        public ObjectId subKeeping { get; set; }
        public int? maxStock { get; set; }
        public int? minStock { get; set; }
        public int? minOrder { get; set; }
        public ObjectId categoryPart { get; set; }
        public ObjectId stockCategory { get; set; }
        public int? objectId { get; set; }
        public ObjectId objectGroupId { get; set; }
        public ObjectId movingStatus { get; set; }
        public int lastUpdatedBy { get; set; }
        public string status { get; set; }
        public int? totalQuantity { get; set; }
        public int? createdBy { get; set; }
        public Int32? __v { get; set; }
        public int? nowStock { get; set; }
        public string poGoods { get; set; }
        public int? predictiveMaintenance { get; set; }
        public string remarks { get; set; }
        public int? stockistId { get; set; }
        public int? eoq { get; set; }
        public int? rop { get; set; }
        public int? safetyStock { get; set; }

        // Properti baru untuk menyimpan nama
        public string KeepingName { get; set; }
        public string SubKeepingName { get; set; }
        public int? sbq { get; set; }

    }

}