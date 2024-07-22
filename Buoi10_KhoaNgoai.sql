-- 1. Thuc the 
-- DATABASE: Luu tru du du lieu 
-- TABLE(Bang): cac thuoc tinh...
-- Cac thuc the (entity): Objects: N/ Cum N 
-- Thuc the : 
-- VD: SV, GV, Lop hoc, Nguoi...
-- Thuc the 
-- -> Xoay quanh cuoc song hang. 
-- -> Va quay quanh the gioi thuc 
-- VD: Nha, Cay coi ..... 
-- 2.Chuan hoa quan he 
-- Tao CSDL buoi 10
-- Tao bang SinhVien gom cac thuoc tinh
-- ID - int - tu tang - khoa chinh
-- Ma - varchar(20) - khong duoc null va la duy nhat 
-- Ten - nvarchar(100)
-- tuoi - int 
-- sdt - varchar(20) -- la duy nhat 
-- mon_hoc - nvarchar(100)
-- Them 3 du lieu vao bang SinhVien 
CREATE DATABASE buoi_10p2
GO
USE buoi_10p2
GO
CREATE TABLE SinhVien(
    ID INT IDENTITY PRIMARY KEY,
    Ma VARCHAR(20) NOT NULL UNIQUE,
    Ten NVARCHAR(100),
    Tuoi INT,
    sdt VARCHAR(20) UNIQUE,
    mon_hoc NVARCHAR(100)
)
INSERT INTO SinhVien
VALUES 
    ('SV000',N'CHOSKHANH',17,'123456789',N'CSDL'),
    ('SV001',N'HIEU',17,'1234567899',N'TOAN'),
    ('SV002',N'DANGCHOS',17,'123456788',N'   TOAN')
SELECT *
FROM SinhVien
WHERE mon_hoc = 'Toan'
-- Tach 1 bang mon hoc (ID , ten mon hoc )
-- Chuan hoa du lieu:
    -- Muc dich : Tối giản và làm sạch dữ liệu. 
    -- Chuan hoá dữ liệu => Tách nhỏ bảng => Làm sạch + Tái sử dụng dữ liệu 
-- Có 4 dạng chuẩn hoá:
-- Dạng 1(cơ bản): 1NF 
-- Dang 2: 2NF 
-- 3NF 
-- BCNF 
-- CSDL lai: lai 2 & 3NF
-- Tăng tốc độ xử lý bài toán 
-- SOF102 
-- => Tách nhỏ 
-- Nhiều thực thể => MQH giữa các thực thể.
-- Co 3 loai MQH chinh:
-- Quan he 1 - 1 
-- Quan he 1 - N 
-- Quan he N - N 
-- Quan he 1 - 1 
    -- 1 vo -> 1 chong 
    -- 1 chong -> 1 vo 
    -- => MQH :  1 vo <=> 1 chong 
    -- Khoa ngoai : Dat o bang nao cung duoc 
--  Quan he 1 - N 
    -- 1 me -> N con 
    -- 1 con -> 1 me 
    -- => MQH :  1 me <=> N con 
    -- Khoa ngoai : Khoa ngoai se dat o bang N  
--  Quan he N - N 
    -- 1 bs -> N benh nhan 
    -- 1 bn -> N bs 
    -- => MQH :  N bs <=> N bn 
    -- Khoa ngoai : Tach bang O GIUA. BANG DUOC TACH CHUA KHOA CHINH CỦA 2 BANG CON LAI 


CREATE TABLE SanPham(
    ma_san_pham VARCHAR(50) PRIMARY KEY NOT NULL,
    ten_san_pham NVARCHAR(100) NOT NULL,
    gia FLOAT NOT NULL,
    so_luong_ton INT NOT NULL,
)
CREATE TABLE HoaDon(
    Ma_hoa_don VARCHAR(50) PRIMARY KEY NOT NULL,
    Ngay_lap DATE NOT NULL,
    So_dien_thoai VARCHAR(15)
)
-- 1 bang => 1 khoa chinh => N thuoc tinh khoa chinh 
-- Kieu du lieu khoa ngoai phan trung vs kieu du lieu khoa chinh cua bang dc noi 
CREATE TABLE HoaDonChiTiet(
    -- C1: FOREIGN KEY REFERENCES
    maSanPham VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES SanPham(ma_san_pham),
    maHoaDon VARCHAR(50) NOT NULL,
    soLuongMua INT,
    gia FLOAT,
    PRIMARY KEY(maSanPham,maHoaDon),
    -- C2: CONSTRAINT (rang buoc)
    CONSTRAINT FK_HoaDon FOREIGN KEY (maHoaDon) REFERENCES HoaDon(Ma_hoa_don)
)
-- Them du lieu 
INSERT INTO SanPham
VALUES 
    ('sv1',N'a',0,2),
    ('sv2',N'b',3,1),
    ('sv3',N'c',1,4),
    ('sv4',N'd',5,6)
INSERT INTO HoaDon
VALUES
    ('GTAV','2015-12-05','0984085074'),
    ('GTAV1','1980-07-11','0985085074'),
    ('GTAV2','2002-11-11','0986085074')
SELECT * FROM HoaDon
SELECT * FROM SanPham
INSERT INTO HOADONCHITIET
VALUES 
    ('sv1','GTAV2',10,10),
    ('sv2','GTAV',10,10),
    ('sv1','GTAV1',10,10)

-- Chu y : Khoa ngoai: Phai ton tai trong bang 
SELECT * FROM HOADONCHITIET
