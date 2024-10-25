<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sang giao hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

</head>
<body>
<script>
    Swal.fire({

        icon: 'success',
        title: '<span style="font-size: 24px;">Hủy đơn hàng thành công!</span>',
        showConfirmButton: false, // Ẩn nút OK
        timer: 1500, // Thời gian hiển thị thông báo (miligiây)

    }).then(() => {

        window.location.href = '/Admin/HoaDon/XacNhanHoaDonKhachHangDangGiao';


    });
</script>
</body>
</html>


