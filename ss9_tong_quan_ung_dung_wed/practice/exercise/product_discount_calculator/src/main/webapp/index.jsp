<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/2/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display-discount" method="post">
    <input  name="mota" type="text" placeholder="Product Description">
    <input name="n1" type="text" placeholder="List Price">
    <input name="n2" type="text" placeholder="Discount Percent">
    <button type="submit">Submit</button>
  </form>
  </body>
</html>
