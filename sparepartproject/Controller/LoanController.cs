using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class LoanController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAllSparepart(int page = 1, int pageSize = 10, string searchTerm = "")
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
                    // Membuat query dasar untuk Spareparts
                    var query = context.Loans.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        query = query.Where(s =>
                            s.goodsCode.Contains(searchTerm) ||
                            s.model.Contains(searchTerm) ||
                            s.line.Contains(searchTerm) 
                        );
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalLoans = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalLoans / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var loans = query

                                        .OrderByDescending(s => s.issuedOn)  // Mengurutkan berdasarkan GoodsCode
                                        .Skip((page - 1) * pageSize)  // Skip data sebelumnya
                                        .Take(pageSize)  // Ambil data sesuai pageSize
                                        .ToList();

                    // Mengembalikan hasil dengan total data, total halaman, dan data per halaman
                    return Ok(new
                    {
                        data = loans,
                        total = totalLoans,
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

        [HttpGet]
        [Route("api/loan/{id}")]
        public IHttpActionResult GetLoanById(int id)
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    // Mencari sparepart berdasarkan GoodsCode
                    var sparepart = context.Loans.FirstOrDefault(s => s.id == id);

                    if (sparepart == null)
                    {
                        return NotFound(); // Mengembalikan 404 jika tidak ditemukan
                    }

                    // Mengambil data issued sparepart berdasarkan goodsCode dengan pagination
                    

                    // Menghitung total data issued sparepart

              

                    // Membuat object response yang mengandung data sparepart dan data issued sparepart
                    var response = new
                    {
                        Sparepart = sparepart,
                        
                    };

                    return Ok(response); // Mengembalikan data sparepart dan issued sparepart jika ditemukan
                }
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}
