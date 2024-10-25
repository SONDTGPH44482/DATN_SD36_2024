<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Thêm sản phẩm vào giỏ hàng thành công</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

</head>
<body>
<script>
    Swal.fire({

        icon: 'success',
        title: '<span style="font-size: 24px;">Sản phẩm được chọn đã được xóa !</span>',
        showConfirmButton: false, // Ẩn nút OK
        timer: 1500, // Thời gian hiển thị thông báo (miligiây)

    }).then(() => {

        // window.location.href = '/templates/Users/Layouts/Shop/gioHangView';
        window.location.href = '/GiayTheThao/NguoiDung/ViewGioHang';

    });
</script>
</body>
</html>


