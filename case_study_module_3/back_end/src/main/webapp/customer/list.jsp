<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/8/2022
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid vh-100">
    <div class="header col-xl-12 d-flex " style="height: 15%;margin-top: 10px;font-size: 12.5px">
        <div class="col-xl-2">
            <img style="height: 90%" src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png"
                 alt=" Logo Header Menu">
        </div>
        <div class="col-xl-4"><img src="../img/Screenshot 2022-11-01 162539.png" height="124" width="321"/>
        </div>
        <div class="d-flex col-xl-3" style="height: 100%">
            <img src="../img/address.png" height="48" width="48"/>
            <p>
                103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam <br>
                7.0 km từ Sân bay Quốc tế Đà Nẵng</p>
        </div>
        <div class=" col-xl-3" style="padding-left: 30px">
            <div class="col-xl-6 d-flex">
                <img src="../img/phone.png" height="30" width="30"/>
                <p>84-236-3847 333/888</p>
            </div>
            <div class="col-xl-6 d-flex">
                <img src="../img/mail.png" height="30px" width="30px"/>
                <p>reservation@furamavietnam.com</p>
            </div>

        </div>
    </div>
    <div class="row sticky-top" style="height: 10%;margin-bottom: 10px" >
        <div class="col-xl-8 " style="background-color: #0d6056;padding-top: 5px">
            <ul class="nav  justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" style="color: white" aria-current="page" href="furama.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:63342/font_end/employee/index.html?_ijt=htp4mcrmci0qvb9al37iu25j86" style="color: white">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customer" style="color: white">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Contract</a>
                </li>
            </ul>
        </div>
        <div class="col-xl-4" style="background-color: #0d6056;padding-top: 10px">
            <form class="d-flex" role="search" action="/customer?action=search" method="post">
                <input style="height: 80%" class="form-control me-2" type="search" placeholder="Search"
                       aria-label="Search" name="search">
                <button  class="btn btn-outline-success" type="submit"
                        style="background-color: #5c636a;height: 80%;border: 2px solid yellow;color: white">Search
                </button>
            </form>
        </div>
    </div>
    <div class="row text-center d-flex" style="height: 10%;color: #0d6056">
        <div class="col-xl-10">
            <h1>LIST CUSTOMER</h1>

        </div>
        <div class="col-xl-2">
            <h1>
            </h1>
        </div>
    </div>

    <div class="row" style="height: 70%">
        <div class="col-xl-12">
            <table id="tableCustomer" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Customer type id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Date of birth</th>
                    <th scope="col">Gender</th>
                    <th scope="col">ID card</th>
                    <th scope="col">Phone number</th>
                    <th scope="col">Email</th>
                    <th  scope="col">Address</th>
                    <th  scope="col" style="text-align: center">
                        <a class="btn btn-primary" href="/customer?action=add" role="button">ADD Customer</a>
                    </th>

                </tr>
                </thead>
                <tbody>
<c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.getId()}</td>
                        <td>${customer.getCustomerTypeId()}</td>
                        <td>${customer.getName()}</td>
                        <td>${customer.getDateOfBirth()}</td>
                        <td>${customer.isGender()}</td>
                        <td>${customer.getIdCard()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getAddress()}</td>
                        <td><button type="button" class="btn btn-outline-success"><a style="text-decoration: none;color: green" href="/customer?action=update&id=${customer.getId()}">UPDATE</a></button></td>
                        <td><button onclick="modalDelete('${customer.getId()}','${customer.getName()}')" type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">DELETE</button></td>
                    </tr>
    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
<!-- delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <input hidden type="text" id="idCustomer">
               <span>Bạn có muốn xóa:  </span><span style="color: red" id="name"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="/customer?action=delete" method="get">
                    <input type="text" hidden id="id" name="id" value="delete">
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<div class="row" style="background-color: #0d6056;height: 10%">--%>

<%--</div>--%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">


</script>
<script>
    function modalDelete(id,name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }
</script>


<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap5.min.js"></script>


<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        });
    });
</script>
</html>
