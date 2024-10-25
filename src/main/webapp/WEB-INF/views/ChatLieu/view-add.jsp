<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Thêm dữ liệu cho chất liệu</title>
</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>

<div class="container">

    <h4 style="text-align: center;color: black;margin-top: 70px">Thêm mới chất liệu</h4>

    <form:form action="/chatLieu/add" modelAttribute="chatLieu" cssClass="container">
    <div class="form-group">
        <label>Tên chất liệu</label>
        <form:input path="tenChatLieu" class="form-control"/>
        <form:errors class="text-danger" element="span" path="tenChatLieu"/>
    </div>

    <div class="form-group">
        <label>Ghi Chú</label>
        <form:input path="ghiChu" class="form-control"/>
        <form:errors class="text-danger" element="span" path="ghiChu"/>
    </div>
    <div class="form-group">
        <label>Ngày tạo</label>
        <form:input type="date" path="ngayTao" class="form-control"/>
        <form:errors class="text-danger" element="span" path="ngayTao"/>
    </div>
    <div class="form-group">
        <label>Ngày sửa</label>
        <form:input type="date" path="ngaySua" class="form-control"/>
        <form:errors class="text-danger" element="span" path="ngaySua"/>
    </div>
    <div class="form-group">
        <label>Trạng thái</label>
        <div class="form-check">
            <form:radiobutton cssClass="form-check-input" path="trangThai" value="1" checked="true" />
            <label class="form-check-label">Đang kích hoạt</label>
        </div>
        <div class="form-check">
            <form:radiobutton cssClass="form-check-input" path="trangThai" value="0" />
            <label class="form-check-label">Chưa kích hoạt</label>
        </div>
    </div>

    <button class="btn btn-success">Add</button>
</div>


</form:form>
</div>

<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
</body>
</html>