CREATE DATABASE Buoi5_TrenLop1
GO
USE Buoi5_TrenLop1
GO

CREATE TABLE GiangVien(
    ID INT PRIMARY KEY IDENTITY,
    MaGiangVien VARCHAR(100) UNIQUE NOT NULL,
    TenGiangVien NVARCHAR(100),
    TenTaiKhoan NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
)

CREATE TABLE MonHoc(
    ID INT PRIMARY KEY IDENTITY,
    MaMonHoc VARCHAR(100) UNIQUE NOT NULL,
    TenMonHoc NVARCHAR(100),
    SoTinChi INT,
    SoHocPhan INT,
)

CREATE TABLE PhanCongGiangVien(
    giang_vien_id INT, 
    mon_hoc_id INT ,
    SoLanDay INT,
    TiLeDo INT,
    PRIMARY KEY (giang_vien_id,mon_hoc_id)
)

SET IDENTITY_INSERT [dbo].[MonHoc] ON 
INSERT INTO MonHoc
VALUES
('AA106',N'van',1,987),
('AA107',N'van',2,986),
('AA108',N'van',3,985),
('AA109',N'van',4,984),
('AA100',N'van',5,983)

INSERT INTO GiangVien
VALUES
    ('TH0022',N'Hoang Van Hai',N'Hai Van Hoang',N'0999944768'),
    ('TH0023',N'Hoang Van Hao',N'Hao Van Hoang',N'0999836726'),
    ('TH0024',N'Hoang Vao Hai',N'Hao Vao Hoang',N'0986283642'),
    ('TH0025',N'Hoang Vao Hao',N'Hao Hao Hoang',N'0981264372'),
    ('TH0026',N'Hoang Vaa Hoa',N'Hao Haa Hoang',N'0172826372')

INSERT INTO PhanCongGiangVien
VALUES
(1,2,3,4),
(2,3,5,6),
(3,4,7,8),
(5,6,4,3),
(3,9,5,7)

SELECT * FROM PhanCongGiangVien
SELECT * FROM GiangVien
SELECT * FROM MonHoc

-- Hiển thị tất cả danh sách giảng viên  
-- Hiển thị tất cả danh sách môn học  
-- Hiển thị danh sách giảng viên gồm các thông tin sau: ma, ten, sdt 
-- Doi ten tam thoi: AS 
-- Viet Tieng Viet them N 
SELECT MaGiangVien as N'Mã Giảng Viên',TenGiangVien,SoDienThoai
FROM GiangVien

-- Lọc dữ liệu => WHERE 
-- Cú pháp:
-- SELECT column1, colum2...
-- FROM table1 
-- WHERE 
--     >= : SS lon hon hoac bang 
--     <=: SS nho hon hoac bang
--     =: SS bang 
--     <>: Khac (#)
--     >:
--     <:
--     BETWEEN ... AND 
--     AND 
--     OR 
--     LIKE 
--     ...
SELECT * 
FROM GiangVien
-- Hiển thị tất cả danh sách giảng viên có mã là TH0022
SELECT * 
FROM GiangVien
WHERE MaGiangVien = 'TH0022' 
-- Hiển thị tất cả các môn học có số tín trong <=3 
SELECT * 
FROM MonHoc
WHERE SoTinChi <= 3 
-- Hiển thị tất cả các môn học có số tín trong khoảng 2 – 3 
-- DK: so thi chi >= 2 && so tin chi <=3 
-- C1: AND 
SELECT * 
FROM MonHoc
WHERE SoTinChi >= 2 AND SoTinChi <= 3
-- C2: BETWEEN ... AND ...
SELECT * 
FROM MonHoc
WHERE SoTinChi BETWEEN 2 AND 3
-- Hiển thị tất cả các môn học có hoc phan trong khoảng 2 – 3  
-- hoac so tin chi khac 2
SELECT *
FROM MonHoc
WHERE SoHocPhan BETWEEN 2 AND 3 OR SoTinChi <> 2

-- Hiển thị top 3 môn học có số tín <= 5 
SELECT TOP 3*
FROM MonHoc
WHERE SoTinChi <= 5

-- ket thuc bang: endwiths 
-- bat dau bang: startwiths
-- chua: contanis 
-- LIKE :
    -- ket thuc: '%gia tri'
    -- bat dau: 'gia tri%'
    -- chua: '% gia tri %'
-- Nguyen Thuy Hang : indexOf
-- Hiển thị danh sách giảng viên gồm các thông tin sau: 
-- ma, ten, sdt với giảng viên có sđt kết thúc bằng “123 
SELECT MaGiangVien,TenGiangVien,SoDienThoai 
FROM GiangVien
WHERE SoDienThoai LIKE '%123'
-- Hiển thị tất cả các giảng viên có mã là GV01 và sdt bắt đầu bằng “081” 
-- Hiển thị tất cả các giảng viên có tên chứ chứ “a" và có sđt chua là “8687” 
SELECT MaGiangVien,TenGiangVien,SoDienThoai
FROM GiangVien
WHERE SoDienThoai LIKE '081%' AND MaGiangVien = 'GV01'

SELECT*
FROM GiangVien
WHERE TenGiangVien LIKE '%a%' AND SoDienThoai LIKE '%8687%'