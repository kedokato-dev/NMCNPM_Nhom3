USE [NMCNPM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/4/2025 12:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[PkIdUser] [int] IDENTITY(0,1) NOT NULL,
	[sAccountName] [nvarchar](50) NOT NULL,
	[sPhoneNumber] [nvarchar](11) NOT NULL,
	[dDate] [date] NOT NULL,
	[FkIdPermission] [int] NOT NULL,
	[sUserIdentification] [nvarchar](20) NOT NULL,
	[sPassword] [varchar](100) NOT NULL,
 CONSTRAINT [PK__tblAccou__35430B20B843047F] PRIMARY KEY CLUSTERED 
(
	[PkIdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBike]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBike](
	[PkIdBike] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](20) NOT NULL,
	[FkIdBikeDetail] [int] NOT NULL,
	[sCondition] [nvarchar](10) NOT NULL,
	[sStatus] [nvarchar](50) NOT NULL,
	[fRentalPrice] [float] NOT NULL,
	[fDeposit] [float] NOT NULL,
	[sImage] [varchar](50) NULL,
 CONSTRAINT [PK__tblBike__BEC4EBB72EA820EF] PRIMARY KEY CLUSTERED 
(
	[PkIdBike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBikeBrand]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBikeBrand](
	[PkIdBikeBrand] [int] IDENTITY(0,1) NOT NULL,
	[sName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkIdBikeBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBikeDetail]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBikeDetail](
	[PkIdBikeDetail] [int] IDENTITY(0,1) NOT NULL,
	[sFrameSize] [nvarchar](50) NOT NULL,
	[sMaterial] [nvarchar](100) NOT NULL,
	[fWeight] [decimal](5, 2) NOT NULL,
	[FkIdBikeBrand] [int] NOT NULL,
	[FkIdBikeType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkIdBikeDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBikeType]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBikeType](
	[PkIdBikeType] [int] IDENTITY(0,1) NOT NULL,
	[sType] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkIdBikeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[PkBillCode] [int] IDENTITY(0,1) NOT NULL,
	[fIncidentalCosts] [float] NULL,
	[dBeginTime] [datetime] NOT NULL,
	[dEndTime] [datetime] NOT NULL,
	[iStatus] [int] NULL,
 CONSTRAINT [PK__tblBill__3E89B1B99B453D66] PRIMARY KEY CLUSTERED 
(
	[PkBillCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetail](
	[FkIdBill] [int] NOT NULL,
	[FkIdBike] [int] NOT NULL,
 CONSTRAINT [PK__tblBillD__D21248C9B5F86271] PRIMARY KEY CLUSTERED 
(
	[FkIdBill] ASC,
	[FkIdBike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCreateBill]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCreateBill](
	[FkIdUser] [int] NOT NULL,
	[FkBillCode] [int] NOT NULL,
 CONSTRAINT [PK_HEHE] PRIMARY KEY CLUSTERED 
(
	[FkIdUser] ASC,
	[FkBillCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 3/4/2025 12:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermission](
	[PkIdPermission] [int] IDENTITY(0,1) NOT NULL,
	[sPermissionn] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PkIdPermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (1, N'Đại tướng Quân', N'0333241634', CAST(N'2004-02-22' AS Date), 1, N'0252040323', N'$2a$11$iAFAN82jAtFw6jEIS9cAWugjHjHIBOatuXLEbX0YYQnQzUT5Lw2de')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (9, N'Hà Nhận', N'0323254785', CAST(N'2025-02-10' AS Date), 2, N'33333333333', N'Admin@12')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (11, N'Tú Sena', N'0333241634', CAST(N'2025-02-18' AS Date), 2, N'025204013481', N'$2a$11$z6zV52VwZM4dA4QPHS4BVubUj9vddhg3YBSLO7WypYjcD9I0PY7RO')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (13, N'Chú bé đần', N'0333241634', CAST(N'2025-02-14' AS Date), 3, N'025204013481', N'$2a$11$iAFAN82jAtFw6jEIS9cAWugjHjHIBOatuXLEbX0YYQnQzUT5Lw2de')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (23, N'PhucGiDO', N'1234567890', CAST(N'0001-01-01' AS Date), 2, N'025204013480', N'User@123')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (24, N'Phúc nè', N'0123456789', CAST(N'0001-01-01' AS Date), 2, N'025204013479', N'User@123')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (25, N'Phúc đây', N'0123456789', CAST(N'0001-01-01' AS Date), 2, N'025204013478', N'User@123')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (27, N'Hello', N'0234567899', CAST(N'2025-03-03' AS Date), 3, N'025204013401', N'$2a$11$IaWPIsxWUZ4o7cnBPrv4C.cNha4053lhf3J/RX94u47kQQyAAt8RC')
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBike] ON 

INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (201, N'Xe 1', 36, N'Chưa thuê', N'Đã thuê', 88312, 513732, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (202, N'Xe Vip', 2, N'Chưa thuê', N'Cũ', 94782, 412014, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (203, N'Phúc nè', 2, N'Chưa thuê', N'Mới', 83641, 586910, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (204, N'Phúc đây', 3, N'Chưa thuê', N'Cũ', 87858, 488891, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (205, N'Xe 5', 1, N'Chưa thuê', N'Cũ', 99448, 565452, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (206, N'Xe 6', 3, N'Chưa thuê', N'Trung bình', 128778, 424345, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (207, N'Xe 7', 2, N'Chưa thuê', N'Mới', 109325, 598956, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (208, N'Xe 8', 36, N'Chưa thuê', N'Mới nè', 112270, 433057, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (209, N'Xe 9', 36, N'Chưa thuê', N'Trung bình', 107199, 409278, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (210, N'Xe 10', 1, N'Chưa thuê', N'Mới', 113401, 456553, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (211, N'Xe 11', 2, N'Chưa thuê', N'Trung bình', 109308, 448297, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (212, N'Xe 12', 2, N'Chưa thuê', N'Mới', 91399, 469645, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (213, N'Xe 13', 1, N'Chưa thuê', N'Cũ', 96249, 581068, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (214, N'Xe 14', 2, N'Chưa thuê', N'Trung bình', 129498, 490986, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (215, N'Xe 15', 3, N'Chưa thuê', N'Mới', 80431, 414725, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (216, N'Xe 16', 4, N'Chưa thuê', N'Mới', 105874, 462388, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (217, N'Xe 17', 4, N'Chưa thuê', N'Mới', 97988, 439344, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (218, N'Xe 18', 4, N'Chưa thuê', N'Cũ', 115330, 505998, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (219, N'Xe 19', 1, N'Chưa thuê', N'Cũ', 109246, 492436, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (220, N'Xe 20', 4, N'Chưa thuê', N'Mới', 123003, 519820, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (221, N'Xe 21', 3, N'Chưa thuê', N'Cũ', 85879, 438570, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (222, N'Xe 22', 2, N'Chưa thuê', N'Trung bình', 113446, 481240, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (223, N'Xe 23', 2, N'Chưa thuê', N'Mới', 122837, 439050, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (224, N'Xe 24', 4, N'Chưa thuê', N'Mới', 105017, 539412, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (225, N'Xe 25', 36, N'Chưa thuê', N'Mới', 108548, 549483, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (226, N'Xe 26', 4, N'Chưa thuê', N'Trung bình', 129827, 594938, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (227, N'Xe 27', 4, N'Chưa thuê', N'Trung bình', 110515, 440357, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (228, N'Xe 28', 2, N'Chưa thuê', N'Trung bình', 125472, 435458, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (229, N'Xe 29', 4, N'Chưa thuê', N'Mới', 102540, 518662, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (230, N'Xe 30', 4, N'Chưa thuê', N'Mới', 91877, 467848, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (231, N'Xe 31', 4, N'Chưa thuê', N'Mới', 110126, 434650, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (232, N'Xe 32', 1, N'Chưa thuê', N'Cũ', 116980, 567842, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (233, N'Xe 33', 36, N'Chưa thuê', N'Cũ', 90470, 430969, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (234, N'Xe 34', 36, N'Chưa thuê', N'Mới', 80694, 487526, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (235, N'Xe 35', 4, N'Chưa thuê', N'Cũ', 125973, 533861, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (236, N'Xe 36', 2, N'Chưa thuê', N'Trung bình', 97028, 408559, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (237, N'Xe 37', 4, N'Chưa thuê', N'Cũ', 101014, 408602, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (238, N'Xe 38', 3, N'Chưa thuê', N'Mới', 94446, 478726, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (239, N'Xe 39', 3, N'Chưa thuê', N'Trung bình', 102595, 439809, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (240, N'Xe 40', 3, N'Chưa thuê', N'Mới', 101547, 506728, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (241, N'Xe 41', 3, N'Chưa thuê', N'Trung bình', 102750, 452769, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (242, N'Xe 42', 3, N'Chưa thuê', N'Mới', 116247, 516768, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (243, N'Xe 43', 36, N'Chưa thuê', N'Trung bình', 101138, 412599, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (244, N'Xe 44', 3, N'Chưa thuê', N'Mới', 119089, 576386, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (245, N'Xe 45', 4, N'Chưa thuê', N'Cũ', 86418, 421385, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (246, N'Xe 46', 36, N'Chưa thuê', N'Trung bình', 87821, 541141, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (247, N'Xe 47', 2, N'Chưa thuê', N'Mới', 126547, 423451, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (248, N'Xe 48', 36, N'Chưa thuê', N'Trung bình', 97656, 578075, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (249, N'Xe 49', 2, N'Chưa thuê', N'Trung bình', 123633, 528415, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (250, N'Xe 50', 3, N'Chưa thuê', N'Mới', 126449, 517458, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (251, N'Xe 51', 4, N'Chưa thuê', N'Mới', 128502, 455100, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (252, N'Xe 52', 2, N'Chưa thuê', N'Trung bình', 103437, 477305, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (253, N'Xe 53', 3, N'Chưa thuê', N'Mới', 128099, 516991, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (254, N'Xe 54', 2, N'Chưa thuê', N'Mới', 99435, 546374, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (255, N'Xe 55', 3, N'Chưa thuê', N'Cũ', 92802, 554475, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (256, N'Xe 56', 3, N'Chưa thuê', N'Cũ', 118654, 589575, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (257, N'Xe 57', 3, N'Chưa thuê', N'Mới', 108515, 409377, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (258, N'Xe 58', 4, N'Chưa thuê', N'Mới', 109375, 462768, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (259, N'Xe 59', 36, N'Chưa thuê', N'Mới', 110657, 468205, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (260, N'Xe 60', 4, N'Chưa thuê', N'Mới', 91716, 494878, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (261, N'Xe 61', 1, N'Chưa thuê', N'Mới', 104855, 441348, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (262, N'Xe 62', 36, N'Chưa thuê', N'Mới', 121531, 569995, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (263, N'Xe 63', 1, N'Chưa thuê', N'Trung bình', 114202, 444076, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (264, N'Xe 64', 4, N'Chưa thuê', N'Trung bình', 89748, 514045, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (265, N'Xe 65', 4, N'Chưa thuê', N'Mới', 96679, 561116, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (266, N'Xe 66', 3, N'Chưa thuê', N'Trung bình', 89823, 599750, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (267, N'Xe 67', 4, N'Chưa thuê', N'Mới', 105094, 438338, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (268, N'Xe 68', 36, N'Chưa thuê', N'Cũ', 82436, 426893, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (269, N'Xe 69', 1, N'Chưa thuê', N'Mới', 95528, 444510, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (270, N'Xe 70', 2, N'Chưa thuê', N'Mới', 125475, 584126, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (271, N'Xe 71', 3, N'Chưa thuê', N'Trung bình', 104631, 448784, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (272, N'Xe 72', 36, N'Chưa thuê', N'Mới', 127843, 519582, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (273, N'Xe 73', 3, N'Chưa thuê', N'Trung bình', 128252, 451623, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (274, N'Xe 74', 1, N'Chưa thuê', N'Mới', 90543, 416377, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (275, N'Xe 75', 4, N'Chưa thuê', N'Mới', 125691, 442526, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (276, N'Xe 76', 2, N'Chưa thuê', N'Trung bình', 121168, 411504, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (277, N'Xe 77', 2, N'Chưa thuê', N'Cũ', 108411, 544045, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (278, N'Xe 78', 2, N'Chưa thuê', N'Mới', 106888, 537031, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (279, N'Xe 79', 1, N'Chưa thuê', N'Mới', 117383, 426059, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (280, N'Xe 80', 36, N'Chưa thuê', N'Mới', 81870, 535943, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (281, N'Xe 81', 36, N'Chưa thuê', N'Cũ', 81550, 521475, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (282, N'Xe 82', 3, N'Chưa thuê', N'Mới', 128725, 431213, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (283, N'Xe 83', 2, N'Chưa thuê', N'Mới', 86573, 409347, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (284, N'Xe 84', 1, N'Chưa thuê', N'Trung bình', 99456, 437198, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (285, N'Xe 85', 1, N'Chưa thuê', N'Cũ', 129996, 433096, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (286, N'Xe 86', 1, N'Chưa thuê', N'Mới', 128993, 543153, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (287, N'Xe 87', 1, N'Chưa thuê', N'Trung bình', 109561, 559569, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (288, N'Xe 88', 3, N'Chưa thuê', N'Cũ', 95818, 591476, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (289, N'Xe 89', 36, N'Chưa thuê', N'Mới', 113095, 532112, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (290, N'Xe 90', 36, N'Chưa thuê', N'Cũ', 105473, 484199, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (291, N'Xe 91', 36, N'Chưa thuê', N'Cũ', 90255, 441949, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (292, N'Xe 92', 36, N'Chưa thuê', N'Mới', 97227, 428636, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (293, N'Xe 93', 3, N'Chưa thuê', N'Cũ', 90138, 455044, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (294, N'Xe 94', 2, N'Chưa thuê', N'Mới', 117272, 443770, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (295, N'Xe 95', 1, N'Chưa thuê', N'Trung bình', 95535, 579053, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (296, N'Xe 96', 2, N'Chưa thuê', N'Trung bình', 103471, 467233, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (297, N'Xe 97', 2, N'Chưa thuê', N'Mới', 115454, 475209, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (298, N'Xe 98', 36, N'Chưa thuê', N'Trung bình', 115087, 464825, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (299, N'Xe 99', 1, N'Chưa thuê', N'Mới', 83022, 575401, N'myBike11.jpg')
GO
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (300, N'Xe 100', 4, N'Chưa thuê', N'Mới', 111081, 434973, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (301, N'Xe của Phúc', 8, N'Chưa thuê', N'Mới', 10000, 500000, N'hihi.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (302, N'Xe của Phúc', 36, N'Chưa thuê', N'Đã xóa', 5421, 432141, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (303, N'Xe của Phúc', 3, N'Chưa thuê', N'Mới', 123, 123, N'133826953185869056.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (304, N'Xe của Phúc', 3, N'Chưa thuê', N'Mới', 123, 123, N'133826953185869056(1).jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (305, N'Xe của Phúc', 1, N'Chưa thuê', N'Mới', 123, 123, N'133826953185869056(2).jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (306, N'Xe của Phúc', 1, N'Chưa thuê', N'Mới', 123, 123, N'133826953185869056(3).jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (327, N'Xe của Phúc Hehe', 2, N'Chưa thuê', N'Đã xóa', 1234, 4321, N'haha(3).jpg')
SET IDENTITY_INSERT [dbo].[tblBike] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeBrand] ON 

INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (6, N'Ducati')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (0, N'Giant')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (3, N'Honda')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (5, N'Kawasaki')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (4, N'Suzuki')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (1, N'Trek')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (2, N'Yamaha')
SET IDENTITY_INSERT [dbo].[tblBikeBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeDetail] ON 

INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (1, N'Phúc', N'Carbon', CAST(10.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (2, N'S', N'Nhôm', CAST(11.20 AS Decimal(5, 2)), 0, 5)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (3, N'M', N'Carbon', CAST(9.80 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (4, N'L', N'Titanium', CAST(12.00 AS Decimal(5, 2)), 2, 2)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (5, N'XL', N'Nhôm', CAST(13.50 AS Decimal(5, 2)), 3, 3)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (6, N'S', N'Carbon', CAST(10.20 AS Decimal(5, 2)), 4, 4)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (7, N'M', N'Nhôm', CAST(11.50 AS Decimal(5, 2)), 0, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (8, N'L', N'Titanium', CAST(12.30 AS Decimal(5, 2)), 1, 2)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (9, N'XL', N'Carbon', CAST(9.70 AS Decimal(5, 2)), 2, 3)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (10, N'S', N'Nhôm', CAST(12.10 AS Decimal(5, 2)), 3, 4)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (11, N'M', N'Carbon', CAST(10.80 AS Decimal(5, 2)), 4, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (12, N'L', N'Titanium', CAST(11.90 AS Decimal(5, 2)), 0, 2)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (13, N'XL', N'Nhôm', CAST(12.60 AS Decimal(5, 2)), 1, 3)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (14, N'S', N'Carbon', CAST(9.90 AS Decimal(5, 2)), 2, 4)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (15, N'M', N'Titanium', CAST(12.10 AS Decimal(5, 2)), 3, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (16, N'L', N'Nhôm', CAST(11.80 AS Decimal(5, 2)), 4, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (17, N'XL', N'Carbon', CAST(10.50 AS Decimal(5, 2)), 0, 3)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (18, N'S', N'Titanium', CAST(11.40 AS Decimal(5, 2)), 1, 4)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (19, N'M', N'Nhôm', CAST(12.30 AS Decimal(5, 2)), 2, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (20, N'L', N'Carbon', CAST(10.60 AS Decimal(5, 2)), 3, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (21, N'XL', N'Titanium', CAST(12.70 AS Decimal(5, 2)), 4, 2)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (23, N'M', N'Gỗ', CAST(12.00 AS Decimal(5, 2)), 0, 2)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (24, N'M', N'Gỗ', CAST(12.00 AS Decimal(5, 2)), 3, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (25, N'P', N'Phúc', CAST(69.00 AS Decimal(5, 2)), 0, 6)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (26, N'M', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 5, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (27, N'M', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (28, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (29, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (30, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (31, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (32, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (33, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (34, N'P', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (35, N'PP', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 3, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (36, N'PM', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (37, N'PH', N'Gỗ', CAST(321.00 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (38, N'P', N'Carbon', CAST(123.00 AS Decimal(5, 2)), 6, 5)
SET IDENTITY_INSERT [dbo].[tblBikeDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeType] ON 

INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (4, N'Cruiser')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (2, N'Scooter')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (3, N'Sport')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (6, N'Standard')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (5, N'Touring')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (0, N'Xe đạp địa hình')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (1, N'Xe đạp đường phố')
SET IDENTITY_INSERT [dbo].[tblBikeType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (61, NULL, CAST(N'2025-03-04T10:44:28.723' AS DateTime), CAST(N'2025-03-04T13:44:28.723' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (62, NULL, CAST(N'2025-03-04T10:48:21.387' AS DateTime), CAST(N'2025-03-04T13:48:21.387' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (63, NULL, CAST(N'2025-03-04T11:47:12.673' AS DateTime), CAST(N'2025-03-04T11:47:19.497' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (64, NULL, CAST(N'2025-03-04T11:48:26.807' AS DateTime), CAST(N'2025-03-04T11:48:36.503' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (65, NULL, CAST(N'2025-03-04T11:49:40.897' AS DateTime), CAST(N'2025-03-04T11:49:44.633' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (66, NULL, CAST(N'2025-03-04T11:50:30.890' AS DateTime), CAST(N'2025-03-04T11:50:34.423' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (67, NULL, CAST(N'2025-03-04T11:51:07.450' AS DateTime), CAST(N'2025-03-04T11:51:24.803' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (68, NULL, CAST(N'2025-03-04T11:52:09.320' AS DateTime), CAST(N'2025-03-04T11:52:16.507' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (69, NULL, CAST(N'2025-03-04T12:05:20.227' AS DateTime), CAST(N'2025-03-04T12:05:24.617' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (70, NULL, CAST(N'2025-03-04T12:06:57.913' AS DateTime), CAST(N'2025-03-04T12:07:04.523' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (71, NULL, CAST(N'2025-03-04T12:09:49.027' AS DateTime), CAST(N'2025-03-04T12:09:52.833' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (72, NULL, CAST(N'2025-03-04T12:11:19.113' AS DateTime), CAST(N'2025-03-04T12:11:35.660' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (73, NULL, CAST(N'2025-03-04T12:12:59.513' AS DateTime), CAST(N'2025-03-04T12:13:09.083' AS DateTime), 0)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (74, NULL, CAST(N'2025-03-04T12:14:17.050' AS DateTime), CAST(N'2025-03-04T12:14:26.270' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (61, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (61, 203)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (62, 204)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (62, 205)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (63, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (63, 203)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (64, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (64, 203)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (65, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (66, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (67, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (68, 202)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (69, 222)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (70, 222)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (71, 222)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (72, 222)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (73, 222)
INSERT [dbo].[tblBillDetail] ([FkIdBill], [FkIdBike]) VALUES (74, 222)
GO
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 61)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 62)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 63)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 64)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 65)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 66)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 67)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 68)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 69)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 70)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 71)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 72)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 73)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 74)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 61)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 63)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 64)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 65)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 66)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 67)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 68)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 69)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 70)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 71)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 72)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 73)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 74)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (25, 62)
GO
SET IDENTITY_INSERT [dbo].[tblPermission] ON 

INSERT [dbo].[tblPermission] ([PkIdPermission], [sPermissionn]) VALUES (0, N'Admin')
INSERT [dbo].[tblPermission] ([PkIdPermission], [sPermissionn]) VALUES (1, N'Staff')
INSERT [dbo].[tblPermission] ([PkIdPermission], [sPermissionn]) VALUES (2, N'User')
INSERT [dbo].[tblPermission] ([PkIdPermission], [sPermissionn]) VALUES (3, N'Block')
SET IDENTITY_INSERT [dbo].[tblPermission] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblBikeB__79DF595972E72658]    Script Date: 3/4/2025 12:16:19 PM ******/
ALTER TABLE [dbo].[tblBikeBrand] ADD UNIQUE NONCLUSTERED 
(
	[sName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblBikeT__47012A9148DEE03F]    Script Date: 3/4/2025 12:16:19 PM ******/
ALTER TABLE [dbo].[tblBikeType] ADD UNIQUE NONCLUSTERED 
(
	[sType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblPermission] FOREIGN KEY([FkIdPermission])
REFERENCES [dbo].[tblPermission] ([PkIdPermission])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblPermission]
GO
ALTER TABLE [dbo].[tblBike]  WITH CHECK ADD  CONSTRAINT [fk_Bike_BikeDetail] FOREIGN KEY([FkIdBikeDetail])
REFERENCES [dbo].[tblBikeDetail] ([PkIdBikeDetail])
GO
ALTER TABLE [dbo].[tblBike] CHECK CONSTRAINT [fk_Bike_BikeDetail]
GO
ALTER TABLE [dbo].[tblBikeDetail]  WITH CHECK ADD  CONSTRAINT [fk_BikeDetail_BikeBrand] FOREIGN KEY([FkIdBikeBrand])
REFERENCES [dbo].[tblBikeBrand] ([PkIdBikeBrand])
GO
ALTER TABLE [dbo].[tblBikeDetail] CHECK CONSTRAINT [fk_BikeDetail_BikeBrand]
GO
ALTER TABLE [dbo].[tblBikeDetail]  WITH CHECK ADD  CONSTRAINT [fk_BikeDetail_BikeType] FOREIGN KEY([FkIdBikeType])
REFERENCES [dbo].[tblBikeType] ([PkIdBikeType])
GO
ALTER TABLE [dbo].[tblBikeDetail] CHECK CONSTRAINT [fk_BikeDetail_BikeType]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [fk_BillDetail_Bike] FOREIGN KEY([FkIdBike])
REFERENCES [dbo].[tblBike] ([PkIdBike])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [fk_BillDetail_Bike]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [fk_BillDetail_Bill] FOREIGN KEY([FkIdBill])
REFERENCES [dbo].[tblBill] ([PkBillCode])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [fk_BillDetail_Bill]
GO
ALTER TABLE [dbo].[tblCreateBill]  WITH CHECK ADD  CONSTRAINT [fk_CreateBill_Bill] FOREIGN KEY([FkBillCode])
REFERENCES [dbo].[tblBill] ([PkBillCode])
GO
ALTER TABLE [dbo].[tblCreateBill] CHECK CONSTRAINT [fk_CreateBill_Bill]
GO
ALTER TABLE [dbo].[tblCreateBill]  WITH CHECK ADD  CONSTRAINT [fk_CreateBill_User] FOREIGN KEY([FkIdUser])
REFERENCES [dbo].[tblAccount] ([PkIdUser])
GO
ALTER TABLE [dbo].[tblCreateBill] CHECK CONSTRAINT [fk_CreateBill_User]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [CK__tblAccoun__dDate__4BAC3F29] CHECK  (([dDate]<getdate()))
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [CK__tblAccoun__dDate__4BAC3F29]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [CK__tblAccoun__sPass__4D94879B] CHECK  ((len([sPassword])>=(8) AND [sPassword] like '%[A-Z]%' AND [sPassword] like '%[0-9]%' AND [sPassword] like '%[^a-zA-Z0-9]%'))
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [CK__tblAccoun__sPass__4D94879B]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [CK__tblAccoun__sPhon__4AB81AF0] CHECK  ((len([sPhoneNumber])=(10) AND NOT [sPhoneNumber] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [CK__tblAccoun__sPhon__4AB81AF0]
GO
ALTER TABLE [dbo].[tblBike]  WITH CHECK ADD  CONSTRAINT [CK__tblBike__fDeposi__6383C8BA] CHECK  (([fDeposit]>(0)))
GO
ALTER TABLE [dbo].[tblBike] CHECK CONSTRAINT [CK__tblBike__fDeposi__6383C8BA]
GO
ALTER TABLE [dbo].[tblBike]  WITH CHECK ADD  CONSTRAINT [CK__tblBike__fRental__628FA481] CHECK  (([fRentalPrice]>(0)))
GO
ALTER TABLE [dbo].[tblBike] CHECK CONSTRAINT [CK__tblBike__fRental__628FA481]
GO
ALTER TABLE [dbo].[tblBike]  WITH CHECK ADD  CONSTRAINT [CK__tblBike__sCondit__619B8048] CHECK  (([sCondition]=N'Chưa thuê' OR [sCondition]=N'Đã thuê'))
GO
ALTER TABLE [dbo].[tblBike] CHECK CONSTRAINT [CK__tblBike__sCondit__619B8048]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [chk_BeginTime_EndTime] CHECK  (([dBeginTime]<[dEndTime]))
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [chk_BeginTime_EndTime]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [CK__tblBill__fIncide__5070F446] CHECK  (([fIncidentalCosts]>=(0)))
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [CK__tblBill__fIncide__5070F446]
GO
ALTER TABLE [dbo].[tblPermission]  WITH CHECK ADD CHECK  (([sPermissionn]='staff' OR [sPermissionn]='block' OR [sPermissionn]='user' OR [sPermissionn]='admin'))
GO
