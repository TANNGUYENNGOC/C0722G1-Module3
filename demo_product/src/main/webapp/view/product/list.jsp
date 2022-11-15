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
<h1> Danh sách sản phẩm</h1>
<p>${mess}</p>
<a href="/product?action=add">Thêm mới</a>
 <table class="table table-dark">
     <tr>
         <th>STT</th>
         <th>Id</th>
         <th>Product code</th>
         <th>Name</th>
         <th>price</th>
         <th>Product Type</th>
         <th>Delete</th>
     </tr>
     <c:forEach var="product" items="${productList}" varStatus="status">
         <tr>
             <td>${status.count}</td>
             <td>${product.getId()}</td>
             <td>${product.getProductCode()}</td>
             <td>${product.getName()}</td>
             <td>${product.getPrice()}</td>
             <td>${product.getProductType().getName()}</td>
             <td>
                 <button type="button" onclick="infoDelete('${product.getId()}','${product.getName()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                     Delete
                 </button>
             </td>
         </tr>
     </c:forEach>

 </table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span> Bạn có muốn xoá sản phẩm </span><span id="deleteName"></span>
            </div>
            <form action="/product" method="post">
                <div class="modal-footer">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden name="deleteId" id="deleteId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function infoDelete( id, name) {
       document.getElementById("deleteId").value=id;
       document.getElementById("deleteName").innerText=name;
    }
</script>
</body>
</html>
