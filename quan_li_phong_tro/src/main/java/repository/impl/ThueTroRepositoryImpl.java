package repository.impl;

import model.HinhThucThanhToan;
import model.ThueTro;
import repository.BaseRepository;
import repository.IThueTroRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ThueTroRepositoryImpl implements IThueTroRepository {
    private final static String SELECT_ALL_THUE_TRO = "SELECT thue_tro.*,hinh_thuc_thanh_toan.hinh_thuc_thanh_toan FROM thue_tro join hinh_thuc_thanh_toan on thue_tro.ma_hinh_thuc_thanh_toan = hinh_thuc_thanh_toan.ma_hinh_thuc_thanh_toan;";
    private final static String SELECT_MA_THUE_TRO = "SELECT*FROM thue_tro WHERE ma_phong_tro = ?;";
    private final String INSERT_THUE_TRO = "insert into thue_tro(ten_nguoi_thue_tro, so_dien_thoai, ngay_bat_dau_thue,ma_hinh_thuc_thanh_toan) values(?,?,?,?);";
    private static final String UPDATE_THUE_TRO = "update thue_tro set ten_nguoi_thue_tro = ?,so_dien_thoai= ?, ngay_bat_dau_thue =?,ma_hinh_thuc_thanh_toan=? where ma_phong_tro = ?;";
    private static final String DELETE_THUE_TRO = "delete from thue_tro where ma_phong_tro = ?;";
    private static final String SEARCH = "SELECT thue_tro.ma_phong_tro, thue_tro.ten_nguoi_thue_tro, thue_tro.so_dien_thoai,thue_tro.ngay_bat_dau_thue, hinh_thuc_thanh_toan.hinh_thuc_thanh_toan\n" +
            "FROM thue_tro JOIN hinh_thuc_thanh_toan ON thue_tro.ma_hinh_thuc_thanh_toan = hinh_thuc_thanh_toan.ma_hinh_thuc_thanh_toan WHERE ten_nguoi_thue_tro LIKE ? OR so_dien_thoai LIKE ?;";

    @Override
    public List<ThueTro> findAll() {
        List<ThueTro> thueTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_THUE_TRO);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int maPhongTro = resultSet.getInt("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("ten_nguoi_thue_tro");
                String so_dien_thoai = resultSet.getString("so_dien_thoai");
                Date ngayBatDauThue = resultSet.getDate("ngay_bat_dau_thue");
                String hinhThucThanhToan = resultSet.getString("hinh_thuc_thanh_toan");
                HinhThucThanhToan hinhThucThanhToan1 = new HinhThucThanhToan(hinhThucThanhToan);
                ThueTro thueTro = new ThueTro(maPhongTro, tenNguoiThueTro, so_dien_thoai, ngayBatDauThue, hinhThucThanhToan1);
                thueTroList.add(thueTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return thueTroList;
    }

    @Override
    public boolean add(ThueTro thueTro) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_THUE_TRO);
            ps.setString(1, thueTro.getTenNguoiThueTro());
            ps.setString(2, thueTro.getSoDienThoai());
            ps.setDate(3, thueTro.getNgayBatDauThue());
            ps.setInt(4, thueTro.getHinhThucThanhToan().getMaHinhThucThanhToan());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateThueTro(ThueTro thueTro, int maPhongTro) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_THUE_TRO);
            ps.setString(1, thueTro.getTenNguoiThueTro());
            ps.setString(2, thueTro.getSoDienThoai());
            ps.setDate(3, thueTro.getNgayBatDauThue());
            ps.setInt(4, thueTro.getHinhThucThanhToan().getMaHinhThucThanhToan());
            ps.setInt(5, maPhongTro);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public ThueTro selectThueTro(int maPhongTro) {
        ThueTro thueTro = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_MA_THUE_TRO);
            ps.setInt(1, maPhongTro);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String tenNguoiThueTro = resultSet.getString("ten_nguoi_thue_tro");
                String sdt = resultSet.getString("so_dien_thoai");
                Date ngayBatDauThue = resultSet.getDate("ngay_bat_dau_thue");
                int maHinhThucThanhToan = resultSet.getInt("ma_hinh_thuc_thanh_toan");
                HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(maHinhThucThanhToan);
                thueTro = new ThueTro(maPhongTro, tenNguoiThueTro, sdt, ngayBatDauThue, hinhThucThanhToan);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return thueTro;
    }

    @Override
    public boolean deleteThueTro(int maPhongTro) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_THUE_TRO);
            ps.setInt(1, maPhongTro);
            rowDelete = ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public List<ThueTro> searchThueTro(String searchInput) {
        List<ThueTro> thueTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH);
            ps.setString(1,"%"+searchInput+"%");
            ps.setString(2,"%"+searchInput+"%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int maPhongTro = resultSet.getInt("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("ten_nguoi_thue_tro");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                Date ngayBatDauThue = Date.valueOf(resultSet.getString("ngay_bat_dau_thue"));
                String tenHinhThucThanhToan = resultSet.getString("hinh_thuc_thanh_toan");
                HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(tenHinhThucThanhToan);
                ThueTro thueTro = new ThueTro(maPhongTro,tenNguoiThueTro,soDienThoai,ngayBatDauThue,hinhThucThanhToan);
                thueTroList.add(thueTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return thueTroList;
    }
}
