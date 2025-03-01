using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblAccount
{
    public int PkIdUser { get; set; }

    public string SAccountName { get; set; } = null!;

    public string SPhoneNumber { get; set; } = null!;

    public DateOnly DDate { get; set; }

    public int FkIdPermission { get; set; }

    public string SUserIdentification { get; set; } = null!;

    public string SPassword { get; set; } = null!;

    public virtual TblPermission FkIdPermissionNavigation { get; set; } = null!;

    public virtual ICollection<TblCreateBill> TblCreateBills { get; set; } = new List<TblCreateBill>();
}
