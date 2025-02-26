using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NMCNPM_Nhom3.Migrations
{
    /// <inheritdoc />
    public partial class AddTblBillDetail : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_BillDetail_Bike",
                table: "tblBillDetail");

            migrationBuilder.DropForeignKey(
                name: "fk_BillDetail_Bill",
                table: "tblBillDetail");

            migrationBuilder.DropPrimaryKey(
                name: "PK__tblBillD__D21248C9B5F86271",
                table: "tblBillDetail");

            migrationBuilder.RenameTable(
                name: "tblBillDetail",
                newName: "TblBillDetail");

            migrationBuilder.RenameIndex(
                name: "IX_tblBillDetail_FkIdBike",
                table: "TblBillDetail",
                newName: "IX_TblBillDetail_FkIdBike");

            migrationBuilder.RenameColumn(
                name: "sPermissions",
                table: "tblAccount",
                newName: "FkIdPermission");

            migrationBuilder.RenameIndex(
                name: "IX_tblAccount_sPermissions",
                table: "tblAccount",
                newName: "IX_tblAccount_FkIdPermission");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TblBillDetail",
                table: "TblBillDetail",
                columns: new[] { "FkIdBill", "FkIdBike" });

            migrationBuilder.CreateTable(
                name: "tblBillDetail",
                columns: table => new
                {
                    FkIdBill = table.Column<int>(type: "int", nullable: false),
                    FkIdBike = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBillD__D21248C9B5F86271", x => new { x.FkIdBill, x.FkIdBike });
                    table.ForeignKey(
                        name: "fk_BillDetail_Bike",
                        column: x => x.FkIdBike,
                        principalTable: "tblBike",
                        principalColumn: "PkIdBike");
                    table.ForeignKey(
                        name: "fk_BillDetail_Bill",
                        column: x => x.FkIdBill,
                        principalTable: "tblBill",
                        principalColumn: "PkBillCode");
                });

            migrationBuilder.CreateIndex(
                name: "IX_tblBillDetail_FkIdBike",
                table: "tblBillDetail",
                column: "FkIdBike");

            migrationBuilder.AddForeignKey(
                name: "FK_TblBillDetail_tblBike_FkIdBike",
                table: "TblBillDetail",
                column: "FkIdBike",
                principalTable: "tblBike",
                principalColumn: "PkIdBike");

            migrationBuilder.AddForeignKey(
                name: "FK_TblBillDetail_tblBill_FkIdBill",
                table: "TblBillDetail",
                column: "FkIdBill",
                principalTable: "tblBill",
                principalColumn: "PkBillCode");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TblBillDetail_tblBike_FkIdBike",
                table: "TblBillDetail");

            migrationBuilder.DropForeignKey(
                name: "FK_TblBillDetail_tblBill_FkIdBill",
                table: "TblBillDetail");

            migrationBuilder.DropTable(
                name: "tblBillDetail");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TblBillDetail",
                table: "TblBillDetail");

            migrationBuilder.RenameTable(
                name: "TblBillDetail",
                newName: "tblBillDetail");

            migrationBuilder.RenameIndex(
                name: "IX_TblBillDetail_FkIdBike",
                table: "tblBillDetail",
                newName: "IX_tblBillDetail_FkIdBike");

            migrationBuilder.RenameColumn(
                name: "FkIdPermission",
                table: "tblAccount",
                newName: "sPermissions");

            migrationBuilder.RenameIndex(
                name: "IX_tblAccount_FkIdPermission",
                table: "tblAccount",
                newName: "IX_tblAccount_sPermissions");

            migrationBuilder.AddPrimaryKey(
                name: "PK__tblBillD__D21248C9B5F86271",
                table: "tblBillDetail",
                columns: new[] { "FkIdBill", "FkIdBike" });
        }
    }
}
