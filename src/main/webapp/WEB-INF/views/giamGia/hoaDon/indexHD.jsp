<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chương trình giảm giá hóa đơn</title>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <style>

        .btn-function {
            display: flex;
            text-align: right;
            margin: 20px;
            justify-content: space-between;
        }

        /* filter */
        .filter {
            margin-top: 20px;
        }

        .filter > div {
            width: auto;
            height: auto;
            margin-left: 30px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 1px 1px 5px rgb(151, 151, 151);
            padding: 20px;
        }

        /* search-input */
        .label-filter {
            font-weight: 500;

        }

        .title {
            font-size: large;
        }

        #search-input {
            border: none;
            outline: none;
            padding: 0;
            padding-bottom: 6px;
            border-radius: 0%;
            border-bottom: 1px solid rgb(104, 104, 104);
        }

        #search-input:focus {
            outline: none;
            box-shadow: none;
        }

        #quality-row {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>

<body style="width: 100%">
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

<div class="row" style="width: 100%">

    <div class="col-3 filter">
            <div class="mb-3">
                <form
                        action="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/search"
                >
                    <label for="search-input" class="form-label label-filter title"
                           style="color: black;font-weight: bold"
                    >Tìm kiếm</label
                    >
                    <input
                            type="text"
                            class="form-control"
                            id="search-input"
                            placeholder="Theo tên chương trình"
                            name="name"
                    />
                </form>
            </div>
            <div class="mb-3">
                <form
                        action="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/filter"
                >
                    <div>
                        <label for="search-input" class="form-label label-filter title"
                               style="color: black;font-weight: bold">
                            Trạng thái
                        </label>
                        <div class="form-check">
                            <input
                                    class="form-check-input trangThai"
                                    type="radio"
                                    name="trangThai"
                                    id="all"
                                    value="2"
                                    checked
                            />
                            <label class="form-check-label" for="all"> Tất cả </label>
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input trangThai"
                                    type="radio"
                                    name="trangThai"
                                    id="activated"
                                    value="1"
                            />
                            <label class="form-check-label" for="activated">
                                Kích hoạt
                            </label>
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input trangThai"
                                    type="radio"
                                    name="trangThai"
                                    id="notYetApplied"
                                    value="0"
                            />
                            <label class="form-check-label" for="notYetApplied">
                                Chưa áp dụng
                            </label>
                        </div>
                    </div>
                    <div>
                        <br>
                        <label class="form-label label-filter title" style="color: black;font-weight: bold">Ngày
                            tháng</label>
                        <div>
                            <label for="ngayBatDau" class="label-filter"
                                   style="color: black;font-weight: bold">Từ: </label>
                            <input type="date" name="ngayBatDau" class="form-control" id="ngayBatDau">
                            <br>
                            <label for="ngayKetThuc" class="label-filter"
                                   style="color: black;font-weight: bold">Đến: </label>
                            <input type="date" name="ngayKetThuc" class="form-control" id="ngayKetThuc">
                            <br>
                        </div>
                    </div>
                    <p style="text-align: right">
                        <button class="btn btn-success" id="btnFilter">Lọc</button>
                    </p>
                </form>
            </div>
            <div class="mb-3">
                <label class="form-label label-filter title" style="color: black;font-weight: bold;font-size: 17px">
                    Chương trình giảm giá </label>
                <div>

                    <div class="row">
                        <div class="col-1">
                            <a
                                    href="${pageContext.request.contextPath}/chuongTrinhGiamGia/hoaDon"
                                    class="btn btn-success"
                            >Hoá đơn</a
                            >
                        </div>
                        <div class="col-1">
                            <a
                                    href="${pageContext.request.contextPath}/chuongTrinhGiamGia/sanPham"
                                    class="btn btn-success"
                            >Sản phẩm</a
                            >
                        </div>
                    </div>

                </div>
            </div>
            <div class="mb-3" id="quality-row">
                <span>Số bản ghi:</span>
                <span>${list.getTotalElements()}</span>
            </div>
        </div>
        <div class="col-9 promotion">
            <div class="btn-function">
                <div>
                    <h3 style="color: black;font-weight: bold;font-weight: bold">${title}</h3>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/createForm"
                       class="btn btn-success"
                    ><i class="fa fa-plus" style="color: #ffffff"></i> Chương trình
                        khuyến mại
                    </a>
                    <a href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/history"
                       class="btn btn-primary">Lịch
                        sử</a>
                </div>
            </div>
            <table class="table table-hover table-light">
                <thead>
                <th style="background-color: #4CAF50">STT</th>
                <th style="background-color: #4CAF50">Tên chương trình</th>
                <th style="background-color: #4CAF50">Giá trị giảm(%)</th>
                <!-- <th>Số lượng</th> -->
                <th style="background-color: #4CAF50">Thời gian áp dụng</th>
                <th style="background-color: #4CAF50">Hình thức</th>
                <th style="background-color: #4CAF50">Trạng thái</th>
                <th style="background-color: #4CAF50">Chức năng</th>
                </thead>
                <tbody>

                <c:if test="${f:length(list.getContent())==0}">
                    <span>Không có dữ liệu</span>
                </c:if>
                <c:if test="${f:length(list.getContent())!=0}">
                    <c:forEach
                            items="${list.getContent()}"
                            var="gg"
                            varStatus="status"
                    >
                        <tr class="${gg.id}">
                            <td>${status.index+1}</td>
                            <td style="text-align: left; max-width: 150px">
                                    ${gg.tenChuongTrinh}
                            </td>
                            <td>${gg.phanTramGiam}</td>
                            <td><b>Từ:</b> ${gg.ngayBatDau} <br><b>Đến:</b> ${gg.ngayKetThuc}</td>
                            <td style="max-width: 100px;">${hinhThuc}</td>
                            <td style="color: black">${gg.trangThai==1?"Kích hoạt":"Chưa áp dụng"}</td>
                            <td>

                                        <a href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/detail?id=${gg.id}"
                                           class="btn btn-primary">Chi tiết</a>

                                        <a
                                                href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/updateForm?id=${gg.id}"
                                                class="btn btn-success"
                                        >Sửa</a
                                        >
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                <!-- <tr>
                  <td>1</td>
                  <td>Khuyến mại ngày 18/10</td>
                  <td>100%</td>
                  <td>12/10/2023</td>
                  <td>20/10/2023</td>
                  <td>Hóa đơn - Giảm giá hóa đơn</td>
                  <td>Kích hoạt</td>
                </tr> -->
                </tbody>
            </table>
            <ul class="pagination" style="margin-left: 500px">
                <c:forEach begin="1" end="${list.getTotalPages()}" var="i">
                    <li class="page-item">
                        <a
                                href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${read}page=${i}"
                                class="page-link"
                        >${i}</a
                        >
                    </li>
                </c:forEach>
            </ul>
        </div>

    </div>


<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>

<script>
    var btnFilter = document.getElementById("btnFilter");

    function check() {
        var radioBtn = document.getElementsByClassName("trangThai");
        var nbd = document.getElementById("ngayBatDau");
        var nkt = document.getElementById("ngayKetThuc");
        for (var i = 0; i < radioBtn.length; i++) {
            if (radioBtn[i].checked) {
                localStorage.setItem("selected", radioBtn[i].value);
            }
        }

        localStorage.setItem("nbd", nbd.value);
        localStorage.setItem("nkt", nkt.value);
    }

    btnFilter.onclick = check;

    function setStorage() {
        var radioBtn = document.getElementsByClassName("trangThai");
        var ngayBatDau = document.getElementById("ngayBatDau");
        var ngayKetThuc = document.getElementById("ngayKetThuc");
        var selected = localStorage.getItem("selected");
        var nbd = localStorage.getItem("nbd");
        var nkt = localStorage.getItem("nkt");
        if (nbd) {
            ngayBatDau.value = nbd;

        }
        if (nkt) {
            ngayKetThuc.value = nkt;

        }
        if (selected) {
            for (var i = 0; i < radioBtn.length; i++) {
                if (radioBtn[i].value == selected) {
                    radioBtn[i].checked = true;
                    break;
                }
            }
        }
    }

    setStorage();

    // function setChecked() {
    //   var url = window.location.href.toString();
    //   var subStringUrl = url.substring(41, url.length);
    //   subStringUrl == "hoaDon"
    //     ? document.getElementById("hoaDon").checked=true
    //     : document.getElementById("sanPham").checked=true;
    // }
    // setChecked();

    // function directionCtgg() {
    //   var btnDirection = document.getElementById("btn-ctgg");
    //   var ctggHD = document.getElementById("hoaDon");
    //   var ctggSP = document.getElementById("sanPham");
    //   var direction =
    //     "${pageContext.request.contextPath}/chuongTrinhGiamGia/";
    //   if (ctggHD.checked) {
    //     direction = direction + "hoaDon";

    //   } else if(ctggSP.checked){
    //     direction = direction + "sanPham";

    //   } else {
    //     console.log("Không có cái nào được chọn");
    //   }
    //   console.log(direction);
    //   btnDirection.onclick = function () {
    //     window.location.href = direction;

    //   };
    // }
    // directionCtgg();

    // function addToSelectedCustomers(customerId) {
    //   var html = `
    //       <td colspan="7">
    //         <div class="update-btn">
    //           <p>
    //             <a href="chuongTrinhGiamGia/updateForm?id=${customerId}" class="btn btn-success update-button">Sửa</a>
    //           </p>
    //         </div>
    //       </td>
    //           `;

    //   document.getElementsByClassName(customerId + "")[0].innerHTML = html;
    // }

    // function confirmUpdate() {
    //   var updateBtn = document.getElementsByClassName("update-button");

    //     var confirmUpdate = confirm("Bạn có muốn sửa không?");

    //     if (confirmUpdate) {
    //       window.location.href = "chuongTrinhGiamGia/";
    //     }

    // }
</script>
</body>
</html>
