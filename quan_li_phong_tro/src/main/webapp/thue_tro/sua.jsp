<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/13/2022
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <div class="row"><h1 class="text-center">Cập nhật thông tin</h1></div>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <form action="/thue_tro?action=update" method="post">
                <div hidden class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Mã phòng trọ</label>
                    <input name="maPhongTro" value="${thueTro.getMaPhongTro()}"  class="form-control" >
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Tên người thuê trọ</label>
                    <input name="tenNguoiThue" value="${thueTro.getTenNguoiThueTro()}"  class="form-control">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
                    <input name="soDienThoai" value="${thueTro.getSoDienThoai()}"  class="form-control">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Ngày bắt đầu thuê</label>
                    <input name="ngayBatDauThue" value="${thueTro.getNgayBatDauThue()}"  class="form-control" id="exampleInputEmail1" >
                </div>
                <div class="mb-3">
                    <select class="form-select" aria-label="Default select example" name="maHinhThucThanhToan">
                        <option selected>Hình thức thanh toán</option>
                        <option value="1"${thueTro.getHinhThucThanhToan().getMaHinhThucThanhToan()==1?"selected": ""}>Tháng</option>
                        <option value="2"${thueTro.getHinhThucThanhToan().getMaHinhThucThanhToan()==2?"selected": ""}>Quý</option>
                        <option value="3"${thueTro.getHinhThucThanhToan().getMaHinhThucThanhToan()==3?"selected": ""}>Năm</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
        <div class="col-3"></div>
    </div>


</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</html>
