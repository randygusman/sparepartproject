using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class VendorController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAllVendor(int page = 1, int pageSize = 10, string searchTerm = "")
        {
            try
            {
                // Validasi parameter page dan pageSize
                if (page <= 0 || pageSize <= 0)
                {
                    return BadRequest("Page and pageSize must be greater than 0.");
                }

                using (var context = new MyDbContext())
                {
                    // Membuat query dasar untuk Vendors
                    var query = context.Vendors.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        query = query.Where(s => s.Vendor_name.Contains(searchTerm));
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalVendors = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalVendors / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var vendors = query
                                    .OrderBy(s => s.Vendor_name)  // Mengurutkan berdasarkan Vendor_name
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


        // API untuk memeriksa apakah VENDOR sudah ada di database
        [HttpPost]
        [Route("api/vendor/check")]
        public IHttpActionResult CheckModelExists([FromBody] VendorRequest vendorRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var vendorExist = context.Vendors
                                         .Any(m => m.Vendor_name.Equals(vendorRequest.VendorName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = vendorExist });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/vendor/add")]
        public IHttpActionResult AddModel([FromBody] VendorRequest vendorRequest)
        {
            if (string.IsNullOrWhiteSpace(vendorRequest.VendorName))
            {
                return BadRequest("Vendor Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var vendorExist = context.Vendors
                                         .Any(m => m.Vendor_name.Equals(vendorRequest.VendorName, StringComparison.OrdinalIgnoreCase));

                if (vendorExist)
                {
                    return Conflict(); // Return 409 Conflict jika vendor sudah ada
                }

                // Membuat objek model baru
                var vendor = new sparepartproject.Model.Vendor
                {
                    Vendor_name = vendorRequest.VendorName,
                    Location= vendorRequest.Location,
                };

                // Menambahkan model ke database
                context.Vendors.Add(vendor);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/vendor/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Vendors.SingleOrDefault(m => m.Id == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Vendors.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Vendor berhasil dihapus" });
            }
        }
    }
}
