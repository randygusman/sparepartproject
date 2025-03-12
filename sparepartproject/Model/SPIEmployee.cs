using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace sparepartproject.Model
{
    [Table("m_employee_macheng")]  // Nama tabel di database
    public class SPIEmployee
    {
        [Key]  // Menandakan bahwa kolom ini adalah primary key
        [Column("emp_no")]  // Nama kolom di database
        public string EmpNo { get; set; }

        [Column("emp_name")]  // Nama kolom di database
        public string EmpName { get; set; }

        [Column("emp_email_address")]  // Nama kolom di database
        public string EmailAddress { get; set; }

        [Column("sparepartRole")]  // Nama kolom di database
        public string SparepartRole { get; set; }
    }

    public class EmployeeRequest
    {
        public string EmpID { get; set; }
        public string EmpName { get; set; }
        public string EmailAddress { get; set; }
    }
}