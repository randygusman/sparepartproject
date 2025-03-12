using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_DailyIssuedSparepart")]
    public class DailyIssued
    {
        [Key] // Jika SPI_IDissued adalah primary key
        public int SPI_IDissued { get; set; }

        public string goodsName { get; set; }

        public string goodsCode { get; set; }

        public string model { get; set; }

        public int? qtyIssued { get; set; }

        public string issuedBy_ID { get; set; }

        public string issuedBy_Name { get; set; }

        public DateTime issuedDate { get; set; }

        public string reason { get; set; }

        public string lineName { get; set; }

        public double? cell { get; set; }

        public string issuedByAccount { get; set; }
    }
}

