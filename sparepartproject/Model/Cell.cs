using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_Cell")]  // Nama tabel di database
    public class Cell
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("id")]  // Nama kolom di database
        public int Id { get; set; }

        [Column("cell_name")]  // Nama kolom di database
        public string CellName { get; set; }
    }

    public class CellRequest
    {
        public string CellName { get; set; }
    }
}