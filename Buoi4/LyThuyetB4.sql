CREATE DATABASE buoi4_p21
-- 1 bang bat co N thuoc tinh 
-- 1 bang co 1 khoa chinh 
-- Khoa chinh co the tao:
-- 1. Khoa chinh them bang tay 
-- 2. Khoa chinh tu dong tang : INT/ BigINT => Tang theo so nguyen: IDENTITY(1,1), IDENTITY
-- 3. Khoa chinh tu gen: (UUID - uniqueidentifier): DEFAULT NEWID()
--  => Tu gen ra 1 doan ma bat ky

-- Tao bang SinhVien gom cac thuoc tinh
-- ID - int, ma - varchar(20), ten - nvarchar(100), tuoi - int 
-- ID: la khoa chinh tu tang 
-- Tao bang NhanVien gom cac thuoc tinh
-- ID - uniqueidentifier, ma - varchar(20), ten - nvarchar(100), 
-- tuoi - int, trang thai - bit
-- ID: la khoa chinh tu gen 
-- Them vao moi bang 2 dong ban ghi 
CREATE TABLE SinhVien(
    ID INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20),
    ten NVARCHAR(100),
    tuoi INT,
)

INSERT INTO SinhVien
VALUES
    ('HE130465',N'ABCD',10),
    ('HE130466',N'ABCD',10),
    ('HE1304678',N'ABCD',10)

SELECT * FROM SinhVien

CREATE TABLE NhanVien(
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    ma VARCHAR(20),
    ten NVARCHAR(100),
    tuoi INT,
    trang_thai BIT
)
-- Liet ke cac truong muon insert
INSERT INTO NhanVien(ma,ten,tuoi,trang_thai)
VALUES
    ('NV01',N'abc',10,1),
    ('NV02',N'abc',12,1),
    ('NV03',N'abc',14,1),
    ('NV04',N'abc',15,1),
    ('NV05',N'abc',10,0)
-- ALTER TABLE ... 

SELECT * FROM NhanVien

-- 2. Khoa chinh 
-- 1 bang co 1 khoa chinh 
-- Tao bang SinhVien gom cac thuoc tinh:
-- id - int , ten - nvarchar(100)
-- Tao bang LopHoc gom cac thuoc tinh:
-- id - UNIQUEIDENTIFIER, ma_lop - varchar(20)
-- Tao bang SinhVienLopHoc gom cac thuoc tinh
-- sinh_vien_id: INT , lop_hoc_id: UNIQUEIDENTIFIER, ma -varchar(10)
-- Khoa chinh: 
    -- SV: ID: Tu tang 
    -- Lop hoc: ID: Tu gen 
    -- SinhVienLopHoc : sinh_vien_id: INT , lop_hoc_id: UNIQUEIDENTIFIER
-- Them du lieu vao moi bang. Moi bang 3 dong ban 
CREATE TABLE SinhVien2(
    id INT PRIMARY KEY IDENTITY,
    ten NVARCHAR(100)
)
CREATE TABLE LopHoc(
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    ma_lop VARCHAR(20)
)
-- 1 bang co 1 khoa chinh
-- Nhung co the co nhieu thuoc tinh khoa chinh 
CREATE TABLE SinhVienLopHoc(
    sinh_vien_id INT ,
    lop_hoc_id UNIQUEIDENTIFIER,
    ma VARCHAR(10),
    PRIMARY KEY (sinh_vien_id,lop_hoc_id)
)

INSERT INTO SinhVien2
VALUES
    (N'Hoanh');

INSERT INTO LopHoc(ma_lop)
VALUES
    ('DM1805');

INSERT INTO SinhVienLopHoc
VALUES
    (3,'15c94884-04c8-4314-86f1-628afd740fc0','M01'),
    (2,'15c94884-04c8-4314-86f1-628afd740fc0','M02'),
    (2,'15c94884-04c8-4314-86f1-628afd740fc1','M03')
-- Thuoc tinh khoa chinh thi co the duplicate
-- Khoa chinh thi la duy nhat
-- UUID vs Varchar & Nvarchar la cac kieu du lieu khac nhau 

SELECT * FROM SinhVienLopHoc

SELECT * FROM SinhVien2

SELECT * FROM LopHoc

-- 3. Dieu kien rang buoc 
-- 1. NOT NULL : Bat buoc phai nhap (co gia tri ) khi them 

SELECT * FROM SINHVIEN

INSERT INTO SINHVIEN (tuoi,ten)
VALUES  
    (10,N'sfsd')

-- Them dieu kien rang buoc : ma k duoc phep null
-- Co 2 cach:
-- C1: Them truc tiep vao table 
-- C2: Su dung tu ALTER 
-- Them dieu kien rang buoc : ten k duoc phep null
CREATE TABLE SinhVien3(
    ID INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20) NOT NULL,
    ten NVARCHAR(100),
    tuoi INT,
)
INSERT INTO SINHVIEN3 (tuoi,ten)
VALUES  
    (10,N'sfsd')
-- Khi them truong => Tu khoa dong 131: ADD 
-- Khi sua truong da ton tai trong table => => Tu khoa dong 131: ALTER 
ALTER TABLE SinhVien3 
ALTER COLUMN ten NVARCHAR(50) NOT NULL  

-- Bo sung them gioi_tinh - bit
ALTER TABLE SinhVien3 
ADD gioi_tinh bit 
-- 2. UNIQUE : DUY NHAT
-- Ma la duy nhat , ten k duoc phep null 
CREATE TABLE SinhVien4(
    ID INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20) UNIQUE,
    ten NVARCHAR(100) NOT NULL UNIQUE ,
    tuoi INT,
)
-- PRIMARY KEY & UNIQUE : DEU LA DUY NHAT CUA 1 bang 
-- 1 bang chi co 1 khoa chinh (primary key)
-- 1 bang co the xuat hien nhieu lan UNIQUE 
-- 3. Gia tri khoi tao default value
-- Gia tri default gioi tinh = 0 
CREATE TABLE SinhVien5(
    ID INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20),
    ten NVARCHAR(100) ,
    tuoi INT,
    gioi_tinh BIT DEFAULT 0 
)

INSERT INTO SinhVien5(ma,ten,tuoi)
VALUES
    ('12',N'32',10)

INSERT INTO SinhVien5(ma,ten,tuoi,gioi_tinh)
VALUES
    ('12',N'32',10,1)
SELECT * FROM SinhVien5