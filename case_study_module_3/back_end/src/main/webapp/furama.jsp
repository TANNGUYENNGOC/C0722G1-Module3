<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/8/2022
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <div class="col-xl-4">
            <img src="img/Screenshot 2022-11-01 162539.png" height="70px" width="200"/></div>
        <div class="d-flex col-xl-3" style="height: 100%">
            <img src="img/address.png" height="48" width="48"/>
            <p>
                103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam <br>
                7.0 km từ Sân bay Quốc tế Đà Nẵng</p>
        </div>
        <div class=" col-xl-3" style="padding-left: 30px">
            <div class="col-xl-6 d-flex">
                <img src="img/phone.png" height="30px" width="30px"/>
                <p>84-236-3847 333/888</p>
            </div>
            <div class="col-xl-6 d-flex">
                <img src="img/mail.png" height="30px" width="30px"/>
                <p>reservation@furamavietnam.com</p>
            </div>

        </div>
    </div>
    <div class="row sticky-top" style="height: 10%">
        <div class="col-xl-8 " style="background-color: #0d6056;padding-top: 5px">
            <ul class="nav  justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" style="color: white" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customer" style="color: white">Customer</a>
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
    <div class="row" style="height: 70%">
        <div class="col-xl-2">
            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>
                <button style="background-color: #fff;color: #0d6056;border-color: white" type="button"
                        class="btn btn-primary">Button
                </button>


            </div>
        </div>
        <div class="col-xl-10" style="border-left: solid #0d6056 2px">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img style="height: 400px"
                             src="https://channel.mediacdn.vn/2020/9/17/photo-1-1600314136939484390371.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img style="height: 400px"
                             src="https://media.ex-cdn.com/EXP/media.vntravellive.com/files/maihonguyenkieu/2019/09/21/5225-nhung-resort-sang-trong-nhat-the-gioi-115141.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img style="height: 400px"
                             src="https://dichoi.com.vn/uploads/001-Dichoi/1-La-ban-du-lich/6-Resort-nghi-duong/10-resort-viet-nam-duoc-vinh-danh-the-gioi-phan-2/10-resort-viet-nam-duoc-vinh-danh-the-gioi-phan-2-1.JPG"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid atque cum dignissimos, impedit iure
                porro praesentium repudiandae! Atque, dolorum eos et ex id iste maiores molestiae reiciendis! Dolorum
                facere mollitia nemo rem sint veniam veritatis! Aspernatur at consequuntur cum deserunt dolores, ducimus
                eius laborum, magnam nulla odit perferendis praesentium quas sit voluptatibus voluptatum. Deserunt
                possimus quaerat quam quas velit! Alias beatae delectus, deserunt distinctio doloribus ducimus eaque
                eius eum exercitationem facere impedit incidunt ipsam laboriosam minus molestias mollitia, natus nisi
                obcaecati omnis praesentium quam quia quibusdam quidem quis ratione, recusandae rem sed sequi similique
                soluta suscipit tempora ut vel vero voluptatem voluptates voluptatum! Ab accusamus adipisci aliquam
                aliquid asperiores dicta dolor dolores doloribus, excepturi fugit illo itaque molestias nam
                necessitatibus perspiciatis quos sequi voluptatem. Ab accusamus adipisci aliquam amet blanditiis
                consequuntur culpa cupiditate doloribus enim fugiat iusto nam necessitatibus odio odit omnis
                perspiciatis quibusdam repudiandae, sapiente sit soluta temporibus tenetur, totam unde voluptates
                voluptatibus? Adipisci amet, atque cupiditate eaque error est excepturi, explicabo ipsa iure laudantium
                minima mollitia neque non nostrum obcaecati pariatur porro, possimus quaerat quasi ratione repudiandae
                sequi similique sit soluta sunt velit vero voluptate. A, asperiores beatae cumque, dignissimos ducimus
                enim est illum nisi obcaecati praesentium quia quis rem reprehenderit, sed tenetur totam unde velit!
                Expedita illum iure nostrum odio ullam. Doloribus eius esse est tenetur voluptatibus. Consectetur,
                deleniti, pariatur? Cumque error, fuga, hic impedit, magni perspiciatis placeat quia quidem repellat
                velit vero voluptates? Aspernatur deleniti fugit obcaecati pariatur quod saepe, voluptatum? Ad
                asperiores assumenda, deserunt dignissimos doloribus dolorum et explicabo facere illo incidunt iure
                laboriosam libero minus molestiae natus necessitatibus odio optio, quis quod repudiandae similique sint
                sunt, tempore tenetur veniam veritatis vero voluptatem. Aperiam doloremque ea facilis nostrum. Ab
                accusamus autem beatae commodi eligendi et eum iste laboriosam minima, nisi officia optio porro tenetur
                voluptas!</p>
        </div>

        <div class="row" style="background-color: #0d6056;height: 10%">

        </div>


    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</html>
