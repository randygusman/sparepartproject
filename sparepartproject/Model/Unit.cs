using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_unit")]  // Nama tabel di database
    public class Unit
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("id")]  // Nama kolom di database
        public int Id { get; set; }

        [Column("unit_name")]  // Nama kolom di database
        public string UnitName { get; set; }
    }

    public class UnitRequest
    {
        public string UnitName { get; set; }
    }
}