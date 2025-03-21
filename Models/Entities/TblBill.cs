﻿using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBill
{
    public int PkBillCode { get; set; }

    public double? FIncidentalCosts { get; set; }

    public DateTime DBeginTime { get; set; }

    public DateTime DEndTime { get; set; }

    public int? IStatus { get; set; }

    public virtual ICollection<TblBillDetail> TblBillDetails { get; set; } = new List<TblBillDetail>();

    public virtual ICollection<TblCreateBill> TblCreateBills { get; set; } = new List<TblCreateBill>();
}
