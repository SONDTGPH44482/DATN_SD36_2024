<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

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
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<div class="container">

    <h3 style="text-align: center;">Create khách hàng</h3>
    <div>
        <h1 style="text-align: center; color: black; margin-top: 30px; margin-bottom: 60px">Thêm khách hàng</h1>
        <frm:form
                modelAttribute="khachHang"
                action="${pageContext.request.contextPath}/KhachHang/create"
                method="POST"
                enctype="multipart/form-data">
            <div class="row">
                <div class="col-6">
                    <label style="">Tên khách hàng</label>
                    <br>
                    <frm:input path="tenKhachHang" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               placeholder="text" value=""/>
                    <frm:errors cssClass="text-danger" path="tenKhachHang"></frm:errors>
                    <label cssClass="text-danger">${tenKhachHangNotNull}</label>
                    <label cssClass="text-danger">${tenKhachHangHopLe}</label>
                </div>
                <div class="col-6">
                    <label style="">Email</label>
                    <br>
                    <frm:input path="email" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               placeholder="text" value=""/>
                    <frm:errors cssClass="text-danger" path="email"></frm:errors>
                    <label cssClass="text-danger">${emailNotNull}</label>
                    <label cssClass="text-danger">${emailHopLe}</label>
                </div>
                <div class="col-6">
                    <label style="">Mật khẩu</label>
                    <br>
                    <frm:input path="matKhau" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               placeholder="text" value=""/>
                    <frm:errors cssClass="text-danger" path="matKhau"></frm:errors>
                    <label cssClass="text-danger">${matKhauNotNull}</label>
                </div>
                <div class="col-6">
                    <label style="">Địa chỉ</label>
                    <br>
                    <frm:input path="diaChi" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               placeholder="text" value=""/>
                    <frm:errors cssClass="text-danger" path="diaChi"></frm:errors>
                    <label cssClass="text-danger">${diaChiNotNull}</label>
                    <label cssClass="text-danger">${diaChiHopLe}</label>
                </div>
                <div class="col-6">
                    <label style="">Số điện thoại</label>
                    <br>
                    <frm:input path="soDienThoai" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               placeholder="text" value=""/>
                    <frm:errors cssClass="text-danger" path="soDienThoai"></frm:errors>
                    <label cssClass="text-danger">${soDienThoaiNotNull}</label>
                    <label cssClass="text-danger">${soDienThoaiHopLe}</label>
                </div>
                <div class="col-6">
                    <label style="">Ngày sinh</label>
                    <br>
                    <frm:input path="ngaySinh" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px"
                               type="date" value=""/>
                </div>

                <div class="col-6">
                    <label style="">Ghi chú</label>
                    <br>
                        <%--                    <frm:textarea id="long-text" name="long-text" rows="4" cols="50"></frm:textarea>--%>
                    <frm:input path="ghiChu" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px" type=""
                               value=""/>
                        <%--                    <textarea id="long-text" path="ghiChu" name="long-text" rows="4" cols="50"></textarea>--%>

                        <%--                                <div class="textTitle"><frm:errors cssStyle="margin-left: 400px; color: red" class="errors" path="name" /></div>--%>
                </div>
                <div class="col-6">
                    <label style="">Giới tính</label>
                    <br>
                    <frm:select path="gioiTinh" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px">
                        <option value="Nam">
                            Nam
                        </option>
                        <option value="Nữ">
                            Nữ
                        </option>
                    </frm:select>
                </div>
                <div class="col-6">
                    <label style="">Trạng thái</label>
                    <br>
                    <frm:select path="trangThai" cssStyle="width: 500px; height: 35px;border-radius: 5px 5px 5px">
                        <option value="1">
                            Còn hoạt động ✔
                        </option>
                        <option value="0">
                            Không còn hoạt động ✖
                        </option>
                    </frm:select>
                </div>
            </div>
            <br>
            <br>
            <button type="submit"
                    onclick="if (!confirm('Bạn chắc chắn muốn thêm không ?')){return false;}else{return true;}"
                    style="margin-left: 600px; margin-bottom: 190px" class="btn btn-primary">Create
            </button>
            <label>${message}</label>
        </frm:form>
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
</body>
</html>