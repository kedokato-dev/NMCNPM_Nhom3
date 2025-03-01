using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System;
using Microsoft.AspNetCore.Authorization;

namespace NMCNPM_Nhom3.Controllers
{
    [Authorize(Roles = "Staff")]
    public class BillController : Controller
    {
        private readonly NmcnpmContext _context;
        private readonly ILogger<BillController> _logger;

        public BillController(NmcnpmContext context, ILogger<BillController> logger)
        {
            _context = context;
            _logger = logger;
        }

        // GET: BillManager/Index (Chỉ hiển thị các hóa đơn đang thuê)
        public async Task<IActionResult> Index()
        {
            var bills = await _context.TblBills
                .Include(b => b.TblBillDetails)
                .ThenInclude(bd => bd.FkIdBikeNavigation)
                .Where(b => b.IStatus.HasValue && b.IStatus.Value == 1) // Chỉ lấy hóa đơn đang thuê
                .ToListAsync();
            return View(bills);
        }

        

        // Xử lý tìm khách hàng theo CCCD
        [HttpGet]
        public async Task<IActionResult> SearchCustomer(string customerIdCard)
        {
            if (string.IsNullOrEmpty(customerIdCard) || !Regex.IsMatch(customerIdCard, @"^\d{12}$"))
            {
                return Json(new { success = false, message = "Số CCCD không hợp lệ." });
            }

            var customer = await _context.TblAccounts
                .FirstOrDefaultAsync(u => u.SUserIdentification == customerIdCard);

            if (customer != null)
            {
                return Json(new
                {
                    success = true,
                    customerName = customer.SAccountName,
                    customerPhone = customer.SPhoneNumber
                });
            }
            else
            {
                return Json(new { success = false, message = "Khách hàng chưa có trong hệ thống." });
            }
        }

        // Xử lý tìm xe theo mã
        [HttpGet]
        public async Task<IActionResult> SearchBike(int bikeCode)
        {
            if (bikeCode <= 0)
            {
                return Json(new { success = false, message = "Mã xe không hợp lệ." });
            }

            var bike = await _context.TblBikes.FirstOrDefaultAsync(b => b.PkIdBike == bikeCode);

            if (bike != null)
            {
                return Json(new
                {
                    success = true,
                    bikeName = bike.SName,
                    bikeCondition = bike.SCondition,
                    bikeStatus = bike.SStatus,
                    bikeRentalPrice = bike.FRentalPrice,
                    bikeImage = bike.SImage
                });
            }
            else
            {
                return Json(new { success = false, message = "Xe không tồn tại." });
            }
        }
        
        // GET: BillManager/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: BillManager/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(TblBill bill, string customerIdCard, string customerFullName, string customerPhoneNumber, List<int> selectedBikeIds)
    {
        _logger.LogInformation("Tạo hóa đơn bắt đầu.");

        // Kiểm tra thông tin CCCD hợp lệ
        if (string.IsNullOrEmpty(customerIdCard) || !Regex.IsMatch(customerIdCard, @"^\d{12}$"))
        {
            _logger.LogWarning("Số CCCD không hợp lệ: {customerIdCard}", customerIdCard);
            return Json(new { success = false, message = "Số CCCD không hợp lệ." });
        }

        _logger.LogInformation("Kiểm tra khách hàng trong database.");

        // Kiểm tra thông tin khách hàng trong database
        var existingCustomer = await _context.TblAccounts
            .FirstOrDefaultAsync(u => u.SUserIdentification == customerIdCard);

        // Nếu khách hàng chưa tồn tại, thêm mới
        if (existingCustomer == null)
        {
            _logger.LogInformation("Khách hàng chưa tồn tại. Thêm mới khách hàng.");
            existingCustomer = new TblAccount
            {
                SAccountName = customerFullName,
                SPhoneNumber = customerPhoneNumber,
                SUserIdentification = customerIdCard,
                //DDate = DateTime.Now,
                FkIdPermission = 2,
                SPassword = "User@123" // Mặc định mật khẩu
            };

            _context.TblAccounts.Add(existingCustomer);
            await _context.SaveChangesAsync();
        }

        // Tạo hóa đơn
        bill.DBeginTime = bill.DBeginTime == default(DateTime) ? DateTime.Now : bill.DBeginTime;
        bill.DEndTime = bill.DBeginTime.AddHours(3);  // Cộng thêm 3 giờ vào thời gian bắt đầu để tính thời gian kết thúc
        bill.IStatus = 1; // Đang thuê
        //bill.FIncidentalCosts = null;

        _logger.LogInformation("Lưu hóa đơn vào bảng TblBill.");

        // Lưu vào bảng TblBill
        _context.TblBills.Add(bill);
        await _context.SaveChangesAsync();

        // Lưu chi tiết hóa đơn (danh sách xe được thuê)
        if (selectedBikeIds != null && selectedBikeIds.Any())
        {
            _logger.LogInformation("Lưu chi tiết hóa đơn (danh sách xe được thuê).");

            foreach (var bikeId in selectedBikeIds)
            {
                var billDetail = new TblBillDetail
                {
                    FkIdBill = bill.PkBillCode,
                    FkIdBike = bikeId
                };
                _context.TblBillDetails.Add(billDetail);
                }
            await _context.SaveChangesAsync();
        }

        // Lưu thông tin nhân viên tạo hóa đơn
        var username = User.Identity.Name;
        var staff = await _context.TblAccounts.FirstOrDefaultAsync(u => u.SAccountName == username);

        if (staff != null)
        {
            var createBill = new TblCreateBill
            {
                FkIdUser = staff.PkIdUser,
                FkBillCode = bill.PkBillCode
            };

            _context.TblCreateBills.Add(createBill);
            await _context.SaveChangesAsync();
        }

        // Lưu thông tin khách hàng vào bảng TblCreateBill (FkIdUser là ID của khách hàng)
        var customerCreateBill = new TblCreateBill
        {
            FkIdUser = existingCustomer.PkIdUser, // Lưu ID của khách hàng vào FkIdUser
            FkBillCode = bill.PkBillCode
        };

        _context.TblCreateBills.Add(customerCreateBill);
        await _context.SaveChangesAsync();

        _logger.LogInformation("Hóa đơn đã được tạo thành công. BillCode: {BillCode}", bill.PkBillCode);

        // Trả về thông báo thành công
        return Json(new 
        {
            success = true,
            message = "Hóa đơn đã được tạo thành công!",
            formattedStartTime = bill.DBeginTime.ToString("dd/MM/yy h:mm"),
            formattedEndTime = bill.DEndTime.ToString("dd/MM/yy h:mm")
        });
    }




        // GET: BillManager/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var bill = await _context.TblBills
                .Include(b => b.TblBillDetails)
                .ThenInclude(bd => bd.FkIdBikeNavigation)
                .FirstOrDefaultAsync(m => m.PkBillCode == id);

            if (bill == null)
            {
                return NotFound();
            }

            // Lấy thông tin xe
            var bikeInfo = bill.TblBillDetails.FirstOrDefault()?.FkIdBikeNavigation;
            if (bikeInfo != null)
            {
                ViewBag.BikeCode = bikeInfo.PkIdBike;
                ViewBag.BikeCondition = bikeInfo.SCondition;
            }

            return View(bill);
        }

        // POST: BillManager/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TblBill bill, string bikeCondition, int IStatus)
        {
            if (id != bill.PkBillCode)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Cập nhật thông tin hóa đơn
                    var existingBill = await _context.TblBills.FindAsync(id);
                    if (existingBill != null)
                    {
                        existingBill.DEndTime = bill.DEndTime;
                        existingBill.FIncidentalCosts = bill.FIncidentalCosts;
                        existingBill.IStatus = IStatus; // Cập nhật trạng thái hóa đơn

                        _context.Update(existingBill);
                    }

                    // Cập nhật tình trạng xe
                    var billDetail = await _context.TblBillDetails.FirstOrDefaultAsync(bd => bd.FkIdBill == id);
                    if (billDetail != null)
                    {
                        var bike = await _context.TblBikes.FindAsync(billDetail.FkIdBike);
                        if (bike != null)
                        {
                            bike.SCondition = bikeCondition;
                            _context.Update(bike);
                        }
                    }

                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Hóa đơn đã được cập nhật thành công!";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BillExists(bill.PkBillCode))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật hóa đơn!";
            return View(bill);
        }




        private bool BillExists(int id)
        {
            return _context.TblBills.Any(e => e.PkBillCode == id);
        }
    }
}
