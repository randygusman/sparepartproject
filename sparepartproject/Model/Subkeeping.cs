using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_SubKeeping")]  // Nama tabel di database

    public class Subkeeping
    {
        public int Id { get; set; }
        [Column("cabinet_name")]  // Nama kolom di database

        public string Name { get; set; }
        [Column("drawer_code")]  // Nama kolom di database
        public string DrawerCode { get; set; }

        [Column("drawer_name")]  // Nama kolom di database
        public string DrawerName { get; set; }

        [Column("cabinet_type")]  // Nama kolom di database
        public string CabinetType { get; set; }

        [Column("cabinet_code")]  // Nama kolom di database
        public string Cabinet { get; set; }
    }

    public class SubkeepingRequest
    {
        public string KeepingName { get; set; }
        public string SubkeepingName { get; set; }
    }
}