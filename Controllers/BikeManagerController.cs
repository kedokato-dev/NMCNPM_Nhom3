using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
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

        // GET: BikeManager/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: BikeManager/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("SName,SStatus,SCondition,FRentalPrice")] TblBike bike)
        {
            if (ModelState.IsValid)
            {
                _context.Add(bike);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(bike);
        }

        // GET: BikeManager/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var bike = await _context.TblBikes.FindAsync(id);
            if (bike == null) return NotFound();

            return View(bike);
        }

        // POST: BikeManager/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PkIdBike,SName,SStatus,SCondition,FRentalPrice")] TblBike bike)
        {
            if (id != bike.PkIdBike) return NotFound();

            if (ModelState.IsValid)
            {
                _context.Update(bike);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(bike);
        }

        // GET: BikeManager/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var bike = await _context.TblBikes.FirstOrDefaultAsync(m => m.PkIdBike == id);
            if (bike == null) return NotFound();

            return View(bike);
        }

        // POST: BikeManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var bike = await _context.TblBikes.FindAsync(id);
            if (bike != null)
            {
                _context.TblBikes.Remove(bike);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        //=====================BikeDetail====================================================

        public async Task<IActionResult> ViewListBikeDetail()
        {
            var bikeDetails = await _context.TblBikeDetails.Include(b => b.FkIdBikeBrandNavigation)
                .Include(b => b.FkIdBikeTypeNavigation).ToListAsync();
            return View(bikeDetails);
        }

        public IActionResult CreateBikeDetail()
        {
            TempData.Clear();
            var brands = _context.TblBikeBrands.ToList();
            var types = _context.TblBikeTypes.ToList();

            // Kiểm tra nếu danh sách rỗng, tránh lỗi NullReferenceException
            ViewBag.FkIdBikeBrand = brands.Any() ? new SelectList(brands, "PkIdBikeBrand", "SName") : new SelectList(new List<TblBikeBrand>());
            ViewBag.FkIdBikeType = types.Any() ? new SelectList(types, "PkIdBikeType", "SType") : new SelectList(new List<TblBikeType>());

            return View();
        }


        // POST: BikeDetail/Create
        [HttpPost]
        public async Task<IActionResult> CreateBikeDetail(TblBikeDetail bikeDetail)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Add(bikeDetail);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Thêm chi tiết xe đạp thành công!";
                }
                catch (Exception ex)
                {
                    TempData["ErrorMessage"] = "Đã xảy ra lỗi khi thêm chi tiết xe đạp.";
                    Console.WriteLine(ex.Message);
                }
            }
            else
            {
                TempData["ErrorMessage"] = "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.\n" ;
            }
            var brands = _context.TblBikeBrands.ToList();
            var types = _context.TblBikeTypes.ToList();

            // Kiểm tra nếu danh sách rỗng, tránh lỗi NullReferenceException
            ViewBag.FkIdBikeBrand = brands.Any() ? new SelectList(brands, "PkIdBikeBrand", "SName") : new SelectList(new List<TblBikeBrand>());
            ViewBag.FkIdBikeType = types.Any() ? new SelectList(types, "PkIdBikeType", "SType") : new SelectList(new List<TblBikeType>());

            return View(bikeDetail);
        }
    }
}
