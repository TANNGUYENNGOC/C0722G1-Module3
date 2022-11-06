<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/6/2022
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Quay lại list</a>
<form action="/product?action=update" method="post">
    <pre>ID:            <input type="hidden" name="iD" value="${product.getiD()}"></pre>
    <pre>Name product:  <input type="text" name="nameProduct" value="${product.getNameProduct()}"></pre>
    <pre>Price product:  <input type="text" name="priceProduct" value="${product.getPriceProduct()}"></pre>
    <pre>Description product: <input type="text" name="descriptionProduct" value="${product.getDescriptionProduct()}"></pre>
    <pre>Manufacturer:       <input type="text" name="manufacturer" value="${product.getManufacturer()}" ></pre>
    <pre><button>Save</button></pre>
</form>
</body>
</html>
