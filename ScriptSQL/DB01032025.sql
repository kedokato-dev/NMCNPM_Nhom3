USE [NMCNPM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/1/2025 8:44:21 AM ******/
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
/****** Object:  Table [dbo].[tblAccount]    Script Date: 3/1/2025 8:44:21 AM ******/
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
/****** Object:  Table [dbo].[tblBike]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblBikeBrand]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblBikeDetail]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblBikeType]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblBill]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblCreateBill]    Script Date: 3/1/2025 8:44:22 AM ******/
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
/****** Object:  Table [dbo].[tblPermission]    Script Date: 3/1/2025 8:44:22 AM ******/
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
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [FkIdPermission], [sUserIdentification], [sPassword]) VALUES (13, N'Chú bé đần', N'0333241634', CAST(N'2025-02-14' AS Date), 1, N'025204013481', N'$2a$11$iAFAN82jAtFw6jEIS9cAWugjHjHIBOatuXLEbX0YYQnQzUT5Lw2de')
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBike] ON 

INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (201, N'Xe 1', 1, N'Chưa thuê', N'Mới', 88312, 513732, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (202, N'Xe 2', 2, N'Đã thuê', N'Cũ', 94782, 412014, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (203, N'Xe 3', 2, N'Chưa thuê', N'Mới', 83641, 586910, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (204, N'Xe 4', 3, N'Đã thuê', N'Cũ', 87858, 488891, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (205, N'Xe 5', 1, N'Chưa thuê', N'Cũ', 99448, 565452, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (206, N'Xe 6', 3, N'Đã thuê', N'Trung bình', 128778, 424345, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (207, N'Xe 7', 2, N'Chưa thuê', N'Mới', 109325, 598956, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (208, N'Xe 8', 0, N'Đã thuê', N'Mới', 112270, 433057, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (209, N'Xe 9', 0, N'Chưa thuê', N'Trung bình', 107199, 409278, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (210, N'Xe 10', 1, N'Đã thuê', N'Mới', 113401, 456553, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (211, N'Xe 11', 2, N'Chưa thuê', N'Trung bình', 109308, 448297, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (212, N'Xe 12', 2, N'Đã thuê', N'Mới', 91399, 469645, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (213, N'Xe 13', 1, N'Chưa thuê', N'Cũ', 96249, 581068, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (214, N'Xe 14', 2, N'Đã thuê', N'Trung bình', 129498, 490986, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (215, N'Xe 15', 3, N'Chưa thuê', N'Mới', 80431, 414725, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (216, N'Xe 16', 4, N'Đã thuê', N'Mới', 105874, 462388, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (217, N'Xe 17', 4, N'Chưa thuê', N'Mới', 97988, 439344, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (218, N'Xe 18', 4, N'Đã thuê', N'Cũ', 115330, 505998, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (219, N'Xe 19', 1, N'Chưa thuê', N'Cũ', 109246, 492436, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (220, N'Xe 20', 4, N'Đã thuê', N'Mới', 123003, 519820, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (221, N'Xe 21', 3, N'Chưa thuê', N'Cũ', 85879, 438570, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (222, N'Xe 22', 2, N'Đã thuê', N'Trung bình', 113446, 481240, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (223, N'Xe 23', 2, N'Chưa thuê', N'Mới', 122837, 439050, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (224, N'Xe 24', 4, N'Đã thuê', N'Mới', 105017, 539412, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (225, N'Xe 25', 0, N'Chưa thuê', N'Mới', 108548, 549483, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (226, N'Xe 26', 4, N'Đã thuê', N'Trung bình', 129827, 594938, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (227, N'Xe 27', 4, N'Chưa thuê', N'Trung bình', 110515, 440357, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (228, N'Xe 28', 2, N'Đã thuê', N'Trung bình', 125472, 435458, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (229, N'Xe 29', 4, N'Chưa thuê', N'Mới', 102540, 518662, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (230, N'Xe 30', 4, N'Đã thuê', N'Mới', 91877, 467848, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (231, N'Xe 31', 4, N'Chưa thuê', N'Mới', 110126, 434650, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (232, N'Xe 32', 1, N'Đã thuê', N'Cũ', 116980, 567842, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (233, N'Xe 33', 0, N'Chưa thuê', N'Cũ', 90470, 430969, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (234, N'Xe 34', 0, N'Đã thuê', N'Mới', 80694, 487526, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (235, N'Xe 35', 4, N'Chưa thuê', N'Cũ', 125973, 533861, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (236, N'Xe 36', 2, N'Đã thuê', N'Trung bình', 97028, 408559, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (237, N'Xe 37', 4, N'Chưa thuê', N'Cũ', 101014, 408602, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (238, N'Xe 38', 3, N'Đã thuê', N'Mới', 94446, 478726, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (239, N'Xe 39', 3, N'Chưa thuê', N'Trung bình', 102595, 439809, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (240, N'Xe 40', 3, N'Đã thuê', N'Mới', 101547, 506728, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (241, N'Xe 41', 3, N'Chưa thuê', N'Trung bình', 102750, 452769, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (242, N'Xe 42', 3, N'Đã thuê', N'Mới', 116247, 516768, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (243, N'Xe 43', 0, N'Chưa thuê', N'Trung bình', 101138, 412599, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (244, N'Xe 44', 3, N'Đã thuê', N'Mới', 119089, 576386, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (245, N'Xe 45', 4, N'Chưa thuê', N'Cũ', 86418, 421385, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (246, N'Xe 46', 0, N'Đã thuê', N'Trung bình', 87821, 541141, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (247, N'Xe 47', 2, N'Chưa thuê', N'Mới', 126547, 423451, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (248, N'Xe 48', 0, N'Đã thuê', N'Trung bình', 97656, 578075, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (249, N'Xe 49', 2, N'Chưa thuê', N'Trung bình', 123633, 528415, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (250, N'Xe 50', 3, N'Đã thuê', N'Mới', 126449, 517458, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (251, N'Xe 51', 4, N'Chưa thuê', N'Mới', 128502, 455100, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (252, N'Xe 52', 2, N'Đã thuê', N'Trung bình', 103437, 477305, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (253, N'Xe 53', 3, N'Chưa thuê', N'Mới', 128099, 516991, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (254, N'Xe 54', 2, N'Đã thuê', N'Mới', 99435, 546374, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (255, N'Xe 55', 3, N'Chưa thuê', N'Cũ', 92802, 554475, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (256, N'Xe 56', 3, N'Đã thuê', N'Cũ', 118654, 589575, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (257, N'Xe 57', 3, N'Chưa thuê', N'Mới', 108515, 409377, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (258, N'Xe 58', 4, N'Đã thuê', N'Mới', 109375, 462768, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (259, N'Xe 59', 0, N'Chưa thuê', N'Mới', 110657, 468205, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (260, N'Xe 60', 4, N'Đã thuê', N'Mới', 91716, 494878, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (261, N'Xe 61', 1, N'Chưa thuê', N'Mới', 104855, 441348, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (262, N'Xe 62', 0, N'Đã thuê', N'Mới', 121531, 569995, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (263, N'Xe 63', 1, N'Chưa thuê', N'Trung bình', 114202, 444076, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (264, N'Xe 64', 4, N'Đã thuê', N'Trung bình', 89748, 514045, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (265, N'Xe 65', 4, N'Chưa thuê', N'Mới', 96679, 561116, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (266, N'Xe 66', 3, N'Đã thuê', N'Trung bình', 89823, 599750, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (267, N'Xe 67', 4, N'Chưa thuê', N'Mới', 105094, 438338, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (268, N'Xe 68', 0, N'Đã thuê', N'Cũ', 82436, 426893, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (269, N'Xe 69', 1, N'Chưa thuê', N'Mới', 95528, 444510, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (270, N'Xe 70', 2, N'Đã thuê', N'Mới', 125475, 584126, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (271, N'Xe 71', 3, N'Chưa thuê', N'Trung bình', 104631, 448784, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (272, N'Xe 72', 0, N'Đã thuê', N'Mới', 127843, 519582, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (273, N'Xe 73', 3, N'Chưa thuê', N'Trung bình', 128252, 451623, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (274, N'Xe 74', 1, N'Đã thuê', N'Mới', 90543, 416377, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (275, N'Xe 75', 4, N'Chưa thuê', N'Mới', 125691, 442526, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (276, N'Xe 76', 2, N'Đã thuê', N'Trung bình', 121168, 411504, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (277, N'Xe 77', 2, N'Chưa thuê', N'Cũ', 108411, 544045, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (278, N'Xe 78', 2, N'Đã thuê', N'Mới', 106888, 537031, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (279, N'Xe 79', 1, N'Chưa thuê', N'Mới', 117383, 426059, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (280, N'Xe 80', 0, N'Đã thuê', N'Mới', 81870, 535943, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (281, N'Xe 81', 0, N'Chưa thuê', N'Cũ', 81550, 521475, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (282, N'Xe 82', 3, N'Đã thuê', N'Mới', 128725, 431213, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (283, N'Xe 83', 2, N'Chưa thuê', N'Mới', 86573, 409347, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (284, N'Xe 84', 1, N'Đã thuê', N'Trung bình', 99456, 437198, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (285, N'Xe 85', 1, N'Chưa thuê', N'Cũ', 129996, 433096, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (286, N'Xe 86', 1, N'Đã thuê', N'Mới', 128993, 543153, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (287, N'Xe 87', 1, N'Chưa thuê', N'Trung bình', 109561, 559569, N'myBike11.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (288, N'Xe 88', 3, N'Đã thuê', N'Cũ', 95818, 591476, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (289, N'Xe 89', 0, N'Chưa thuê', N'Mới', 113095, 532112, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (290, N'Xe 90', 0, N'Đã thuê', N'Cũ', 105473, 484199, N'myBike2.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (291, N'Xe 91', 0, N'Chưa thuê', N'Cũ', 90255, 441949, N'myBike3.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (292, N'Xe 92', 0, N'Đã thuê', N'Mới', 97227, 428636, N'myBike4.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (293, N'Xe 93', 3, N'Chưa thuê', N'Cũ', 90138, 455044, N'myBike5.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (294, N'Xe 94', 2, N'Đã thuê', N'Mới', 117272, 443770, N'myBike6.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (295, N'Xe 95', 1, N'Chưa thuê', N'Trung bình', 95535, 579053, N'myBike7.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (296, N'Xe 96', 2, N'Đã thuê', N'Trung bình', 103471, 467233, N'myBike8.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (297, N'Xe 97', 2, N'Chưa thuê', N'Mới', 115454, 475209, N'myBike9.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (298, N'Xe 98', 0, N'Đã thuê', N'Trung bình', 115087, 464825, N'myBike10.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (299, N'Xe 99', 1, N'Chưa thuê', N'Mới', 83022, 575401, N'myBike11.jpg')
GO
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (300, N'Xe 100', 4, N'Đã thuê', N'Mới', 111081, 434973, N'myBike0.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (301, N'Xe của Phúc', 8, N'Chưa thuê', N'Mới', 10000, 500000, N'myBike1.jpg')
INSERT [dbo].[tblBike] ([PkIdBike], [sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage]) VALUES (302, N'Xe của Phúc', 0, N'Chưa thuê', N'Đã xóa', 5421, 432141, N'myBike2.jpg')
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

INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (0, N'M', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (1, N'L', N'Carbon', CAST(10.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (2, N'S', N'Nhôm', CAST(11.20 AS Decimal(5, 2)), 0, 0)
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

INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (0, 50, CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (1, 75, CAST(N'2024-02-10T00:00:00.000' AS DateTime), CAST(N'2024-02-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (2, NULL, CAST(N'2025-02-28T09:55:00.000' AS DateTime), CAST(N'2025-02-28T12:55:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (3, NULL, CAST(N'2025-02-28T09:55:00.000' AS DateTime), CAST(N'2025-02-28T12:55:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (4, NULL, CAST(N'2025-02-28T10:06:00.000' AS DateTime), CAST(N'2025-02-28T13:06:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (5, NULL, CAST(N'2025-02-28T21:42:00.000' AS DateTime), CAST(N'2025-03-01T00:42:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (6, NULL, CAST(N'2025-02-28T21:52:00.000' AS DateTime), CAST(N'2025-03-01T00:52:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (7, NULL, CAST(N'2025-02-28T21:55:00.000' AS DateTime), CAST(N'2025-03-01T00:55:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (8, NULL, CAST(N'2025-02-28T21:56:00.000' AS DateTime), CAST(N'2025-03-01T00:56:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (9, NULL, CAST(N'2025-02-28T21:59:00.000' AS DateTime), CAST(N'2025-03-01T00:59:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (10, NULL, CAST(N'2025-02-28T22:02:00.000' AS DateTime), CAST(N'2025-03-01T01:02:00.000' AS DateTime), 1)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (11, NULL, CAST(N'2025-03-01T08:40:00.000' AS DateTime), CAST(N'2025-03-01T11:40:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (1, 11)
INSERT [dbo].[tblCreateBill] ([FkIdUser], [FkBillCode]) VALUES (11, 11)
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
/****** Object:  Index [UQ__tblBikeB__79DF595972E72658]    Script Date: 3/1/2025 8:44:22 AM ******/
ALTER TABLE [dbo].[tblBikeBrand] ADD UNIQUE NONCLUSTERED 
(
	[sName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblBikeT__47012A9148DEE03F]    Script Date: 3/1/2025 8:44:22 AM ******/
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
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [CK__tblBill__fIncide__5070F446] CHECK  (([fIncidentalCosts]>(0)))
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [CK__tblBill__fIncide__5070F446]
GO
ALTER TABLE [dbo].[tblPermission]  WITH CHECK ADD CHECK  (([sPermissionn]='staff' OR [sPermissionn]='block' OR [sPermissionn]='user' OR [sPermissionn]='admin'))
GO
