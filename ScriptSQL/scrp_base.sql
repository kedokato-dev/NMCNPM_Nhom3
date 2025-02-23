USE [NMCNPM]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 23/02/2025 8:55:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[PkIdUser] [int] IDENTITY(0,1) NOT NULL,
	[sAccountName] [nvarchar](50) NOT NULL,
	[sPhoneNumber] [nvarchar](11) NOT NULL,
	[dDate] [date] NOT NULL,
	[sPermissions] [int] NOT NULL,
	[sUserIdentification] [nvarchar](20) NOT NULL,
	[sPassword] [varchar](100) NOT NULL,
 CONSTRAINT [PK__tblAccou__35430B20B843047F] PRIMARY KEY CLUSTERED 
(
	[PkIdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBike]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblBikeBrand]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblBikeDetail]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblBikeType]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblBill]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 23/02/2025 8:55:03 CH ******/
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
/****** Object:  Table [dbo].[tblCreateBill]    Script Date: 23/02/2025 8:55:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCreateBill](
	[FkIdUser] [int] NOT NULL,
	[FkBillCode] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 23/02/2025 8:55:03 CH ******/
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

INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [sPermissions], [sUserIdentification], [sPassword]) VALUES (1, N'Đại tướng Quân', N'0333241634', CAST(N'2004-02-22' AS Date), 0, N'0252040323', N'Admin@12')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [sPermissions], [sUserIdentification], [sPassword]) VALUES (9, N'Hà Nhận', N'0323254785', CAST(N'2025-02-10' AS Date), 2, N'33333333333', N'$2a$11$IFkvdi8sIQ771b6nN/JUROhCKNSc3435zRnvyj55o64fs.hLHrLI2')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [sPermissions], [sUserIdentification], [sPassword]) VALUES (11, N'Tú Sena', N'0333241634', CAST(N'2025-02-18' AS Date), 2, N'025204013481', N'$2a$11$z6zV52VwZM4dA4QPHS4BVubUj9vddhg3YBSLO7WypYjcD9I0PY7RO')
INSERT [dbo].[tblAccount] ([PkIdUser], [sAccountName], [sPhoneNumber], [dDate], [sPermissions], [sUserIdentification], [sPassword]) VALUES (13, N'Chú bé đần', N'0333241634', CAST(N'2025-02-14' AS Date), 1, N'025204013481', N'$2a$11$0sUvSGk7MdfDQx1bc5cq7.RlTwQaIIedmurJFZQAxE1OD7MyZ/DO2')
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeBrand] ON 

INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (0, N'Giant')
INSERT [dbo].[tblBikeBrand] ([PkIdBikeBrand], [sName]) VALUES (1, N'Trek')
SET IDENTITY_INSERT [dbo].[tblBikeBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeDetail] ON 

INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (0, N'M', N'Nhôm', CAST(12.50 AS Decimal(5, 2)), 0, 0)
INSERT [dbo].[tblBikeDetail] ([PkIdBikeDetail], [sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES (1, N'L', N'Carbon', CAST(10.00 AS Decimal(5, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[tblBikeDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBikeType] ON 

INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (0, N'Xe đạp địa hình')
INSERT [dbo].[tblBikeType] ([PkIdBikeType], [sType]) VALUES (1, N'Xe đạp đường phố')
SET IDENTITY_INSERT [dbo].[tblBikeType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (0, 50, CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblBill] ([PkBillCode], [fIncidentalCosts], [dBeginTime], [dEndTime], [iStatus]) VALUES (1, 75, CAST(N'2024-02-10T00:00:00.000' AS DateTime), CAST(N'2024-02-15T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblBill] OFF
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
/****** Object:  Index [UQ__tblBikeB__79DF5959CE8BA688]    Script Date: 23/02/2025 8:55:03 CH ******/
ALTER TABLE [dbo].[tblBikeBrand] ADD UNIQUE NONCLUSTERED 
(
	[sName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblBikeT__47012A9151EFF243]    Script Date: 23/02/2025 8:55:03 CH ******/
ALTER TABLE [dbo].[tblBikeType] ADD UNIQUE NONCLUSTERED 
(
	[sType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblPermission] FOREIGN KEY([sPermissions])
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
