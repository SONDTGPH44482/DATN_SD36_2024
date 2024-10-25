<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create dữ liệu giầy thể thao</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%--    <link href="/css/GiayTheThao/All_GiayTheThao/create.css" rel="stylesheet">--%>

</head>
<body>

<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>

<div class="container">

    <a href="/GiayTheThao/listGiayTheThao" style="text-decoration: none">
        <button style="margin-bottom: 10px;" type="submit" class="btn btn-primary">Back</button>
    </a>

    <h3 style="text-align: center; color: black; margin-top: 0px; margin-bottom: 30px">Thêm dữ liệu bảng giầy thể thao</h3>

    <frm:form
                    modelAttribute="giayTheThao"
                    action="${pageContext.request.contextPath}/GiayTheThao/create"
                    method="POST"
                    enctype="multipart/form-data"
            >

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label >Form</label>
                        <span style="color: red">*</span>
                        <select class="form-control" name="form.id">
                            <c:forEach items="${form}" var="form">
                                <c:if test="${form.trangThai eq 1}">
                                    <option value="${form.id}">${form.tenForm}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Công dụng</label>
                        <span style="color: red">*</span>
                        <select class="form-control" name="congDung.id">
                            <c:forEach items="${congDung}" var="congDung">
                                <c:if test="${congDung.trangThai eq 1}">
                                    <option value="${congDung.id}">${congDung.tenCongDung}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Chất liệu</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="chatLieu.id">
                            <c:forEach items="${chatLieu}" var="chatLieu">
                                <c:if test="${chatLieu.trangThai eq 1}">
                                    <option value="${chatLieu.id}">${chatLieu.tenChatLieu}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label >Hướng dẫn bảo quản </label>
                        <span style="color: red">*</span>
                        <select class="form-control" name="huongDanBaoQuan.id">
                            <c:forEach items="${huongDanBaoQuan}" var="huongDanBaoQuan">
                                <c:if test="${huongDanBaoQuan.trangThai eq 1}">
                                    <option value="${huongDanBaoQuan.id}">${huongDanBaoQuan.tenHuongDanBaoQuan}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Lót giầy</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="lotGiay.id">
                            <c:forEach items="${lotGiay}" var="lotGiay">
                                <c:if test="${lotGiay.trangThai eq 1}">
                                    <option value="${lotGiay.id}">${lotGiay.tenLotGiay}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Cổ giầy</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="coGiay.id">
                            <c:forEach items="${coGiay}" var="coGiay">
                                <c:if test="${coGiay.trangThai eq 1}">
                                    <option value="${coGiay.id}">${coGiay.tenCoGiay}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label >Đế giầy</label>
                        <span style="color: red">*</span>
                        <select class="form-control" name="deGiay.id">
                            <c:forEach items="${deGiay}" var="deGiay">
                                <c:if test="${deGiay.trangThai eq 1}">
                                    <option value="${deGiay.id}">${deGiay.tenDeGiay}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Dây giày</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="dayGiay.id">
                            <c:forEach items="${dayGiay}" var="dayGiay">
                                <c:if test="${dayGiay.trangThai eq 1}">
                                    <option value="${dayGiay.id}">${dayGiay.tenDayGiay}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Trọng lượng</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="trongLuong.id">
                            <c:forEach items="${trongLuong}" var="trongLuong">
                                <c:if test="${trongLuong.trangThai eq 1}">
                                    <option value="${trongLuong.id}">${trongLuong.tenTrongLuong}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Thương hiệu</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="thuongHieu.id">
                            <c:forEach items="${thuongHieu}" var="thuongHieu">
                                <c:if test="${thuongHieu.trangThai eq 1}">
                                    <option value="${thuongHieu.id}">${thuongHieu.tenThuongHieu}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Kiểu buộc</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="kieuBuoc.id">
                            <c:forEach items="${kieuBuoc}" var="kieuBuoc">
                                <c:if test="${kieuBuoc.trangThai eq 1}">
                                    <option value="${kieuBuoc.id}">${kieuBuoc.tenKieuBuoc}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Đinh tán giầy</label>
                        <span style="color: red">*</span>
                        <select  class="form-control" name="dinhTanGiay.id">
                            <c:forEach items="${dinhTanGiay}" var="dinhTanGiay">
                                <c:if test="${dinhTanGiay.trangThai eq 1}">
                                    <option value="${dinhTanGiay.id}">${dinhTanGiay.tenDinhTanGiay}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label>Tên giầy thể thao</label>
                        <span style="color: red">*</span>
                        <frm:input id="tenGiayTheThao" required="" type="text" class="form-control" path="tenGiayTheThao" cssStyle="" placeholder="Input text" value=""/>
                        <frm:errors path="tenGiayTheThao"></frm:errors>
                        <div class="er">
                             <label style="color: red">${erTenGiayTheThaoIsEmty}</label>
                             <label style="color: red">${erCheckTenGiayTheThaoSo}</label>
                             <label style="color: red">${erCheckTenGiayTheThaoTrung}</label>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Giá bán VNĐ</label>
                        <span style="color: red">*</span>
                        <frm:input id="giaBan"  required="" type="text" class="form-control" path="giaBan" cssStyle="" onblur="formatGiaBan()" placeholder="Input VNĐ" value=""/>
                        <frm:errors path="giaBan"></frm:errors>
                        <div class="er">
                            <label style="color: red">${erCheckGiaBanNumber}</label>
                            <label style="color: red">${erCheckGiaBanSoConertString}</label>
                            <label style="color: red">${erCheckGiaBanIsEmtry}</label>
                        </div>
                    </div>

<%--                    <div class="form-group col-md-4">--%>
<%--                        <label style="margin-left: 30px">Giới tính :</label>--%>
<%--                        <div class="gioiTinh" style="margin-top: 7px; margin-left: 50px">--%>
<%--                            <input class="form-check-input" type="radio" name="gioiTinh" id="inlineRadio1" value="Nam" checked = "checked" >--%>
<%--                            <label style="color: black; margin-right: 40px" class="form-check-label" for="inlineRadio1">Nam</label>--%>
<%--                            <input class="form-check-input" type="radio" name="gioiTinh" id="inlineRadio2" value="Nữ">--%>
<%--                            <label style="color: black" class="form-check-label" for="inlineRadio2">Nữ</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label>Mô tả</label>
                        <frm:textarea path="moTa" class="form-control" type="text" cssStyle="height: 100px"/>
                        <frm:errors path="moTa"></frm:errors>
                    </div>
                </div>

        <button  style="margin-bottom: 30px; margin-left: 470px; margin-top: 30px" type="submit" class="btn btn-primary">Create</button>
    </frm:form>

</div>


<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>


<%--Định dạng tiền--%>

<script>

    function formatGiaBan() {
        var giaBanInput = document.getElementById("giaBan");
        var giaBanValue = giaBanInput.value;

        // Loại bỏ dấu phẩy và khoảng trắng (nếu có)
        var giaBanFormatted = giaBanValue.replace(/,/g, '').replace(/\s/g, '');

        // Kiểm tra xem giá trị là một số
        if (!isNaN(giaBanFormatted)) {
            // Định dạng giá trị thành chuỗi có dấu phẩy
            var formattedValue = giaBanFormatted.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Cập nhật giá trị trên trường nhập
            giaBanInput.value = formattedValue;
        }
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>