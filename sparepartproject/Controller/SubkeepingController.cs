using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class SubkeepingController : ApiController
    {
        // API untuk mengambil data unit dengan pagination dan pencarian
        [HttpGet]
        public IHttpActionResult GetUnits(int page = 1, int pageSize = 10, string search = "")
        {
            using (var context = new MyDbContext())
            {
                // Membangun query untuk mengambil data dengan filter pencarian
                var query = context.Subkeepings.AsQueryable();

                // Menambahkan filter pencarian jika ada
                if (!string.IsNullOrEmpty(search))
                {
                    query = query.Where(m => m.DrawerName.Contains(search));
                }

                // Menghitung total record setelah filter pencarian
                int totalRecords = query.Count();

                // Menghitung total halaman
                int totalPages = (int)Math.Ceiling(totalRecords / (double)pageSize);

                // Mengambil data model sesuai halaman yang diminta
                var models = query
                            .OrderBy(m => m.Id)  // Mengurutkan berdasarkan Id
                            .Skip((page - 1) * pageSize)  // Skip data untuk halaman
                            .Take(pageSize)  // Mengambil data sebanyak pageSize
                            .ToList();

                // Mengembalikan data dalam format JSON
                return Json(new
                {
                    data = models,
                    totalPages = totalPages
                });
            }
        }

        // API untuk memeriksa apakah VENDOR sudah ada di database
        [HttpPost]
        [Route("api/subkeeping/check")]
        public IHttpActionResult CheckModelExists([FromBody] SubkeepingRequest subKeepingRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var vendorExist = context.Subkeepings
                                         .Any(m => m.DrawerName.Equals(subKeepingRequest.SubkeepingName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = vendorExist });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/subkeeping/add")]
        public IHttpActionResult AddModel([FromBody] SubkeepingRequest subkeepingRequest)
        {
            if (string.IsNullOrWhiteSpace(subkeepingRequest.SubkeepingName))
            {
                return BadRequest("Subkeeping Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var vendorExist = context.Subkeepings
                                         .Any(m => m.DrawerName.Equals(subkeepingRequest.SubkeepingName, StringComparison.OrdinalIgnoreCase));

                if (vendorExist)
                {
                    return Conflict(); // Return 409 Conflict jika vendor sudah ada
                }

                // Membuat objek model baru
                var vendor = new sparepartproject.Model.Subkeeping
                {
                    DrawerName = subkeepingRequest.SubkeepingName,
                     Name = subkeepingRequest.KeepingName,
                };

                // Menambahkan model ke database
                context.Subkeepings.Add(vendor);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/subkeeping/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Subkeepings.SingleOrDefault(m => m.Id == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Subkeepings.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Vendor berhasil dihapus" });
            }
        }
    }
}
