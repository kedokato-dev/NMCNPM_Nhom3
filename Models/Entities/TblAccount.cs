using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblAccount
{
    public int PkIdUser { get; set; }

    [Required]
    [StringLength(20, ErrorMessage = "Tên tài khoản phải dưới 20 kí tự")]
    public string SAccountName { get; set; } = null!;

    [Required]
    [RegularExpression(@"^\d{10,11}$", ErrorMessage = "Số điện thoại phải có từ 10 - 11 số")]
    public string SPhoneNumber { get; set; } = null!;

    public DateTime DDate { get; set; }

    public int SPermissions  { get; set; }

    [Required]
    [RegularExpression(@"^\d{12}$", ErrorMessage = "Căn cước công dân phải có đúng 12 số")]
    public string SUserIdentification { get; set; } = null!;

    [Required]
    [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$",
            ErrorMessage = "Mật khẩu phải có từ 8 kí tự trở lên, bao gồm ít nhất 1 chữ hoa, 1 chữ thường, 1 số và 1 kí tự đặc biệt")]
    public string SPassword { get; set; } = null!;


    public virtual TblPermission? SPermissionsNavigation { get; set; }

}
