<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>User</title>
</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<div class="container">
    <h1>Nhân viên</h1>
    <form action="/user/loc" method="get">
        <div>
            <div>
                <h6 style="color:black;margin-top: 10px">Trạng thái</h6>
                <select id="trangThai" style="width: 500px;height: 35px; border-radius: 5px 5px 5px" name="trangThai">
                    <option value="" style="">Tất cả trạng thái </option>
                    <option value="1" style="">Đã kích hoạt </option>
                    <option value="0" style="">Chưa kích hoạt </option>
                </select>
                <%--        <button type="submit" class="btn btn-info btn-sm" >Lọc</button>--%>
            </div>
        </div>
    </form>
    <br>
    <br>
    <form action="/user/search" method="get">
        <input type="text" style="width: 400px" name="ten">
        <button type="submit" class="btn btn-info btn-sm" >Tìm kiếm</button>
    </form>
    <br>
    <a href="/user/view-add" class="btn btn-info btn-sm"> Add </a>
    <br>
    <br>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Email</th>
                <th>Tên user</th>
                <th>Giới tính</th>
                <th>SDT</th>
                <th>Trạng thái</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="d" varStatus="i">
                <tr>
                    <th>${i.index+1}</th>
                    <td>${d.email}</td>
                    <td>${d.tenUser}</td>
                    <td>${d.gioiTinh}</td>
                    <td>${d.soDienThoai}</td>
                    <td>${d.trangThai == 0 ? "Đang hoạt động" : "Đã nghỉ làm"}</td>
                    <td>${d.role}</td>
                    <td>
                            <%--                    <a href="/user/delete/${d.id}" class="btn btn-danger btn-sm">Remove</a>--%>
                        <a href="/user/detail/${d.id}" class="btn btn-info btn-sm">Detail</a>
                            <%--                    <a href="/user/view-add" class="btn btn-info btn-sm"> Add </a>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <c:if test="${next > 0}">
                        <a class="page-link" href="/user/hien-thi?num=${next - 1}">Previous</a>
                    </c:if>
                </li>
                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                    <li class="page-item"><a class="page-link" href="/user/hien-thi?num=${loop.index - 1}">${loop.index}</a></li>
                </c:forEach>
                <li class="page-item">
                    <c:if test="${!userPage.last && next < totalPages - 1}">
                        <a class="page-link" href="/user/hien-thi?num=${next + 1}">Next</a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </div>
</div>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
</body>
</html>