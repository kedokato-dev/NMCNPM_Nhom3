using System.Diagnostics;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models;
using NMCNPM_Nhom3.Models.Entities;

namespace NMCNPM_Nhom3.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly NmcnpmContext _context;
        public HomeController(ILogger<HomeController> logger,NmcnpmContext context)
        {
            _logger = logger;
            _context = context;
        }
        //[Authorize(Roles = "Admin")]
        public IActionResult Index()
        {
            //var s = User.FindFirst(ClaimTypes.Role).Value;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string username, string password)
        {
            var user = await _context.TblAccounts
                .Include(u => u.FkIdPermissionNavigation)
                .FirstOrDefaultAsync(u => u.SPhoneNumber == username);

            // Kiểm tra tài khoản có tồn tại không
            if (user == null || !isCorrectPassword(password, user.SPassword))//
            {
                return Json(new { success = false, message = "Tên đăng nhập hoặc mật khẩu không đúng!" });
            }

            // Tạo danh sách claim
            var claims = new List<Claim>
    {
        new Claim(ClaimTypes.Name, user.SAccountName),
        new Claim("Phone", user.SPhoneNumber),
        new Claim(ClaimTypes.Role, user.FkIdPermissionNavigation?.SPermissionn ?? "ban")
    };

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);

            // Đăng nhập với cookie authentication
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

            return Json(new { success = true });
        }


        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Details(int id)
        {
            var bike = await _context.TblBikes
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeTypeNavigation) // Load loại xe
        .Include(b => b.FkIdBikeDetailNavigation)
            .ThenInclude(d => d.FkIdBikeBrandNavigation) // Load hãng xe
        .FirstOrDefaultAsync(b => b.PkIdBike == id);
            if (bike == null || bike.FkIdBikeDetailNavigation == null)
            {
                return NotFound();
            }
            return  View(bike);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        private bool isCorrectPassword(string password, string hash)
        {
            return BCrypt.Net.BCrypt.Verify(password, hash);
        }
    }
}
