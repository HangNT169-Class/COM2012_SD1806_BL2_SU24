-- Comment : 
    -- Comment 1 dong 
    -- Comment 1 khoi lenh: 
    /**
        Noi dung can comment 
    */ 
/**
    1. Luu y
    - Co so du lieu (Database) - SQL: Noi tap trung du lieu 
    - Database co nhieu loai: SQL Server , MySQL, Postgress, H2, Oracle...
    - J3 - J6: chi hoc va dung SQL Server 
    SSMS => Microsoft => ban quyen
    - Java: Phan biet hoa thuong 
        int a;
        int A;
    - SQL: Moi loai ten trong SQL => KHONG PHAN BIET HOA THUONG 
    database : buoi1 , Buoi1
    - Dat ten trong SQL: ran 
        sinh_vien
        buoi1_sd1806
    - TAT CA CAC TU KHOA SQL: VIET HOA 100%: TABLE, DATABASE, INSERT INTO, SELECT...
    2. Kieu du lieu trong SQL 
    - so nguyen : int, bigint(giong long)
    - so thuc: float, decimal, money....
    - chuoi: 
        + Viet tieng viet: NVARCHAR(do dai toi da)
            VD: nvarchar(100)
        + Viet khong dau: VARCHAR(doi dai toi da)
            VD: VARCHAR(50)
    - dung/sai: C(bool), Java(boolean), SQL(bit) - CHI NHAN DUOC 0 HOAC 1 
        + 0: false 
        + 1: true 
    - ngay thang: date, datetime, datetime2, timestamp(Trong cac loai SQL khac: SQL Server k co)
    ....
    3. Database : Chua cac bang ma muon truy cap <=> Tao project trong Java
    - B1: Tao CSDL dau tien
    Cu phap:
        CREATE DATABASE ten_database;
    CREATE DATABASE demo5;
    -- Xoa  
    -- DROP DATABASE ten csdl;
    -- Co 2 cach de su dung database mong muon 
    -- C1: USE database 
    -- C2: Chon database muon su dung tren giao dien 
    -- Cach chay: Boi den doan muon chay roi an excute/run
    GO -- Chay toan bo tu tren xuong duoi 
    USE demo4
    GO 
    4. Table: Bang <=> Tao doi tuong trong Java 
    Cu phap:
        CREATE TABLE ten bang(
            Liet ke cac thuoc tinh cua bang
            ten thuoc tinh kieu du lieu rang buoc (neu co),
        )
    1 bang bat buoc se phai co khoa chinh(duy nhat)
    1 BANG CHI CO 1 KHOA CHINH DUY NHAT
    NHUNG CO THE CO NHIEU THUOC TINH KHOA CHINH
*/
-- Bai tap
-- Tao CSDL buoi1_sd1806
-- Tao bang sinh vien gom cac thuoc tinh:
-- mssv - varchar(50)
-- ten - nvarchar(100)
-- tuoi - int 
-- dia_chi - nvarchar(100)
-- Khoa chinh cua bang la MSSV
-- Them 3 dong du lieu cho doi tuong sinh vien
-- In thong tin cua 3 dong du lieu ra man hinh

CREATE DATABASE buoi1_sd1806
GO 
USE buoi1_sd1806
GO

CREATE TABLE sinh_vien(
    mssv VARCHAR(50),
    -- C1: them PRIMARY KEY ben canh thuoc tinh khoa chinh 
    ten NVARCHAR(100),
    tuoi INT
)
-- Sua : ALTER
ALTER TABLE sinh_vien
ADD dia_chi NVARCHAR(100)

ALTER TABLE sinh_vien
ADD PRIMARY KEY(mssv)

ALTER TABLE sinh_vien 
DROP COLUMN tuoi 

-- Them du lieu vao bang : INSERT INTO 
INSERT INTO sinh_vien
VALUES('HE130461',N'Nguyễn Thuý Hằng',N'Hà Nội', 10)

INSERT INTO sinh_vien
VALUES('HE130462',N'Nguyễn Thuý Hằng2',N'Hà Nội1', 101)

INSERT INTO sinh_vien
VALUES
    ('HE130463',N'Nguyễn Thuý Hằng2',N'Hà Nội1', 101),
    ('HE130464',N'Nguyễn gdf Hằng2',N'Hà Nội1', 101),
    ('HE130465',N'Nguyễn gad Hằng2',N'Hà Nội1', 5),
    ('HE130466',N'Nguyễn gsdf Hằng2',N'Hà Nội1', 5),
    ('HE130467',N'Nguyễn gsd Hằng2',N'Hà Nội1', 101)

-- Hien thi toan bo danh sach => SELECT 
SELECT * FROM sinh_vien