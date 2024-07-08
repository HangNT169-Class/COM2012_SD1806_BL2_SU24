CREATE DATABASE LuyenTapTrenLopBuoi4;
GO
USE LuyenTapTrenLopBuoi4
GO
CREATE TABLE XeMay(
    ma VARCHAR(20) PRIMARY KEY,
    loai NVARCHAR(50),
    mau_sac NVARCHAR(50),
    gia FLOAT,
    trang_thai BIT
)

INSERT INTO XeMay
VALUES
    ('hoasjds',N'SH',N'xanh',300,1),
    ('dfhb',N'SH',N'xanh',300,1)

SELECT * FROM XeMay