using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBike
{
    public int PkIdBike { get; set; }

    public string SName { get; set; } = null!;

    public int FkIdBikeDetail { get; set; }

    public string SCondition { get; set; } = null!;

    public string SStatus { get; set; } = null!;

    [Range(0.01, double.MaxValue, ErrorMessage = "Rental price must be greater than 0.")]
    public double FRentalPrice { get; set; }
    [Range(0.01, double.MaxValue, ErrorMessage = "Deposit must be greater than 0.")]
    public double FDeposit { get; set; }

    public string? SImage { get; set; }

    public virtual TblBikeDetail? FkIdBikeDetailNavigation { get; set; }

    public virtual ICollection<TblBillDetail> TblBillDetails { get; set; } = new List<TblBillDetail>();
}
