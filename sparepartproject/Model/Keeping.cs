using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_Keeping")]  // Nama tabel di database

    public class Keeping
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("id")]  // Nama kolom di database
        public int Id { get; set; }

        [Column("cabinet_name")]  // Nama kolom di database
        public string KeepingName { get; set; }

        [Column("cabinet_type")]  // Nama kolom di database

        public string CabinetType { get; set; }
    }

    public class KeepingRequest
    {
        public string KeepingName { get; set; }
    }
}