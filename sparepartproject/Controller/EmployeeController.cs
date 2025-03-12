using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class EmployeeController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAllEmployee(int page = 1, int pageSize = 10, string searchTerm = "")
        {
            try
            {
                // Validasi parameter page dan pageSize
                if (page <= 0 || pageSize <= 0)
                {
                    return BadRequest("Page and pageSize must be greater than 0.");
                }

                using (var context = new MyDBContext2())
                {
                    // Membuat query dasar untuk Vendors
                    var query = context.Employees.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        query = query.Where(s => s.EmpName.Contains(searchTerm));
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalVendors = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalVendors / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var vendors = query
                                    .OrderBy(s => s.EmpName)  // Mengurutkan berdasarkan Vendor_name
                                    .Skip((page - 1) * pageSize)  // Skip data sebelumnya
                                    .Take(pageSize)                // Ambil data sesuai pageSize
                                    .ToList();

                    // Mengembalikan hasil dengan total data, total halaman, dan data per halaman
                    return Ok(new
                    {
                        data = vendors,
                        total = totalVendors,
                        totalPages = totalPages,
                        currentPage = page
                    });
                }
            }
            catch (Exception ex)
            {
                // Menangani error dan mengembalikan status InternalServerError
                return InternalServerError(ex);
            }
        }

        // API untuk memeriksa apakah model sudah ada di database
        [HttpPost]
        [Route("api/employee/check")]
        public IHttpActionResult CheckEmployeeExist([FromBody] EmployeeRequest empReq)
        {
            using (var context = new MyDBContext2())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var empExist = context.Employees
                                         .Any(m => m.EmpNo.Equals(empReq.EmpID.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = empExist });
            }
        }


        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/employee/add")]
        public IHttpActionResult AddModel([FromBody] EmployeeRequest empReq)
        {
            if (string.IsNullOrWhiteSpace(empReq.EmpID))
            {
                return BadRequest("Employee ID tidak boleh kosong.");
            }

            using (var context = new MyDBContext2())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var empExist = context.Employees
                                         .Any(m => m.EmpNo.Equals(empReq.EmpID, StringComparison.OrdinalIgnoreCase));

                if (empExist)
                {
                    return Conflict(); // Return 409 Conflict jika model sudah ada
                }

                // Membuat objek model baru
                var employees = new sparepartproject.Model.SPIEmployee
                {
                    EmpNo = empReq.EmpID,
                    EmpName = empReq.EmpName,
                    EmailAddress= empReq.EmailAddress,
                    SparepartRole="STAFF"
                };

                // Menambahkan model ke database
                context.Employees.Add(employees);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/employee/delete/{id}")]
        public IHttpActionResult DeleteModel(string id)
        {
            using (var context = new MyDBContext2())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Employees.SingleOrDefault(m => m.EmpNo == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Employees.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Employee berhasil dihapus" });
            }
        }
    }
}
