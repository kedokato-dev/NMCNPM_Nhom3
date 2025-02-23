using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NMCNPM_Nhom3.Migrations
{
    /// <inheritdoc />
    public partial class FixTblBikeBrand : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "tblBikeBrand",
                columns: table => new
                {
                    PkIdBikeBrand = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sName = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBikeB__02E62FE1582632C6", x => x.PkIdBikeBrand);
                });

            migrationBuilder.CreateTable(
                name: "tblBikeType",
                columns: table => new
                {
                    PkIdBikeType = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sType = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBikeT__A92939E0508A3CCC", x => x.PkIdBikeType);
                });

            migrationBuilder.CreateTable(
                name: "tblBill",
                columns: table => new
                {
                    PkBillCode = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    fIncidentalCosts = table.Column<double>(type: "float", nullable: true),
                    dBeginTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    dEndTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    iStatus = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBill__3E89B1B99B453D66", x => x.PkBillCode);
                });

            migrationBuilder.CreateTable(
                name: "tblPermission",
                columns: table => new
                {
                    PkIdPermission = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sPermissionn = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblPermi__DADB96523ACC3141", x => x.PkIdPermission);
                });

            migrationBuilder.CreateTable(
                name: "tblBikeDetail",
                columns: table => new
                {
                    PkIdBikeDetail = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sFrameSize = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    sMaterial = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    fWeight = table.Column<decimal>(type: "decimal(5,2)", nullable: false),
                    FkIdBikeBrand = table.Column<int>(type: "int", nullable: false),
                    FkIdBikeType = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBikeD__9596CA93FF0BB9D9", x => x.PkIdBikeDetail);
                    table.ForeignKey(
                        name: "fk_BikeDetail_BikeBrand",
                        column: x => x.FkIdBikeBrand,
                        principalTable: "tblBikeBrand",
                        principalColumn: "PkIdBikeBrand");
                    table.ForeignKey(
                        name: "fk_BikeDetail_BikeType",
                        column: x => x.FkIdBikeType,
                        principalTable: "tblBikeType",
                        principalColumn: "PkIdBikeType");
                });

            migrationBuilder.CreateTable(
                name: "tblAccount",
                columns: table => new
                {
                    PkIdUser = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sAccountName = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    sPhoneNumber = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: false),
                    dDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    sPermissions = table.Column<int>(type: "int", nullable: false),
                    sUserIdentification = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    sPassword = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblAccou__35430B20B843047F", x => x.PkIdUser);
                    table.ForeignKey(
                        name: "FK_tblAccount_tblPermission",
                        column: x => x.sPermissions,
                        principalTable: "tblPermission",
                        principalColumn: "PkIdPermission");
                });

            migrationBuilder.CreateTable(
                name: "tblBike",
                columns: table => new
                {
                    PkIdBike = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sName = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    FkIdBikeDetail = table.Column<int>(type: "int", nullable: false),
                    sCondition = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    sStatus = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    fRentalPrice = table.Column<double>(type: "float", nullable: false),
                    fDeposit = table.Column<double>(type: "float", nullable: false),
                    sImage = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tblBike__BEC4EBB72EA820EF", x => x.PkIdBike);
                    table.ForeignKey(
                        name: "fk_Bike_BikeDetail",
                        column: x => x.FkIdBikeDetail,
                        principalTable: "tblBikeDetail",
                        principalColumn: "PkIdBikeDetail");
                });

            migrationBuilder.CreateTable(
                name: "tblCreateBill",
                columns: table => new
                {
                    FkIdUser = table.Column<int>(type: "int", nullable: false),
                    FkBillCode = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.ForeignKey(
                        name: "fk_CreateBill_Bill",
                        column: x => x.FkBillCode,
                        principalTable: "tblBill",
                        principalColumn: "PkBillCode");
                    table.ForeignKey(
                        name: "fk_CreateBill_User",
                        column: x => x.FkIdUser,
                        principalTable: "tblAccount",
                        principalColumn: "PkIdUser");
                });

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
                name: "IX_tblAccount_sPermissions",
                table: "tblAccount",
                column: "sPermissions");

            migrationBuilder.CreateIndex(
                name: "IX_tblBike_FkIdBikeDetail",
                table: "tblBike",
                column: "FkIdBikeDetail");

            migrationBuilder.CreateIndex(
                name: "UQ__tblBikeB__79DF5959CE8BA688",
                table: "tblBikeBrand",
                column: "sName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_tblBikeDetail_FkIdBikeBrand",
                table: "tblBikeDetail",
                column: "FkIdBikeBrand");

            migrationBuilder.CreateIndex(
                name: "IX_tblBikeDetail_FkIdBikeType",
                table: "tblBikeDetail",
                column: "FkIdBikeType");

            migrationBuilder.CreateIndex(
                name: "UQ__tblBikeT__47012A9151EFF243",
                table: "tblBikeType",
                column: "sType",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_tblBillDetail_FkIdBike",
                table: "tblBillDetail",
                column: "FkIdBike");

            migrationBuilder.CreateIndex(
                name: "IX_tblCreateBill_FkBillCode",
                table: "tblCreateBill",
                column: "FkBillCode");

            migrationBuilder.CreateIndex(
                name: "IX_tblCreateBill_FkIdUser",
                table: "tblCreateBill",
                column: "FkIdUser");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "tblBillDetail");

            migrationBuilder.DropTable(
                name: "tblCreateBill");

            migrationBuilder.DropTable(
                name: "tblBike");

            migrationBuilder.DropTable(
                name: "tblBill");

            migrationBuilder.DropTable(
                name: "tblAccount");

            migrationBuilder.DropTable(
                name: "tblBikeDetail");

            migrationBuilder.DropTable(
                name: "tblPermission");

            migrationBuilder.DropTable(
                name: "tblBikeBrand");

            migrationBuilder.DropTable(
                name: "tblBikeType");
        }
    }
}
