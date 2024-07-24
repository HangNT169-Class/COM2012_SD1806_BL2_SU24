CREATE DATABASE Buoi11_2
GO
USE Buoi11_2
GO

CREATE TABLE GiaoVien(
    id INT PRIMARY KEY IDENTITY,
    MaGV VARCHAR(20) UNIQUE NOT NULL,
    TenGV NVARCHAR(50),
    GioiTinh BIT,
    sdt VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100)
)
INSERT INTO GiaoVien
VALUES
('TH123',N'HangNT', 0, '1234', 'dvvsdu'),
('TH124',N'HangNT', 0, '12345', 'egugwuyuw'),
('TH125',N'HangNT', 0, '123452', 'evwwu')

CREATE TABLE MonHoc(
    ID INT PRIMARY KEY IDENTITY,
    MaMonHoc VARCHAR(10),
    TenMonHoc NVARCHAR(100),
    SoTinChi INT,
    SoTiet INT
)
ALTER TABLE MonHoc
ALTER COLUMN MaMonHoc VARCHAR(10) NOT NULL 

INSERT INTO MonHoc
VALUES
('COM202',N'hh', 455423, 363),
('COM203',N'hh', 323, 423),
('COM204',N'hh', 6235, 378)

SELECT * FROM GiaoVien

CREATE TABLE PhanCong(
    ID INT PRIMARY KEY IDENTITY,
    GiaoVienID INT FOREIGN KEY REFERENCES GiaoVien(id),
    MonHocID INT FOREIGN KEY REFERENCES MonHoc(ID),
    NamHoc VARCHAR(10),
    HocKy INT,
    SoTietDay INT,
)
SELECT*
FROM PhanCong
INSERT INTO PhanCong
VALUES
    (1, 2, '2022', 3, 4),
    (1, 3, '2021', 4, 5),
    (2, 2, '2020', 1,2),
    (2, 1, '2019', 5,6),
    (2, 1, '2018', 2,1),
    (3, 3, '2017', 4,3),
    (3, 1, '2016', 6,5),
    (1, 2, '2015', 7,8),
    (3, 2, '2014', 8,72),
    (1, 1, '2013', 1,31)
-- Hiển thị danh sách tất cả
    -- các môn học mà giáo viên có MaGiaoVien là GV02 đang phụ trách. 
-- B1: Xac dinh tat ca cac bang ma minh muon lam viec 
-- => 3 bang 
-- JOIN 
-- C1: Su dung dung dieu kien
SELECT m.*, g.MaGV
-- Liet ke tat ca cac bang can dung
FROM MonHoc m, GiaoVien g, PhanCong p 
WHERE m.ID = p.MonHocID 
AND g.id = p.GiaoVienID
AND g.MaGV = 'TH123'
-- C2: Join (Ket noi cac bang)
    -- 1. Inner Join <=> WHERE 
    -- 2. Outer Join: Left join, Right join, Full join 
SELECT m.*
FROM MonHoc m 
INNER JOIN PhanCong p 
ON m.ID = p.MonHocID 
INNER JOIN GiaoVien g 
ON g.id = p.GiaoVienID
WHERE g.MaGV ='TH123'
INSERT INTO PhanCong
VALUES
(1,2,'2024',1,35)
-- Hiển thị danh sách tất cả các môn học 
    -- mà giáo viên có MaGiaoVien 
    -- là GV01 đang phụ trách và số tiết dạy lớn hơn 30. 
SELECT m.*,p.*
FROM MonHoc m
INNER JOIN PhanCong p
ON m.ID = p.MonHocID
INNER JOIN GiaoVien g
ON g.ID = p.GiaoVienID
WHERE g.MaGV = 'TH123'
AND SoTietDay > 30
-- Hiển thị danh sách tất cả các môn học 
    -- mà giáo viên có MaGiaoVien là GV03 
    -- đang phụ trách và có số tiết dạy từ 20 đến 30. 
SELECT m.*
FROM MonHoc m 
INNER JOIN PhanCong p 
ON m.ID = p.MonHocID
INNER JOIN GiaoVien g 
ON g.id = p.GiaoVienID
WHERE g.MaGV='TH124'
AND SoTietDay BETWEEN 20 AND 30
-- Hiển thị danh sách tất cả các giáo viên 
    -- có tham gia phân công môn học có 
    -- MaMonHoc là MH01 trong năm học "2023-2024". 

-- Hiển thị danh sách tất cả các giáo viên 
    -- có điểm trung bình của các môn học 
    --  mà họ phụ trách lớn hơn hoặc bằng 8. 