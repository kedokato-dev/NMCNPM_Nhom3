using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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
    }
}
