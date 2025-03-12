using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Driver;
using System.Web.Http;
using static sparepartproject.comingpart;
using sparepartproject.Class;
using MongoDB.Bson;
using sparepartproject.Model;
using System.Data.SqlClient;
using System.Configuration;
using MongoDB.Driver.Core.Configuration;
using Microsoft.Graph.Models;
using System.IO;
using System.Net.Http;
using OfficeOpenXml;
using System.Net.Http.Headers;
using System.Net;

namespace sparepartproject.Controller
{
    public class SparepartController : ApiController
    {

        public SparepartController()
        {
            
        }

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
                    var query = context.Spareparts.AsQueryable();

                    // Pencarian berdasarkan searchTerm
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        query = query.Where(s =>
                            s.GoodsCode.Contains(searchTerm) ||
                            s.GoodsName.Contains(searchTerm) ||
                            s.GoodsDesc.Contains(searchTerm) ||
                            s.Model.Contains(searchTerm) ||
                            s.SuppName.Contains(searchTerm)
                        );
                    }

                    // Menghitung total data setelah filter pencarian
                    var totalSpareparts = query.Count();

                    // Menghitung total halaman
                    var totalPages = (int)Math.Ceiling(totalSpareparts / (double)pageSize);

                    // Mengambil data dengan pagination dan pencarian
                    var spareparts = query
                                        .OrderBy(s => s.GoodsCode)  // Mengurutkan berdasarkan GoodsCode
                                        .Skip((page - 1) * pageSize)  // Skip data sebelumnya
                                        .Take(pageSize)  // Ambil data sesuai pageSize
                                        .ToList();

                    // Mengembalikan hasil dengan total data, total halaman, dan data per halaman
                    return Ok(new
                    {
                        data = spareparts,
                        total = totalSpareparts,
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
        [Route("api/sparepart/{goodsCode}")]
        public IHttpActionResult GetSparepartByCode(string goodsCode, int page = 1, int pageSize = 10)
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    // Mencari sparepart berdasarkan GoodsCode
                    var sparepart = context.Spareparts.FirstOrDefault(s => s.GoodsCode == goodsCode);

                    if (sparepart == null)
                    {
                        return NotFound(); // Mengembalikan 404 jika tidak ditemukan
                    }

                    // Mengambil data issued sparepart berdasarkan goodsCode dengan pagination
                    var issuedSparepartsQuery = context.DailyIssueds
                        .Where(i => i.goodsCode == goodsCode);

                    var modificationHistoryQuery = context.AuditLogs
                        .Where(i => i.GoodsCode == goodsCode);

                    // Menghitung total data issued sparepart
                    var totalIssuedSpareparts = issuedSparepartsQuery.Count();
                    var totalModificationHistory = modificationHistoryQuery.Count();

                    // Mengambil data issued sparepart sesuai dengan page dan pageSize
                    var issuedSpareparts = issuedSparepartsQuery
                        .OrderByDescending(i => i.issuedDate) // Contoh pengurutan, sesuaikan jika perlu
                        .Skip((page - 1) * pageSize)
                        .Take(pageSize)
                        .ToList();

                    var modificationHistory = modificationHistoryQuery
                        .OrderByDescending(i => i.ChangeTime) // Contoh pengurutan, sesuaikan jika perlu
                        .Skip((page - 1) * pageSize)
                        .Take(pageSize)
                        .ToList();

                    // Membuat object response yang mengandung data sparepart dan data issued sparepart
                    var response = new
                    {
                        Sparepart = sparepart,
                        IssuedSpareparts = issuedSpareparts,
                        TotalIssuedSpareparts = totalIssuedSpareparts,
                        ModificationHistory = modificationHistory,
                        TotalModificationHistory = totalModificationHistory,

                        CurrentPage = page,
                        PageSize = pageSize
                    };

                    return Ok(response); // Mengembalikan data sparepart dan issued sparepart jika ditemukan
                }
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

        [HttpGet]
        [Route("api/sparepart/{goodsCode}/excel")]
        public HttpResponseMessage GetIssuedSparepartsExcel(string goodsCode)
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    var issuedSpareparts = context.DailyIssueds
                        .Where(i => i.goodsCode == goodsCode)
                        .OrderByDescending(i => i.issuedDate)
                        .ToList();

                    if (issuedSpareparts == null || issuedSpareparts.Count == 0)
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "No issued spareparts found for this goods code.");
                    }

                    ExcelPackage.LicenseContext = LicenseContext.Commercial;

                    // Membuat paket Excel menggunakan EPPlus
                    using (ExcelPackage package = new ExcelPackage())
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Issued Spareparts");

                        // Header
                        worksheet.Cells[1, 1].Value = "Goods Code";
                        worksheet.Cells[1, 2].Value = "Goods Name";
                        worksheet.Cells[1, 3].Value = "Issued By";
                        worksheet.Cells[1, 4].Value = "Quantity";
                        worksheet.Cells[1, 5].Value = "Model";
                        worksheet.Cells[1, 6].Value = "Line";
                        worksheet.Cells[1, 7].Value = "Issued Date";
                        worksheet.Cells[1, 8].Value = "Reason";

                        // Data
                        for (int i = 0; i < issuedSpareparts.Count; i++)
                        {
                            var item = issuedSpareparts[i];
                            worksheet.Cells[i + 2, 1].Value = item.goodsCode;
                            worksheet.Cells[i + 2, 2].Value = item.goodsName;
                            worksheet.Cells[i + 2, 3].Value = item.issuedBy_ID;
                            worksheet.Cells[i + 2, 4].Value = item.qtyIssued;
                            worksheet.Cells[i + 2, 5].Value = item.model;
                            worksheet.Cells[i + 2, 6].Value = item.lineName;
                            worksheet.Cells[i + 2, 7].Value = item.issuedDate.ToString("yyyy-MM-dd");
                            worksheet.Cells[i + 2, 8].Value = item.reason;
                        }

                        // Sesuaikan kolom
                        worksheet.Cells.AutoFitColumns();

                        // Konversi paket Excel ke array byte
                        byte[] excelData;
                        try
                        {
                            excelData = package.GetAsByteArray();
                        }
                        catch (Exception ex)
                        {
                            // Log the exception or handle it as needed
                            return Request.CreateResponse(HttpStatusCode.InternalServerError, "Error generating Excel file: " + ex.Message);
                        }

                        if (excelData == null || excelData.Length == 0)
                        {
                            return Request.CreateResponse(HttpStatusCode.InternalServerError, "Excel file generation resulted in empty data.");
                        }

                        // Membuat respons
                        HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
                        response.Content = new ByteArrayContent(excelData);
                        response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
                        response.Content.Headers.ContentDisposition.FileName = $"HistoryIssuedSpareparts_{goodsCode}.xlsx";
                        response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

                        return response;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "An unexpected error occurred: " + ex.Message);
            }
        }

        //[HttpGet]
        //[Route("api/sparepartissued/top10")]
        //public IHttpActionResult GetTop10IssuedSpareparts()
        //{
        //    try
        //    {
        //        using (var context = new MyDbContext())
        //        {
        //            var top10 = context.DailyIssueds
        //                .GroupBy(i => new { i.goodsCode, i.goodsName })
        //                .OrderByDescending(g => g.Sum(i => i.qtyIssued))
        //                .Take(10)
        //                .Select(g => new
        //                {
        //                    goodsCode = g.Key.goodsCode,
        //                    goodsName = g.Key.goodsName,
        //                    quantityIssued = g.Sum(i => i.qtyIssued)
        //                })
        //                .ToList();

        //            return Ok(top10);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return InternalServerError(ex);
        //    }
        //}

        [HttpGet]
        [Route("api/sparepartissued/top10")]
        public IHttpActionResult GetTop10IssuedSpareparts(string month = null)
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    IQueryable<DailyIssued> query = context.DailyIssueds;

                    if (!string.IsNullOrEmpty(month))
                    {
                        // Asumsikan format bulan adalah YYYY-MM
                        if (DateTime.TryParseExact(month + "-01", "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out DateTime selectedDate))
                        {
                            int year = selectedDate.Year;
                            int monthValue = selectedDate.Month;

                            query = query.Where(i => i.issuedDate.Year == year && i.issuedDate.Month == monthValue);
                        }
                        else
                        {
                            // Tangani kasus jika format bulan tidak valid
                            return BadRequest("Invalid month format. Please use YYYY-MM.");
                        }
                    }

                    var top10 = query
                        .GroupBy(i => new { i.goodsCode, i.goodsName })
                        .OrderByDescending(g => g.Sum(i => i.qtyIssued))
                        .Take(10)
                        .Select(g => new
                        {
                            goodsCode = g.Key.goodsCode,
                            goodsName = g.Key.goodsName,
                            quantityIssued = g.Sum(i => i.qtyIssued)
                        })
                        .ToList();

                    return Ok(top10);
                }
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}