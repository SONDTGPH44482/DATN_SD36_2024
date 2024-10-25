<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn khách hàng</title>
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

    <div class="vertical-menu">
        <a href="/KhachHang/HoaDon/ChoThanhToan/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Chờ thanh toán</a>
        <a href="/KhachHang/HoaDon/ChoXacNhan/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Chờ xác nhận</a>
        <a href="/KhachHang/HoaDon/ChoDongGoi/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Chờ đóng gói</a>
        <a href="/KhachHang/HoaDon/DangGiaoHang/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Đang giao</a>
        <a href="/KhachHang/HoaDon/GiaoHangThanhCong/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Hoàn thành</a>
        <a href="/KhachHang/HoaDon/HuyDonHang/${maKH}" style="color: black;font-size: 18px;font-weight: lighter">Đã hủy</a>

    </div>

    <div style="margin-left: 300px; padding: 1px 16px;margin-top: 50px">
        <h3>Vui lòng theo dõi đơn hàng để có thể biết được chi tiết</h3>
    </div>

</div>
</body>
</html>
