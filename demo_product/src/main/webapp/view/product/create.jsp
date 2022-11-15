<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 11/10/2022
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/product">Quay lại trang list</a>
<p style="color: red">${mess}</p>
<form action="/product?action=add" method="post">
<%--    <input type="text" name="productCode" required--%>
<%--          pattern="M-\d{4}" title="Code chưa đúng định dạng " placeholder="nhập mã"><br><br><br>--%>
    <input type="text" name="productCode" value="${productCode}"
            placeholder="nhập mã"><br>
      <c:if test="${!errorMap.isEmpty()}">
          <p style="color:red;"> ${errorMap.get('productCode')}</p><br>
      </c:if>
    <input type="text" name="name" placeholder="nhập tên" value="${name}"> <br><br>
    <input type="number" value="${price}" name="price" placeholder="nhập số lượng"><br>
    <c:if test="${!errorMap.isEmpty()}">
        <p style="color: #ff0000"> ${errorMap.get('price')}</p><br>
    </c:if>
    <select name="productTypeId">
        <c:forEach var="tp" items="${productTypeList}">
            <option value="${tp.id}">${tp.name}</option>
        </c:forEach>
        <option></option>
    </select><br><br>
    <button>Thêm mới</button>
</form>
<script>

</script>
</body>
</html>
