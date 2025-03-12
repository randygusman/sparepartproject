using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class UnitController : ApiController
    {
        // API untuk mengambil data unit dengan pagination dan pencarian
        [HttpGet]
        public IHttpActionResult GetUnits(int page = 1, int pageSize = 10, string search = "")
        {
            using (var context = new MyDbContext())
            {
                // Membangun query untuk mengambil data dengan filter pencarian
                var query = context.Units.AsQueryable();

                // Menambahkan filter pencarian jika ada
                if (!string.IsNullOrEmpty(search))
                {
                    query = query.Where(m => m.UnitName.Contains(search));
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

        // API untuk memeriksa apakah model sudah ada di database
        [HttpPost]
        [Route("api/unit/check")]
        public IHttpActionResult CheckModelExists([FromBody] UnitRequest unitRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var modelExists = context.Units
                                         .Any(m => m.UnitName.Equals(unitRequest.UnitName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = modelExists });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/unit/add")]
        public IHttpActionResult AddModel([FromBody] UnitRequest unitRequest)
        {
            if (string.IsNullOrWhiteSpace(unitRequest.UnitName))
            {
                return BadRequest("Unit Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var modelExists = context.Units
                                         .Any(m => m.UnitName.Equals(unitRequest.UnitName, StringComparison.OrdinalIgnoreCase));

                if (modelExists)
                {
                    return Conflict(); // Return 409 Conflict jika model sudah ada
                }

                // Membuat objek model baru
                var model = new sparepartproject.Model.Unit
                {
                    UnitName = unitRequest.UnitName
                };

                // Menambahkan model ke database
                context.Units.Add(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/unit/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Units.SingleOrDefault(m => m.Id == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Units.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Unit berhasil dihapus" });
            }
        }
    }
}
