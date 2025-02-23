using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;
using BCrypt.Net;

namespace NMCNPM_Nhom3.Controllers
{
    public class StaffController : Controller
    {
        private readonly NmcnpmContext _context;

        public StaffController(NmcnpmContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            if (IsLoggedIn())
            {
                var staff = _context.TblAccounts.ToList();
                return View(staff);
            }
            return RedirectToAction("Login", "Login");
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(TblAccount account)
        {
            if (!IsLoggedIn())
                return RedirectToAction("Login", "Login");

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                return View(account);
            }

            try
            {
                account.SPassword = BCrypt.Net.BCrypt.HashPassword(account.SPassword);

                _context.TblAccounts.Add(account);
                _context.SaveChanges();
                return Json(new { message = "Thêm tài khoản thành công, tài khoản: " + account.SAccountName, redirectUrl = "/Staff/Index" });
               


            }
            catch (Exception ex)
            {
                //Console.WriteLine("Lỗi khi thêm tài khoản: ");
                //ModelState.AddModelError("", "Có lỗi xảy ra khi thêm tài khoản." + ex.ToString());
                return View(account);
            }
        }

        public IActionResult Edit(int id)
        {
            var account = _context.TblAccounts.Find(id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(TblAccount account)
        {
            if (ModelState.IsValid)
            {
                var existingAccount = _context.TblAccounts.Find(account.PkIdUser);
                if (existingAccount == null)
                {
                    return NotFound();
                }

                // Cập nhật thông tin tài khoản
                existingAccount.SAccountName = account.SAccountName;
                existingAccount.SPhoneNumber = account.SPhoneNumber;
                existingAccount.DDate = account.DDate;
                existingAccount.FkIdPermission = account.FkIdPermission;
                existingAccount.SUserIdentification = account.SUserIdentification;

                // Nếu có mật khẩu mới thì mã hóa và lưu, nếu không thì giữ nguyên mật khẩu cũ
                if (!string.IsNullOrEmpty(account.SPassword))
                {
                    existingAccount.SPassword = BCrypt.Net.BCrypt.HashPassword(account.SPassword);
                }

                _context.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(account);
        }

       public IActionResult Delete(int id)
        {
            var account = _context.TblAccounts.Find(id);
            if (account == null)
            {
                return NotFound();
            }
            _context.TblAccounts.Remove(account);
            _context.SaveChanges();

            // Thêm thông báo thành công vào TempData
            TempData["SuccessMessage"] = "Tài khoản đã được xóa thành công!";
            return RedirectToAction("Index");
        }


        private bool IsLoggedIn()
        {
            return !string.IsNullOrEmpty(HttpContext.Session.GetString("AccountId"));
        }
    }
}
