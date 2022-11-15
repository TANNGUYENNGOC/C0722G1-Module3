package controller;

import model.HinhThucThanhToan;
import model.ThueTro;
import repository.BaseRepository;
import service.IThueTroService;
import service.impl.ThueTroServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ThueTroServlet", value = "/thue_tro")
public class ThueTroServlet extends HttpServlet {
    private IThueTroService thueTroService = new ThueTroServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteThueTro(request,response);
                break;
            case "update":
                updateThueTro(request,response);
                break;
            case "searchNameOrSDT":
                searchThueTro(request,response);
                break;
            case "searchID":
                searchID(request,response);
                break;
            case "add":
                addThueTro(request, response);
                break;
        }
    }

    private void searchID(HttpServletRequest request, HttpServletResponse response) {
        int search = Integer.parseInt(request.getParameter("searchByID"));
        ThueTro thueTro = thueTroService.selectThueTro(search);
        List<ThueTro> thueTroList = new ArrayList<>();
        thueTroList.add(thueTro);
        request.setAttribute("thueTroList",thueTroList);
        try {
            request.getRequestDispatcher("thue_tro/danh_sach.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void searchThueTro(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("searchNameOrSDT");
        List<ThueTro> thueTroList = thueTroService.searchThueTro(search);
        request.setAttribute("thueTroList",thueTroList);
        try {
            request.getRequestDispatcher("thue_tro/danh_sach.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

//    private void searchThueTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<ThueTro> thueTroList = thueTroService.findAll();
//        List<ThueTro> thueTroListSearch = new ArrayList<>();
//        String searchInput = request.getParameter("search-input");
//        int brige;
//        try {
//            brige = Integer.parseInt(searchInput);
//        }catch (NumberFormatException e){
//            brige = -9;
//        }
//        for(int i=0;i<thueTroList.size();i++){
//            if( (thueTroList.get(i).getMaPhongTro()) == brige|| thueTroList.get(i).getTenNguoiThueTro().contains(searchInput)|| thueTroList.get(i).getSoDienThoai().equals(searchInput)){
//                thueTroListSearch.add(thueTroList.get(i));
//            }
//        }
//        thueTroList = thueTroListSearch;
//        request.setAttribute("thueTroList", thueTroList);
//            request.getRequestDispatcher("thue_tro/danh_sach.jsp").forward(request, response);
//
//    }

    private void deleteThueTro(HttpServletRequest request, HttpServletResponse response) {
        int maPhongTro = Integer.parseInt(request.getParameter("id"));
        thueTroService.deleteThueTro(maPhongTro);
        showList(request,response);
    }

    private void updateThueTro(HttpServletRequest request, HttpServletResponse response) {
        int maPhongTro = Integer.parseInt(request.getParameter("maPhongTro"));
        String tenNguoiThue = request.getParameter("tenNguoiThue");
        String soDienThoai = request.getParameter("soDienThoai");
        Date ngayBatDauThue = Date.valueOf(request.getParameter("ngayBatDauThue"));
        int mahinhThucThanhToan = Integer.parseInt(request.getParameter("maHinhThucThanhToan"));
        HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(mahinhThucThanhToan);
        ThueTro thueTro = new ThueTro(tenNguoiThue,soDienThoai,ngayBatDauThue,hinhThucThanhToan);
        thueTroService.updateThueTro(thueTro,maPhongTro);
        showList(request,response);
    }

    private List<HinhThucThanhToan> hinhThucThanhToanList() {
        List<HinhThucThanhToan> hinhThucThanhToanList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT*FROM hinh_thuc_thanh_toan;");
            ResultSet resultSet = ps.executeQuery();
            int maHinhThucThanhToan = resultSet.getInt("ma_hinh_thuc_thanh_toan");
            String hinhThucThanhToan = resultSet.getString("hinh_thuc_thanh_toan");
            HinhThucThanhToan hinhThucThanhToan1 = new HinhThucThanhToan(maHinhThucThanhToan, hinhThucThanhToan);
            hinhThucThanhToanList.add(hinhThucThanhToan1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return hinhThucThanhToanList;
    }

    private void addThueTro(HttpServletRequest request, HttpServletResponse response) {
        List<HinhThucThanhToan> hinhThucThanhToanList = hinhThucThanhToanList();
        request.setAttribute("hinhThucThanhToanList", hinhThucThanhToanList);
        try {
            request.getRequestDispatcher("thue_tro/danh_sach.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String tenNguoiThueTro = request.getParameter("tenNguoiThueTro");
        String soDienThoai = request.getParameter("soDienThoai");
        Date ngayBatDauThue = Date.valueOf(request.getParameter("ngayBatDauThue"));
        int maHinhThucThanhToan = Integer.parseInt(request.getParameter("maHinhThucThanhToan"));
        HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(maHinhThucThanhToan);
        ThueTro thueTro = new ThueTro(tenNguoiThueTro, soDienThoai, ngayBatDauThue, hinhThucThanhToan);
        thueTroService.add(thueTro);
        request.getRequestDispatcher("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                showFormUpdate(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int maPhongTro = Integer.parseInt(request.getParameter("maPhongTro"));
        ThueTro thueTro = thueTroService.selectThueTro(maPhongTro);
        request.setAttribute("thueTro", thueTro);
        try {
            request.getRequestDispatcher("thue_tro/sua.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<ThueTro> thueTroList = thueTroService.findAll();
        request.setAttribute("thueTroList", thueTroList);
        try {
            request.getRequestDispatcher("thue_tro/danh_sach.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
