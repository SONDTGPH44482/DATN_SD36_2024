<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Khách hàng</title>
    <%--    <link rel="icon" href="img/background_title.jpg" type="image/x-icon">--%>
    <style>

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<style>

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

<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<div class="container">
    <h3 style="text-align: center;">List Khách Hàng </h3>
    <br>
    <br>
<%--    <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm:" aria-label="Search"--%>
<%--           aria-describedby="basic-addon2">--%>

<%--    <form action="${pageContext.request.contextPath}/KhachHang/search" method="GET">--%>
<%--        <input style="width: 400px" type="text" name="tenKhachHang">--%>
<%--        <button class="btn btn-primary" type="submit">Tìm kiếm</button>--%>
<%--        <h6 style="color: red; margin-top: 10px">${messageFindDone}</h6>--%>
<%--        <h6 style="color: red; margin-top: 10px">${messageFindError}</h6>--%>
<%--        <h6 style="color: red; margin-top: 10px">${messageFind}</h6>--%>
<%--    </form>--%>
    <br>
    <br>
    <div class="row">
        <h3 style="margin-top: 5px; color: black; margin-bottom: 20px">Lọc</h3>
        <div class="common-filter">
            <form id="filter-form">
                <div class="row">
                    <div class="col-6">
                        <h6 style="color:black">Tên khách hàng</h6>
                        <input style="width: 500px; height: 35px;border-radius: 5px 5px 5px" type="text"
                               id="tenKhachHang" placeholder="Tên khách hàng">
                    </div>
                    <div class="col-6">
                        <h6 style="color:black">Email</h6>
                        <input style="width: 500px; height: 35px;border-radius: 5px 5px 5px" type="text" id="email"
                               placeholder="Email">
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="col-6">
                        <h6 style="color:black">Số điện thoại</h6>
                        <input style="width: 500px; height: 35px;border-radius: 5px 5px 5px" type="text"
                               id="soDienThoai" placeholder="Số điện thoại">
                    </div>
                    <div class="col-6">
                        <h6 style="color:black">Địa chỉ</h6>
                        <input style="width: 500px; height: 35px;border-radius: 5px 5px 5px" type="text" id="diaChi"
                               placeholder="Địa chỉ">
                    </div>
                </div>
            </form>
            <div>

            </div>
        </div>
    </div>

    <br>
    <br>

    <div><a href="${pageContext.request.contextPath}/KhachHang/view-createDanngKy" class="btn btn-primary">Thêm khách hàng</a>
    </div>
    <br>
    <br>
    <br>
    <br>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên khách hàng</th>
            <th scope="col">Email</th>
            <th scope="col">Mật khẩu</th>
            <th scope="col">Giới tính</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Ghi chú</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Function</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="kh" items="${listPage}" varStatus="i">
            <tr class="product-item hide-row" data-tenKhachHang="${kh.tenKhachHang}" data-email="${kh.email}"
                data-soDienThoai="${kh.soDienThoai}" data-diaChi="${kh.diaChi}">
                <th style="">${i.index+1}</th>
                <td style="">${kh.tenKhachHang}</td>
                <td style="">${kh.email}</td>
                <td style="">${kh.matKhau}</td>
                <td style="">${kh.gioiTinh}</td>
                <td style="">${kh.ngaySinh}</td>
                <td style="">${kh.soDienThoai}</td>
                <td style="">${kh.diaChi}</td>
                <td style="">${kh.ghiChu}</td>
                <td style="padding-top: 30px">${kh.trangThai==0 ?"✔" : "✖"}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/KhachHang/edit/${kh.id}">
                        <button class="btn btn-primary">Edit</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/KhachHang/delete/${kh.id}"
                       class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="noResults" class="alert alert-warning" style="display: none;margin-top: 10px">
        <h5 style="text-align: center;height: 60px;margin-top: 40px">Không có dữ liệu phù hợp với bộ lọc hiện tại!</h5>
    </div>
    <div class="row">
        <div class="col-12" style="">
            <%--            --%>
            <%--            <ul class="pagination" style="margin-left: 400px">--%>
            <%--                <c:choose>--%>
            <%--                    <c:when test="${currentPage > 1}">--%>
            <%--                        <li class="page-item">--%>
            <%--                            <a href="/MauSac/list?pageNum=${currentPage - 1}&tab=active" class="page-link" style="border: 1px solid red;width: 100px">Previous</a>--%>
            <%--                        </li>--%>
            <%--                    </c:when>--%>
            <%--                    <c:otherwise>--%>
            <%--                        <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->--%>
            <%--                    </c:otherwise>--%>
            <%--                </c:choose>--%>

            <%--                <c:forEach var="pageNumber" items="${pageNumbers}">--%>
            <%--                    <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">--%>
            <%--                        <a href="/MauSac/list?pageNum=${pageNumber}&tab=active" class="page-link">${pageNumber}</a>--%>
            <%--                    </li>--%>
            <%--                </c:forEach>--%>

            <%--                <c:if test="${currentPage < totalPage}">--%>
            <%--                    <li class="page-item">--%>
            <%--                        <a href="/MauSac/list?pageNum=${currentPage + 1}&tab=active" class="page-link" style="border: 1px solid red; width: 50px">Next</a>--%>
            <%--                    </li>--%>
            <%--                </c:if>--%>
            <%--            </ul>--%>

            <%--    <ul class="pagination" style="margin-left: 500px">--%>
            <%--        <c:choose>--%>
            <%--            <c:when test="${currentPage > 1}">--%>
            <%--                <li class="page-item">--%>
            <%--                    <a href="${pageContext.request.contextPath}/MauSac/list?pageNum=${currentPage - 1}" class="page-link">Previous</a>--%>
            <%--                </li>--%>
            <%--            </c:when>--%>
            <%--            <c:otherwise>--%>
            <%--                <li class="page-item disabled">--%>
            <%--                    <span class="page-link">Previous</span>--%>
            <%--                </li>--%>
            <%--            </c:otherwise>--%>
            <%--        </c:choose>--%>

            <%--        <c:forEach var="pageNumber" items="${pageNumbers}">--%>
            <%--            <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">--%>
            <%--                <a href="${pageContext.request.contextPath}/MauSac/list?pageNum=${pageNumber}" class="page-link">${pageNumber}</a>--%>
            <%--            </li>--%>
            <%--        </c:forEach>--%>

            <%--        <c:if test="${currentPage < totalPage}">--%>
            <%--            <li class="page-item">--%>
            <%--                <a href="${pageContext.request.contextPath}/MauSac/list?pageNum=${currentPage + 1}" class="page-link">Next</a>--%>
            <%--            </li>--%>
            <%--        </c:if>--%>
            <%--    </ul>--%>


            <ul class="pagination" style="margin-left: 400px">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <li class="page-item">
                            <a href="/KhachHang/list?pageNum=${currentPage - 1}" class="page-link"
                               style="border: 1px solid red;width: 100px">Previous</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->
                    </c:otherwise>
                </c:choose>

                <c:forEach var="pageNumber" items="${pageNumbers}">
                    <li class="page-item ${pageNumber == currentPage}">
                        <a href="/KhachHang/list?pageNum=${pageNumber}" class="page-link">${pageNumber}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPage}">
                    <li class="page-item">
                        <a href="/KhachHang/list?pageNum=${currentPage + 1}" class="page-link"
                           style="border: 1px solid red; width: 50px">Next</a>
                    </li>
                </c:if>
            </ul>


        </div>
    </div>
</div>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    var filterForm = document.getElementById('filter-form');
    var searchPerformed = false; // Tạo biến để kiểm tra xem tìm kiếm đã được thực hiện hay chưa

    filterForm.addEventListener('input', function () {
        var tenKhachHang = document.getElementById('tenKhachHang').value.toLowerCase();
        var email = document.getElementById('email').value.toLowerCase();
        var soDienThoai = document.getElementById('soDienThoai').value.toLowerCase();
        var diaChi = document.getElementById('diaChi').value.toLowerCase();

        var products = document.getElementsByClassName('product-item');

        for (var i = 0; i < products.length; i++) {
            var product = products[i];

            var productTenKhachHang = product.getAttribute('data-tenKhachHang').toLowerCase();
            var productEmail = product.getAttribute('data-email').toLowerCase();
            var productSoDienThoai = product.getAttribute('data-soDienThoai').toLowerCase();
            var productDiaChi = product.getAttribute('data-diaChi').toLowerCase();

            if (productTenKhachHang.includes(tenKhachHang) &&
                productEmail.includes(email) &&
                productSoDienThoai.includes(soDienThoai) &&
                productDiaChi.includes(diaChi)) {

                product.classList.remove('hide-row'); // Loại bỏ lớp ẩn

            } else {

                product.classList.add('hide-row'); // Thêm lớp ẩn

            }
        }

        var noResultsMessage = document.getElementById('noResults');
        if (anyResults) {
            noResultsMessage.style.display = 'none'; // Ẩn thông báo
        } else {
            noResultsMessage.style.display = 'block'; // Hiển thị thông báo
        }
        // Đặt biến searchPerformed thành true khi người dùng thực hiện tìm kiếm
        searchPerformed = true;

    });

    // Trước khi kích hoạt tìm kiếm, kiểm tra xem searchPerformed đã được thiết lập thành true hay chưa
    if (!searchPerformed) {
        var initialProducts = document.getElementsByClassName('product-item');
        for (var i = 0; i < initialProducts.length; i++) {

            initialProducts[i].classList.remove('hide-row'); // Loại bỏ lớp ẩn

        }
    }


</script>
</body>
</html>