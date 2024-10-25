<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib
        uri="http://www.springframework.org/tags/form" prefix="sf" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Bán hàng tại quầy</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
            integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="../../../resources/css/BanHangTaiQuay.css"
    />
    <style>
        .form-input-check {
            outline: none;
            border: none;
            background-color: rgb(252, 250, 250);
            text-align: right;
        }

        #customer-need-to-pay {
            color: #005cbf;
            font-weight: bold;
        }

        #listSP {
            height: 530px;
            overflow: auto;
        }

        #redirect-pay-form {
            width: 100%;
        }

        .button {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #scroll-kh {
            max-height: 500px;
            overflow: auto;
        }

        #textCodeCheck {
            border: 1px solid grey;
            background-color: rgb(237, 237, 237);
            outline: none;
            margin-right: 10px;
            border-radius: 5px;
        }

        #search-input {
            border: 1px solid grey;
            outline: none;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-right: none;

        }

        #search-btn {
            border: 1px solid grey;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-left: none;
            background-color: rgb(255, 255, 255);
        }

        .card-product {
            position: relative;

        }

        .notification {
            position: absolute;
            top: 0px;
            right: 0px;
            border: 1px solid rgb(184, 184, 184);
            border-right: none;
            border-top: none;
            border-bottom-left-radius: 10px;
            width: 40px;
            height: 30px;
            background-color: red;
            color: white;
            box-shadow: -2px 2px 5px rgb(156, 156, 156);
            text-align: center;
        }

        .attribute {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            font-weight: bold;
        }

        .showOrno {
            cursor: pointer;
            color: #cccccc;
            font-size: smaller;
        }

        .a {
            font-weight: bold;
        }

        #textCodeCheck {
            cursor: pointer;
        }

        #reset {
            margin-left: 10px;
            background: white;
            border-radius: 5px;
            outline: none;
            border: 1px solid gray;


        }

        #modal-detailProduct {
            display: flex;
        }

        #detailProduct-img {
            margin-right: 20px;
            max-width: 250px;
        }

        #detailProduct-info {
            width: 70%;
            line-height: 40px;
            font-weight: bolder;
        }

        #detailProduct-info > p > input {
            line-height: 30px;

        }

        #detailProduct-name {
            font-size: 30px;
        }

        .color, .sizeProduct {
            border: 1px solid black;
            background-color: #ffffff;
            cursor: pointer;
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-right: 5px;
            margin-left: 5px;
            border-radius: 2px;
        }

        #detailProduct-price {
            color: red;
            font-size: x-large;
        }

        #detailProduct-price > del {
            color: black;
            font-size: 15px;
        }

        #detailProduct-price > span {
            font-size: smaller;
            background-color: yellow;
            color: red;
        }

        #inventory {
            display: none;
        }

        .name_product {
            max-width: 200px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>
</head>
<body>

<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div
                class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
        >
            <a href="http://localhost:8080/TrangChu/Admin/home"

               class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none" id="banner">Trang Chủ</a>



            <div class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">

                <input type="text" id="textCodeCheck" readonly="true">

                <!-- Modal -->
                <div
                        class="modal fade"
                        id="showInforCheck"
                        data-bs-backdrop="static"
                        data-bs-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabel"
                        aria-hidden="true"
                >
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                    Thông tin hóa đơn
                                </h1>
                                <button
                                        type="button"
                                        class="btn-close"
                                        data-bs-dismiss="modal"
                                        aria-label="Close"
                                ></button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-borderless">
                                    <tbody id="infor_Check">
                                    <tr>
                                        <td class="a">Mã hóa đơn:</td>
                                        <td id="checkCode"></td>
                                    </tr>
                                    <tr>
                                        <td class="a">Nhân viên:</td>
                                        <td id="checkStaff"></td>
                                    </tr>
                                    <tr id="inforCustomer">
                                        <td class="a">Khách hàng:</td>
                                        <td id="checkCustomer"></td>
                                    </tr>
                                    <tr>
                                        <td class="a">Ngày tạo:</td>
                                        <td id="checkTimeCreate"></td>
                                    </tr>
                                    <tr>
                                        <td class="a">Trạng thái:</td>
                                        <td>Chưa thành toán</td>
                                    </tr>
                                    <tr>
                                        <td class="a">Hình thức:</td>
                                        <td>Bán hàng tại quầy</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-bs-dismiss="modal"
                                >
                                    Thoát
                                </button>

                            </div>
                        </div>
                    </div>
                </div>

                <input type="search" name="search-name" id="search-input">


                <button id="search-btn"><i class="bi bi-search"></i></button>
                <button id="reset"><i class="bi bi-arrow-clockwise"></i></button>
            </div>


            <div class="dropdown text-end">
                <a
                        href="#"
                        class="d-block link-dark text-decoration-none dropdown-toggle"
                        id="dropdownUser1"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                >
                    <img
                            src="https://github.com/mdo.png"
                            alt="mdo"
                            width="32"
                            height="32"
                            class="rounded-circle"
                    />
                </a>
                <ul
                        class="dropdown-menu text-small"
                        aria-labelledby="dropdownUser1"
                >

                    <li><a class="dropdown-item" href="/TrangChu/ThongTinCaNhan/Admin">Profile</a></li>
                    <li>
                        <hr class="dropdown-divider"/>
                    </li>
                    <li><a class="dropdown-item" href="/UserLog/logout">Sign out</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="container-fluid">
    <div class="row">
        <div class="col-8">
            <div id="cart-detail">
                <table class="table table-hover">
                    <tbody id="cart-detail-product">

                    </tbody>
                </table>
            </div>
            <div id="all-product">
                <div
                        class="container-fluid"
                        style="display: flex; flex-wrap: wrap"
                        id="listProducts"
                >
                    <%--                    list san pham --%>
                    <c:forEach items="${list}" var="gtt">
                        <c:if test="${gtt.giayTheThao.trangThai eq 1}">
                            <div class="card card-product" style="width: 9.8rem">
                                <img
                                        src="/upload/${gtt.giayTheThao.getAnhDau()}"
                                        class="card-img-top img-product-card"
                                />

                                <div class="card-body product-card-body">
                                    <p class="card-text">
                                        <a
                                                href="#"
                                                class="name-product"
                                                onclick="addToCart(`${gtt.id}`, `${gtt.giayTheThao.tenGiayTheThao}`, `${gtt.giayTheThao.giaBan}`, event)"
                                        >${gtt.giayTheThao.tenGiayTheThao} (${gtt.soLuong})</a
                                        >
                                    </p>
                                    <p class="card-text price-card-product">${gtt.giayTheThao.giaBan}</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <!-- modal -->

                </div>
            </div>
            <div
                    class="modal fade"
                    id="showDetailProduct"
                    data-bs-backdrop="static"
                    data-bs-keyboard="false"
                    tabindex="-1"
                    aria-labelledby="staticBackdropLabel"
                    aria-hidden="true"
            >
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                Thông tin chi tiết giày thể thao
                            </h1>
                            <button
                                    type="button"
                                    class="btn-close"
                                    id="close-detailProduct"
                            ></button>
                        </div>
                        <div class="modal-body">
                            <div id="modal-detailProduct">
                                <div>
                                    <img id="detailProduct-img" src="" alt="gift">
                                </div>
                                <div id="detailProduct-info">
                                    <p id="detailProduct-name"></p>
                                    <p>Giá bán: <span id="detailProduct-price"></span></p>
                                    <p id="inventory">Số lượng tồn: <span id="inventoryNumber"></span></p>
                                    <p id="detailProduct-color">Màu sắc: <span id="listMS"><span
                                            class="color">Vàng</span> <span class="color">Đỏ</span> <span class="color">Trắng</span></d>
                                    </p>
                                    <p id="detailProduct-size">Size: <span id="listSize"><span
                                            class="sizeProduct">38</span> <span class="sizeProduct">39</span> <span
                                            class="sizeProduct">40</span></span></p>
                                    <p id="detailProduct-quantity">Số lượng <input id="quantityDetailProduct"
                                                                                   type="number"
                                                                                   oninput="validateQuantity(this)">
                                        <span id="notification-detailProduct"
                                              style="color: #ff0000;font-weight: lighter;"></span></p>

                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="addProductToCart">
                                Thêm
                            </button>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div id="listSP">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã hóa đơn</th>
                        <th scope="col">Nhân viên</th>
                        <th scope="col">Khách hàng</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody id="list-hdc">
                    <c:forEach items="${listHDC}" var="hdc" varStatus="status">
                        <tr onclick="getHDC(`${hdc.id}`)">
                            <td>${status.index+1}</td>
                            <td>${hdc.maHoaDon}</td>
                            <td>${hdc.user.tenUser==null?"N/A":hdc.user.tenUser}</td>
                            <td>${hdc.khachHang.tenKhachHang}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="button">
                <!-- <button class="btn btn-primary" style="width: 100%;">Tạo hóa đơn mới</button> -->
                <button
                        class="btn btn-success"
                        data-bs-toggle="modal"
                        data-bs-target="#staticBackdropCheck"
                        style="width: 100%;"

                >Tạo hóa đơn mới

                </button>
                <!-- modal -->
                <div
                        class="modal fade"
                        id="staticBackdropCheck"
                        data-bs-backdrop="static"
                        data-bs-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabel"
                        aria-hidden="true"
                >
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                    Tạo hóa đơn
                                </h1>
                                <button
                                        type="button"
                                        class="btn-close"
                                        data-bs-dismiss="modal"
                                        aria-label="Close"
                                ></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="search-client" class="form-label"
                                    >Tìm kiếm khách hàng</label
                                    >
                                    <input
                                            type="search"
                                            class="form-control"
                                            id="search-client"
                                            placeholder="Nhập tên khách hàng..."
                                    />
                                </div>

                                <div id="scroll-kh">
                                    <table class="table table-hover">
                                        <thead>
                                        <th></th>
                                        <th>STT</th>
                                        <th>Tên</th>
                                        <th>Giới tính</th>
                                        <th>Ngày sinh</th>
                                        <th>SĐT</th>
                                        <th>Email</th>
                                        <th>Địa chỉ</th>
                                        </thead>
                                        <tbody id="list-kh">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button
                                        type="button"
                                        class="btn btn-secondary"
                                        data-bs-dismiss="modal"
                                >
                                    Thoát
                                </button>
                                <button
                                        type="button"
                                        class="btn btn-primary"
                                        id="chooseButton"
                                >
                                    Tạo mới
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button">
                    <a href="#" class="btn btn-primary" id="redirect-pay-form" onclick="redirect(event)">Thanh Toán</a>
                </div>
            </div>
        </div>
</section>

<div class="container-fluid">
    <footer
            class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top"
    >
        <div class="col-md-4 d-flex align-items-center">
            <a
                    href="/"
                    class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1"
            >
                <svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>
            <span class="mb-3 mb-md-0 text-body-secondary"
            >© 2023 Company, Inc</span
            >
        </div>

        <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <li class="ms-3">
                <a class="text-body-secondary" href="#"
                ><i class="bi bi-twitter" width="24" height="24"></i
                ></a>
            </li>
            <li class="ms-3">
                <a class="text-body-secondary" href="#"
                ><i class="bi bi-instagram" width="24" height="24"></i
                ></a>
            </li>
            <li class="ms-3">
                <a class="text-body-secondary" href="#"
                ><i class="bi bi-facebook" width="24" height="24"></i
                ></a>
            </li>
        </ul>
    </footer>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="../../../resources/js/BanHangTaiQuay.js"></script>
<script>

    var mauSac = '';
    var kichCo = '';
    var idProduct = '';
    var nameProduct = '';
    var idGttct = '';
    var productPrice = '';
    var quantityInstock = '';


    function start() {
        getAllProducts(renderProducts);
        getAllHDCho(renderHDCho);
        getAllKH(renderKH);
        search();
        showInforCheck();
        searchCustomer();
        document.getElementById("reset").addEventListener("click", () => {
            getAllProducts(renderProducts);
        });
    }

    start();

    function showInforCheck() {
        var inforCheckInput = document.getElementById('textCodeCheck');

        inforCheckInput.addEventListener('click', function () {

            var idHD = localStorage.getItem("idHD");
            if (inforCheckInput.value != '') {
                getHDByID(idHD, (hd) => {
                    var checkCode = document.getElementById("checkCode");
                    var staff = document.getElementById('checkStaff');
                    var customer = document.getElementById("checkCustomer");
                    var timeCreate = document.getElementById("checkTimeCreate");

                    checkCode.innerText = inforCheckInput.value;
                    staff.innerText = hd.user.tenUser;
                    if (hd.khachHang != null) {

                        customer.innerHTML = `
                            <br/>
                            <table class="table table-borderless">
                                <tr>
                                    <td class="a">Tên: </td>
                                    <td>` + hd.khachHang.tenKhachHang + `</td>

                                </tr>
                                <tr>
                                    <td class="a">Giới tính: </td>
                                    <td>` + hd.khachHang.gioiTinh + `</td>

                                </tr>
                                <tr>

                                    <td class="a">Ngày sinh: </td>
                                    <td>` + hd.khachHang.ngaySinh + `</td>

                                </tr>
                                <tr>

                                    <td class="a">Số điện thoại: </td>
                                    <td>` + hd.khachHang.soDienThoai + `</td>

                                </tr>
                                <tr>

                                    <td class="a">Email: </td>
                                    <td>` + hd.khachHang.email + `</td>

                                </tr>
                                <tr>

                                    <td class="a">Địa chỉ: </td>
                                    <td>` + hd.khachHang.diaChi + `, ` + hd.khachHang.thanhPho + ` - ` + hd.khachHang.huyen + ` - ` + hd.khachHang.xa + `</td>
                                </tr>
                            </table>
                        `;

                    } else {
                        customer.innerText = "Khách hàng lẻ";

                    }
                    timeCreate.innerText = hd.ngayTao;
                })
                $('#showInforCheck').modal('show');
            }
        });
    }

    function getHDByID(id, callback) {
        fetch("http://localhost:8080/api/hd/" + id)
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(callback)
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });

    }

    function getAllProducts(callback) {
        fetch("http://localhost:8080/api/gtt")
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(callback)
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
    }

    function renderProducts(products) {

        var htmls = products.map((gtt) => {

            var soTienDaGiam = gtt.soTienDaGiam + '';
            if (!isNaN(soTienDaGiam) && gtt.soTienDaGiam != 0) {
                var salePercent = '-' + (gtt.soTienDaGiam / gtt.giaBan) * 100 + '%';
                var salePrice = gtt.giaBan - gtt.soTienDaGiam;
                if (gtt.tenGiayTheThao.length > 20) {
                    return `
                <div class="card card-product" style="width: 9.8rem; ">
                            <img
                                    src="/upload/` + gtt.anhDau + `"
                                    class="card-img-top img-product-card"
                            />

                            <div class="card-body product-card-body">
                                <p class="card-text">
                                    <a
                                            href="#"
                                            class="name-product"
                                            onclick="showDetailProduct(\`` + gtt.id + `\`, \`` + gtt.tenGiayTheThao + `\`, \`` + gtt.giaBan + `\`, \`` + gtt.anhDau + `\`, \`` + gtt.soTienDaGiam + `\`, event)"
                                    >` + gtt.tenGiayTheThao + `</a
                                    >
                                    <span class="showOrno" onclick="showName(this, \`` + gtt.tenGiayTheThao + `\`)">Hiện</span>
                                </p>

                                <p class="card-text price-card-product">` + salePrice + `</p>
                            </div>
                            <div class="notification">` + salePercent + `</div>
                        </div>


            `;
                } else {
                    return `
                    <div class="card card-product" style="width: 9.8rem; ">
                                <img
                                        src="/upload/` + gtt.anhDau + `"
                                        class="card-img-top img-product-card"
                                />

                                <div class="card-body product-card-body">
                                    <p class="card-text">
                                        <a
                                                href="#"
                                                class="name-product"
                                                onclick="showDetailProduct(\`` + gtt.id + `\`, \`` + gtt.tenGiayTheThao + `\`, \`` + gtt.giaBan + `\`, \`` + gtt.anhDau + `\`, \`` + gtt.soTienDaGiam + `\`, event)"
                                        >` + gtt.tenGiayTheThao + `</a
                                        >

                                    </p>

                                    <p class="card-text price-card-product">` + salePrice + `</p>
                                </div>
                            <div class="notification">` + salePercent + `</div>
                            </div>


            `;
                }
            } else {
                if (gtt.tenGiayTheThao.length > 20) {
                    return `
                <div class="card card-product" style="width: 9.8rem; ">
                            <img
                                    src="/upload/` + gtt.anhDau + `"
                                    class="card-img-top img-product-card"
                            />

                            <div class="card-body product-card-body">
                                <p class="card-text">
                                    <a
                                            href="#"
                                            class="name-product"
                                            onclick="showDetailProduct(\`` + gtt.id + `\`, \`` + gtt.tenGiayTheThao + `\`, \`` + gtt.giaBan + `\`, \`` + gtt.anhDau + `\`, \`` + gtt.soTienDaGiam + `\`, event)"
                                    >` + gtt.tenGiayTheThao + `</a
                                    >
                                    <span class="showOrno" onclick="showName(this, \`` + gtt.tenGiayTheThao + `\`)">Hiện</span>
                                </p>

                                <p class="card-text price-card-product">` + gtt.giaBan + `</p>
                            </div>
                        </div>


          `;
                } else {
                    return `
                <div class="card card-product" style="width: 9.8rem; ">
                            <img
                                    src="/upload/` + gtt.anhDau + `"
                                    class="card-img-top img-product-card"
                            />

                            <div class="card-body product-card-body">
                                <p class="card-text">
                                    <a
                                            href="#"
                                            class="name-product"
                                            onclick="showDetailProduct(\`` + gtt.id + `\`, \`` + gtt.tenGiayTheThao + `\`, \`` + gtt.giaBan + `\`, \`` + gtt.anhDau + `\`, \`` + gtt.soTienDaGiam + `\`, event)"
                                    >` + gtt.tenGiayTheThao + `</a
                                    >

                                </p>

                                <p class="card-text price-card-product">` + gtt.giaBan + `</p>
                            </div>
                        </div>


          `;
                }
            }


        });
        var html = htmls.join("");
        document.getElementById("listProducts").innerHTML = html;
        var priceProduct = document.getElementsByClassName("price-card-product");
        var priceArray = Array.from(priceProduct);
        priceArray.forEach((element) => {
            var price = parseInt(element.textContent).toLocaleString("en-US");
            element.textContent = price + " đ";
        });

        var longTextElements = document.querySelectorAll(".name-product");
        var maxLength = 20;

        longTextElements.forEach(function (element) {
            var originalText = element.innerText;

            if (originalText.length > maxLength) {
                var truncatedText = originalText.substring(0, maxLength) + "...";
                element.innerText = truncatedText;
            }
        });


    }

    function closeDetailProduct() {
        document.getElementById("close-detailProduct").onclick = function () {
            mauSac = '';
            idProduct = '';
            kichCo = '';
            document.getElementById("quantityDetailProduct").value = "";
            $('#showDetailProduct').modal('hide');
        }
    }

    closeDetailProduct();

    function validateQuantity(input) {
        input.value = input.value.replace(/[^\d]+/g, "");
        if (input.value > 999) {
            document.getElementById('notification-detailProduct').innerText = 'Không nhập số lượng > 999';
        } else {
            document.getElementById('notification-detailProduct').innerText = '';
        }

    }

    function toggleColorAndSize() {
        var colors = document.querySelectorAll('.color');
        var sizes = document.querySelectorAll('.sizeProduct');


        colors.forEach(function (color) {
            color.onclick = function () {

                colors.forEach(function (s) {
                    s.style.backgroundColor = '#ffffff';
                });

                // Đổi màu nền của span được click
                color.style.backgroundColor = 'rgb(79,214,115)';

                mauSac = color.id;
                console.log(kichCo, '-', mauSac, '-', idProduct);
                if (kichCo != '') {
                    changeInforProduct();
                }
            };
        });

        sizes.forEach(function (size) {
            size.onclick = function () {

                sizes.forEach(function (s) {
                    s.style.backgroundColor = '#ffffff';
                });

                // Đổi màu nền của span được click
                size.style.backgroundColor = 'rgb(79,214,115)';
                kichCo = size.id;
                console.log(kichCo, '-', mauSac, '-', idProduct);
                if (mauSac != '') {

                    changeInforProduct();
                }
            };
        });
    }

    // function checkSale() {
    //     fetch("http://localhost:8080/api/gttct/")
    // }

    function changeInforProduct() {

        fetch("http://localhost:8080/api/gttct/" + idProduct, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify([mauSac, kichCo])
        }).then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
            .then(data => {

                var inventory = document.getElementById('inventory');
                var inventoryNumber = document.getElementById('inventoryNumber');
                inventory.style.display = 'block';
                if (data.soLuong == 0) {
                    idGttct = '';
                    inventoryInstock = 0;
                    inventoryNumber.innerText = 0;
                } else {
                    idGttct = data.id;
                    inventoryInstock = data.soLuong;
                    inventoryNumber.innerText = data.soLuong;
                }

            }).catch(error => console.error("Error: ", error))

    }

    function getIdGttct(callback) {

        fetch("http://localhost:8080/api/gttct/" + idProduct, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify([mauSac, kichCo])
        }).then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
            .then(callback).catch(error => console.error("Error: ", error))

    }


    function showDetailProduct(id, ten, giaBan, anh, soTienDaGiam, event) {
        event.preventDefault();
        idProduct = id;
        nameProduct = ten;
        console.log(anh);
        if (mauSac == '' || kichCo == '') {
            document.getElementById('inventory').style.display = 'none';
        }
        Promise.all([getAllMSByIdGtt(id), getAllSizeByIdGtt(id)])
            .then(([ms, size]) => {

                document.getElementById('detailProduct-name').innerText = ten;
                if (!isNaN(soTienDaGiam) && soTienDaGiam != 0) {

                    var price = parseInt(giaBan).toLocaleString("en-US") + 'đ';
                    var priceSale = parseInt(giaBan) - parseInt(soTienDaGiam);
                    var sale = priceSale.toLocaleString("en-US") + 'đ';
                    var percent = parseInt(soTienDaGiam) / parseInt(giaBan) * 100;
                    productPrice = priceSale;
                    document.getElementById('detailProduct-price').innerHTML = sale + `  <del >` + price + `</del>  <span>-` + percent + `%</span>`;
                } else {
                    productPrice = giaBan;
                    document.getElementById('detailProduct-price').innerHTML = parseInt(giaBan).toLocaleString("en-US") + 'đ';

                }

                document.getElementById('detailProduct-img').src = "/upload/" + anh;

                var htmls1 = ms.map(mauSac => {
                    return `<span class="color" id='` + mauSac.id + `'>` + mauSac.tenMauSac + `</span>`;
                })
                var html1 = htmls1.join('');
                document.getElementById('listMS').innerHTML = html1;
                var htmls2 = size.map(s => {
                    return `<span class="sizeProduct" id='` + s.id + `'>` + s.size + `</span>`;
                })
                var html2 = htmls2.join('');
                document.getElementById('listSize').innerHTML = html2;
                toggleColorAndSize();
                $('#showDetailProduct').modal('show');
            }).catch(error => {
            console.error('Error: ' + error);
        })


    }

    function getAllMSByIdGtt(id) {
        return fetch("http://localhost:8080/api/gttct/mauSac/" + id)
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .catch(error => {
                console.error('Error: ', error);
                return Promise.reject(error);
            })
    }


    function getAllSizeByIdGtt(id) {
        return fetch("http://localhost:8080/api/gttct/size/" + id)
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            // .then(data=>console.log(data))
            .catch(error => {
                console.error('Error: ', error);
                return Promise.reject(error);
            })
    }

    function addProductToCart(idGTTCT) {
        var btnThem = document.getElementById('addProductToCart');
        btnThem.addEventListener('click', () => {
            if (mauSac == '' && kichCo == '') {
                alert('Hãy chọn màu sắc và kích cỡ');

            } else if (mauSac != '' && kichCo == '') {
                alert('Hãy chọn kích cỡ');
            } else if (mauSac == '' && kichCo != '') {
                alert('Hãy chọn màu sắc');
            } else {
                getIdGttct(
                    data => {


                        if (data.soLuong == 0) {
                            idGttct = '';
                            inventoryInstock = 0;
                        } else {
                            idGttct = data.id;
                            inventoryInstock = data.soLuong;
                        }
                        if (data.giayTheThao == null) {
                            addToCart(data.id, '', productPrice);
                        }
                        addToCart(data.id, data.giayTheThao.tenGiayTheThao, productPrice);
                        document.getElementById("quantityDetailProduct").value = "";
                        $('#showDetailProduct').modal('hide');
                    }
                );

            }

        });
    }

    addProductToCart();

    function showName(params, name) {
        var values = params.innerText;
        var previousElementSibling = params.previousElementSibling;
        if (values == "Hiện") {
            previousElementSibling.innerText = name;
            params.innerText = "Ẩn";
        } else {
            var maxLength = 20;
            var originalText = previousElementSibling.innerText;
            if (originalText.length > maxLength) {
                var truncatedText = originalText.substring(0, maxLength) + "...";
                previousElementSibling.innerText = truncatedText;
            }
            params.innerText = "Hiện";
        }

    }


    function search() {

        var btn_search = document.getElementById("search-btn");
        btn_search.addEventListener('click', () => {
            var name = document.getElementById("search-input").value;

            fetch('http://localhost:8080/api/gttct/search', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify([name])
            })
                .then(response => response.json())
                .then(data => {

                    if (data.length > 0) {

                        renderProducts(data);
                    } else {
                        alert("Không tìm thấy");
                    }

                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });
    }

    function getAllHDCho(callback) {
        fetch("http://localhost:8080/api/hd/unpaid")
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(callback)
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
    }

    function renderHDCho(checks) {
        var htmls = checks.map((check, key) => {
            return `
                <tr id="` + check.id + `" onclick="getHDC(\`` + check.id + `\`)">
                    <td>` + (key + 1) + `</td>
                    <td >` + check.maHoaDon + `</td>
                    <td>` + (check.user == null ? "N/A" : check.user.tenUser) + `</td>
                    <td>` + (check.khachHang == null ? "Khách hàng lẻ" : check.khachHang.tenKhachHang) + `</td>
                    <td style="text-align: center">
                      <i
                        class="bi bi-x-lg cancel"
                        onclick="removeCheck(\`` + check.id + `\`)"
                      ></i>
                    </td>
                  </tr>

          `;
        });
        var html = htmls.join("");
        document.getElementById("list-hdc").innerHTML = html;

    }

    function removeCheck(id) {

        fetch("http://localhost:8080/api/hd/" + id, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }

            })
            .then(() => {
                getAllHDCho(renderHDCho);
                localStorage.setItem("idHD", "");
                document.getElementById("textCodeCheck").value = "";
                document.getElementById("cart-detail-product").innerHTML = "";

            })
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });


    }


    function createCheck() {
        $("#chooseButton").click(function () {
            var idKH = localStorage.getItem("idKH");
            if (idKH.trim().length == 0) {
                idKH = "";
            }
            var formData = ["", idKH];
            fetch("http://localhost:8080/api/hd", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData),
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(() => {
                    getAllHDCho(renderHDCho);
                    alert("Tạo mới hóa đơn thành công");
                    localStorage.setItem("idKH", "");
                    var radios = document.getElementsByClassName("rdo-check")
                    Array.from(radios).forEach(function (radio) {
                        radio.checked = false;
                    });
                })
                .catch(error => {
                    console.error('Error during POST request:', error);
                });

            $("#staticBackdropCheck").modal("hide");
        });
    }


    createCheck();

    function getAllKH(callback) {
        fetch("http://localhost:8080/api/kh")
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(callback)
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
    }

    function searchCustomer() {
        var inputSearchClient = document.getElementById('search-client');
        inputSearchClient.addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                console.log(inputSearchClient.value, "  this is name");
                getAllKHByName(renderKH, inputSearchClient.value);
            }
        });

    }

    function getAllKHByName(callback, name) {

        fetch("http://localhost:8080/api/kh/search",
            {
                method: "Post",
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify([name])
            }
        )
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(callback)
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
    }

    function renderKH(customers) {
        console.log(customers);
        var htmls = customers.map((customer, key) => {
            return `
                <tr id="` + customer.id + `" onclick="setLocalStorageKH(\`` + customer.id + `\`, ` + (key + 1) + `)" >
                  <td>
                    <input class="form-check-input rdo-check" type="radio" name="kh" id="check-` + (key + 1) + `">
                  </td>
                  <td>` + (key + 1) + `</td>
                  <td class="name">` + customer.tenKhachHang + `</td>
                  <td>` + customer.gioiTinh + `</td>
                  <td>` + customer.ngaySinh + `</td>
                  <td>` + customer.soDienThoai + `</td>
                  <td>` + customer.email + `</td>
                  <td>` + customer.diaChi + `</td>
                </tr>

          `;
        });
        var html = htmls.join("");
        document.getElementById("list-kh").innerHTML = html;
    }

    function setLocalStorageKH(idKH, key) {
        document.getElementById("check-" + key).checked = true;

        localStorage.setItem("idKH", idKH);
    }


    function addToCart(idGTTCT, name, price) {

        console.log(idGTTCT, 'idGTTCT');

        var idHD = localStorage.getItem("idHD");
        console.log(idHD);
        var qty = document.querySelector("#quantityDetailProduct");
        var quantity = '0';

        if (qty.value == 0 || qty.value == '') {
            quantity = '1';
        } else {
            quantity = qty.value + '';
        }

        if (inventoryInstock == 0) {
            alert("Sản phẩm này đã hết. Vui lòng chọn sản phẩm khác.");
            return;
        }

        if (idHD == null || idHD.length <= 0) {
            alert("Hãy chọn 1 hóa đơn");
            return;
        }
        //xử lý request
        var gttct = {id: idGTTCT};
        var hd = {id: idHD};
        var formData = {
            hoaDon: hd,
            giayTheThaoChiTiet: gttct,
            donGia: price,
            soLuong: quantity
        };
        fetch("http://localhost:8080/api/hdct", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                return response.text();
            })
            .then(datas => {
                //xử lý giao diện

                if (datas.trim() != "") {
                    var data = JSON.parse(datas);

                    if (data.trangThai == 2) {
                        var id = data.id;
                        var tr = document.getElementById(id);
                        var inputElement = tr.querySelector(".qty");
                        if (inputElement) {
                            inputElement.value = parseInt(inputElement.value) + parseInt(quantity);
                            updateTotal(inputElement);
                        } else {
                            console.error('Không tìm thấy ô input');
                        }
                    } else {
                        var table = document.querySelector("#cart-detail-product");

                        var newRow = document.createElement("tr");
                        newRow.id = data.id;

                        if (quantity)

                            newRow.innerHTML = `

                              <td style="text-align: center">
                                <i
                                  class="bi bi-x-lg cancel"
                                  onclick="removeCartDetail(` + `\`` + data.id + `\`` + `,this)"
                                ></i>
                              </td>
                              <td>1</td>
                              <td class="name_product">` + name + `</td>
                              <td class="unit-price">` + price + `</td>
                              <td>` + data.giayTheThaoChiTiet.mauSac.tenMauSac + `</td>
                            <td>` + data.giayTheThaoChiTiet.size.size + `</td>
                              <td class="col-qty">
                                <div class="quantity-box">
                                  <a
                                    class="btn btn-subtract-qty"
                                    onclick="subtractQty(` + `\`` + data.id + `\`` + `,this)"
                                    ><i class="bi bi-dash"></i
                                  ></a>
                                  <input
                                    type="text"
                                    class="qty"
                                    oninput="validateNumber(` + `\`` + data.id + `\`` + `,this)"
                                    onblur="validateQty(` + `\`` + data.id + `\`` + `,this)"
                                    value="` + data.soLuong + `"
                                  />
                                  <a class="btn btn-plus-qty" onclick="addQty(` + `\`` + data.id + `\`` + `,this)"
                                    ><i class="bi bi-plus-lg"></i
                                  ></a>
                                </div>
                              </td>
                              <td class="total-price">` + price + `</td>

                `;

                        table.appendChild(newRow);
                        // truncatedText();
                    }
                } else {
                    alert("Sản phẩm trong kho đã hết");
                    console.log(data);
                    idProduct = '';
                    mauSac = '';
                    kichCo = '';
                }


            })
            .catch(error => {
                console.error('Error during POST request:', error);
            });


    }

    function truncatedText() {
        var longTextElements = document.querySelectorAll(".name_product");
        var maxLength = 20;

        longTextElements.forEach(function (element) {
            var originalText = element.innerText;

            if (originalText.length > maxLength) {
                var truncatedText = originalText.substring(0, maxLength) + "...";
                element.innerText = truncatedText;
            }
        });
    }

    function getHDC(id) {
        localStorage.setItem("idHD", id);

        fetch("http://localhost:8080/api/hdct/" + id)
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then((data) => {
                getAllHDCho((checks) => {
                    checks.forEach(check => {
                        if (check.id == id) {
                            document.getElementById("textCodeCheck").value = check.maHoaDon;
                            return;
                        }
                    });
                })
                render(data);
            })
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
    }

    function render(listHDCT) {

        var htmls = listHDCT.map((hdct, key) => {
            var ten = hdct.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao;

            var giaoDien = `
            <tr id="` + hdct.id + `">
                  <td style="text-align: center">
                    <i
                      class="bi bi-x-lg cancel"
                      onclick="removeCartDetail(` + `\`` + hdct.id + `\`` + `,this)"
                    ></i>
                  </td>
                  <td>` + (key + 1) + `</td>
                  <td class="name_product">` + ten + `</td>
                  <td class="unit-price">` + hdct.donGia + `</td>
                  <td>` + hdct.giayTheThaoChiTiet.mauSac.tenMauSac + `</td>
                  <td>` + hdct.giayTheThaoChiTiet.size.size + `</td>
                  <td class="col-qty">
                    <div class="quantity-box">
                      <a
                        class="btn btn-subtract-qty"
                        onclick="subtractQty(` + `\`` + hdct.id + `\`` + `,this)"
                        ><i class="bi bi-dash"></i
                      ></a>
                      <input
                        type="text"
                        class="qty"
                        oninput="validateNumber(` + `\`` + hdct.id + `\`` + `,this)"
                        onblur="validateQty(` + `\`` + hdct.id + `\`` + `,this)"
                        value="` + hdct.soLuong + `"
                      />
                      <a class="btn btn-plus-qty" onclick="addQty(` + `\`` + hdct.id + `\`` + `,this)"
                        ><i class="bi bi-plus-lg"></i
                      ></a>
                    </div>
                  </td>
                  <td class="total-price">` + (hdct.soLuong * hdct.donGia) + `</td>
                </tr>
          `;
            return giaoDien;
        });
        var html = htmls.join('');
        document.getElementById('cart-detail-product').innerHTML = html;
        var longTextElements = document.querySelectorAll(".name_product");
        var maxLength = 20;

        longTextElements.forEach(function (element) {
            var originalText = element.innerText;

            if (originalText.length > maxLength) {
                var truncatedText = originalText.substring(0, maxLength) + "...";
                element.innerText = truncatedText;
            }
        });
    }

    function addQty(id, element) {
        var qty = element.previousElementSibling;

        var number = Number(qty.value);
        if (qty.value <= 999) {
            number += 1;
        }


        check(id, number, (check) => {
            if (check == "false") {
                qty.value = number;
                updateQuantity(id, number);
                updateTotal(qty);
            } else {
                alert("Sản phẩm trong kho đã hết");
            }
        });

    }

    function validateQty(id, element) {
        var qty = element;
        if (qty.value > 999) {
            qty.value = 999;
            updateQuantity(id, 999, (datas) => {
                var data = JSON.parse(datas);
                if (data.id == null) {
                    qty.value = data.soLuong;
                    updateQuantity(id, data.soLuong, () => {
                    });
                    updateTotal(qty);
                }
            });
        }
        if (!qty.value) {
            qty.value = 1;
            updateQuantity(id, 1, (datas) => {

            });
            updateTotal(qty);
        }

        updateQuantity(id, qty.value, (datas) => {
            var data = JSON.parse(datas);
            if (data.id == null) {
                qty.value = data.soLuong;
                updateQuantity(id, data.soLuong, () => {
                });
                updateTotal(qty);
            }
        });
        updateTotal(qty);
    }

    function subtractQty(id, element) {
        var qty = element.nextElementSibling;

        var number = Number(qty.value);
        if (qty.value > 1) {
            number -= 1;
        }

        updateQuantity(id, number, () => {
            qty.value = number;
            updateTotal(qty);
        });

    }

    function validateNumber(id, input) {
        input.value = input.value.replace(/[^\d]+/g, "");
        // input.value = input.value.replace(/[]/g, "");

    }

    function updateTotal(inputElement) {
        var unitPriceElement = inputElement
            .closest("tr")
            .querySelector(".unit-price");
        var totalElement = inputElement.closest("tr").querySelector(".total-price");

        var unitPrice = parseFloat(unitPriceElement.textContent, 10);
        var quantity = parseFloat(inputElement.value, 10);
        var total = unitPrice * quantity;

        totalElement.textContent = total;
    }

    function updateQuantity(id, quantity, callback) {
        fetch("http://localhost:8080/api/hdct/" + id, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(quantity),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(callback)
            .catch(error => {
                console.error('Error during POST request:', error);
            });
    }

    function check(id, quantity, callback) {
        fetch("http://localhost:8080/api/hdct/check/" + id, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(quantity),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(callback)
            .catch(error => {
                console.error('Error during POST request:', error);
            });
    }

    function redirect(event) {
        event.preventDefault();
        var idHD = localStorage.getItem("idHD");
        if (idHD.length > 0) {
            window.location.href = "${pageContext.request.contextPath}/BanHangTaiQuay/thanhToan/" + idHD;
        } else {
            alert("Hãy chọn 1 hóa đơn");
        }
    }

    function removeCartDetail(id, element) {
        fetch("http://localhost:8080/api/hdct/" + id, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }

            })
            .catch((error) => {
                console.error(
                    "There was a problem with the fetch operation:",
                    error
                );
            });
        var parentElement = element.closest("tr").parentNode;
        parentElement.removeChild(element.closest("tr"));

    }

    localStorage.setItem("idHD", "");
    localStorage.setItem("idKH", "");
</script>
</body>
</html>
