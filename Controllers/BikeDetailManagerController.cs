using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;

namespace NMCNPM_Nhom3.Controllers
{
    public class BikeDetailManagerController : Controller
    {
        
        private readonly NmcnpmContext _context;
        public BikeDetailManagerController(NmcnpmContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
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
                TempData["ErrorMessage"] = "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.\n";
            }
            var brands = _context.TblBikeBrands.ToList();
            var types = _context.TblBikeTypes.ToList();

            // Kiểm tra nếu danh sách rỗng, tránh lỗi NullReferenceException
            ViewBag.FkIdBikeBrand = brands.Any() ? new SelectList(brands, "PkIdBikeBrand", "SName") : new SelectList(new List<TblBikeBrand>());
            ViewBag.FkIdBikeType = types.Any() ? new SelectList(types, "PkIdBikeType", "SType") : new SelectList(new List<TblBikeType>());

            return View(bikeDetail);
        }

        //Edit BikeDetail
        [HttpGet]
        public async Task<IActionResult> EditBikeDetail(int id)
        {
            TempData.Clear();
            var bikeDetail = await _context.TblBikeDetails.FindAsync(id);
            if (bikeDetail == null)
            {
                return NotFound();
            }

            var brands = _context.TblBikeBrands.ToList();
            var types = _context.TblBikeTypes.ToList();

            ViewBag.FkIdBikeBrand = new SelectList(brands, "PkIdBikeBrand", "SName", bikeDetail.FkIdBikeBrand);
            ViewBag.FkIdBikeType = new SelectList(types, "PkIdBikeType", "SType", bikeDetail.FkIdBikeType);

            return View(bikeDetail);
        }
        [HttpPost]
        public async Task<IActionResult> EditBikeDetail(int id, TblBikeDetail bikeDetail)
        {
            if (id != bikeDetail.PkIdBikeDetail)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(bikeDetail);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Cập nhật chi tiết xe đạp thành công!";
                }
                catch (Exception ex)
                {
                    TempData["ErrorMessage"] = "Đã xảy ra lỗi khi cập nhật chi tiết xe đạp.";
                    Console.WriteLine(ex.Message);
                }
            }
            else
            {
                TempData["ErrorMessage"] = "Thông tin không hợp lệ";
            }

            var brands = _context.TblBikeBrands.ToList();
            var types = _context.TblBikeTypes.ToList();

            ViewBag.FkIdBikeBrand = new SelectList(brands, "PkIdBikeBrand", "SName", bikeDetail.FkIdBikeBrand);
            ViewBag.FkIdBikeType = new SelectList(types, "PkIdBikeType", "SType", bikeDetail.FkIdBikeType);

            return View(bikeDetail);
        }
        //View
        [HttpGet]
        public async Task<IActionResult> ViewBikeDetail(int id)
        {
            var bikeDetail = await _context.TblBikeDetails
                .Include(b => b.FkIdBikeBrandNavigation)
                .Include(b => b.FkIdBikeTypeNavigation)
                .FirstOrDefaultAsync(m => m.PkIdBikeDetail == id);

            if (bikeDetail == null)
            {
                return NotFound();
            }

            return View(bikeDetail);
        }

    }
}
