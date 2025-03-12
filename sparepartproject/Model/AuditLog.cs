using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("SPI_AuditLog")]
    public class AuditLog
    {
        [Key]
        public int AuditID { get; set; }
        public string Username { get; set; }
        public string Role { get; set; }
        public DateTime ChangeTime { get; set; }
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public string OldValue { get; set; }
        public string NewValue { get; set; }
        public string EventType { get; set; }
        public string GoodsCode { get; set; }
    }
}