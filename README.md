# 🚴‍♂️ NMCNPM - Nhóm 3 🌐  

## 📌 Thành viên trong nhóm  

### 👨‍💻 Team Dev  
- **Nguyễn Thị Mỹ Bình**  
- **Trần Trường Giang**  
- **Nguyễn Văn Phúc**  
- **Trần Anh Quân**  

### 🔍 Team Test  
- **Vi Thị Thu Hà Nhận**  
- **Nguyễn Thế Thành**  
- **Dương Thị Thương**  
- **Nguyễn Thanh Tùng**  

---

## 📝 Đề tài: **Web Cho Thuê Xe Đạp - BinaryBike**  
Ứng dụng web hỗ trợ cửa hàng BinaryBike trong việc quản lý và cho thuê xe đạp trực tuyến.  

---

## 🛠️ Công nghệ sử dụng  

<div align="center">  
  <img src="https://www.techmeet360.com/wp-content/uploads/2018/11/ASP.NET-Core-Logo.png" alt="ASP.NET Core" width="150"/>  
  <img src="https://zhost.vn/wp-content/uploads/2024/05/huong-dan-cai-dat-sql-server-ubuntu-01.png" alt="SQL Server" width="150"/>  
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Logo_jQuery.svg/2560px-Logo_jQuery.svg.png" alt="jQuery" width="150"/>  
  <img src="https://logovectorseek.com/wp-content/uploads/2019/10/bootstrap-logo-vector.png" alt="Bootstrap" width="150"/>  
</div>  

---

## 🚀 Hướng dẫn cài đặt  

## ⬇️ 1. Clone repo:
   ```sh
    git clone https://github.com/your-repo/NMCNPM_Nhom3.git
    cd NMCNPM_Nhom3
```

## 🛢️2. Thiết lập CSDL
   ```sh
    Truy cập www.root -> script --> copy toàn bộ code
    Mở SQL Server paste đoạn code SQL Server vào rồi chạy để tạo Database
```
## 🔗 3. Cấu hình chuỗi kết nối
```sh
    {
    "Logging": {
        "LogLevel": {
        "Default": "Information",
        "Microsoft.AspNetCore": "Warning"
        }
    },
    "ConnectionStrings": {
        "DefaultConnection": "Data Source=Name_Host;Initial Catalog=NMCNPM;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False"
    },
    "AllowedHosts": "*"
    } 
```
- **Đổi Name_Host thành địa chỉ của SQL Server mà ứng dụng sẽ kết nối tới.**

    Ví dụ Name_Host của mình là : **Data Source = QuanDepZai\SQLEXPRESS**

    Một số máy thì Name_Host có thể là: **Data Source = .**

## ⛏️ 4. Cài đặt thư viện Entity Framework (EF) trong ASP.NET Core**

**Cài đặt qua Nucget Package Console**
```sh
    dotnet add package Microsoft.EntityFrameworkCore
    dotnet add package Microsoft.EntityFrameworkCore.SqlServer
    dotnet add package Microsoft.EntityFrameworkCore.Tools
```

**Hoặc nếu dùng NuGet Package Manager, cài lần lượt:**

- Microsoft.EntityFrameworkCore

- Microsoft.EntityFrameworkCore.SqlServer

- Microsoft.EntityFrameworkCore.Tools

## ☕️ 5. Tận hưởng thành quả 
```sh
    dotnet run
```

## 🤝 6. Đóng góp (Contributing)
1. Fork repository này.
2. Tạo nhánh mới (`git checkout -b feature-tinh-nang-moi`).
3. Commit thay đổi (`git commit -m "Thêm tính năng mới"`).
4. Push lên GitHub (`git push origin feature-tinh-nang-moi`).
5. Tạo Pull Request.



## 📜 7. Giấy phép (License) 
```sh
    Distributed under the MIT License. See `LICENSE` for more information.
```

## 📢 8. Liên hệ (Contact)
```sh
    💪🏻 Trần Anh Quân
    📧 Email: thocodeanhquan@gmail.com
    📍 GitHub: [@kedokato-dev](https://github.com/kedokato-dev)  
```

