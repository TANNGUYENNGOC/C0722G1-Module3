<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/5/2022
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="/product?action=add">Thêm mới sản phẩm</a>

<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Giá sản phẩm</th>
        <th scope="col">Mô tả</th>
        <th scope="col">Nhà sản xuất</th>
        <th scope="col">Xóa</th>
        <th scope="col">Cập nhật</th>
    </tr>
    </thead>
    <c:forEach var="produc" items = "${productList}">
    <tr>
        <td>${produc.getiD()}</td>
        <td>${produc.getNameProduct()}</td>
        <td>${produc.getPriceProduct()}</td>
        <td>${produc.getDescriptionProduct()}</td>
        <td>${produc.getManufacturer()}</td>
        <td><a href="/product?action=delete&id=${produc.getiD()}"><button>Delete</button></a></td>
        <td><a href="/product?action=update&id=${produc.getiD()}"><button>Update</button></a></td>
        <td><a href="/product?action=display&id=${produc.getiD()}"><button>Thông tin chi tiết</button></a></td>
    </tr>
    </c:forEach>

</body>
</html>
