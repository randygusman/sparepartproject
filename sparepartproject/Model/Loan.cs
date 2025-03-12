using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_SparepartLoan")]  // Nama tabel di database

    public class Loan
    {
        [Key]
        public int id { get; set; }
        public string goodsCode { get; set; }
        public string model { get; set; }
        public string line { get; set; }
        public string cell { get; set; }
        public string issuedBy { get; set; }
        public int? issuedQty { get; set; }
        public DateTime? issuedOn { get; set; }
        public string issuedByAccount { get; set; }
        public string imageApproval { get; set; }
        public string reason { get; set; }
        public string status { get; set; }
        public DateTime? returnedOn { get; set; }
        public string returnedTo { get; set; } = null;


    }
}