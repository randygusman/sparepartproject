using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class KeepingController : ApiController
    {
        // API untuk mengambil data unit dengan pagination dan pencarian
        [HttpGet]
        public IHttpActionResult GetUnits(int page = 1, int pageSize = 10, string search = "")
        {
            using (var context = new MyDbContext())
            {
                // Membangun query untuk mengambil data dengan filter pencarian
                var query = context.Keepings.AsQueryable();

                // Menambahkan filter pencarian jika ada
                if (!string.IsNullOrEmpty(search))
                {
                    query = query.Where(m => m.KeepingName.Contains(search));
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
        [Route("api/keeping/check")]
        public IHttpActionResult CheckModelExists([FromBody] KeepingRequest keepingRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var modelExists = context.Keepings
                                         .Any(m => m.KeepingName.Equals(keepingRequest.KeepingName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = modelExists });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/keeping/add")]
        public IHttpActionResult AddModel([FromBody] KeepingRequest keepingRequest)
        {
            if (string.IsNullOrWhiteSpace(keepingRequest.KeepingName))
            {
                return BadRequest("Line Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var modelExists = context.Keepings
                                         .Any(m => m.KeepingName.Equals(keepingRequest.KeepingName, StringComparison.OrdinalIgnoreCase));

                if (modelExists)
                {
                    return Conflict(); // Return 409 Conflict jika model sudah ada
                }

                // Membuat objek model baru
                var model = new sparepartproject.Model.Keeping
                {
                    KeepingName = keepingRequest.KeepingName,
                    CabinetType = "Keeping"
                };

                // Menambahkan model ke database
                context.Keepings.Add(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        [HttpDelete]
        [Route("api/keeping/delete/{name}")]
        public IHttpActionResult DeleteKeeping(string name)
        {
            using (var context = new MyDbContext())
            {
                // Mencari Keeping berdasarkan Name
                var keeping = context.Keepings.SingleOrDefault(k => k.KeepingName == name);

                if (keeping == null)
                {
                    return NotFound();
                }

                // Mengecek apakah ada SubKeeping yang terkait
                bool hasSubKeeping = context.Subkeepings.Any(sk => sk.Name == keeping.KeepingName);
                if (hasSubKeeping)
                {
                    return BadRequest("Tidak dapat menghapus Keeping karena masih ada SubKeeping yang terkait.");
                }

                // Menghapus Keeping
                context.Keepings.Remove(keeping);
                context.SaveChanges();

                return Ok(new { success = true, message = "Keeping berhasil dihapus" });
            }
        }


    }
}
