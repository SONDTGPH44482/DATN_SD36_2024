<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Hóa đơn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

    <style>
        td, th {
            padding: 10px; /* Khoảng cách nội dung bên trong ô */
            color: black; /* Màu chữ */
            text-align: center; /* Căn giữa nội dung trong ô */
        }

        /*    Cho hóa đơn*/

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .payment-methods {
            padding: 10px 0;
        }

        #ctgg-details,
        #banking-image,
        #cash-details {
            display: none;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

    </style>


<%--    css cho chương trình giảm giá--%>

    <style>
        .payment-methods {
            padding: 10px 0;
        }

        #ctgg-details,
        #banking-image,
        #cash-details {
            display: none;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>


</head>
<body>
<%--Header cho giỏ hàng --%>
<%@ include file="../../Layouts/Index/_Header_No_Register.jsp" %>

<div class="container" style="margin-top: 150px">
    <div class="container-fluid">

        <form action="/nguoiDung/hoaDon/ThanhToan/${hoaDonId}" method="post">
            <div class="thongBaoHoaDon">
                <span style="color: red;font-size: 20px;margin-left: 40px">${diaChiChonNull}</span>
            </div>
            ${error_momo}
            <div class="row px-xl-5">
                <div class="col-lg-6">
                    <h5 class="section-title position-relative text-uppercase mb-3">
                        <span class="">ĐỊA CHỈ NHẬN HÀNG</span>
                    </h5>
                    <input type="checkbox" name="diaChiChon" value="diaChiCu" id="checkbox1">
                    <label for="checkbox1" class="label_check_box">Địa chỉ ban đầu</label>
                    <br>
                    <div id="view_dia_chi_cu" style="display:block">
                        <div class="bg-light p-30 mb-5">
                            <div class="row">
                                <div class="col-md-6 form-group" style="margin-top: 30px">
                                    <label>Họ tên :</label>
                                    <%--                                    <input class="form-control" type="text" name="ten" id="ten" value="${khachHang.ten}" placeholder="${khachHang.ten}" readonly>--%>
                                    <input class="form-control" type="text" name="tenKhachHang" id="ten" value="${tenKhachHang}" placeholder="${tenKhachHang}" readonly>
                                    <input type="hidden" name="tenKhachHang" value="${tenKhachHang}">

                                </div>
                                <div class="col-md-6 form-group" style="margin-top: 30px">
                                    <label>Email :</label>
                                    <%--                                    <input class="form-control" type="text" name="email" id="email" value="${khachHang.email}" placeholder="${khachHang.email}" readonly>--%>
                                    <input class="form-control" type="text" name="email" id="email" value="${email}"
                                           placeholder="${email}" readonly>
                                    <input type="hidden" name="email" value="${email}">

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Số điện thoại :</label>
                                    <%--                                    <input class="form-control" type="text" name="sdt" id="sdt" value="${khachHang.sdt}" placeholder="${khachHang.sdt}" readonly>--%>
                                    <input class="form-control" type="text" name="soDienThoai" id="sdt"
                                           value="${soDienThoai}" placeholder="${soDienThoai}" readonly>

                                    <input type="hidden" name="soDienThoai" value="${soDienThoai}">

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Tỉnh :</label>
                                    <input class="form-control" type="text" name="quocGia" placeholder="${thanhPho}"
                                           value="${thanhPho}" id="tinh" readonly>
                                    <input type="hidden" name="quocGia" value="${thanhPho}">

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Huyện : </label>
                                    <input class="form-control" type="text" name="thanhPho"
                                           placeholder="${huyen}" value="${huyen}"
                                           id="huyen"
                                           readonly>
                                    <input type="hidden" name="thanhPho" value="${huyen}">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Xã :</label>
                                    <input class="form-control" type="text" name="diaChi" id="xa"
                                           value="${xa}"
                                           placeholder="${xa}"
                                           readonly>
                                    <input type="hidden" name="diaChi" value="${xa}">
                                </div>

                                <div class="col-12">
                                    <label>Ghi chú :</label>
                                    <textarea id="mess" name="mess" class="form-control" rows="4" placeholder="Nhập ghi chú của bạn"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>

                    <input type="checkbox" name="diaChiChon" value="diaChiMoi" id="checkbox2"
                           onclick="toggleView('view_dia_chi_moi')">
                    <label for="checkbox2" class="label_check_box">Địa chỉ mới</label>
                    <div id="view_dia_chi_moi" style="display:none">
                        <div class="bg-light p-30 mb-5">
                            <div class="bg-light p-30 mb-5">
                                <div class="row" style="margin-top: 10px">
                                    <div class="col-md-6 form-group" style="margin-top: 20px;">
                                        <label>Họ tên</label>
                                        <span style="color: red">*</span>
                                        <input class="form-control" name="ten1" id="ten1" type="text"
                                               placeholder="Họ tên">
                                        <span style="color: red;">${tenKhachHangMoiNull}</span>
                                    </div>
                                    <div class="col-md-6 form-group" style="margin-top: 20px;">
                                        <label>Email</label>
                                        <span style="color: red">*</span>
                                        <input class="form-control" name="email1" id="email1" type="text"
                                               placeholder="Email">
                                        <span style="color: red;">${emailMoiNull}</span>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Số điện thoại</label>
                                        <span style="color: red">*</span>
                                        <input class="form-control" name="sdt1" id="sdt1" type="text"
                                               placeholder="Số điện thoại">
                                        <span style="color: red;">${soDienThoaiMoiNull}</span>
                                        <span style="color: red;">${erLogSoDienThoai0}</span>
                                        <span style="color: red;">${erLogSoDienThoaiChonChu}</span>
                                        <span style="color: red;">${erLogSoDienThoaiNumber}</span>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="province">Tỉnh:</label>
                                        <span style="color: red">*</span>
                                        <select id="province" class="form-control"
                                                onchange="loadDistricts(); checkSelection()">
                                            <option value="">Chọn tỉnh</option>
                                        </select>
                                        <input type="hidden" id="tinh1" name="quocGia1">
                                        <span style="color: red;">${quocGiaMoiNull}</span>
                                    </div>

                                    <div class="col-md-6 form-group" style="margin-bottom: 20px">
                                        <label for="district">Huyện:</label>
                                        <span style="color: red">*</span>
                                        <select id="district" class="form-control"
                                                onchange="loadWards(); checkSelection()"
                                                disabled>
                                            <option value="">Chọn huyện</option>
                                        </select>
                                        <input type="hidden" id="huyen1" name="thanhPho1">
                                        <span style="color: red;">${thanhPhoMoiNull}</span>
                                    </div>
                                    <div class="col-md-6 form-group" style="margin-bottom: 20px">
                                        <label for="ward">Xã:</label>
                                        <span style="color: red">*</span>
                                        <select id="ward" class="form-control" onchange="checkSelection()" disabled>
                                            <option value="">Chọn xã</option>
                                        </select>
                                        <input type="hidden" id="xa1" name="diaChi1">
                                        <span style="color: red;">${diaChiMoiNull}</span>
                                    </div>
                                    <div class="col-12">
                                        <label>Ghi chú :</label>
                                        <textarea id="messMoi" name="messMoi" class="form-control" rows="4" placeholder="Nhập ghi chú của bạn"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-6">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span
                            class="">Order Total</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom" style="margin-top: 20px">
                            <br>
                            <c:forEach items="${hoaDonChiTietList}" var="list" varStatus="i">
                                <p>
                                    <input type="hidden" name="idGiayTheTheThaoChiTiet" value="${list.giayTheThaoChiTiet.id}">
                                    <span style="display: inline-block;color: black;font-size: 16px;margin-left: 15px">${i.index+1} :</span>
                                    <span style="display: inline-block;color: black;font-size: 16px">${list.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</span>
                                    <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Size: ${list.giayTheThaoChiTiet.size.size}</span>
                                    <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Màu sắc: ${list.giayTheThaoChiTiet.mauSac.tenMauSac}</span>
                                    <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Số lượng mua: ${list.soLuong}</span>
                                    <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px;margin-top: 30px">Giá bán:
                            <fmt:formatNumber type="" value="${list.giayTheThaoChiTiet.giayTheThao.giaBan}" pattern="#,##0.###"/> VNĐ

                        </span>
                              <span style="display: inline-block;padding-left: 20px">
                            <img src="/upload/${list.giayTheThaoChiTiet.giayTheThao.image.get(0).link}" width="110px"
                                 style="border-radius: 10px 10px 10px">
                        </span>
                                </p>
                            </c:forEach>

                        </div>

                        <div class="border-bottom pt-3 pb-2">
                            <div class="border-bottom pt-3 pb-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h4 style="margin-left: 15px;color: black">Đơn giá :</h4>
                                    <h5 style="margin-right: 50px;color: red">
                                        <fmt:formatNumber type="" value="${hoaDon.thanhTien}" pattern="#,##0.###"/> VNĐ

                                    </h5>
                                    <input type="hidden" name="thanhTien" value="${hoaDon.thanhTien}">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h4 style="margin-left: 15px;color: black" class="font-weight-medium">Phí ship tạm tính :</h4>
                                    <h6 style="margin-right: 50px;color: red" class="font-weight-medium">
                                        <p style="font-size: 17px" id="shipcode"></p>
                                        <input type="hidden" name="ship" id="ship" readonly style="border: none; background: none; text-align: left;padding-left: 50%">
                                    </h6>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="price" style="font-size: 20px;color: black;margin-bottom: 20px;margin-left:10px;margin-top: 5px;margin-left: 10px">Tổng tiền:</label>
                                <input name="thanhTienTong" type="hidden" id="price" value="${hoaDon.thanhTien}" readonly>
<%--                                <input name="thanhTienTongPrice" type="hidden" id="price1" name="tongTien" readonly>--%>
                                <input type="hidden" id="price1" name="tongTien" readonly>
                                <br>
                                <label id="tongTienString" style="font-size: 18px;color:#ff0000;margin-left: 10px"></label>
                            </div>
                        </div>
                    </div>

<%--                    Cho khuyến mãi --%>
                    <h5 style="margin-bottom: 20px;color: black">KHUYẾN MẠI</h5>

                    <div class="mb-5" style="background-color: #F8F9FA;margin-bottom: 30px">
                        <label style="margin-top: 15px;margin-left: 15px;">Chương trình giảm giá:</label>

                        <div class="payment-methods">
                            <label for="ctgg">
                                <input style="margin-left: 15px" type="radio" name="ctgg-method" id="ctgg" onchange="togglePaymentDetails1()"> Chương trình giảm giá
                            </label>

                        </div>

                        <div id="ctgg-details" style="margin-bottom: 20px">

                                <c:choose>
                                    <c:when test="${not empty CTGG}">
                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${CTGG}" var="list">
<%--                                            Hiện các mã khuyễn mãi còn để áp dụng--%>
                                            <c:if test="${list.trangThai == 1}">
                                                <input style="margin-left: 15px" name="options" id="price" type="radio" value="${list.phanTramGiam}" onclick="updatePrice(this)"><span style="color: red">${list.tenChuongTrinh} </span> phần trăm giảm: <span style="color:  red">${list.phanTramGiam} %</span><br>
                                                <c:set var="count" value="${count + 1}"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                            <p style="color: red; margin-left: 15px;font-size: 15px">Không có mã khuyễn mãi nào áp dụng cho mã hóa đơn này</p>
                                    </c:otherwise>
                                </c:choose>
                        </div>
                        <br>
                    </div>
                    <div class="mb-5">
                        <div class="thongBaoPayment">
                            <span style="color: red">${hinhThucThanhToanNull}</span>

                        </div>
                        <h5 class="section-title position-relative text-uppercase mb-3">
                            <span class="">Payment</span>
                        </h5>
                        <div class="bg-light p-30">
                            <div class="form-group mb-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" value="momo" name="payment" id="banktransfer1">
                                    <label class="custom-control-label" for="banktransfer1" style="margin-top: 15px;margin-left: 15px">Thanh toán momo</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" value="cash" name="payment" id="directcheck">
                                    <label class="custom-control-label" for="directcheck" style="margin-left: 15px">
                                        Thanh toán khi nhận hàng
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" value="vi" name="payment" id="vi">
                                    <label class="custom-control-label" for="vi" style="margin-left: 15px">Thanh toán bằng ví điện tử</label>
                                </div>
                            </div>
                            <div class="thongBao">
                                <span style="color: red">${erVi}</span>
                            </div>
                            <button style="margin-top: 10px" type="submit" class="btn btn-block btn-primary font-weight-bold py-3">
                                Đặt hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="../../../resources/lib/easing/easing.min.js"></script>
    <script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <!-- Contact Javascript File -->
    <script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
    <script src="../../../resources/mail/contact.js"></script>
    <!-- Template Javascript -->
    <script src="../../../resources/js/main.js"></script>



<%--Mã code js cho giao hàng nhanh --%>


<script>

    var gia = parseFloat(document.getElementById("price").value);
    var gia1 = gia;
    document.getElementById("price1").value = gia1.toFixed(0);

    var gia1Formatted1 = gia.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

    var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

    document.getElementById("price").value = gia1WithCurrency1;
    document.getElementById("tongTienString").innerText = gia1WithCurrency1;

    function togglePaymentDetails1() {
        var ctggDetails = document.getElementById("ctgg-details");
        var ctggRadio = document.getElementById("ctgg");

        if (ctggRadio.checked) {
            ctggDetails.style.display = "block";
        }
    }

    function updatePrice(radioButton) {
        var priceInput = document.getElementById("price");
        var currentPrice = parseFloat(${hoaDon.thanhTien});
        var selectedValue = parseFloat(radioButton.value);
        var newPrice = currentPrice - (currentPrice * selectedValue / 100);

        var gia1Formatted = newPrice.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        priceInput.value = gia1WithCurrency;
        document.getElementById("tongTienString").innerText = gia1WithCurrency;
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
<script>
    function showCondition(condition) {
        document.getElementById("condition-text").innerHTML = condition;
        document.getElementById("condition-popup").style.display = "block";
    }

    function closeCondition() {
        document.getElementById("condition-popup").style.display = "none";
    }
</script>
<script>

    var checkbox1 = document.getElementById("checkbox1");
    var checkbox2 = document.getElementById("checkbox2");
    var view_dia_chi_cu = document.getElementById("view_dia_chi_cu");
    var view_dia_chi_moi = document.getElementById("view_dia_chi_moi");

    var bothUnchecked = true;

    // Thêm sự kiện cho checkbox1 để kiểm tra trạng thái của checkbox2
    checkbox1.addEventListener("change", async function () {
        if (checkbox1.checked) {
            checkbox2.checked = false;
            view_dia_chi_moi.style.display = "none";
            view_dia_chi_cu.style.display = "block";
            document.getElementById("province").selectedIndex = 0;
            document.getElementById("district").selectedIndex = 0;
            document.getElementById("ward").selectedIndex = 0;
            document.getElementById('ten1').style.borderColor = 'gray';
            document.getElementById('email1').style.borderColor = 'gray';
            document.getElementById('sdt1').style.borderColor = 'gray';
            document.getElementById('province').style.borderColor = 'gray';
            document.getElementById('district').style.borderColor = 'gray';
            document.getElementById('ward').style.borderColor = 'gray';
            await findCalculateShipping();
        }
        checkBothUnchecked();
    });

    // Thêm sự kiện cho checkbox2 để kiểm tra trạng thái của checkbox1
    checkbox2.addEventListener("change", function () {
        if (checkbox2.checked) {
            checkbox1.checked = false;
            view_dia_chi_moi.style.display = "block";
            document.getElementById('ten').style.borderColor = 'gray';
            document.getElementById('email').style.borderColor = 'gray';
            document.getElementById('sdt').style.borderColor = 'gray';
            document.getElementById('tinh').style.borderColor = 'gray';
            document.getElementById('huyen').style.borderColor = 'gray';
            document.getElementById('xa').style.borderColor = 'gray';
            // document.getElementById('mess').style.borderColor = 'gray';

        }
        checkBothUnchecked();
    });

    function checkBothUnchecked() {
        if (!checkbox1.checked && !checkbox2.checked) {
            const shippingCost = 0;

            var tongSoTien = currentPrice + shippingCost;
            priceInput1.value = tongSoTien;

            var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

            document.getElementById("ship").value = gia1WithCurrency3;
            document.getElementById("shipcode").innerText = gia1WithCurrency3;

            var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

            priceInput.value = gia1WithCurrency2;
            document.getElementById("tongTienString").innerText = gia1WithCurrency2;
            bothUnchecked = true;
            document.getElementById("province").selectedIndex = 0;
            document.getElementById("district").selectedIndex = 0;
            document.getElementById("ward").selectedIndex = 0;
        }
        if (!checkbox1.checked && checkbox2.checked) {
            const shippingCost = 0;

            var tongSoTien = currentPrice + shippingCost;
            priceInput1.value = tongSoTien;
            document.getElementById("tongTienString").innerText = tongSoTien;

            var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

            document.getElementById("ship").value = gia1WithCurrency3;
            document.getElementById("shipcode").innerText = gia1WithCurrency3;

            var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

            priceInput.value = gia1WithCurrency2;
            document.getElementById("tongTienString").innerText = gia1WithCurrency2;
            bothUnchecked = true;
        }
    }

    // Thêm sự kiện onchange cho các combobox

    // Hàm để cập nhật giá trị các input dựa trên các combobox đã chọn


    async function findProvinceIdByName(provinceName) {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        for (const province of data.data) {
            if (province.ProvinceName === provinceName) {
                return province.ProvinceID;
            }
        }

        return null;
    }

    async function findProvinceNameById(provinceid) {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        for (const province of data.data) {
            if (province.ProvinceID === provinceid) {
                return province.ProvinceName;
            }
        }

        return null;
    }

    async function findDistrictIdByName(districtName, provinceId) {
        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        for (const district of data.data) {
            if (district.DistrictName === districtName) {
                return district.DistrictID;
            }
        }

        // Trả về null nếu không tìm thấy huyện nào có tên tương ứng
        return null;
    }

    async function findWardIdByName(wardName, districtId) {
        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        for (const ward of data.data) {
            if (ward.WardName === wardName) {
                return ward.WardCode;
            }
        }

        // Trả về null nếu không tìm thấy xã nào có tên tương ứng
        return null;
    }

    async function findCalculateShipping() {
        var tinh = document.getElementById("tinh").value;
        var provinceName = tinh;
        var provinceId = await findProvinceIdByName(provinceName);


        var huyen = document.getElementById("huyen").value;
        var districtName = huyen;
        var districtId = await findDistrictIdByName(districtName, provinceId);

        var xa = document.getElementById("xa").value;
        var wardName = xa;
        var wardId = await findWardIdByName(wardName, districtId);

        // var mess = document.getElementById("mess").value;
        // var wardName = mess;
        // var wardId = await findWardIdByName(wardName, districtId);

        const transportationFeeDTO = {
            toDistrictId: districtId,
            toWardCode: wardId,
            quantity: 1,
            insuranceValue: 0
        };

        try {
            const response = await fetch('http://localhost:8080/public/transportationFee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(transportationFeeDTO)
            });

            const data = await response.json();

            if (data && data.code === 200) {
                const shippingCost = data.data.total;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;
                document.getElementById("tongTienString").innerText = tongSoTien;


                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;
                document.getElementById("shipcode").innerText = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                document.getElementById("tongTienString").innerText = gia1WithCurrency2;

            } else {
                document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
            }
        } catch (error) {
            console.error('Error:', error);
            document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
        }
    }


    // JavaScript code để kiểm tra địa chỉ cũ

</script>
<script>

    var priceInput = document.getElementById("price");
    var priceInput1 = document.getElementById("price1");
    var currentPrice = parseFloat(${hoaDon.thanhTien});

    async function loadProvinces() {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        const provinceSelect = document.getElementById("province");
        provinceSelect.innerHTML = '<option value="">Chọn tỉnh</option>';

        for (const province of data.data) { // Thay đổi dòng này để lấy dữ liệu từ data.data
            const option = document.createElement("option");
            option.value = province.ProvinceID;
            option.text = province.ProvinceName;
            provinceSelect.appendChild(option);
            console.log(province.ProvinceID, province.ProvinceName);
        }
    }

    async function loadDistricts() {
        const provinceId = document.getElementById("province").value;

        if (!provinceId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        const districtSelect = document.getElementById("district");
        districtSelect.innerHTML = '<option value="">Chọn huyện</option>';

        for (const district of data.data) {
            const option = document.createElement("option");
            option.value = district.DistrictID;
            option.text = district.DistrictName;
            districtSelect.appendChild(option);
        }

        districtSelect.disabled = false;
        document.getElementById("ward").disabled = true;
        document.getElementById("message").innerText = "";
    }

    async function loadWards() {
        const districtId = document.getElementById("district").value;

        if (!districtId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        const wardSelect = document.getElementById("ward");
        wardSelect.innerHTML = '<option value="">Chọn xã</option>';

        for (const ward of data.data) {
            const option = document.createElement("option");
            option.value = ward.WardCode;
            option.text = ward.WardName;
            wardSelect.appendChild(option);
        }

        wardSelect.disabled = false;
        document.getElementById("message").innerText = "";
    }

    function checkSelection() {
        const provinceSelect = document.getElementById("province");
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");

        const provinceName = provinceSelect.options[provinceSelect.selectedIndex].text;
        const districtName = districtSelect.options[districtSelect.selectedIndex].text;
        const wardName = wardSelect.options[wardSelect.selectedIndex].text;

        if (provinceName) {
            document.getElementById("tinh1").value = provinceName;
        }

        if (districtName) {
            document.getElementById("huyen1").value = districtName;
        }

        if (wardName) {
            document.getElementById("xa1").value = wardName;
        }

        if (provinceName && districtName && wardName) {
            calculateShipping();
        } else {
            document.getElementById("message").innerText = "";
            // Khóa nút tính phí nếu không đủ điều kiện
            document.getElementById("shippingCost").innerText = "";
        }
    }

    async function calculateShipping() {
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");
        const toDistrictId = districtSelect.value;
        const toWardCode = wardSelect.value;

        const transportationFeeDTO = {
            toDistrictId: toDistrictId,
            toWardCode: toWardCode,
            quantity: 1,
            insuranceValue: 0
        };

        try {
            const response = await fetch('http://localhost:8080/public/transportationFee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(transportationFeeDTO)
            });

            const data = await response.json();

            if (data && data.code === 200) {
                const shippingCost = data.data.total;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;
                document.getElementById("tongTienString").innerText = tongSoTien;

                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;
                document.getElementById("shipcode").innerText = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                document.getElementById("tongTienString").innerText = gia1WithCurrency2;

            } else {
                document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
            }
        } catch (error) {
            console.error('Error:', error);
            document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
        }
    }

    loadProvinces();
    document.getElementById("province").addEventListener("change", loadDistricts);
    document.getElementById("district").addEventListener("change", loadWards);
    document.getElementById("ward").addEventListener("change", checkSelection);

</script>
<script>
    var loiHoaDonBySL = "${loiHoaDonBySL}";
    if (loiHoaDonBySL == "2") {
        Swal.fire({
            icon: 'warning',
            html: '<div class="swal-text">Xin lỗi, sản phẩm trong hóa đn của bạn nhiều hơn số lượng tồn</div><div class="progress-bar-container"></div>',
            allowOutsideClick: true

        });
        setTimeout(() => {
            Swal.close();
            addFormContainer.style.display = 'block';
        }, 1000);
    }
</script>


<%--Mã js cho chương trình giảm giá hóa đơn --%>

<script>

    var gia = parseFloat(document.getElementById("price").value);
    var gia1 = gia;
    document.getElementById("price1").value = gia1.toFixed(0);

    //Hiện ra các loại mã áp dụng cho hóa đơn này thôi
    function togglePaymentDetails1() {
        var ctggDetails = document.getElementById("ctgg-details");
        var ctggRadio   = document.getElementById("ctgg");

        if (ctggRadio.checked) {
            ctggDetails.style.display = "block";
        }
    }

    function updatePrice(radioButton) {
        var priceInput = document.getElementById("price");
        var priceInput1 = document.getElementById("price1");
        var currentPrice = parseFloat(${hoaDon.thanhTien});
        var selectedValue = parseFloat(radioButton.value);

        var newPrice = currentPrice - (currentPrice * selectedValue / 100);

        // Định dạng số theo định dạng tiền tệ của Việt Nam với "VNĐ" ở cuối
        var formattedPrice = newPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });

        // Xóa ký tự đơn vị tiền tệ hiện tại (₫) và thêm "VNĐ" vào cuối
        formattedPrice = formattedPrice.replace('₫', '') + ' VNĐ';

        document.getElementById("tongTienString").innerText = formattedPrice;

        priceInput.value = newPrice.toFixed(2);
        priceInput1.value = newPrice.toFixed(2);

    }


    function toggleView(elementId) {

        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";

    }

</script>


<script>
    // Hàm xử lý khi giá trị thay đổi
    function formatShipValue() {
        // Lấy giá trị từ input
        var shipInput = document.getElementById("ship");
        var shipValue = shipInput.value;

        // Loại bỏ dấu chấm và khoảng trắng
        var formattedValue = shipValue.replace(/\./g, "").trim();

        // Đặt giá trị mới vào input
        shipInput.value = formattedValue;
    }
</script>
</body>
</html>