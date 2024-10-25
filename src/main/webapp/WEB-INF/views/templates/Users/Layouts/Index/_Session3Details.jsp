<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css">

<style>

    <%--    css cho thương hiệu--%>
    .pagination .page-item.disabled a {

        background-color: red;

    }

    .brandContainer {
        display: flex;
        justify-content: space-between;
    }

    .brandColumn {
        flex: 0 0 48%; /* Đặt chiều rộng cho mỗi cột, có thể điều chỉnh tùy ý */
    }

    /*css cho trọng lượng*/
    .trongLuongContainer {
        display: flex;
        justify-content: space-between;
    }

    .trongLuongColumn {
        flex: 0 0 48%; /* Đặt chiều rộng cho mỗi cột, có thể điều chỉnh tùy ý */
    }

    /*    Css cho giá bán*/

    #priceSlider {
        width: 280px;
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


    #giaBan .noUi-handle-lower {
        margin-left: 30px;
        background-color: #3498db; /* Màu nền */
        border-color: #2980b9; /* Màu viền */
    }

    /* CSS cho nút tăng giá bán */
    #giaBan .noUi-handle-upper {
        margin-left: 30px;
        background-color: #e74c3c; /* Màu nền */
        border-color: #c0392b; /* Màu viền */
    }

    /* CSS cho dải mức giá được chọn */
    #giaBan .noUi-connect {
        background-color: #2ecc71; /* Màu nền của dải mức giá */
        border-color: #27ae60; /* Màu viền của dải mức giá */
    }


</style>

<section class="owl-carousel active-product-area section_gap">
    <!-- single product slide -->

    <div class="single-product-slider">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <h1 style="">Giầy thể thao</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et
                            dolore
                            magna aliqua.</p>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3" style="">
                    <h3>Bộ lọc tìm dữ liệu</h3>
                    <h4>Tên giầy thể thao</h4>
                    <input style="width: 260px; height: 35px; border-radius: 5px 5px 5px" type="text"
                           id="tenGiayTheThao" placeholder="Tên giày thể thao" oninput="filterProducts()">
                    <h4 style="color: black;margin-top: 20px;margin-bottom: 20px">Giá bán</h4>
                    <div id="priceSlider" style="margin-top: 20px;width: 250px">
                        <%--                                        Slide chỉ là nút--%>
                        <div style="width: 250px" id="giaBan" class="noUi-target noUi-ltr noUi-horizontal"></div>

                    </div>
                    <br>
                    <div>
                        <p style="color: black">Giá tối thiểu: <span id="minPrice">100.000</span></p>
                        <p style="color: black">Giá tối đa: <span id="maxPrice">300.000</span></p>
                    </div>
                    <h4 style="margin-bottom: 20px">Form giày thể thao</h4>
                    <div class="formContainer">
                        <div class="formColumn">
                            <c:forEach items="${form}" var="form">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="formCheckbox" value="${form.tenForm}" onchange="getSelectedForm()">
                                            ${form.tenForm}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <h4 style="margin-bottom: 20px;margin-top: 20px">Công dụng</h4>
                    <div class="congDungContainer">
                        <div class="congDungColumn">
                            <c:forEach items="${congDung}" var="congDung">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="congDungCheckbox" value="${congDung.tenCongDung}" onchange="getSelectedCongDung()">
                                            ${congDung.tenCongDung}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <h4 style="margin-bottom: 20px;margin-top: 20px">Chất liệu</h4>
                    <div class="chatLieuContainer">
                        <div class="chatLieuColumn">
                            <c:forEach items="${chatLieu}" var="chatLieu">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="chatLieuCheckbox" value="${chatLieu.tenChatLieu}" onchange="getSelectedChatLieu()">
                                            ${chatLieu.tenChatLieu}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <h4 style="margin-bottom: 20px;margin-top: 20px">Trọng lượng giầy</h4>
                    <div class="trongLuongContainer">
                        <div class="trongLuongColumn">
                            <c:forEach items="${trongLuong}" var="trongLuong" begin="0" end="3">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="trongLuongCheckbox" value="${trongLuong.tenTrongLuong}"
                                               onchange="getSelectedTrongLuong()">${trongLuong.tenTrongLuong}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="trongLuongColumn">
                            <c:forEach items="${trongLuong}" var="trongLuong" begin="4" end="7">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="trongLuongCheckbox" value="${trongLuong.tenTrongLuong}"
                                               onchange="getSelectedTrongLuong()">${trongLuong.tenTrongLuong}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>


                    <h4 style="margin-top: 20px; margin-bottom: 20px">Thương hiệu</h4>
                    <div class="brandContainer">
                        <div class="brandColumn">
                            <c:forEach items="${thuongHieu}" var="thuongHieu" begin="0" end="3">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="brandCheckbox" value="${thuongHieu.tenThuongHieu}"
                                               onchange="getSelectedBrands()">${thuongHieu.tenThuongHieu}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="brandColumn">
                            <c:forEach items="${thuongHieu}" var="thuongHieu" begin="4" end="7">
                                <div style="margin-bottom: 5px;">
                                    <label>
                                        <input type="checkbox" class="brandCheckbox" value="${thuongHieu.tenThuongHieu}"
                                               onchange="getSelectedBrands()">${thuongHieu.tenThuongHieu}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="col-9" style="">
                    <div class="row">
                        <div class="col-12">
                            <div id="noResults" class="alert alert-warning" style="display: none;margin-top: 10px">
                                <h5 style="text-align: center;height: 60px;margin-top: 40px">Không có dữ liệu phù hợp với bộ
                                    lọc hiện tại!
                                </h5>
                            </div>
                        </div>
                        <%--                --%>
                        <div id="product-list" class="row">
                            <!-- Danh sách sản phẩm sẽ được hiển thị ở đây -->
                            <c:forEach var="listGiay" items="${listPage}">
                                <c:if test="${listGiay.trangThai == 1}">
                                    <div class="col-lg-3 col-md-6 product-item"
                                         data-thuongHieu    =   "${listGiay.thuongHieu.tenThuongHieu}"
                                         data-giaBan        =   "${listGiay.giaBan}"
                                         data-Form          =   "${listGiay.form.tenForm}"
                                         data-CongDung      =   "${listGiay.congDung.tenCongDung}"
                                         data-TrongLuong    =   "${listGiay.trongLuong.tenTrongLuong}"
                                         data-ChatLieu      =   "${listGiay.chatLieu.tenChatLieu}"
                                    >

                                        <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}">
                                            <div class="card" style="height: 300px;width: 200px">
                                                <img class="card-img-top" style="height: 200px"
                                                     src="/upload/${listGiay.image.get(0).link}" alt="">
                                                <div class="card-body">
                                                    <h6 class="card-title"
                                                        style="text-align: center">${listGiay.tenGiayTheThao}</h6>
                                                    <div class="price">
                                                        <h6 style="text-align: center">
                                                            <span style="color: red"> Đ </span>
                                                            <fmt:formatNumber type="" value="${listGiay.giaBan}"
                                                                              pattern="#,##0.###"/> VNĐ
                                                        </h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>

    <script>
        var giaBanSlider = document.getElementById('giaBan');
        var minPrice = document.getElementById('minPrice');
        var maxPrice = document.getElementById('maxPrice');
        var selectedBrands = [];
        var selectedForms = [];
        var selectedCongDungs =[];
        var selectedTrongLuongs = [];
        var selectedChatLieus = [];
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

            filterProducts();
        });

        function filterProducts() {
            var productList = document.getElementById('product-list');
            var anyResults = false;
            var products = document.querySelectorAll('.product-item');
            var tenGiayFilter = document.getElementById('tenGiayTheThao').value.toLowerCase();
            var giaBanValues = giaBanSlider.noUiSlider.get();

            products.forEach(function (product) {
                var productBrand = product.getAttribute('data-thuongHieu');
                var productName = product.querySelector('.card-title').textContent.toLowerCase();
                var productGiaBan = parseFloat(product.getAttribute('data-giaBan'));
                var productForm = product.getAttribute('data-Form');
                var productCongDung = product.getAttribute('data-CongDung');
                var productTrongLuong = product.getAttribute('data-TrongLuong');
                var productChatLieu = product.getAttribute('data-ChatLieu');

                var brandCondition = selectedBrands.length === 0 || selectedBrands.includes(productBrand);
                var formCondition = selectedForms.length === 0 || selectedForms.includes(productForm);
                var congDungCondition = selectedCongDungs.length === 0 || selectedCongDungs.includes(productCongDung);
                var trongLuongCondition = selectedTrongLuongs.length === 0 || selectedTrongLuongs.includes(productTrongLuong);
                var chatLieuCondition = selectedChatLieus.length === 0 || selectedChatLieus.includes(productChatLieu);
                var nameCondition = tenGiayFilter === '' || productName.includes(tenGiayFilter);
                var priceCondition = productGiaBan >= parseFloat(giaBanValues[0]) && productGiaBan <= parseFloat(giaBanValues[1]);

                if (brandCondition          &&
                    formCondition           &&
                    nameCondition           &&
                    priceCondition          &&
                    congDungCondition       &&
                    chatLieuCondition       &&
                    trongLuongCondition     ) {
                    product.style.display = 'block';
                    anyResults = true;
                } else {
                    product.style.display = 'none';
                }
            });

            var noResultsMessage = document.getElementById('noResults');
            if (!anyResults) {
                noResultsMessage.style.display = 'block';
            } else {
                noResultsMessage.style.display = 'none';
            }
        }

        function getSelectedBrands() {
            selectedBrands = [];
            var brandCheckboxes = document.getElementsByClassName('brandCheckbox');

            for (var i = 0; i < brandCheckboxes.length; i++) {
                if (brandCheckboxes[i].checked) {
                    selectedBrands.push(brandCheckboxes[i].value);
                }
            }

            filterProducts();
        }

        function getSelectedForm() {
            selectedForms = [];
            var formCheckboxes = document.getElementsByClassName('formCheckbox');

            for (var i = 0; i < formCheckboxes.length; i++) {
                if (formCheckboxes[i].checked) {
                    selectedForms.push(formCheckboxes[i].value);
                }
            }

            filterProducts();
        }

        function getSelectedCongDung(){
            selectedCongDungs = [];
            var congDungCheckboxes = document.getElementsByClassName('congDungCheckbox');

            for (var i = 0; i < congDungCheckboxes.length; i++) {
                if (congDungCheckboxes[i].checked) {
                    selectedCongDungs.push(congDungCheckboxes[i].value);
                }
            }

            filterProducts();
        }

        function getSelectedTrongLuong(){
            selectedTrongLuongs = [];
            var trongLuongCheckboxes = document.getElementsByClassName('trongLuongCheckbox');

            for (var i = 0; i < trongLuongCheckboxes.length; i++) {
                if (trongLuongCheckboxes[i].checked) {
                    selectedTrongLuongs.push(trongLuongCheckboxes[i].value);
                }
            }

            filterProducts();
        }

        function getSelectedChatLieu(){
            selectedChatLieus = [];
            var chatLieuCheckboxes = document.getElementsByClassName('chatLieuCheckbox');

            for (var i = 0; i < chatLieuCheckboxes.length; i++) {
                if (chatLieuCheckboxes[i].checked) {
                    selectedChatLieus.push(chatLieuCheckboxes[i].value);
                }
            }

            filterProducts();
        }

        giaBanSlider.noUiSlider.on('change', function () {
            filterProducts();
        });
    </script>

</section>