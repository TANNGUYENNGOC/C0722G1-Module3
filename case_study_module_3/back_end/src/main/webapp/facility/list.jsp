<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/10/2022
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Facility</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
    <div class="row sticky-top" style="height: 10%">
        <div class="col-xl-8 " style="background-color: #0d6056;padding-top: 5px">
            <ul class="nav  justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" style="color: white" aria-current="page"
                       href="font_end/index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Customer</a>
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
            <form class="d-flex" role="search">
                <input style="height: 80%" class="form-control me-2" type="search" placeholder="Search"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit"
                        style="background-color: #5c636a;height: 80%;border: 2px solid yellow;color: white">Search
                </button>
            </form>
        </div>
    </div>
    <div class="row text-center d-flex" style="height: 10%;color: #0d6056;margin-top: 10px">
        <div class="col-xl-10">
            <h1>LIST FACILITY</h1>

        </div>

    </div>

    <div class="row" style="height: 70%">
        <div class="col-xl-12">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Area</th>
                    <th scope="col">Cost</th>
                    <th scope="col">Max people</th>
                    <th scope="col">Rent type</th>
                    <th scope="col">Facility type</th>
                    <th scope="col">Standard room</th>
                    <th scope="col">Description other convenience</th>
                    <th scope="col">Pool area</th>
                    <th scope="col">Number of floors</th>
                    <th scope="col">Facility free</th>
                    <th colspan="2" scope="col">
                        <div class="dropdown" >
                            <button style="background-color: #0d6056" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ADD Facility
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/facility?action=add_room">ADD Room</a></li>
                                <li><a class="dropdown-item" href="/facility?action=add_house">ADD House</a></li>
                                <li><a class="dropdown-item" href="/facility?action=add_villa">ADD Villa</a></li>
                            </ul>
                        </div>
                    </th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="facility" items="${facilityList}" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td>${facility.getName()}</td>
                        <td>${facility.getArea()}</td>
                        <td>${facility.getCost()}</td>
                        <td>${facility.getMax_people()}</td>
                        <td>${facility.getRentTypeId().getName()}</td>
                        <td>${facility.getFacilityTypeId().getName()}</td>
                        <td>${facility.getStandardRoom()}</td>
                        <td>${facility.getDescriptionOtherConvenience()}</td>
                        <td>${facility.getPoolArea()}</td>
                        <td>${facility.getNumberOfFloors()}</td>
                        <td>${facility.getFacilityree()}</td>

                        <td>
                            <button type="button" class="btn btn-outline-success"><a style="text-decoration: none;color: green" href="/facility?action=update&id=${facility.getId()}">Update</a></button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-outline-success"><a style="text-decoration: none;color: green" href="/facility?action=delete&id=${facility.getId()}">Delete</a></button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
