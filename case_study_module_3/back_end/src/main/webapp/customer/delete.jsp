<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/9/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<div class="container-fluid vh-100">
    <div class="header col-xl-12 d-flex " style="height: 15%;font-size: 12.5px">
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
    <div class="row sticky-top" style="margin-bottom: 10px;height: 10%">
        <div class="col-xl-8 " style="background-color: #0d6056;padding-top: 5px">
            <ul class="nav  justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" style="color: white" aria-current="page"
                       href="http://localhost:63342/font_end/index.html?_ijt=h2m45sa76s23id5kgintmqo1a7">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                       href="http://localhost:63342/font_end/service/index.html?_ijt=s8gbt172efd8ddbjvhop7rue7c"
                       style="color: white">Service</a>
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
    <!--    <div class="vh-100"></div>-->

    <div class="row d-flex" style="height: 60%;margin-bottom: 10px">
        <div class="col-xl-3"></div>
        <div class="col-xl-6">
            <h2 class="text-uppercase text-center mb-5">DELETE ARE YOU OK ???</h2>
            <form class="row d-flex" method="post" action="/customer?action=delete">
                <div class="col-5">

                    <div class="form-outline mb-4">
                        <input readonly name="customerTypeId" type="text"  class="form-control form-control-lg"
                               value="${customer.getCustomerTypeId()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="name" type="text"  class="form-control form-control-lg"
                               value="${customer.getName()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="dateOfBirth" type="text"  class="form-control form-control-lg"
                               value="${customer.getDateOfBirth()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="Gender" type="text"  class="form-control form-control-lg"
                               value="${customer.isGender()}"/>
                    </div>

                    <div class="form-outline mb-4">
                        <input  name="id" type="hidden"  class="form-control form-control-lg"
                                value="${customer.getId()}"/>
                    </div>
                </div>
                <div class="col-2"></div>
                <div class="col-5">
                    <div class="form-outline mb-4">
                        <input readonly name="idCard" type="text"  class="form-control form-control-lg"
                               value="${customer.getIdCard()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="phoneNumber" type="text"  class="form-control form-control-lg" value="${customer.getId()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="email" type="text"  class="form-control form-control-lg"
                               value="${customer.getPhoneNumber()}"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input readonly name="address" type="text"  class="form-control form-control-lg"
                               value="${customer.getEmail()}"/>
                    </div>

                    <div class="d-flex">
                        <button class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                            DELETE
                        </button>
                    </div>
                </div>


                <!--                                    <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="#!"-->
                <!--                                                                                                            class="fw-bold text-body"><u>Login here</u></a></p>-->
            </form>
        </div>
        <div class="col-xl-3"></div>
        <h1></h1>
        <h1></h1>
        <div class="row" style="background-color: #0d6056;height: 10%;width: 100%">
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
