CREATE DATABASE LuyenTap_Buoi71
GO
USE LuyenTap_Buoi71
GO

CREATE TABLE Khoa(
    id INT PRIMARY KEY IDENTITY,
    maKhoa VARCHAR(10) NOT NULL UNIQUE,
    tenKhoa NVARCHAR(50),
)

CREATE TABLE SinhVien(
    id INT PRIMARY KEY IDENTITY,
    maSV VARCHAR(10) NOT NULL UNIQUE,
    tenSV NVARCHAR(100),
    ngaySinh DATE,
    diaChi NVARCHAR(100),
    khoa_id INT
)
INSERT INTO Khoa(maKhoa,tenKhoa)
VALUES
    ('CNTN1',N'Duong'),
    ('CNTN2',N'Duong'),
    ('CNTN3',N'Duong'),
    ('CNTN4',N'Duong'),
    ('CNTN5',N'Duong'),
    ('CNTN6',N'Duong'),
    ('CNTN7',N'Duong'),
    ('CNTN8',N'Duong'),
    ('CNTN9',N'Duong'),
    ('CNTN10',N'Duong')

INSERT INTO SinhVien(maSV, tenSV, ngaySinh, diaChi, khoa_id)
VALUES
    ('TH04471',N'Duong','2007-11-03',N'SD1806',1),
    ('TH04472',N'fdDuong','2008-11-03',N'SD1806',2),
    ('TH04473',N'f Duong','1345-04-23',N'SV01',3),
    ('TH04474',N'aaDuong','2002-04-23',N'SV01',1),
    ('TH04475',N'aaDuong','2004-04-23',N'SV21',1),
    ('TH04476',N'ADuong','1347-04-23',N'SV01',3),
    ('TH04477',N'BDuong','1349-04-23',N'SV01',2),
    ('TH04478',N'ADuong','2005-04-23',N'SV01',1)
    
SELECT * FROM SinhVien
SELECT * FROM Khoa
-- Liệt kê tất cả sinh viên. 
-- Liệt kê tất cả sinh viên có tuổi từ 20 đến 25 và
--  sắp xếp theo ngày sinh từ mới đến cũ. 
-- Ham - SQL 
-- C1: YEAR 
-- 2024 - Year(ngaysinh)
-- GETDATE() : Lay ra ngay gio hien tai 
-- C2: DATEDIFF(ths1,ths2,ths3)
-- ths1 : Kieu dang muon lay: YEAR/MONTH,DAY,SECOND....
-- ths2: Gia tri bi tru 
-- ths3: Gia tri duoc tru

-- Sap xep : ORDER BY 
    -- Cu phap: ORDER By column1, column2 ... Kieu sap xep:
        -- Tang dan: ASC (Hoac k can ghi gi ca) => DEfault la tang dan
        -- Giam dan: DESC 
    -- Vi tri cua ORDER BY: LUON LUON O CUOI CUNG CUA CAU TRUY VAN 
-- SELECT maSV,tenSV, YEAR(GETDATE()) - YEAR(ngaySinh) as Tuoi, ngaySinh
-- FROM SinhVien
-- WHERE YEAR(GETDATE()) - YEAR(ngaySinh) BETWEEN 20 AND 25
-- ORDER BY ngaySinh DESC
SELECT maSV,tenSV, DATEDIFF(YEAR,ngaySinh,GETDATE())
FROM SinhVien
WHERE YEAR(GETDATE()) - YEAR(ngaySinh) BETWEEN 20 AND 25
ORDER BY ngaySinh DESC
-- Liệt kê mã sinh viên, tên sinh viên của tất cả sinh viên có khoa_id = 1. 
SELECT maSV, tenSV, khoa_id
FROM SinhVien
WHERE khoa_id=1

-- Liệt kê tên sv và số lượng sinh viên ở khoa ,
--  với điều kiện số lượng sv ở cac khoa > 3 , 
-- sắp xếp theo số lượng sinh viên ở cac khoa giam dan. 
-- Ham 
    -- COUNT
    -- SUM 
    -- AVG
    -- MIN
    -- MAX
    -- ...
-- KHi su dung cac ham COUNT, SUM, AVG... theo 1 dieu kien cu the
--  => GROUP BY theo dieu kien
-- Dieu kien COUNT/SUM => k the dung where thay the bang HAVING 
SELECT khoa_id, COUNT(*) as [So luong sinh vien]
FROM SinhVien
GROUP BY khoa_id
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC
-- Liệt kê mã sinh viên, tên sinh viên 
-- của tất cả sinh viên có tên bắt đầu bằng chữ 'A' và ngày sinh sau năm 2000. 
-- SELECT maSV, tenSV, ngaySinh
-- FROM SinhVien
-- WHERE (tenSV LIKE 'A%' OR tenSV LIKE 'a%')
--         AND YEAR(ngaySinh) > 2000  
-- UPPER : viet hoa 
-- LOWER : viet thuong
SELECT maSV, tenSV, ngaySinh,LOWER(tenSV)
FROM SinhVien
WHERE LOWER(tenSV) LIKE 'a%'
        AND YEAR(ngaySinh) > 2000  
-- Liệt kê khoa ID, tong so luong sinh vien theo moi khoa, 
-- chỉ lấy tong số lượng sinh viên lớn hơn 5, sắp xếp theo khoa ID giam dan.. 

-- Liệt kê tuổi trung bình của sinh viên trong mỗi khoa id. 

-- Liệt kê  khoa id và ngày sinh trẻ nhất của sinh viên trong mỗi khoa. 
