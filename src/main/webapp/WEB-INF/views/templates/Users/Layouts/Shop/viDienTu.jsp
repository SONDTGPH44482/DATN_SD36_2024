<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Ví tiền của khách hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

    <link rel="stylesheet" href="../../../resources/css/add_form.css">

    <style>

        .boderForm {
            max-width: 800px;
            margin: 0px auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 5px;
        }

        .btn-nap-rut {

            margin-top: 30px;
            margin-bottom: 50px;
            background: #80bdff;
            height: 45px;
            padding-top: 10px;
            color: white;
            border-radius: 5px;
            font-size: 20px;
            text-align: center;
            cursor: pointer; /* Đặt loại con trỏ chuột thành bàn tay */
            transition: background 0.3s ease-in-out; /* Thêm hiệu ứng di chuyển mềm mại */
        }

        .btn-nap-rut:hover {
            background: #a1ba48; /* Màu nền thay đổi khi di chuột vào */
        }

    </style>


</head>
<body>
<%--Header cho giỏ hàng --%>
<%@ include file="../../Layouts/Index/_Header_No_Register.jsp" %>

    <div class="container" style="width: 1000px;height:400px;border: 1px solid #FAFAFA;margin-top: 140px;background-color: #FAFAFA;border-radius: 10px 10px 10px">

<%--        View --%>
             <br>
            <div class="row">
                <div class="col-6">
                    <p style="color: black;font-weight: bold;font-size: 20px;margin-left: 20px">Ví của: <span style="color: red">${tenKhachHang}</span></p>
                </div>
                <div class="col-6">
                     <p style="color: black;font-weight: bold;font-size: 20px">Tổng tiền hiện có:
                         <span style="color: red">
                            <fmt:formatNumber value="${viTien.thanhTien}"/>
                         </span>  VNĐ </p>
                </div>
            </div>

                <%--                   Form ẩn nhập số tiền nạp là bao nhiêu--%>
                <div id="addFormContainer" style="display: none;">
                    <div class="container-fluid">
                        <div class="boderForm">
                            <form method="post" id="addForm">
                                <br>
                                <h3 style="text-align: center">NẠP TIỀN BẰNG MOMO</h3>
                                <br>
                                <div class="form-group">
                                    <input type="text" name="soTien" class="form-control"
                                           id="soTien" placeholder="Nhập số tiền muốn nạp ">
                                    <br>
                                    <span style="margin-top: 10px" id="errorSoTien" class="text-danger"></span>
                                </div>
                                <br>
                                <button class="btn btn-success" formaction="/KhachHang/ViDienTu/NapTien/${maKH}" type="submit"
                                        onclick="addProduct()" id="idThem">Nạp tiền
                                </button>
                            </form>

                        </div>
                    </div>
                </div>


<%--            View --%>
                     <div class="row" style="">
                            <div style="margin-left: 30px" class="col-4 btn-nap-rut" id="addButton" onclick="clickThem()">
                                <i class="fas fa-money-bill"></i> Nạp tiền
                            </div>



                          <div class="col-6"></div>
                    </div>
<%--            View--%>
          <div class="row">
              <div class="col-12">
                  <h3 style="color: #0d6efd;text-align: center;font-weight: bold">Thông tin giao dịch</h3>
                  <br>
              </div>
              <div class="col-12">
                  <table id="example1" class="table table-bordered table-striped" style="border-radius: 20px 20px 20px">
                      <thead>
                      <tr>
                          <th style="color: black">Mã giao dịch</th>
                          <th style="color: black">Hình thức</th>
                          <th style="color: black">Ngày giao dịch</th>
                          <th style="color: black">Đơn giá</th>
                          <th style="color: black">Trạng thái</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${giaoDichViChiTietList}" var="list">
                          <tr>
                              <td>${list.maGiaoDichViChiTiet}</td>
                              <td>
                                  <c:choose>
                                      <c:when test="${list.hinhThuc == 1}">Nạp tiền</c:when>
                                      <c:when test="${list.hinhThuc == 2}">Thanh toán đơn hàng</c:when>
                                      <c:when test="${list.hinhThuc == 3}">Hoàn tiền</c:when>
                                  </c:choose>
                              </td>
                              <td>
                                  <c:set var="dateTimeString" value="${list.ngayGiaoDich}"/>
                                  <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                                 pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                  <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                                  pattern="yyyy-MM-dd HH:mm:ss"/>
                                      ${formattedDate}
                              </td>
                              <td>
                                  <c:choose>
<%--                                      Trạng thái 1 là cộng tiền--%>
                                      <c:when test="${list.hinhThuc == 1}">
                                                <span style="color: #24c534">+
                                                    <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ"/>
                                                </span>
                                      </c:when>
<%--                                      Trạng thái 2 là trừ tiền--%>
                                      <c:when test="${list.hinhThuc == 2}">
                                                <span style="color: red">-
                                                    <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ"/>
                                                </span>
                                      </c:when>
                                      <c:when test="${list.hinhThuc == 3}">
                                                <span style="color: #24c534">+
                                                    <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ"/>
                                                </span>
                                      </c:when>
                                  </c:choose>
                              </td>
                              <td>
                                  <c:choose>
                                      <c:when test="${list.trangThai == 1}">Hoàn thành</c:when>
                                      <c:when test="${list.trangThai == 2}">Đang xử lí</c:when>
                                  </c:choose>
                              </td>
                          </tr>
                      </c:forEach>
                      </tbody>
                  </table>
              </div>
          </div>
    </div>

<%--<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

<%----%>

<%--Js check validate bên js--%>

<script>
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

    function addProduct() {
        var soTienInput = document.getElementById("soTien").value;

        // Kiểm tra xem giá trị có phải là số và là số dương không
        if (!(/^\d*\.?\d+$/.test(soTienInput)) || parseFloat(soTienInput) <= 0) {
            document.getElementById("errorSoTien").innerHTML = "Vui lòng nhập số tiền hợp lệ để tiến hành nạp !";
            event.preventDefault();
        } else if (parseFloat(soTienInput) < 50000) {
            document.getElementById("errorSoTien").innerHTML = "Số tiền phải lớn hơn 50,000 VNĐ !";
            event.preventDefault();
        }else if (parseFloat(soTienInput) > 1000000) {
            document.getElementById("errorSoTien").innerHTML = "Số tiền không được lớn hơn 1,000,000 VNĐ !";
            event.preventDefault();
        }
    }

</script>

<%--JS cho phần thông báo nạp tiền--%>

<script>
    var themThanhCong = "${themThanhCong}";
    if (themThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Nạp tiền thành công!',
            icon: 'success',
        });
    }

    var themThatBai = "${themThatBai}";
    if (themThatBai == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Nạp tiền thất bại!',
            icon: 'error',
        });
    }
</script>


</body>
</html>


