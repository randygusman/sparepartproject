using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class CellController : ApiController
    {
        // API untuk mengambil data unit dengan pagination dan pencarian
        [HttpGet]
        public IHttpActionResult GetCells(int page = 1, int pageSize = 10, string search = "")
        {
            using (var context = new MyDbContext())
            {
                // Membangun query untuk mengambil data dengan filter pencarian
                var query = context.Cells.AsQueryable();

                // Menambahkan filter pencarian jika ada
                if (!string.IsNullOrEmpty(search))
                {
                    query = query.Where(m => m.CellName.Contains(search));
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
        [Route("api/cell/check")]
        public IHttpActionResult CheckModelExists([FromBody] CellRequest cellRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var modelExists = context.Cells
                                         .Any(m => m.CellName.Equals(cellRequest.CellName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = modelExists });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/cell/add")]
        public IHttpActionResult AddModel([FromBody] CellRequest cellRequest)
        {
            if (string.IsNullOrWhiteSpace(cellRequest.CellName))
            {
                return BadRequest("Cell Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var modelExists = context.Cells
                                         .Any(m => m.CellName.Equals(cellRequest.CellName, StringComparison.OrdinalIgnoreCase));

                if (modelExists)
                {
                    return Conflict(); // Return 409 Conflict jika model sudah ada
                }

                // Membuat objek model baru
                var model = new sparepartproject.Model.Cell
                {
                    CellName = cellRequest.CellName
                };

                // Menambahkan model ke database
                context.Cells.Add(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/cell/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var model = context.Cells.SingleOrDefault(m => m.Id == id);

                if (model == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Cells.Remove(model);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Cell berhasil dihapus" });
            }
        }
    }
}
