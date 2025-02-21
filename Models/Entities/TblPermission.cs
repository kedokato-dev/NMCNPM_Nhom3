using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblPermission
{
    public int PkIdPermission { get; set; }

    public string SPermissionn { get; set; } = null!;

    public virtual ICollection<TblAccount> TblAccounts { get; set; } = new List<TblAccount>();
}
