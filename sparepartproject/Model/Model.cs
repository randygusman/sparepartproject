using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_Model")]  // Nama tabel di database
    public class Model
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("id")]  // Nama kolom di database
        public int Id { get; set; }

        [Column("model")]  // Nama kolom di database
        public string ModelName { get; set; }
    }

    public class ModelRequest
    {
        public string ModelName { get; set; }
    }
}