using System;
using System.Collections.Generic;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBikeDetail
{
    public int PkIdBikeDetail { get; set; }

    public string SFrameSize { get; set; } = null!;

    public string SMaterial { get; set; } = null!;

    public decimal FWeight { get; set; }

    public int IQuantity { get; set; }

    public int FkIdBikeBrand { get; set; }

    public int FkIdBikeType { get; set; }

    public virtual TblBikeBrand FkIdBikeBrandNavigation { get; set; } = null!;

    public virtual TblBikeType FkIdBikeTypeNavigation { get; set; } = null!;

    public virtual ICollection<TblBike> TblBikes { get; set; } = new List<TblBike>();
}
