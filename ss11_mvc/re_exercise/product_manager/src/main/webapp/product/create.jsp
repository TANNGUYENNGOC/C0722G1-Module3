<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/6/2022
  Time: 5:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Đây là trang thêm mới sản phẩm</h1>
    <a href="/product">Quay lại list</a>
    <c:if test="${mess!=null}">
        <span style="color: red">${mess}</span>
    </c:if>
    <form action="/product?action=create" method="post">
        <pre>ID:            <input type="text" name="iD"></pre>
        <pre>Name product:  <input type="text" name="nameProduct"></pre>
        <pre>Price product:  <input type="text" name="priceProduct"></pre>
        <pre>Description product: <input type="text" name="descriptionProduct"></pre>
        <pre>Manufacturer:       <input type="text" name="manufacturer"></pre>
        <pre><button>Thêm mới</button></pre>
    </form>
</body>
</html>
