using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBikeBrand
{
    public int PkIdBikeBrand { get; set; }

    public string SName { get; set; } = null!;

    public virtual ICollection<TblBikeDetail> TblBikeDetails { get; set; } = new List<TblBikeDetail>();
}
