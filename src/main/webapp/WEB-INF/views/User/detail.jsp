<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Update Detail User</title>
</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>


<%--@elvariable id="user" type=""--%>
<form:form action="/user/update/${id}" modelAttribute="user" cssClass="container">

    <h3 style="color: black;margin-top: 50px; margin-bottom: 30px;text-align: center">Detail thông tin User</h3>

    <form:input type="hidden" path="maUser" class="form-control"/>

    <div class="row">
        <div class="col-6">
            <label>
                Email
             <span style="color: red">*</span>
            </label>
            <form:input path="email" class="form-control" readonly="true"/>
            <form:errors class="text-danger" element="span" path="email"/>
        </div>
        <div class="col-6">
            <label>
                Mật khẩu
                <span style="color: red">*</span>
            </label>
            <form:input type="password" path="matKhau" class="form-control"/>
            <form:errors class="text-danger" element="span" path="matKhau"/>
            <div class="thongBao" style="margin-top: 5px">
                <span style="color: red">${checkPass}</span>
                <span style="color: red">${checkPasslengh}</span>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-6">
            <label>
                Tên User
                <span style="color: red">*</span>
            </label>
            <form:input path="tenUser" class="form-control"/>
            <form:errors class="text-danger" element="span" path="tenUser"/>
            <div class="thongBao" style="margin-top: 5px">
                <span style="color: red">${tenUser}</span>
                <span style="color: red">${erCheckTen}</span>
            </div>
        </div>
        <div class="col-6" style="margin-top: 40px">
            <label>
                Giới tính
            </label>
<%--            <form:input path="gioiTinh" class="form-control"/>--%>
<%--            <form:errors class="text-danger" element="span" path="gioiTinh"/>--%>
            <form:radiobutton path="gioiTinh" value="Nam" checked="" cssStyle="margin-left: 50px"/>Nam
            <form:radiobutton cssStyle="margin-left: 30px" path="gioiTinh" value="Nữ"/>Nữ
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-6">
            <label>
                SĐT
                <span style="color: red">*</span>
            </label>
            <form:input path="soDienThoai" class="form-control"/>
            <form:errors class="text-danger" element="span" path="soDienThoai"/>
            <div class="thongBao" style="margin-top: 5px">
                <span style="color: red">${erCheckSĐT}</span>
                <span style="color: red">${erCheckSĐTString}</span>
                <span style="color: red">${erCheckSĐTStringNumber}</span>
                <span style="color: red">${erLogSoDienThoaiNumber}</span>
            </div>
        </div>
        <div class="col-6">
            <label>CCCD</label>
            <form:input path="maCCCD" class="form-control"/>
            <form:errors class="text-danger" element="span" path="maCCCD"/>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-6">
            <label>
                Hộ khẩu
                <span style="color: red">*</span>
            </label>
            <form:input path="hoKhau" class="form-control"/>
            <form:errors class="text-danger" element="span" path="hoKhau"/>
        </div>
        <div class="col-6">
            <label>Ngày sinh</label>
            <form:input type="date" path="ngaySinh" class="form-control"/>
            <form:errors class="text-danger" element="span" path="ngaySinh"/>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-6">
            <label>
                Địa chỉ
                <span style="color: red">*</span>
            </label>
                <%--                <form:input path="diaChi" class="form-control"/>--%>
                <%--                <form:errors class="text-danger" element="span" path="diaChi"/>--%>
            <form:textarea path="diaChi" class="form-control" type="text" cssStyle="height: 100px"/>
            <form:errors path="diaChi"/>

            <div class="thongBao" style="margin-top: 5px">
                <span style="color: red">${erCheckDiaChiNull}</span>
                <span style="color: red">${erCheckDiaChiSo}</span>
            </div>

        </div>
        <div class="col-6">
            <label>Ghi Chú</label>
            <form:textarea path="ghiChu" class="form-control" type="text" cssStyle="height: 100px"/>
            <form:errors path="ghiChu"/>

        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-6">
            <label>
                Trạng thái
                <span style="color: red">*</span>
            </label>
            <div class="form-check" style="margin-left: 90px">
                <form:radiobutton cssClass="form-check-input" path="trangThai" value="0" checked="true"/>
                <label class="form-check-label">Đang hoạt động</label>
            </div>
            <div class="form-check" style="margin-left: 90px">
                <form:radiobutton cssClass="form-check-input" path="trangThai" value="1"/>
                <label class="form-check-label">Ngừng hoạt động</label>
            </div>
        </div>
        <div class="col-6">
            <label>
                Role
                <span style="color: red">*</span>
            </label>
            <form:select path="role" cssStyle="width: 200px; margin-left:40px; height: 35px; border-radius: 10px 10px 10px ">
                <option value="ADMIN">
                    Admin
                </option>
                <option value="MEMBER">
                    Member
                </option>
            </form:select>
        </div>
    </div>



    <button class="btn btn-success" style="margin-top: 30px; margin-bottom: 30px">Update</button>

</form:form>


<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
</body>
</html>


