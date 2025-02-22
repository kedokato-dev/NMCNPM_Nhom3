using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblCreateBill
{
    public int FkIdUser { get; set; }

    public int FkBillCode { get; set; }

    public virtual TblBill FkBillCodeNavigation { get; set; } = null!;

    public virtual TblAccount FkIdUserNavigation { get; set; } = null!;
}
