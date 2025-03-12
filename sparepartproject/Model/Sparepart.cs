using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_DatabasePart")]  // Nama tabel di database
    public class Sparepart
    {
        public string StockistName { get; set; }

        [Key]
        public string GoodsCode { get; set; }
        public string GoodsName { get; set; }
        public string GoodsDesc { get; set; }
        public string Currency { get; set; }
        public string GoodsUnit { get; set; }

        [Column("unit_price")] // Nama kolom di DB
        public double? UnitPrice { get; set; } // Ubah dari float ke double
        public string Maker { get; set; }
        public string Model { get; set; }
        public string SuppName { get; set; }
        public string Keeping { get; set; }
        public string SubKeeping { get; set; }
        public int? MaxStock { get; set; }
        public int? MinStock { get; set; }
        public int? NowStock { get; set; }
        public int? MinOrder { get; set; }
        public string CategoryPart { get; set; }

        [Column("PO Doc")] // Nama kolom di DB
        public string PoDoc { get; set; }

        [Column("attcFile_Picture")] // Nama kolom di DB
        public string AttcFilePicture { get; set; }

        [Column("attcFile_Document")] // Nama kolom di DB
        public string AttcFileDocument { get; set; }
        public string StockCategory { get; set; }
        public string MovingStatus { get; set; }
        public string LastUpdateBy { get; set; }
        public DateTime? LastUpdateDate { get; set; }

        [Column("insert_date")] // Nama kolom di DB
        public DateTime? InsertDate { get; set; }
        public string Remark { get; set; }
        public int? PredictiveMaintenance { get; set; }
        public string PoGoods { get; set; }
    }


}