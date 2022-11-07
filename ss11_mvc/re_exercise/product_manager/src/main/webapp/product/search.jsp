<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/7/2022
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Result search</title>
</head>
<body>
<a href="/product">Quay lại list</a>
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
</html>
