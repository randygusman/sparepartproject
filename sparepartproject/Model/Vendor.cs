using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_Vendor")]  // Nama tabel di database

    public class Vendor
    {
        [Key]
        public int Id { get; set; }
        public string Vendor_name { get; set; }
        public string Location { get; set; }
    }

    public class VendorRequest
    {
        public string VendorName { get; set; }
        public string Location { get; set; }
    }
}