using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBikeDetail
{
    public int PkIdBikeDetail { get; set; }

    public string SFrameSize { get; set; } = null!;

    public string SMaterial { get; set; } = null!;
    [Range(0.01, double.MaxValue, ErrorMessage = "Weight must be greater than 0.")]
    public decimal FWeight { get; set; }

    public int FkIdBikeBrand { get; set; }

    public int FkIdBikeType { get; set; }

    public virtual TblBikeBrand? FkIdBikeBrandNavigation { get; set; } 

    public virtual TblBikeType? FkIdBikeTypeNavigation { get; set; }

    public virtual ICollection<TblBike> TblBikes { get; set; } = new List<TblBike>();
}
