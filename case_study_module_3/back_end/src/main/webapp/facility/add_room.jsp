<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/11/2022
  Time: 8:30 PM
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
                       href="http://localhost:63342/font_end/index.html?_ijt=h2m45sa76s23id5kgintmqo1a7">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:63342/font_end/service/index.html?_ijt=s8gbt172efd8ddbjvhop7rue7c" style="color: white">Service</a>
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
    <div style="padding: 20px">
        <form style="margin-top: 15px" action="/facility?action=add" method="post">
            <div class="form-content">
                <div class="row">
                    <div class="col-md-6">

                        <div hidden class="form-group">
                            <label>Id</label>
                            <input style="border-radius: 30px" type="text" class="form-control" name="id" placeholder="id *"/>
                        </div>
                        <div class="form-group">
                            <label>Name</label>

                            <input style="border-radius: 30px" type="text" class="form-control" name="name"
                                   placeholder="name *"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Area</label>
                            <input style="border-radius: 30px" type="text" class="form-control" name="area"
                                   placeholder="area*"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Cost</label>

                            <input style="border-radius: 30px" type="text" class="form-control" name="cost"
                                   placeholder="cost *"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Select People Number</label>
                            <select name="maxPeople" class="form-select" aria-label="Default select example"
                                    style="border-radius: 30px">
                                <option selected>SELECT People Number *</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </div>

                        <br>
                        <div hidden class="form-group">
                            <label>Facility Type Id</label>
                            <select name="facilityTypeID" class="form-select" aria-label="Default select example"
                                    style="border-radius: 30px">
                                <option value="3"${facility.getRentTypeId()}>Room</option>
                            </select>
                        </div>
                        <br>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Rent Type Id</label>
                            <select name="rentTypeID" class="form-select" aria-label="Default select example"
                                    style="border-radius: 30px">
                                <option selected>SELECT RENTAL TYPE *</option>
                                <option value="1">year</option>
                                <option value="2">month</option>
                                <option value="3">day</option>
                                <option value="4">hour</option>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Standard Room</label>
                            <select style="border-radius: 30px" class="form-select" aria-label="Default select example" name="standardRoom">
                                <option value="Standard Room *" selected>SELECT STANDARD ROOM</option>
                                <option value="Vip">Vip</option>
                                <option value="Normal">Normal</option>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Description Other Convenience</label>

                            <input style="border-radius: 30px" type="text" class="form-control"
                                   name="descriptionOtherConvenience"
                                   placeholder="descriptionOtherConvenience *"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Facility Free</label>
                            <input style="border-radius: 30px" type="text" class="form-control" name="facilityFree"
                                   placeholder="facilityFree *"/>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-outline-success">Submit</button>
                        <br>
                        <div hidden class="form-group">
                            <label>Pool Area</label>

                            <input style="border-radius: 30px" type="text" class="form-control" name="poolArea"
                                   placeholder="poolArea *" value="0.0"/>
                        </div>
                        <br>
                        <div hidden class="form-group">
                            <label>Number Of Floors</label>

                            <input style="border-radius: 30px" type="text" class="form-control" name="numberOfFloors"
                                   placeholder="numberOfFloors *" value="0"/>
                        </div>
                        <br>


                    </div>
                </div>
                <br>
            </div>
        </form>
    </div>



</div>
</div>

</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
</html>
