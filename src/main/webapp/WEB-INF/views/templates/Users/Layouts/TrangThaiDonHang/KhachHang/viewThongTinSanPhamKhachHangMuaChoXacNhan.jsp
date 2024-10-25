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
    <title>View thông tin sản phẩm khách hàng chờ xác nhận</title>
    <style>


        .vertical-menu {
            width: 200px;
            background-color: #FAFAFA;
            position: absolute;
            left: 160px;
            height: 100%;
            overflow: auto;
        }

        .vertical-menu a {
            background-color: #FAFAFA;
            color: black;
            display: block;
            padding: 12px;
            text-decoration: none;
        }

        .vertical-menu a:hover {
            background-color: #b1dfbb;
            color: white;
        }

    </style>

</head>
<body>

<%@ include file="../../Index/_Header_No_Register.jsp" %>

<div class="container" style="padding-top: 90px">

    <a href="/KhachHang/thongTinHoaDonAll/${maKhachHang}">
        <button class="btn btn-primary" style="margin-top: 40px">
                Black
        </button>
    </a>


    <h3 style="color: black;margin-top: 30px;margin-bottom: 40px;text-align: center">Thông tin sản phẩm mua</h3>

    <table class="table table-striped;" style="border-radius: 10px 10px 10px;border: 1px solid #FAFAFA ; background-color: #FAFAFA">
        <tr>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Mã hóa đơn</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 200px">Khách hàng</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 300px">Ngày thanh toán</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 170px">Tổng tiền</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 170px">Phí ship</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 300px">Thông tin nhận hàng</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 210px;text-align: center">Ghi chú</td>
            <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 200px">Trạng thái</td>
        </tr>
        <tr>
            <td style="font-size: 17px;color: black;">${hoaDonView.maHoaDon}</td>
            <td style="font-size: 17px;color: black;">${hoaDonView.khachHang.tenKhachHang}</td>

            <td style="font-size: 17px;color: black;">

                <c:set var="dateTimeString" value="${hoaDonView.ngayThanhToan}"/>
                <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                               pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                pattern="yyyy-MM-dd HH:mm:ss"/>
                ${formattedDate}

            </td>
            <td style="font-size: 17px;color: black">
                <fmt:formatNumber type="" value="${hoaDonView.thanhTien}" pattern="#,##0.###" />
            </td>
            <td style="font-size: 17px;color: black">
                <fmt:formatNumber type="" value="${hoaDonView.phiShip}" pattern="#,##0.###" />
            </td>
            <td style="font-size: 17px;color: black">
                ${hoaDonView.ghiChu}
            </td>
            <td style="font-size: 17px;color: black;">
                    <c:choose>
                        <c:when test="${not empty list.mess}">${hoaDonView.mess}</c:when>
                        <c:otherwise>N/A</c:otherwise>
                    </c:choose>
            </td>
            <td style="font-size: 17px;color: black">
                <c:choose>
                    <c:when test="${hoaDonView.trangThai == 0}">Chưa thanh toán</c:when>
                    <c:when test="${hoaDonView.trangThai == 1}">Chờ xác nhận</c:when>
                    <c:when test="${hoaDonView.trangThai == 2}">Đang đóng gói hàng</c:when>
                    <c:when test="${hoaDonView.trangThai == 3}">Đang giao</c:when>
                    <c:when test="${hoaDonView.trangThai == 4}">Giao hàng thành công</c:when>
                    <c:when test="${hoaDonView.trangThai == 5}">Hủy đơn hàng</c:when>
                    <c:otherwise>Trạng thái không xác định</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>

    <br>

    <h3 style="text-align: center;color: black;margin-bottom: 50px">Thông tin chi tiết sản phẩm</h3>
    <c:forEach items="${hoaDonChiTietList}" var="list" varStatus="i">
        <p style="border: 1px solid #FAFAFA; background-color: #FAFAFA;border-radius: 5px 5px 5px;height: 100px">
            <span style="display: inline-block;color: black;font-size: 16px;margin-left: 15px">${i.index+1} :</span>
            <span style="display: inline-block;color: black;font-size: 16px">${list.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</span>
            <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Size: ${list.giayTheThaoChiTiet.size.size}</span>
            <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Màu sắc: ${list.giayTheThaoChiTiet.mauSac.tenMauSac}</span>
            <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px">Số lượng mua: ${list.soLuong}</span>
            <span style="display: inline-block;padding-left: 20px;color: black;font-size: 16px;margin-top: 30px">Giá bán:
                <fmt:formatNumber type="" value="${list.giayTheThaoChiTiet.giayTheThao.giaBan}" pattern="#,##0.###"/> VNĐ
            </span>
            <span style="display: inline-block;padding-left: 20px">
                <img src="/upload/${list.giayTheThaoChiTiet.giayTheThao.image.get(0).link}" width="110px"
                     style="border-radius: 10px 10px 10px;margin-top: 5px">
            </span>
        </p>
    </c:forEach>
    <br>
    <br>

</div>

</body>
</html>
