<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/5/2022
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Bạn có chắc xóa sản phẩm này không ???</h3>
<a href="/product"><button>Quay lại danh sách sản phẩm</button></a>
<form action="/product?action=delete" method="post">
    <table>
        <tr>
            <td hidden>ID</td>
            <td>Tên</td>
            <td>Giá</td>
        </tr>
        <tr>
            <td hidden><input type="text" name="id" value="${product.getId()}"></td>
            <td><input type="text" name="name" value="${product.getName()}" readonly></td>
            <td><input type="text" name="price" value="${product.getPrice()}" readonly></td>
        </tr>
    </table>
    <button>Xóa</button>
</form>

</body>
</html>
