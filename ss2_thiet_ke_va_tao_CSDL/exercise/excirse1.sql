create database quan_li_vat_tu;
use quan_li_vat_tu;

create table phieu_xuat(
	so_phieu_xuat int primary key,
    ngay_xuat datetime not null
);

create TABLE vat_tu(
	ma_vat_tu int primary key,
    ten_vat_tu nvarchar(50)
);

create table chi_tiet_phieu_xuat(
	don_gia_xuat int,
    so_luong_xuat int,
    so_phieu_xuat int,
    ma_vat_tu int,
    primary key(so_phieu_xuat, ma_vat_tu),
    foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);

CREATE TABLE phieu_nhap(
	so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATETIME
);

CREATE TABLE chi_tiet_phieu_nhap(
	don_gia_nhap INT,
    so_luong_nhap INT,
    ma_vat_tu int,
    so_phieu_nhap INT,
    PRIMARY KEY(ma_vat_tu, so_phieu_nhap),
    FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
    FOREIGN KEY(so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap)
);

CREATE TABLE don_dat_hang(
	so_dat_hang int PRIMARY KEY,
    ngay_dat_hang DATETIME
);

CREATE TABLE chi_tiet_don_dat_hang(
	ma_vat_tu int,
    so_dat_hang int,
    PRIMARY KEY(ma_vat_tu, so_dat_hang),
    FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
    FOREIGN KEY(so_dat_hang) REFERENCES don_dat_hang(so_dat_hang)
);

CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT PRIMARY KEY,
    ten_nha_cung_cap NVARCHAR(100),
    dia_chi NVARCHAR(100),
    so_dien_thoai VARCHAR(10)
);

CREATE TABLE cung_cap(
	ma_nha_cung_cap INT,
    so_dat_hang INT,
    PRIMARY KEY(ma_nha_cung_cap, so_dat_hang),
    FOREIGN KEY(ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap),
    FOREIGN KEY(so_dat_hang) REFERENCES don_dat_hang(so_dat_hang)
);


