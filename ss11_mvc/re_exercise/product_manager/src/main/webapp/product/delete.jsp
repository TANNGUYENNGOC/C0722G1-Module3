<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/6/2022
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>BẠn có muốn xóa ??</h1>
<a href="product/list.jsp">Quay lại list</a>
<form action="/product?action=delete" method="post">
    <pre>ID:            <input type="hidden" name="iD" value="${product.getiD()}"></pre>
    <pre>Name product:  <input type="text" name="nameProduct" value="${product.getNameProduct()}"readonly></pre>
    <pre>Price product:  <input type="text" name="priceProduct" value="${product.getPriceProduct()}"readonly></pre>
    <pre>Description product: <input type="text" name="descriptionProduct" value="${product.getDescriptionProduct()}"readonly></pre>
    <pre>Manufacturer:       <input type="text" name="manufacturer" value="${product.getManufacturer()}" readonly></pre>
    <pre><button>Save</button></pre>
</form>
</body>
</html>
