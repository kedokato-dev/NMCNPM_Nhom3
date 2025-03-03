using Microsoft.EntityFrameworkCore;
using NMCNPM_Nhom3.Models.Entities;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHttpContextAccessor();
//CookieAuthentication
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Home";   // Đường dẫn login
        options.LogoutPath = "/Home"; // Đường dẫn logout
        options.AccessDeniedPath = "/Account/AccessDenied"; // Trang từ chối truy cập
        options.Cookie.Name = "CookieAuth";   // Tên cookie
        options.Cookie.HttpOnly = true;        // Ngăn JavaScript truy cập cookie
        options.ExpireTimeSpan = TimeSpan.FromDays(5); // Hết hạn sau 30 phút
        options.SlidingExpiration = true; // Reset lại thời gian nếu user hoạt động
    });

builder.Services.AddAuthorization();
// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<NmcnpmContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// cấu hình session
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); //  timeout của session
    options.Cookie.HttpOnly = true; // Bảo mật cookie
    options.Cookie.IsEssential = true; //  cookie là bắt buộc
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseStaticFiles(); // Kích hoạt file tĩnh
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

// dùng session
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
