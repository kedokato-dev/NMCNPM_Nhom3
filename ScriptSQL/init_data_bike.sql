-- Thêm dữ liệu vào bảng tblBrand
INSERT INTO tblBikeBrand (sName) VALUES
('Yamaha'),
('Honda'),
('Suzuki'),
('Kawasaki'),
('Ducati');

-- Thêm dữ liệu vào bảng tblType
INSERT INTO tblBikeType (sType) VALUES
('Scooter'),
('Sport'),
('Cruiser'),
('Touring'),
('Standard');
SET IDENTITY_INSERT [dbo].[tblBikeDetail] ON 

INSERT INTO [dbo].[tblBikeDetail] ([sFrameSize], [sMaterial], [fWeight], [FkIdBikeBrand], [FkIdBikeType]) VALUES
(N'S', N'Nhôm', 11.20, 0, 0),
(N'M', N'Carbon', 9.80, 1, 1),
(N'L', N'Titanium', 12.00, 2, 2),
(N'XL', N'Nhôm', 13.50, 3, 3),
(N'S', N'Carbon', 10.20, 4, 4),
(N'M', N'Nhôm', 11.50, 0, 1),
(N'L', N'Titanium', 12.30, 1, 2),
(N'XL', N'Carbon', 9.70, 2, 3),
(N'S', N'Nhôm', 12.10, 3, 4),
(N'M', N'Carbon', 10.80, 4, 0),
(N'L', N'Titanium', 11.90, 0, 2),
(N'XL', N'Nhôm', 12.60, 1, 3),
(N'S', N'Carbon', 9.90, 2, 4),
(N'M', N'Titanium', 12.10, 3, 0),
(N'L', N'Nhôm', 11.80, 4, 1),
(N'XL', N'Carbon', 10.50, 0, 3),
(N'S', N'Titanium', 11.40, 1, 4),
(N'M', N'Nhôm', 12.30, 2, 0),
(N'L', N'Carbon', 10.60, 3, 1),
(N'XL', N'Titanium', 12.70, 4, 2);

SET IDENTITY_INSERT [dbo].[tblBikeDetail] OFF
GO

DECLARE @i INT = 1;
DECLARE @FkIdBikeDetail INT;
DECLARE @sCondition NVARCHAR(50);
DECLARE @sStatus NVARCHAR(50);

WHILE @i <= 100
BEGIN
    -- Chọn ngẫu nhiên một FkIdBikeDetail từ 0 đến 4
    SET @FkIdBikeDetail = (SELECT ABS(CHECKSUM(NEWID())) % 5);

    -- Chọn ngẫu nhiên một điều kiện xe
    SET @sStatus = CASE (ABS(CHECKSUM(NEWID())) % 2)
        WHEN 0 THEN N'Mới'
        WHEN 1 THEN N'Cũ'
        ELSE N'Trung bình'
    END;

    -- Trạng thái xen kẽ giữa 'Free' và 'Busy'
    SET @sCondition = CASE WHEN @i % 2 = 0 THEN N'Đã thuê' ELSE N'Chưa thuê' END;

    INSERT INTO [dbo].[tblBike] ([sName], [FkIdBikeDetail], [sCondition], [sStatus], [fRentalPrice], [fDeposit], [sImage])
    VALUES
    (N'Xe ' + CAST(@i AS NVARCHAR), @FkIdBikeDetail, @sCondition, @sStatus, 
     80000 + (ABS(CHECKSUM(NEWID())) % 50000), 400000 + (ABS(CHECKSUM(NEWID())) % 200000), N'bike.png');

    SET @i = @i + 1;
END;
