using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace sparepartproject.Controller
{
    public class MakerController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAllMaker(int page = 1, int pageSize = 10, string searchTerm = "")
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
                    var query = context.Makers.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        query = query.Where(s => s.Nama_maker.Contains(searchTerm));
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalMakers = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalMakers / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var makers = query
                                    .OrderBy(s => s.Nama_maker)  // Mengurutkan berdasarkan Vendor_name
                                    .Skip((page - 1) * pageSize)  // Skip data sebelumnya
                                    .Take(pageSize)                // Ambil data sesuai pageSize
                                    .ToList();

                    // Mengembalikan hasil dengan total data, total halaman, dan data per halaman
                    return Ok(new
                    {
                        data = makers,
                        total = totalMakers,
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
        [Route("api/maker/check")]
        public IHttpActionResult CheckMakerExists([FromBody] MakerRequest makerRequest)
        {
            using (var context = new MyDbContext())
            {
                // Mengecek apakah model dengan nama yang sama sudah ada
                var makerExist = context.Makers
                                         .Any(m => m.Nama_maker.Equals(makerRequest.MakerName.ToUpper(), StringComparison.OrdinalIgnoreCase));

                return Ok(new { exists = makerExist });
            }
        }

        // API untuk menambahkan model baru ke database
        [HttpPost]
        [Route("api/maker/add")]
        public IHttpActionResult AddModel([FromBody] MakerRequest makerRequest)
        {
            if (string.IsNullOrWhiteSpace(makerRequest.MakerName))
            {
                return BadRequest("Maker Name tidak boleh kosong.");
            }

            using (var context = new MyDbContext())
            {
                // Cek apakah model sudah ada sebelum ditambahkan
                var makerExist = context.Makers
                                         .Any(m => m.Nama_maker.Equals(makerRequest.MakerName, StringComparison.OrdinalIgnoreCase));

                if (makerExist)
                {
                    return Conflict(); // Return 409 Conflict jika vendor sudah ada
                }

                // Membuat objek model baru
                var maker = new sparepartproject.Model.Maker
                {
                    Nama_maker = makerRequest.MakerName,
                    Kode_maker = makerRequest.MakerKode,
                };

                // Menambahkan model ke database
                context.Makers.Add(maker);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true });
            }
        }

        // API untuk menghapus model dari database
        [HttpDelete]
        [Route("api/maker/delete/{id}")]
        public IHttpActionResult DeleteModel(int id)
        {
            using (var context = new MyDbContext())
            {
                // Mencari model dengan ID yang diberikan
                var maker = context.Makers.SingleOrDefault(m => m.Id == id);

                if (maker == null)
                {
                    // Mengembalikan status 404 jika model tidak ditemukan
                    return NotFound();
                }

                // Menghapus model dari database
                context.Makers.Remove(maker);
                context.SaveChanges();

                // Mengembalikan response sukses
                return Ok(new { success = true, message = "Maker berhasil dihapus" });
            }
        }
    }
}
