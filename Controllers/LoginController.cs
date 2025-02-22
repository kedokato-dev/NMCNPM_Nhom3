using System.Runtime.InteropServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;

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
            return View();
        }

        [HttpPost]
        public IActionResult Login(TblAccount account)
        {
            if (account == null || string.IsNullOrEmpty(account.SPhoneNumber) || string.IsNullOrEmpty(account.SPassword))
            {
                return Json(new { message = "Vui lòng nhập đầy đủ thông tin.", redirectUrl = "" });
            }

            var acc = _context.TblAccounts
                .AsNoTracking()
                .FirstOrDefault(a => a.SPhoneNumber == account.SPhoneNumber && a.SPassword == account.SPassword);

            if (acc == null)
            {
                return Json(new { message = "Tài khoản hoặc mật khẩu không đúng.", redirectUrl = "" });
            }
            else
            {
                HttpContext.Session.SetString("AccountId", acc.PkIdUser.ToString()); 
                HttpContext.Session.SetString("AccountName", acc.SAccountName); 
                HttpContext.Session.SetString("PhoneNumber", acc.SPhoneNumber);
                HttpContext.Session.SetString("Permissions", acc.SPermissions.ToString());
                return Json(new { message = "Đăng nhập thành công" + acc.SAccountName, redirectUrl = "/Home/Index" });
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

    }
}

