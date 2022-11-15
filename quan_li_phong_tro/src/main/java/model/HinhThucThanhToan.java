package model;

public class HinhThucThanhToan {
    private int maHinhThucThanhToan;
    private String hinhThucThanhToan;

    public HinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public HinhThucThanhToan(int maHinhThucThanhToan) {
        this.maHinhThucThanhToan = maHinhThucThanhToan;
    }

    public HinhThucThanhToan(int maHinhThucThanhToan, String hinhThucThanhToan) {
        this.maHinhThucThanhToan = maHinhThucThanhToan;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public int getMaHinhThucThanhToan() {
        return maHinhThucThanhToan;
    }

    public void setMaHinhThucThanhToan(int maHinhThucThanhToan) {
        this.maHinhThucThanhToan = maHinhThucThanhToan;
    }

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }
}
