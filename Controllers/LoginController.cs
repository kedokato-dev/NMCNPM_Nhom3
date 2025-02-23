using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using NMCNPM_Nhom3.Models.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;

namespace NMCNPM_Nhom3.Controllers
{
    public class LoginController : Controller
    {

        private readonly NmcnpmContext _context;

        public LoginController(NmcnpmContext context)
        {
            _context = context;
        }
        public IActionResult Login()
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string username, string password)
        {
            var user = _context.TblAccounts.Include(u => u.SPermissionsNavigation).FirstOrDefault(u => u.SPhoneNumber == username && u.SPassword == password);
            if (user == null)
            {
                ViewBag.Message = "Invalid login credentials.";
                return View();
            }
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.SAccountName),
                new Claim("Phone", user.SPhoneNumber),
                new Claim(ClaimTypes.Role,  user.SPermissionsNavigation?.SPermissionn??"ban")
            };
            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login");
        }

    }
}

