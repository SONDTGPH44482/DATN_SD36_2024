<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm thông tin giầy thể thao</title>

</head>
<body>
<%@ include file="../../../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThaoHoaDon.jsp" %>
<div class="container" style="padding-top: 90px">

    <div class="back">

        <a href="/Admin/xacNhanDonHangKhachHang">
            <button class="btn btn-primary">Back</button>
        </a>

    </div>

    <h3 style="color: black;text-align: center;margin-bottom: 30px">Thông giầy thể thao vào hóa đơn</h3>


    <form method="post" action="/Admin/HoaDon/ThemThongTinSanPham">

            <div class="row">

<%--            <div class="col-12">--%>
<%--                <label>Tên giày thể thao</label>--%>
<%--                <select class="form-control" name="giayTheThaoChiTietId" onchange="removeDuplicates(this)">--%>
<%--                    <c:forEach items="${giayTheThaoChiTiet}" var="giayTheThaoChiTiet">--%>
<%--                        <option value="${giayTheThaoChiTiet.giayTheThao.id}">${giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </div>--%>

        <div class="col-12">
            <label>Tên giày thể thao</label>
            <select class="form-control" name="giayTheThaoChiTietId" onchange="removeDuplicates(this)">
                <c:forEach items="${giayTheThaoChiTiet}" var="giayTheThaoChiTiet">
                    <c:if test="${!values.contains(giayTheThaoChiTiet.giayTheThao.tenGiayTheThao)}">
                        <option value="${giayTheThaoChiTiet.giayTheThao.id}">${giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>



            </div>


            <div class="row">
                <div class="col-12">
                    <label>Size</label>
                    <select class="form-control" name="sizeId">
                        <c:forEach items="${giayTheThaoChiTiet}" var="giayTheThaoChiTiet">
                            <option value="${giayTheThaoChiTiet.size.id}">${giayTheThaoChiTiet.size.size}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <label>Size</label>
                    <select class="form-control" name="mauSacId">
                        <c:forEach items="${giayTheThaoChiTiet}" var="giayTheThaoChiTiet">
                            <option value="${giayTheThaoChiTiet.mauSac.id}">${giayTheThaoChiTiet.mauSac.tenMauSac}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        <div class="row">
            <div class="col-12">
                <label>Số lượng</label>
                <select class="form-control" name="soLuong">
                    <c:forEach items="${giayTheThaoChiTiet}" var="giayTheThaoChiTiet">
                        <option value="${giayTheThaoChiTiet.soLuong}">${giayTheThaoChiTiet.soLuong}</option>
                    </c:forEach>
                </select>
            </div>
        </div>




    <input type="hidden" name="idHoaDonConvert" value="${idHoaDonConvert}" />
        <button style="margin-top: 30px" type="submit" class="btn btn-primary">Lưu</button>
    </form>


</div>

</body>
<%--Loại bỏ các tên trùng lặp của giầy thể thao--%>

<script>
    var values = []; // Chuyển mảng values thành biến toàn cục

    function removeDuplicates(selectElement) {
        var options = selectElement.options;

        for (var i = 0; i < options.length; i++) {
            var optionValue = options[i].value;

            // Nếu giá trị không tồn tại trong mảng, thêm vào mảng
            if (values.indexOf(optionValue) === -1) {
                values.push(optionValue);
            } else {
                // Nếu giá trị đã tồn tại, loại bỏ option
                options[i].remove();
                i--; // Giảm chỉ số vì option đã bị loại bỏ
            }
        }
    }
</script>


</html>
