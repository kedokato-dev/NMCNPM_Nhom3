using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using NMCNPM_Nhom3.Models.Entities;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace NMCNPM_Nhom3.Controllers
{
    [Authorize(Roles = "Admin")]
    public class BikeManagerController : Controller
    {
        private readonly NmcnpmContext _context;

        public BikeManagerController(NmcnpmContext context)
        {
            _context = context;
        }

        // GET: BikeManager
        public async Task<IActionResult> Index()
        {
            var bikes = await _context.TblBikes.Include(b => b.FkIdBikeDetailNavigation).ToListAsync();
            return View(bikes);
        }
        
        // GET: BikeManager/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var bike = await _context.TblBikes
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeTypeNavigation) // Load loại xe
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeBrandNavigation) // Load hãng xe
        .FirstOrDefaultAsync(b => b.PkIdBike == id);

            if (bike == null) return NotFound();

            return View(bike);
        }
        [HttpGet]
        public async Task<IActionResult> EditBike(int id)
        {
            TempData.Clear();
            var bike = await _context.TblBikes
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeBrandNavigation)
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeTypeNavigation)
        .FirstOrDefaultAsync(b => b.PkIdBike == id);
            if (bike == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy xe đạp!";
                return RedirectToAction("Index");
            }
            string content = $"{bike.FkIdBikeDetailNavigation.FkIdBikeBrandNavigation.SName}-{bike.FkIdBikeDetailNavigation.FkIdBikeTypeNavigation.SType}-{bike.FkIdBikeDetailNavigation.SFrameSize}-{bike.FkIdBikeDetailNavigation.SMaterial}-{bike.FkIdBikeDetailNavigation.FWeight}";
            ViewBag.Detail = content;
            return View(bike);
        }
        [HttpGet]
        public async Task<IActionResult> GetBikeDetails()
        {
            try
            {
                var bikeDetails = await _context.TblBikeDetails
                    .Where(d => d.FkIdBikeBrandNavigation != null && d.FkIdBikeTypeNavigation != null) // Đảm bảo không bị null
                    .Select(d => new
                    {
                        d.PkIdBikeDetail,
                        DisplayText = $"{d.FkIdBikeBrandNavigation.SName} - {d.FkIdBikeTypeNavigation.SType} - {d.SFrameSize} - {d.SMaterial} - {d.FWeight}"
                    })
                    .ToListAsync();

                if (!bikeDetails.Any())
                {
                    return NotFound(new { message = "Không tìm thấy dữ liệu xe đạp!" });
                }

                return Ok(bikeDetails); // Trả về HTTP 200 OK
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Lỗi máy chủ!", error = ex.Message });
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditBike(int id, TblBike bike)
        {
            if (id != bike.PkIdBike)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(bike);
                    await _context.SaveChangesAsync();
                    var bike1 = await _context.TblBikes
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeBrandNavigation)
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeTypeNavigation)
        .FirstOrDefaultAsync(b => b.PkIdBike == id);
                    TempData["SuccessMessage"] = "Cập nhật xe đạp thành công!";
                    string content = $"{bike1.FkIdBikeDetailNavigation.FkIdBikeBrandNavigation.SName}-{bike1.FkIdBikeDetailNavigation.FkIdBikeTypeNavigation.SType}-{bike1.FkIdBikeDetailNavigation.SFrameSize}-{bike1.FkIdBikeDetailNavigation.SMaterial}-{bike1.FkIdBikeDetailNavigation.FWeight}";
                    ViewBag.Detail = content;
                }
                catch (DbUpdateConcurrencyException)
                {
                    TempData["ErrorMessage"] = "Lỗi khi cập nhật dữ liệu!";
                }

            }

            // Nếu có lỗi, load lại danh sách chi tiết xe
            ViewBag.FkIdBikeDetail = new SelectList(_context.TblBikeDetails, "PkIdBikeDetail", "SFrameSize", bike.FkIdBikeDetail);

            return View(bike);
        }



        [HttpGet]
        public IActionResult Create()
        {
            TempData.Clear();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TblBike bike, IFormFile ImageFile)
        {
            if (ModelState.IsValid)
            {
                // Đường dẫn thư mục lưu ảnh
                string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/assests/resources");

                // Tạo tên file gốc
                string fileName = Path.GetFileNameWithoutExtension(ImageFile.FileName);
                string extension = Path.GetExtension(ImageFile.FileName);
                string uniqueFileName = fileName + extension;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                // Kiểm tra nếu file đã tồn tại, thêm (1), (2),...
                int count = 1;
                while (System.IO.File.Exists(filePath))
                {
                    uniqueFileName = $"{fileName}({count}){extension}";
                    filePath = Path.Combine(uploadsFolder, uniqueFileName);
                    count++;
                }

                // Tạo thư mục nếu chưa tồn tại
                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                // Lưu file vào thư mục
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await ImageFile.CopyToAsync(fileStream);
                }
                bike.SImage =  uniqueFileName;
                _context.TblBikes.Add(bike);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Thêm mới xe đạp thành công!";
            }
            else
            {
                string s = "";
                foreach(var key in ModelState.Keys)
                {
                    var errors = ModelState[key].Errors;
                    foreach (var error in errors)
                    {
                        s+=$"Lỗi tại {key}: {error.ErrorMessage} ";
                    }
                }
                TempData["ErrorMessage"] = "Thêm mới xe đạp thất bại! Vui lòng kiểm tra lại dữ liệu." + s;
            }
            
            
            return View(bike);
        }


    }
}
