using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;
using BCrypt.Net;
using Microsoft.AspNetCore.Authorization;

namespace NMCNPM_Nhom3.Controllers
{
    [Authorize(Roles = "Admin")]
    public class StaffController : Controller
    {
        private readonly NmcnpmContext _context;

        public StaffController(NmcnpmContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var staff = _context.TblAccounts
                                .Where(a => a.FkIdPermission == 1 )
                                .ToList();
            return View(staff);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(TblAccount account)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.SuccessMessage = "Thêm tài khoản thất bại";
                ViewBag.RedirectUrl = Url.Action("Create", "Staff");
                return View(account);
            }

            if (_context.TblAccounts.Any(a => a.SPhoneNumber == account.SPhoneNumber) ||
                _context.TblAccounts.Any(a => a.SUserIdentification == account.SUserIdentification))
            {
                ViewBag.SuccessMessage = "Tài khoản này đã tồn tại";
                ViewBag.RedirectUrl = Url.Action("Create", "Staff");
                return View(account);
            }

            account.SPassword = BCrypt.Net.BCrypt.HashPassword(account.SPassword); // Mã hóa mật khẩu

            _context.TblAccounts.Add(account); // Thêm tài khoản vào DB
            _context.SaveChanges(); // Lưu thay đổi

            ViewBag.SuccessMessage = $"Thêm tài khoản thành công: {account.SAccountName}";
            ViewBag.RedirectUrl = Url.Action("Index", "Staff"); // Chuyển hướng sau khi thêm thành công
            return View(account);
        }




        [HttpGet]
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
        public async Task<IActionResult> Edit(int id, TblAccount account)
        {
            if (ModelState.IsValid)
            {
                //return View(account);
                return Content("Lỗi");
            }

            var existingAccount = await _context.TblAccounts.FindAsync(id);
            if (existingAccount == null)
            {
                return NotFound();
            }

            
            bool isPhoneNumberExist = _context.TblAccounts.Any(a => a.SPhoneNumber == account.SPhoneNumber && a.PkIdUser != id);
            bool isCCCDExist = _context.TblAccounts.Any(a => a.SUserIdentification == account.SUserIdentification && a.PkIdUser != id);

            if (isPhoneNumberExist)
            {
                ModelState.AddModelError("SPhoneNumber", "Số điện thoại đã tồn tại.");
                return View(account);
            }
            if (isCCCDExist)
            {
                ModelState.AddModelError("SUserIdentification", "Số CCCD đã tồn tại.");
                return View(account);
            }

           
            existingAccount.SAccountName = account.SAccountName;
            existingAccount.SPhoneNumber = account.SPhoneNumber;
            existingAccount.DDate = account.DDate;
            existingAccount.FkIdPermission = account.FkIdPermission;
            existingAccount.SUserIdentification = account.SUserIdentification;


            try
            {
                await _context.SaveChangesAsync();

             
                ViewBag.SuccessMessage = "Cập nhật tài khoản thành công!";
                ViewBag.RedirectUrl = Url.Action("Index");

                return View(account);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Có lỗi xảy ra khi cập nhật: " + ex.Message);
                return View(account);
            }
        }



        [HttpGet]
        public IActionResult Delete(int id)
        {
            var account = _context.TblAccounts.FirstOrDefault(a => a.PkIdUser == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirm(int id)
        {
            var account = _context.TblAccounts.Find(id);
            if (account == null)
            {
                ViewBag.ErrorMessage = "Tài khoản không tồn tại!";
                return View("Delete"); 
            }
            account.FkIdPermission = 3;
            _context.TblAccounts.Update(account);
            _context.SaveChanges();

            ViewBag.SuccessMessage = "Xoá tài khoản thành công!";
            ViewBag.RedirectUrl = Url.Action("Index");

            return View("Delete", account);

        }




    }
}
