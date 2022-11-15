<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/13/2022
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="row d-flex">
    <div class="col-8">
        <nav class="navbar bg-light">
            <div class="container-fluid">
                <form class="d-flex" role="search" action="/thue_tro?action=searchNameOrSDT" method="post">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm tên hoặc SDT" aria-label="Search" name="search-input">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <div class="col-4" style="text-align: center;justify-items: center">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#create" data-bs-whatever="@mdo">Thêm mới</button>
    </div>

</div>

<nav class="navbar bg-light">
    <div class="container-fluid">
        <form class="d-flex" role="search" action="/thue_tro?action=searchID" method="post">
            <input class="form-control me-2" type="search" placeholder="Search ID" aria-label="Search" name="searchByID">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>

<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tên người thuê</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Ngày bắt đầu thuê</th>
        <th scope="col">Hình thức thanh toán</th>
        <th scope="col">Xóa</th>
        <th scope="col">Sửa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="thueTro" varStatus="status" items="${thueTroList}">
    <tr>
        <th scope="row">${status.count}</th>
        <td>${thueTro.getTenNguoiThueTro()}</td>
        <td>${thueTro.getSoDienThoai()}</td>
        <td>${thueTro.getNgayBatDauThue()}</td>
        <td>${thueTro.getHinhThucThanhToan().getHinhThucThanhToan()}</td>
        <td><button onclick="modalXoa('${thueTro.getMaPhongTro()}','${thueTro.getTenNguoiThueTro()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delete">
         Xóa
        </button></td>
        <td><button onclick="location.href='/thue_tro?action=update&maPhongTro=${thueTro.getMaPhongTro()}'" type="button" class="btn btn-success" >Sửa</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<%--modal xoa--%>
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Cảnh báo</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Bạn có muốn xóa:</span>
                <span style="color: red" id="name"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="/thue_tro?action=delete" method="post">
                    <input type="text" hidden name="id" id="idXoa">
                    <button type="submit" class="btn btn-primary" >Xóa</button>
                </form>

            </div>
        </div>
    </div>
</div>
<%--modal them moi--%>
<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel1">Thêm mới</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/thue_tro?action=add" method="post">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Tên người thê trọ</label>
                        <input required pattern="^([A-Z][a-z]+[ ])+([A-Z][a-z]+)$" title="Chỉ có chữ cái từ a đến z và khoảng trống được phép có trong tên;
Ký tự đầu và cuối phải là chữ cái;
Họ tên phải bao gồm ít nhất 2 từ (chữ) trở lên;
Giữa các từ chỉ có một dấu cách;" type="text" class="form-control" id="recipient-name" name="tenNguoiThueTro">
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name1" class="col-form-label">Số điện thoại</label>
                        <input required pattern="0[0-9]{9}" title="Số điện thoại bắt đầu bằng 0 và có 10 chữ số" type="text" class="form-control" id="recipient-name1" name="soDienThoai">
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name2" class="col-form-label">Ngày bắt đầu thuê</label>
                        <input required type="date" class="form-control" id="recipient-name2" name="ngayBatDauThue">
                    </div>
                    <div class="mb-3">
                        <label class="col-form-label" for="">Hình thức thanh toán</label>
                    <select required class="form-select" aria-label="Default select example" name="maHinhThucThanhToan">
                        <option selected></option>
                        <option  value="1">Tháng</option>
                        <option  value="2">Quý</option>
                        <option  value="3">Năm</option>
                    </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button class="btn btn-primary">Thêm mới</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


</body>
<script>
function modalXoa(id,name) {
document.getElementById("idXoa").value =id;
document.getElementById("name").innerText =name;

}
</script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>
