package model;

import java.sql.Date;

public class ThueTro {
    private int maPhongTro;
    private String tenNguoiThueTro;
    private String soDienThoai;
    private Date ngayBatDauThue;
    private  HinhThucThanhToan hinhThucThanhToan;

    public ThueTro(int maPhongTro, String tenNguoiThueTro, String soDienThoai, Date ngayBatDauThue, HinhThucThanhToan hinhThucThanhToan) {
        this.maPhongTro = maPhongTro;
        this.tenNguoiThueTro = tenNguoiThueTro;
        this.soDienThoai = soDienThoai;
        this.ngayBatDauThue = ngayBatDauThue;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public ThueTro(String tenNguoiThueTro, String soDienThoai, Date ngayBatDauThue, HinhThucThanhToan hinhThucThanhToan) {
        this.tenNguoiThueTro = tenNguoiThueTro;
        this.soDienThoai = soDienThoai;
        this.ngayBatDauThue = ngayBatDauThue;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public int getMaPhongTro() {
        return maPhongTro;
    }

    public void setMaPhongTro(int maPhongTro) {
        this.maPhongTro = maPhongTro;
    }

    public String getTenNguoiThueTro() {
        return tenNguoiThueTro;
    }

    public void setTenNguoiThueTro(String tenNguoiThueTro) {
        this.tenNguoiThueTro = tenNguoiThueTro;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public Date getNgayBatDauThue() {
        return ngayBatDauThue;
    }

    public void setNgayBatDauThue(Date ngayBatDauThue) {
        this.ngayBatDauThue = ngayBatDauThue;
    }

    public HinhThucThanhToan getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(HinhThucThanhToan hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }
}
