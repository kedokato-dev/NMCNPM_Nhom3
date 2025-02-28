namespace NMCNPM_Nhom3.Models.Entities;

public partial class TblBillDetail
{
    public int FkIdBill { get; set; }
    public int FkIdBike { get; set; }

    public virtual TblBill FkIdBillNavigation { get; set; }
    public virtual TblBike FkIdBikeNavigation { get; set; }
}