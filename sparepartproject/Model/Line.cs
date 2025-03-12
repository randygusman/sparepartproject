using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_LineName")]  // Nama tabel di database
    public class Line
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("id")]  // Nama kolom di database
        public int Id { get; set; }

        [Column("line_name")]  // Nama kolom di database
        public string LineName { get; set; }
    }

    public class LineRequest
    {
        public string LineName { get; set; }
    }
}