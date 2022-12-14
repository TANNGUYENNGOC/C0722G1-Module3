<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/6/2022
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="d-flex">
    <a  href="/product?action=create">Thêm mới sản phẩm</a>
    <form style="margin-left: 150px" action="/product?action=search" method="post">
        <input type="text" name="name">
        <input type="submit" value="search name">
    </form>
</div>

<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">nameProduct</th>
        <th scope="col">priceProduct</th>
        <th scope="col">descriptionProduct</th>
        <th scope="col">manufacturer</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${product.getNameProduct()}</td>
            <td>${product.getPriceProduct()}</td>
            <td>${product.getDescriptionProduct()}</td>
            <td>${product.getManufacturer()}</td>
            <td>
                <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#exampleModal"
                        data-bs-whatever="@mdo"><a href="/product?action=delete&id=${product.getiD()}">Delete</a>
                </button>
            </td>
            <td><a href="/product?action=update&id=${product.getiD()}">Update</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
