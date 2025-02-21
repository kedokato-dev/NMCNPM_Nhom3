using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBikeType
{
    public int PkIdBikeType { get; set; }

    public string SType { get; set; } = null!;

    public virtual ICollection<TblBikeDetail> TblBikeDetails { get; set; } = new List<TblBikeDetail>();
}
