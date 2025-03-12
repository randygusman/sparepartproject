using sparepartproject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sparepartproject.Controller
{
    public class HomeController : ApiController
    {
        [HttpGet]
        [Route("api/home/groupbycategory")]
        public IHttpActionResult GetSparepartGroupByCategory()
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    IQueryable<Sparepart> query = context.Spareparts;

                    var totalCount = context.Spareparts.Count(); // Jumlah total sparepart

                    var result = context.Spareparts
                        .GroupBy(s => s.StockCategory)
                        .Select(g => new
                        {
                            StockCategory = g.Key,
                            Count = g.Count(),
                            Percentage = (double)g.Count() / totalCount * 100 // Hitung persentase
                        })
                        .ToList();

                    if (result == null || !result.Any())
                    {
                        return NotFound();
                    }

                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}
