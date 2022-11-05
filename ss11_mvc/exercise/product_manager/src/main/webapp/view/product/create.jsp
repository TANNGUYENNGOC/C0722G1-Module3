<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/5/2022
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Đây là trang thêm mới sản phẩm</h1>
<a href="/product">Quay lại</a>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<form action="/product?action=add" method="post">
    <pre>ID:            <input type="text" name="iD"></pre>
    <pre>Name product:  <input type="text" name="nameProduct"></pre>
    <pre>Price product:  <input type="text" name="priceProduct"></pre>
    <pre>Description product: <input type="text" name="descriptionProduct"></pre>
    <pre>Manufacturer:       <input type="text" name="manufacturer"></pre>
    <pre><button>Save</button></pre>
</form>

</body>
</html>
