<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn của khách hàng</title>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap; /* Cho phép các phần tử con xuống dòng khi không đủ không gian */
        }

        .vertical-menu {
            display: flex;
            flex-direction: row;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .vertical-menu a {
            text-decoration: none;
            color: black;
            font-size: 20px;
            font-weight: bold;
            margin-left: 20px;
            padding-left: 20px;
            padding-right: 20px;
            margin: 5px;
        }

        .container > div {
            width: 100%; /* Đảm bảo rằng nội dung chiếm toàn bộ chiều rộng khi xuống dòng */
            margin-top: 16px; /* Thêm khoảng trắng giữa menu và nội dung */
            padding: 16px;
        }


    </style>

</head>
<body>

<%@ include file="../../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThaoHoaDon.jsp" %>

<div class="container">

    <div class="vertical-menu" style="background-color: #bac8f3">
        <a href="/Admin/xacNhanDonHangKhachHangAll" style="color: black">All trạng thái đơn hàng</a>
        <a href="/Admin/xacNhanDonHangKhachHang" style="color: black">Chờ xác nhận</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonDangDongGoi" style="">Đang đóng gói</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonKhachHangDangGiao"> Đang giao</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonGiaoHangThanhCongHoanThanh">Hoàn thành</a>
        <a href="/Admin/HoaDon/DonHangBiHuy">Đã hủy</a>
    </div>

   <br>
    <div style="overflow-x: auto;width: 100%">
        <h3 style="text-align: center;color: black;margin-bottom: 50px;margin-top: 10px">All Trạng thái các đơn hàng</h3>
        <form  method="post" action="/HoaDon/Admin/TrangThaiDonHangAllView">
            <table class="table table-striped;" style="border-radius: 10px 10px 10px">
                <tr>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Mã hóa đơn</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 200px">Khách hàng</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 260px">Ngày thanh toán</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 200px">Tổng tiền</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;text-align: center;background-color: #bac8f3;width:300px">Thông tin nhận hàng</td>
<%--                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;text-align: center;background-color: #bac8f3;width: 300px">Ghi chú</td>--%>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Hình thức</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Loại</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Trạng thái</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Functions</td>

                </tr>
                <c:forEach items="${listHoaDon}" var="list">
                    <tr>

                        <td style="font-size: 14px;color: black;font-weight: bold">${list.maHoaDon}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.khachHang.tenKhachHang}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">
                            <c:set var="dateTimeString" value="${list.ngayThanhToan}"/>
                            <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                           pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                            <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                            ${formattedDate}
                        </td>
                        <td style="font-size: 14px;color: black;font-weight: bold">
                            <fmt:formatNumber type="" value="${list.thanhTien}" pattern="#,##0.###" /> VNĐ
                        </td>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.ghiChu}</td>
<%--                        <td style="font-size: 14px; color: black; font-weight: bold">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${not empty list.mess}">${list.mess}</c:when>--%>
<%--                                <c:otherwise>N/A</c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </td>--%>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.hinhThuc == 1 ? "Tại quầy" : "Online"}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.trangThaiMoney == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">
                                <c:choose>
                                    <c:when test="${list.trangThai == 0}">
                                            Chưa thanh toán
                                    </c:when>
                                    <c:when test="${list.trangThai == 1}">
                                            Chờ xác nhận
                                    </c:when>
                                    <c:when test="${list.trangThai == 2}">
                                        Đang đóng gói hàng
                                    </c:when>
                                    <c:when test="${list.trangThai == 3}">
                                        Đang giao
                                    </c:when>
                                    <c:when test="${list.trangThai == 4}">
                                        Giao hàng thành công
                                    </c:when>
                                    <c:when test="${list.trangThai == 5}">
                                        Hủy đơn hàng
                                    </c:when>
                                    <c:otherwise>
                                        Trạng thái không xác định
                                    </c:otherwise>
                                </c:choose>
                        </td>
                         <td style="font-size: 14px;color: black;font-weight: bold">
                             <button type="submit" name="selectedIdHoaDon" value="${list.id}" class="btn btn-primary">Views</button>
                         </td>

                    </tr>
                </c:forEach>
            </table>
        </form>



    </div>

</div>

</body>
</html>
