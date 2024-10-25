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
    <title>Đơn hàng bị hủy bên khách hàng</title>
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

<div class="container" style="">

    <div class="vertical-menu" style="background-color: #bac8f3">
        <a href="/Admin/xacNhanDonHangKhachHangAll" style="color: black">All trạng thái đơn hàng</a>
        <a href="/Admin/xacNhanDonHangKhachHang">Chờ xác nhận</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonDangDongGoi">Đang đóng gói</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonKhachHangDangGiao">Đang giao</a>
        <a href="/Admin/HoaDon/XacNhanHoaDonGiaoHangThanhCongHoanThanh">Hoàn thành</a>
        <a href="/Admin/HoaDon/DonHangBiHuy">Đã hủy</a>
    </div>

    <div style="overflow-x: auto;width: 100%">

        <h3 style="margin-top: 30px;margin-bottom: 60px;text-align: center;color: black">Các đơn hàng bị hủy</h3>
        <form method="post">
            <table class="table table-striped;" style="border-radius: 10px 10px 10px">
                <tr>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 130px">Mã hóa đơn</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 200px">Khách hàng</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 300px">Ngày thanh toán</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 170px">Tổng tiền</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 300px">Thông tin nhận hàng</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 210px;text-align: center">Ghi chú</td>
                    <td scope="col" style="color: black;font-weight: bold;font-size: 17px;background-color: #bac8f3;width: 210px;text-align: center">Funstion</td>

                </tr>
                <c:forEach items="${page.content}" var="list">
                    <tr>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.maHoaDon}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">${list.khachHang.tenKhachHang}</td>
                        <td style="font-size: 14px;color: black;font-weight: bold">
                            <script>
                                var ngayThanhToan = "${list.ngayThanhToan}";
                                var parts = ngayThanhToan.split('-');
                                var formattedDate = parts[1] + '-' + parts[2] + '-' + parts[0];
                                document.write(formattedDate);
                            </script>
                        </td>
                        <td style="font-size: 14px;color: black;font-weight: bold">
                            <fmt:formatNumber type="" value="${list.thanhTien}" pattern="#,##0.###" /> VNĐ
                        </td>
                        <td style="font-size: 14px;color: black;font-weight: bold;">${list.ghiChu}</td>
                        <td style="font-size: 14px; color: black; font-weight: bold">
                            <c:choose>
                                <c:when test="${not empty list.mess}">${list.mess}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <input type="hidden" name="hoaDonId" value="${list.id}">
                            <button style="margin-left: 30px;margin-top: 30px" formaction="/XoaHoaDon" value="${list.id}" class="btn btn-primary">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <ul class="pagination">
                <c:if test="${not page.first}">
                    <li class="page-item">
                        <a href="?pageNo=${page.number -1}">Pre</a>
                    </li>
                </c:if>
                <c:forEach begin="0" end="${page.totalPages > 1 ? page.totalPages - 1 : 0}" var="i">
                    <li class="page-item <c:if test='${i == page.number}'>active</c:if>">
                        <a class="page-link" href="?pageNo=${i}">${i + 1}</a>
                    </li>
                </c:forEach>
                <c:if test="${not page.last}">
                    <li class="page-item">
                        <a href="?pageNo=${page.number +1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </form>

    </div>

</div>



</body>
</html>
