using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class HistoryController : ApiController
    {
        [HttpGet]
        [Route("api/history")]
        public IHttpActionResult GetAllHistory(int page = 1, int pageSize = 10, string searchTerm = "")
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
                    // Membuat query dasar untuk AuditLogs
                    var query = context.AuditLogs.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm?.Trim()))
                    {
                        searchTerm = searchTerm.Trim().ToLower(); // Trim whitespace dan ubah ke lowercase

                        query = query.Where(s =>
                            s.GoodsCode.Contains(searchTerm) ||
                            s.TableName.Contains(searchTerm) ||
                            s.Username.Contains(searchTerm) 
                        );
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalModification = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalModification / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var modifications = query
                        .OrderByDescending(s => s.AuditID)  // Mengurutkan berdasarkan AuditID
                        .Skip((page - 1) * pageSize)  // Skip data sebelumnya
                        .Take(pageSize)  // Ambil data sesuai pageSize
                        .ToList();

                    // Mengembalikan hasil dengan total data, total halaman, dan data per halaman
                    return Ok(new
                    {
                        data = modifications,
                        total = totalModification,
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

    }
}
