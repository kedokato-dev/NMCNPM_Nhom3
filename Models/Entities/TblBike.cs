using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBike
{
    public int PkIdBike { get; set; }

    public string SName { get; set; } = null!;

    public int FkIdBikeDetail { get; set; }

    public string SCondition { get; set; } = null!;

    public string SStatus { get; set; } = null!;

    public double FRentalPrice { get; set; }

    public double FDeposit { get; set; }

    public string? SImage { get; set; }

    public virtual TblBikeDetail FkIdBikeDetailNavigation { get; set; } = null!;

    public virtual ICollection<TblBillDetail> TblBillDetails { get; set; } = new List<TblBillDetail>();
}
