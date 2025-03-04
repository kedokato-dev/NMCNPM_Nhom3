using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System;
using Microsoft.AspNetCore.Authorization;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using System.Linq.Expressions;

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
                .Include(b => b.TblCreateBills)
                    .ThenInclude(cb => cb.FkIdUserNavigation)
                .Where(b => b.IStatus.HasValue && b.IStatus.Value == 1)
                .Select(b => new ViewInvoice
                {
                    InvoiceID = b.PkBillCode,
                    CustomerName = b.TblCreateBills
                        .Where(cb => cb.FkIdUserNavigation.FkIdPermission == 2)
                        .Select(cb => cb.FkIdUserNavigation.SAccountName)
                        .FirstOrDefault() ?? "Khách hàng không xác định",
                    TimeBegin = b.DBeginTime,
                    TotalDeposit = b.TblBillDetails.Sum(bd => bd.FkIdBikeNavigation.FDeposit)
                })

                .ToListAsync();
            return View(bills);
        }



        // Xử lý tìm khách hàng theo CCCD
        [HttpGet]
        public async Task<IActionResult> SearchCustomer(string customerIdCard)
        {
            if (string.IsNullOrEmpty(customerIdCard) || !Regex.IsMatch(customerIdCard, @"^\d{12}$"))
            {
                return Json(new { success = false, message = "Số CCCD không hợp lệ.", exist = false });
            }

            var customer = await _context.TblAccounts
                .FirstOrDefaultAsync(u => u.SUserIdentification == customerIdCard);

            if (customer != null)
            {
                var checkExist = await _context.TblCreateBills
    .Include(b => b.FkIdUserNavigation)
    .Include(b => b.FkBillCodeNavigation) // Thêm Include để tránh lỗi truy cập null
    .FirstOrDefaultAsync(b =>
        b.FkIdUserNavigation.SUserIdentification == customerIdCard &&
        b.FkBillCodeNavigation.IStatus == 1);
                if (checkExist != null)
                {
                    return Json(new {success = false,exist = true, message = "Khách hàng đang thuê hóa đơn khác!"});
                }
                return Json(new
                {
                    success = true,
                    customerName = customer.SAccountName,
                    customerPhone = customer.SPhoneNumber
                });
            }
            else
            {
                return Json(new { success = false, message = "Khách hàng chưa có trong hệ thống.", exist = false });
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddCustomer(string customerIdCard, string customerName, string customerPhone)
        {
            if (string.IsNullOrEmpty(customerIdCard) || string.IsNullOrEmpty(customerName) || string.IsNullOrEmpty(customerPhone))
            {
                return Json(new { success = false, message = "Vui lòng nhập đầy đủ thông tin." });
            }

            // Kiểm tra xem CCCD đã tồn tại chưa
            var existingCustomer = await _context.TblAccounts
                .FirstOrDefaultAsync(u => u.SUserIdentification == customerIdCard);

            if (existingCustomer != null)
            {
                return Json(new { success = false, message = "CCCD đã tồn tại trong hệ thống." });
            }

            // Thêm khách hàng mới
            var newCustomer = new TblAccount
            {
                SUserIdentification = customerIdCard,
                SAccountName = customerName,
                SPhoneNumber = customerPhone,
                FkIdPermission = 2, // Quyền mặc định cho khách hàng
                SPassword = "User@123" // Mật khẩu mặc định
            };

            _context.TblAccounts.Add(newCustomer);
            await _context.SaveChangesAsync();

            return Json(new { success = true });
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
                //if (bike.SCondition == "Đã thuê")
                //{
                //    return Json(new
                //    {
                //        success = false,
                //        message = "Đã thuê",
                //        bikeStatus = bike.SCondition
                //    });
                //}

                return Json(new
                {
                    success = true,
                    bikeName = bike.SName,
                    bikeCondition = bike.SStatus,
                    bikeStatus = bike.SCondition,
                    bikeRentalPrice = bike.FRentalPrice,
                    bikeDepositPrice = bike.FDeposit

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
        public async Task<IActionResult> Create(TblBill bill, string customerIdCard, string customerFullName, string customerPhoneNumber, string selectedBikeIds)
        {
            _logger.LogInformation("Tạo hóa đơn bắt đầu.");

            // Sử dụng transaction để đảm bảo tính toàn vẹn dữ liệu
            using (var transaction = await _context.Database.BeginTransactionAsync())
            {
                try
                {
                    // Kiểm tra thông tin khách hàng trong database
                    var existingCustomer = await _context.TblAccounts
                        .FirstOrDefaultAsync(u => u.SUserIdentification == customerIdCard);

                    // Nếu khách hàng chưa tồn tại, thêm mới
                    //if (existingCustomer == null)
                    //{
                    //    _logger.LogInformation("Khách hàng chưa tồn tại. Thêm mới khách hàng.");
                    //    existingCustomer = new TblAccount
                    //    {
                    //        SAccountName = customerFullName,
                    //        SPhoneNumber = customerPhoneNumber,
                    //        SUserIdentification = customerIdCard,
                    //        FkIdPermission = 2,
                    //        SPassword = "User@123"
                    //    };

                    //    _context.TblAccounts.Add(existingCustomer);
                    //    await _context.SaveChangesAsync();
                    //}

                    // Tạo hóa đơn
                    bill.DBeginTime = bill.DBeginTime == default(DateTime) ? DateTime.Now : bill.DBeginTime;
                    bill.DEndTime = bill.DBeginTime.AddHours(3);
                    bill.IStatus = 1;

                    _logger.LogInformation("Lưu hóa đơn vào bảng TblBill.");

                    // Lưu vào bảng TblBill
                    _context.TblBills.Add(bill);
                    await _context.SaveChangesAsync();

                    _logger.LogInformation("BillCode: {BillCode}", bill.PkBillCode);

                    // Chuyển đổi selectedBikeIds từ JSON string sang List<int>
                    List<int> bikeIds = new List<int>();
                    if (!string.IsNullOrEmpty(selectedBikeIds))
                    {
                        bikeIds = JsonConvert.DeserializeObject<List<int>>(selectedBikeIds);
                    }

                    // Kiểm tra danh sách xe đã chọn
                    if (bikeIds == null || !bikeIds.Any())
                    {
                        _logger.LogWarning("Không có xe nào được chọn.");
                        return Json(new { success = false, message = "Không có xe nào được chọn." });
                    }

                    _logger.LogInformation("Danh sách xe đã chọn: {SelectedBikeIds}", string.Join(", ", bikeIds));

                    // Lưu chi tiết hóa đơn (danh sách xe được thuê)
                    foreach (var bikeId in bikeIds)
                    {
                        var bk = await _context.TblBikes.FirstOrDefaultAsync(b => b.PkIdBike == bikeId);
                        if(bk != null)
                        {
                            bk.SCondition = "Đã thuê";
							_context.Update(bk);
						}
                        var billDetail = new TblBillDetail
                        {
                            FkIdBill = bill.PkBillCode,
                            FkIdBike = bikeId
                        };
                        _context.TblBillDetails.Add(billDetail);
                    }
                    await _context.SaveChangesAsync();

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
                        FkIdUser = existingCustomer.PkIdUser,
                        FkBillCode = bill.PkBillCode
                    };

                    _context.TblCreateBills.Add(customerCreateBill);
                    await _context.SaveChangesAsync();

                    // Commit transaction
                    await transaction.CommitAsync();

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
                catch (Exception ex)
                {
                    // Rollback transaction nếu có lỗi
                    await transaction.RollbackAsync();
                    _logger.LogError(ex, "Lỗi khi tạo hóa đơn.");
                    return Json(new { success = false, message = "Có lỗi xảy ra khi tạo hóa đơn." });
                }
            }
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
                .Include(b => b.TblCreateBills)
                .ThenInclude(cb => cb.FkIdUserNavigation)
                .FirstOrDefaultAsync(m => m.PkBillCode == id);

            if (bill == null)
            {
                return NotFound();
            }

            var customer = bill.TblCreateBills.FirstOrDefault(cb => cb.FkIdUserNavigation.FkIdPermission == 2)?.FkIdUserNavigation;
            if (customer != null)
            {
                ViewBag.CustomerName = customer.SAccountName;
                ViewBag.CustomerPhone = customer.SPhoneNumber;
            }

            // Lấy thông tin xe
            var bikeList = bill.TblBillDetails.Select(bd => bd.FkIdBikeNavigation).ToList();
            double totalDeposit = 0;
            foreach(var x in bikeList)
            {
                totalDeposit += x.FDeposit;
            }
            ViewBag.totalDeposit = totalDeposit;
            ViewBag.BikeList = bikeList;

            return View(bill);
        }

        // POST: BillManager/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TblBill bill, int PaymentStatus)
        {
            if (id != bill.PkBillCode)
            {
                return HandleError("Không tìm thấy hóa đơn!");
            }

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                foreach (var error in errors)
                {
                    _logger.LogError(error.ErrorMessage);
                }
                LogModelStateErrors();
                return HandleError("Dữ liệu không hợp lệ!", bill);
            }

            try
            {
                var existingBill = await _context.TblBills
                    .Include(b => b.TblBillDetails)
                    .ThenInclude(bd => bd.FkIdBikeNavigation)
                    .FirstOrDefaultAsync(b => b.PkBillCode == id);

                if (existingBill == null)
                {
                    return HandleError("Không tìm thấy hóa đơn!");
                }

                // Cập nhật hóa đơn (Không cập nhật điều kiện xe)
                UpdateBill(existingBill, bill, PaymentStatus);

                // Bỏ phần cập nhật điều kiện xe
                //await UpdateBikeCondition(existingBill, "Chưa thuê");

                await _context.SaveChangesAsync();

                TempData["SuccessMessage"] = "Hóa đơn đã được cập nhật thành công!";
                return View(bill);
            }
            catch (DbUpdateConcurrencyException ex)
            {
                _logger.LogError(ex, "Lỗi DbUpdateConcurrencyException khi cập nhật hóa đơn.");
                return HandleError("Lỗi đồng thời khi cập nhật hóa đơn!");
            }
            catch (DbUpdateException ex)
            {
                _logger.LogError(ex, "Lỗi DbUpdateException khi cập nhật hóa đơn.");
                return HandleError("Lỗi khi lưu dữ liệu vào database!");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi không xác định khi cập nhật hóa đơn.");
                return HandleError("Lỗi hệ thống không xác định!");
            }
        }

        private void UpdateBill(TblBill existingBill, TblBill newBill, int paymentStatus)
        {
            existingBill.DBeginTime = newBill.DBeginTime;
            existingBill.DEndTime = newBill.DEndTime;
            existingBill.FIncidentalCosts = newBill.FIncidentalCosts;
            existingBill.IStatus = paymentStatus;
            _context.Update(existingBill);
        }

        private void LogModelStateErrors()
        {
            var errors = ModelState.Values.SelectMany(v => v.Errors);
            foreach (var error in errors)
            {
                _logger.LogError(error.ErrorMessage);
            }
        }

        private IActionResult HandleError(string message, TblBill bill = null)
        {
            TempData["ErrorMessage"] = message;
            if (bill != null)
            {
                return View(bill);
            }
            return RedirectToAction(nameof(Index));
        }




        private bool BillExists(int id)
        {
            return _context.TblBills.Any(e => e.PkBillCode == id);
        }
        [HttpPost]
        public async Task<IActionResult> BillInfo(int id)
        {
            var billCreate = await _context.TblCreateBills.FirstOrDefaultAsync(b => b.FkBillCode == id);
            var bill = await _context.TblBills.FirstOrDefaultAsync(b => b.PkBillCode == id);
            var listBikeID = _context.TblBillDetails.Where(b => b.FkIdBill == id).ToList();

            if (bill == null || billCreate == null || listBikeID == null || listBikeID.Count == 0 || bill.IStatus == 0)
            {
                ViewBag.error = "Lỗi";
                return View();
            }
            bill.IStatus = 0;
            _context.Update(bill);
            await _context.SaveChangesAsync();

            double totalRental = 0;
			double totalDeposit = 0;
            bill.DEndTime = DateTime.Now;
            TimeSpan duration = DateTime.Now - bill.DBeginTime;
            List<TblBike> bikes = new List<TblBike>();
            int hours = (int)duration.TotalMinutes/ 60;
            if((int)duration.TotalMinutes%60 >= 10)
            {
                hours++;
            }
            if (duration.TotalMinutes < 10) hours = 0;
            foreach(var x in listBikeID)
            {
                var bike = await _context.TblBikes.FirstOrDefaultAsync(b => b.PkIdBike == x.FkIdBike);
                if(bike != null)
                {
                    bike.SCondition = "Chưa thuê";
                    bikes.Add(bike);
                    _context.Update(bike);
                    totalDeposit += bike.FDeposit;
                    totalRental += hours * bike.FRentalPrice;
                }

            }
            await _context.SaveChangesAsync();

            var staff = await _context.TblAccounts.FirstOrDefaultAsync(a => a.PkIdUser == billCreate.FkIdUser && a.FkIdPermission == 1);
            var customer = await _context.TblAccounts.FirstOrDefaultAsync(a => a.PkIdUser == billCreate.FkIdUser && a.FkIdPermission == 2);

            ViewBag.totalRental = totalRental;
            ViewBag.totalDeposit = totalDeposit;
            ViewBag.nameStaff = staff?.SAccountName ?? "Nhân viên";
            ViewBag.nameCustomer = customer?.SAccountName ?? "Khách hàng";
            ViewBag.bikes = bikes;
            ViewBag.dEnd = bill.DEndTime;
            ViewBag.dStart = bill.DBeginTime;
            ViewBag.hours = hours;
            ViewBag.fIncidentalCosts = bill.FIncidentalCosts??0;
            return View();
        }
    }
}
