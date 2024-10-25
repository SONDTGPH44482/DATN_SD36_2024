<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách dữ liệu giầy thể thao</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link href="/css/ChuongTrinhGiamGia/HoaDon/list.css" rel="stylesheet">

    <style>
        <%--        Dành cho tab--%>

        .nav-tabs {

            background-image: linear-gradient(
                    to bottom right, #25AEB8, #0DDB9F
            );
            padding: 0;
            margin: 20px 0 0;
            list-style: none;
            width: 500px;
            height: 40px;
            display: flex;
            /*max-width: fit-content;*/
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            overflow: hidden;
            position: relative;
            z-index: 1;
        }


        .nav-item {

            font-weight: bold;
            font-size: 15px;
            width: 140px;
            margin-top: 10px;
            margin-bottom: 5px;
            height: 20px;
            text-align: center;
            border-right: 1px solid #1d868d;
            transition: 0.5s;
            cursor: pointer;
        }


        .nav-item:nth-last-child(1) {
            border-right: none;
        }

        .nav-item.active {
            color: #555;
        }

        .bg-active {

            background-color: #eee;
            padding: 20px;
            width: 140px;
            position: absolute;
            left: 0;
            height: 100%;
            z-index: -1;
            transition: 0.5s;
        }


        .content-tabs {

            padding: 30px;
            background-color: #eee;
            color: #555;
            border-radius: 10px;
            border-top-left-radius: 0;
            min-height: 300px;
            text-align: justify;
        }


        .content-tabs .tab {
            display: none;
        }

        .content-tabs .tab.active {
            display: block;
            animation: showContent 0.5s ease-in-out 1;
        }

        @keyframes showContent {
            from {
                opacity: 0;
                transform: translateY(100px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        <%--        Danh cho giá bán--%>
        #priceSlider {
            width: 300px;
            margin: 0 auto;
            text-align: center;
        }

        #giaBan {
            height: 10px;
            margin: 10px 0;
        }

        #priceSlider .noUi-handle {
            width: 20px;
            border-radius: 20px 20px 20px;
            background-color: aliceblue;
            height: 20px;
            cursor: ew-resize;
        }

        /*    Table */
        td, th {
            padding: 10px; /* Khoảng cách nội dung bên trong ô */
            color: black; /* Màu chữ */
            text-align: center; /* Căn giữa nội dung trong ô */
        }

        .hide-row {
            display: none;
        }

    </style>
</head>
<body>
<%--template của header--%>
<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<%--Session--%>
<div class="container">

    <h4 style="color: red; font-size: 20px; font-weight: bold; margin-top: 40px; margin-left: 7px; margin-bottom: 30px">${messageDone}</h4>
    <div class="" style="margin-top: 0px; margin-bottom: 20px">
        <div class="row">
            <div class="col-6">
                <h6 style="color: red; margin-top: 10px">${messageFindDone}</h6>
                <h6 style="color: red; margin-top: 10px">${messageFindError}</h6>
                <h6 style="color: red; margin-top: 10px">${messageFind}</h6>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                <a href="/GiayTheThao/create" style="text-decoration: none">
                    <button class="button" style="width: 130px;margin-top: 0px; margin-bottom: 20px">

                        <svg class="svg-icon" fill="none" height="20" viewBox="0 0 20 20" width="20"
                             xmlns="http://www.w3.org/2000/svg">
                            <g stroke="#ff342b" stroke-linecap="round" stroke-width="1.5">
                                <path d="m3.33337 10.8333c0 3.6819 2.98477 6.6667 6.66663 6.6667 3.682 0 6.6667-2.9848 6.6667-6.6667 0-3.68188-2.9847-6.66664-6.6667-6.66664-1.29938 0-2.51191.37174-3.5371 1.01468"></path>
                                <path d="m7.69867 1.58163-1.44987 3.28435c-.18587.42104.00478.91303.42582 1.0989l3.28438 1.44986"></path>
                            </g>
                        </svg>
                        <span class="lable">Thêm</span>

                    </button>
                </a>
            </div>
        </div>

        <div class="row">
            <h3 style="margin-top: 5px; color: black; margin-bottom: 20px">Lọc</h3>
            <div class="col-12">
                <div class="common-filter">
                    <form id="filter-form">
                        <div class="row">
                            <div class="col-6">
                                <h6 style="color:black">Tên giầy thể thao</h6>

                                <input style="width: 500px; height: 35px;border-radius: 5px 5px 5px" type="text"
                                       id="tenGiayTheThao" placeholder="Tên giầy thể thao">

                            </div>
                            <div class="col-6">
                                <h6 style="color: black">Giá bán</h6>
                                <div id="priceSlider" style="margin-top: 20px;margin-left: 0px">
                                    <%--                                        Slide chỉ là nút--%>
                                    <div id="giaBan" class="noUi-target noUi-ltr noUi-horizontal"></div>

                                </div>
                                <br>
                                <div>

                                    <p style="float: left;margin-right: 75px;color: black">Giá tối thiểu: <span
                                            id="minPrice">100.000</span></p>

                                    <p style="color: black">Giá tối đa: <span id="maxPrice">300.000</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <h6 style="color:black;margin-top: 10px">Thương hiệu</h6>
                                <%--                                <input style="width: 500px;height: 35px; border-radius: 5px 5px 5px" type="text" id="thuongHieu" placeholder="Thương hiệu">--%>

                                <select style="width: 500px;height: 35px; border-radius: 5px 5px 5px;margin-bottom: 0px"
                                        type="text" id="thuongHieu">
                                    <option style="border-radius: 5px 5px 5px" value="">Tất cả dữ liệu của thương hiệu
                                    </option>

                                    <c:forEach items="${thuongHieu}" var="thuongHieu">
                                        <option style="border-radius: 5px 5px 5px">${thuongHieu.tenThuongHieu}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-6">
                                <h6 style="color:black;margin-top: 10px">Công dụng</h6>

                                <select style="width: 500px;height: 35px; border-radius: 5px 5px 5px;margin-bottom: 0px"
                                        type="text" id="congDung">
                                    <option style="border-radius: 5px 5px 5px" value="">Tất cả dữ liệu của công dụng
                                    </option>

                                    <c:forEach items="${congDung}" var="congDung">
                                        <option style="border-radius: 5px 5px 5px">${congDung.tenCongDung}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <h6 style="color:black;margin-top: 10px">Trạng thái</h6>
                                <select id="trangThai" style="width: 500px;height: 35px; border-radius: 5px 5px 5px">
                                    <option value="" style="">All trạng thái ✔✖</option>
                                    <option value="1" style="">Đã kích hoạt ✔</option>
                                    <option value="0" style="">Chưa kích hoạt ✖</option>
                                </select>
                            </div>
                        </div>
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-12">
                <label style="color: red">${errorTrimSearch}</label>
                <label style="color: red">${messageFind}</label>
                <label style="color: red">${messageErrorFind}</label>
                <div>
                    <a href="/GiayTheThao/exportPDF">
                        <button class="btn btn-primary">Xuất file PDF</button>
                    </a>
                    <a href="/GiayTheThao/exportExcal">
                        <button class="btn btn-primary">Xuất file Excel</button>
                    </a>
                </div>
                <br>

                <div class="scrollable-list"
                     style="width: 100%; max-height: 300px; overflow-y: auto; overflow-x: hidden">

                    <table class="data-table" style="margin-top: 30px;width: 100%;border-radius: 50px 50px 50px">
                        <thead>
                        <tr>
                            <th style="padding-top: 5px; text-align: center; color: black">STT</th>
                            <th style="padding-top: 5px; text-align: center; color: black">Tên giầy thể thao</th>
                            <th style="padding-top: 5px; text-align: center; color: black;width: 180px">Giá bán VNĐ
                                <a href="${pageContext.request.contextPath}/GiayTheThao/listGiayTheThao?sort=desc">
                                    <i class="fa fa-caret-down" style="font-size: 1.5em;"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/GiayTheThao/listGiayTheThao?sort=asc">
                                    <i class="fa fa-caret-up" style="font-size: 1.5em;"></i>
                                </a>
                            </th>
                            <th style="padding-top: 5px; text-align: center; color: black">Thương hiệu</th>
                            <th style="padding-top: 5px; text-align: center; color: black">Công dụng</th>
                            <th style="padding-top: 5px; text-align: center; color: black">Trạng thái</th>
                            <th style="padding-top: 5px; text-align: center; color: black">Functions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="giayTheThao" items="${listPageFind}" varStatus="i">

                            <tr class="product-item hide-row" data-tenGiayTheThao="${giayTheThao.tenGiayTheThao}"
                                data-giaBan="${giayTheThao.giaBan}"
                                data-thuongHieu="${giayTheThao.thuongHieu.tenThuongHieu}"
                                data-congDung="${giayTheThao.congDung.tenCongDung}"
                                data-trangThai="${giayTheThao.trangThai}">


                                <td style="padding-top: 3px; text-align: center; color: black">${i.index+1}</td>
                                <td style="padding-top: 3px; text-align: center; color: black">${giayTheThao.tenGiayTheThao}</td>
                                <td style="padding-top: 3px; text-align: center; color: black">

                                    <fmt:formatNumber type="" value="${giayTheThao.giaBan}" pattern="#,##0.###"/>

                                </td>
                                <td style="padding-top: 3px; text-align: center; color: black">${giayTheThao.thuongHieu.tenThuongHieu}</td>
                                <td style="padding-top: 3px; text-align: center; color: black">${giayTheThao.congDung.tenCongDung}</td>
                                <td style="padding-top: 3px; text-align: center; color: black">${giayTheThao.trangThai == 1 ? "✔" : "✖"}</td>
                                <td>

                                    <a class="col-sm-4"
                                       href="${pageContext.request.contextPath}/GiayTheThao/update/${giayTheThao.id}">
                                        <button class="btn btn-primary" style="margin-top: 3px">Detail</button>
                                    </a>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div id="noResults" class="alert alert-warning" style="display: none;margin-top: 10px">

                        <h5 style="text-align: center;height: 60px;margin-top: 40px">Không có dữ liệu phù hợp với bộ lọc
                            hiện tại!</h5>

                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <%--        Tab list--%>


        <div class="sliderTab">
            <ul class="nav-tabs">
                <li class="nav-item ${param.tab == 'active' ? 'active' : ''}" data-target="tab1"
                    style="text-decoration: none;margin-bottom: 40px;">
                    <a href="${pageContext.request.contextPath}/GiayTheThao/listGiayTheThao?tab=active" class="nav-link"
                       style="">
                        Đã kích hoạt
                    </a>
                </li>
                <li class="nav-item ${param.tab == 'inactive' ? 'active' : ''}" data-target="tab2"
                    style="text-decoration: none">
                    <a href="${pageContext.request.contextPath}/GiayTheThao/listGiayTheThao?tab=inactive"
                       class="nav-link" style="">

                        Chưa kích hoạt
                    </a>
                </li>
                <div class="bg-active"></div>
            </ul>
            <div class="content-tabs">
                <div class="tab ${param.tab == 'active' ? 'active' : ''}" id="tab1">
                    <%--              Nội dung  --%>
                    <h4 style="color: black">Trạng thái đã kích hoạt</h4>
                    <table style="border-collapse: collapse; width:100%; margin-top: 40px">
                        <thead>
                        <tr>
                            <th scope="col" style="text-align: center;color: black; width: 40px">#</th>
                            <th scope="col" style="text-align: center;color: black">Tên giầy thể thao</th>
                            <th scope="col" style="text-align: center;color: black">Image</th>
                            <th scope="col" style="text-align: center;color: black">Công dụng</th>

                            <th scope="col" style="text-align: center;color: black">Giá bán VNĐ</th>
                            <th scope="col" style="text-align: center;color: black">Thương hiệu</th>
                            <th scope="col" style="text-align: center;color: black;width: 225px">Functions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="giayTheThao" items="${listPage}" varStatus="i">
                            <c:if test="${giayTheThao.trangThai eq 1}">
                                <tr>

                                    <th style="padding-top: 40px; text-align: center; color: black"
                                        scope="row">${i.index+1}</th>
                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.tenGiayTheThao}</td>
                                    <td style="padding-top: 20px; text-align: center; color: black">
                                        <img style="width: 100px;margin-bottom: 10px"
                                             src="/upload/${giayTheThao.image.get(0).link}" alt="">
                                    </td>
                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.congDung.tenCongDung}</td>
                                    <td style="padding-top: 20px; text-align: center; color: black"><fmt:formatNumber
                                            type="" value="${giayTheThao.giaBan}" pattern="#,##0.###"/> VNĐ
                                    </td>
                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.thuongHieu.tenThuongHieu}</td>
                                    <td>
                                        <a class="col-sm-4"
                                           href="${pageContext.request.contextPath}/GiayTheThao/update/${giayTheThao.id}">
                                            <button class="btn btn-primary">Edit</button>
                                        </a>

                                        <a class="col-sm-4"
                                           href="${pageContext.request.contextPath}/GiayTheThao/update/${giayTheThao.id}">
                                            <button class="btn btn-primary">Detail</button>
                                        </a>

                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    <%--Phân trang --%>
                    <div class="" style="margin-top: 30px"></div>
                    <div class="row">
                        <div class="col-12" style="">
                            <ul class="pagination" style="margin-left: 400px">
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                        <li class="page-item">

                                            <a href="/GiayTheThao/listGiayTheThao?pageNum=${currentPage - 1}&tab=active"
                                               class="page-link" style="border: 1px solid red;width: 100px">Previous</a>

                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="pageNumber" items="${pageNumbers}">
                                    <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">

                                        <a href="/GiayTheThao/listGiayTheThao?pageNum=${pageNumber}&tab=active"
                                           class="page-link">${pageNumber}</a>

                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPage}">
                                    <li class="page-item">

                                        <a href="/GiayTheThao/listGiayTheThao?pageNum=${currentPage + 1}&tab=active"
                                           class="page-link" style="border: 1px solid red; width: 50px">Next</a>

                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="tab ${param.tab == 'inactive' ? 'active' : ''}" id="tab2">
                    <%--            trạng thái chưa kích hoạt--%>
                    <h4 style="color: black">Trạng thái chưa kích hoạt</h4>
                    <table style="border-collapse: collapse; width:100%; margin-top: 40px">
                        <thead>
                        <tr>
                            <th scope="col" style="text-align: center;color: black; width: 40px">#</th>
                            <th scope="col" style="text-align: center;color: black">Tên giầy thể thao</th>
                            <th scope="col" style="text-align: center;color: black">Image</th>
                            <th scope="col" style="text-align: center;color: black">Công dụng</th>


                            <th scope="col" style="text-align: center;color: black">Giá bán VNĐ</th>
                            <th scope="col" style="text-align: center;color: black">Thương hiệu</th>
                            <th scope="col" style="text-align: center;color: black">Functions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="giayTheThao" items="${listPage}" varStatus="i">
                            <c:if test="${giayTheThao.trangThai eq 0}">
                                <tr>

                                    <th style="padding-top: 40px; text-align: center; color: black"
                                        scope="row">${i.index+1}</th>

                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.tenGiayTheThao}</td>
                                    <td style="padding-top: 20px; text-align: center; color: black">
                                        <span>NULL</span>
                                    </td>
                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.congDung.tenCongDung}</td>

                                        <%--                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.gioiTinh}</td>--%>
                                    <td style="padding-top: 20px; text-align: center; color: black"><fmt:formatNumber
                                            type="" value="${giayTheThao.giaBan}" pattern="#,##0.###"/> VNĐ
                                    </td>
                                    <td style="padding-top: 20px; text-align: center; color: black">${giayTheThao.thuongHieu.tenThuongHieu}</td>
                                    <td style="margin-bottom: 10px">
                                        <a class="col-sm-4"
                                           href="${pageContext.request.contextPath}/GiayTheThao/update/${giayTheThao.id}">
                                            <button class="btn btn-primary"
                                                    style="margin-left: 30px;float: left; margin-top: 22px">Edit
                                            </button>
                                        </a>
                                        <a class="col-sm-4"
                                           href="${pageContext.request.contextPath}/GiayTheThao/update/${giayTheThao.id}">
                                            <button class="btn btn-primary" style="margin-top: 0px">Detail</button>
                                        </a>

                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="" style="margin-top: 30px"></div>
                    <div class="row">
                        <div class="col-12" style="">
                            <ul class="pagination" style="margin-left: 400px">
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                        <li class="page-item">

                                            <a href="/GiayTheThao/listGiayTheThao?pageNum=${currentPage - 1}&tab=inactive"
                                               class="page-link" style="border: 1px solid red;width: 100px">Previous</a>

                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="pageNumber" items="${pageNumbers}">
                                    <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">

                                        <a href="/GiayTheThao/listGiayTheThao?pageNum=${pageNumber}&tab=inactive"
                                           class="page-link">${pageNumber}</a>

                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPage}">
                                    <li class="page-item">

                                        <a href="/GiayTheThao/listGiayTheThao?pageNum=${currentPage + 1}&tab=inactive"
                                           class="page-link" style="border: 1px solid red; width: 50px">Next</a>

                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br>
    </div>
</div>


<%--template của footer--%>
<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>
<script>

    //Todo code giá bán

    var giaBanSlider = document.getElementById('giaBan');
    var minPrice = document.getElementById('minPrice');
    var maxPrice = document.getElementById('maxPrice');

    noUiSlider.create(giaBanSlider, {
        start: [100000, 300000000],
        connect: true,
        range: {
            'min': 100000,
            'max': 300000000
        }
    });

    giaBanSlider.noUiSlider.on('update', function (values, handle) {
        var selectedValues = giaBanSlider.noUiSlider.get();

        minPrice.innerHTML = parseFloat(selectedValues[0]).toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });
        maxPrice.innerHTML = parseFloat(selectedValues[1]).toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });


        // Gọi hàm filterProducts ở đây để lọc dựa trên khoảng giá đã chọn.
        filterProducts();
    });

    function filterProducts() {
        // Lấy giá trị từ các trường input và select
        var tenGiayTheThao = document.getElementById('tenGiayTheThao').value.toLowerCase();
        var giaBanValues = giaBanSlider.noUiSlider.get();
        var thuongHieu = document.getElementById('thuongHieu').value;
        var congDung = document.getElementById('congDung').value;
        var trangThai = document.getElementById('trangThai').value;

        // Lấy danh sách sản phẩm
        var products = document.getElementsByClassName('product-item');
        var anyResults = false; // Biến kiểm tra có kết quả hay không

        for (var i = 0; i < products.length; i++) {
            var product = products[i];
            var productTenGiayTheThao = product.getAttribute('data-tenGiayTheThao').toLowerCase();
            var productGiaBan = parseFloat(product.getAttribute('data-giaBan'));
            var productThuongHieu = product.getAttribute('data-thuongHieu');
            var productCongDung = product.getAttribute('data-congDung');
            var productTrangThai = product.getAttribute('data-trangThai');

            // Kiểm tra xem sản phẩm phù hợp với bộ lọc hay không
            if (
                (trangThai === '' || productTrangThai === trangThai) &&
                productTenGiayTheThao.includes(tenGiayTheThao) &&
                (productGiaBan >= parseFloat(giaBanValues[0]) && productGiaBan <= parseFloat(giaBanValues[1])) &&
                (thuongHieu === '' || productThuongHieu === thuongHieu) &&
                (congDung === '' || productCongDung === congDung)
            ) {
                // Hiển thị sản phẩm nếu nó phù hợp với bộ lọc
                product.classList.remove('hide-row');
                anyResults = true;
            } else {
                // Ẩn sản phẩm nếu không phù hợp
                product.classList.add('hide-row');
            }
        }

        // Hiển thị hoặc ẩn thông báo không có kết quả
        var noResultsMessage = document.getElementById('noResults');
        if (anyResults) {

            noResultsMessage.style.display = 'none'; // Ẩn thông báo

        } else {

            noResultsMessage.style.display = 'block'; // Hiển thị thông báo
        }
    }

    // Thêm sự kiện người nghe đầu vào và thay đổi cho tất cả các trường bộ lọc
    document.getElementById('tenGiayTheThao').addEventListener('input', filterProducts);
    document.getElementById('thuongHieu').addEventListener('change', filterProducts);
    document.getElementById('congDung').addEventListener('change', filterProducts);
    document.getElementById('trangThai').addEventListener('change', filterProducts);

    // Áp dụng bộ lọc ban đầu
    filterProducts();

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>


</body>
</html>
