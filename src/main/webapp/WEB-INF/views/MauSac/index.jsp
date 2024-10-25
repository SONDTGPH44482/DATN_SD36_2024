<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Màu sắc</title>
    <style>

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<style>
    <%--        Dành cho tab--%>

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
    <h3 style="text-align: center;">List màu sắc</h3>
    <br>
    <br>
<%--    <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm:" aria-label="Search"--%>
<%--           aria-describedby="basic-addon2">--%>

<%--    <form action="${pageContext.request.contextPath}/MauSac/search" method="GET">--%>
<%--        &lt;%&ndash;        <label for="tenMauSac" style="margin-left: 30px">Tên màu sắc </label>&ndash;%&gt;--%>
<%--        <input style="width: 400px" type="text" id="tenMauSac1" name="tenMauSac">--%>
<%--        &lt;%&ndash;        <br>&ndash;%&gt;--%>
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
                        <h6 style="color:black">Màu sắc</h6>
                        <select style="width: 500px;height: 35px; border-radius: 5px 5px 5px;margin-bottom: 0px"
                                type="text" id="tenMauSac">
                            <option style="border-radius: 5px 5px 5px" value="">Tất cả tên màu sắc</option>
                            <c:forEach items="${tenMauSac}" var="tenMauSac">
                                <option style="border-radius: 5px 5px 5px">${tenMauSac.tenMauSac}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-6">
                        <h6 style="color:black">Trạng thái</h6>
                        <select id="trangThai" style="width: 500px;height: 35px; border-radius: 5px 5px 5px">
                            <option value="" style="">All trạng thái ✔✖</option>
                            <option value="1" style="">Đã kích hoạt ✔</option>
                            <option value="0" style="">Chưa kích hoạt ✖</option>
                        </select>
                    </div>
                </div>
            </form>
            <div>

            </div>
        </div>
    </div>

    <br>
    <br>

    <div><a href="${pageContext.request.contextPath}/MauSac/view-create" class="btn btn-primary">Thêm màu sắc</a></div>

    <br>
    <br>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col" style="text-align: center">STT</th>
            <th scope="col" style="text-align: center">Tên màu sắc</th>
            <th scope="col" style="text-align: center">Ghi chú</th>
            <th scope="col" style="text-align: center">Trạng thái</th>
            <th scope="col" style="text-align: center">Functions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ms" items="${listPage}" varStatus="i">
            <tr class="product-item hide-row" data-tenMauSac="${ms.tenMauSac}" data-trangThai="${ms.trangThai}">
                <th style="" scope="row">${i.index+1}</th>
                <td style="">${ms.tenMauSac}</td>
                <td style="">${ms.ghiChu}</td>
                <td style="">${ms.trangThai== 0 ?"✔" : "✖"}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/MauSac/edit/${ms.id}">
                        <button class="btn btn-primary">Edit</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/MauSac/delete/${ms.id}"
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
                            <a href="/MauSac/list?pageNum=${currentPage - 1}" class="page-link"
                               style="border: 1px solid red;width: 100px">Previous</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->
                    </c:otherwise>
                </c:choose>

                <c:forEach var="pageNumber" items="${pageNumbers}">
                    <li class="page-item ${pageNumber == currentPage}">
                        <a href="/MauSac/list?pageNum=${pageNumber}" class="page-link">${pageNumber}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPage}">
                    <li class="page-item">
                        <a href="/MauSac/list?pageNum=${currentPage + 1}" class="page-link"
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

    function filterProducts() {
        // Lấy giá trị từ các trường input và select
        var tenMauSac = document.getElementById('tenMauSac').value.toLowerCase();
        var trangThai = document.getElementById('trangThai').value;

        // Lấy danh sách sản phẩm
        var products = document.getElementsByClassName('product-item');
        var anyResults = false; // Biến kiểm tra có kết quả hay không

        for (var i = 0; i < products.length; i++) {
            var product = products[i];
            var productTenMauSac = product.getAttribute('data-tenMauSac').toLowerCase();
            var productTrangThai = product.getAttribute('data-trangThai');

            // Kiểm tra xem sản phẩm phù hợp với bộ lọc hay không
            if (
                (trangThai === '' || productTrangThai === trangThai) &&
                productTenMauSac.includes(tenMauSac)

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
    document.getElementById('tenMauSac').addEventListener('input', filterProducts);
    document.getElementById('trangThai').addEventListener('change', filterProducts);

    // Áp dụng bộ lọc ban đầu
    filterProducts();


</script>

</body>
</html>