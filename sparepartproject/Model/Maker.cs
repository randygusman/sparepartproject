using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_Maker")]
    public class Maker
    {
        // Nama tabel di database


        [Key]
        public int Id { get; set; }
        public string Nama_maker { get; set; }
        public string Kode_maker { get; set; }


        
    }

    public class MakerRequest
    {
        public string MakerName { get; set; }
        public string MakerKode { get; set; }
    }
}