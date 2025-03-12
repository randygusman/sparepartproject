using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class ModelsController : ApiController
    {
        // API untuk mengambil data model dengan pagination dan pencarian
        [HttpGet]
        public IHttpActionResult GetModels(int page = 1, int pageSize = 10, string search = "")
        {
            using (var context = new MyDbContext())
            {
                // Membangun query untuk mengambil data dengan filter pencarian
                var query = context.Models.AsQueryable();

                // Menambahkan filter pencarian jika ada
                if (!string.IsNullOrEmpty(search))
                {
                    query = query.Where(m => m.ModelName.Contains(search));
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
        [Route("api/models/check")]
        public IHttpActionResult CheckModelExists([FromBody] ModelRequest modelRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var modelExists = context.Models
                                         .Any(m => m.ModelName.Equals(modelRequest.ModelName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = modelExists });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/models/add")]
        public IHttpActionResult AddModel([FromBody] ModelRequest modelRequest)
        {
            if (string.IsNullOrWhiteSpace(modelRequest.ModelName))
            {
                return BadRequest("Model Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var modelExists = context.Models
                                         .Any(m => m.ModelName.Equals(modelRequest.ModelName, StringComparison.OrdinalIgnoreCase));

                if (modelExists)
                {
                    return Conflict(); // Return 409 Conflict jika model sudah ada
                }

                // Membuat objek model baru
                var model = new sparepartproject.Model.Model
                {
                    ModelName = modelRequest.ModelName
                };

                // Menambahkan model ke database
                context.Models.Add(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/models/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Models.SingleOrDefault(m => m.Id == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Models.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Model berhasil dihapus" });
            }
        }

    }
}
