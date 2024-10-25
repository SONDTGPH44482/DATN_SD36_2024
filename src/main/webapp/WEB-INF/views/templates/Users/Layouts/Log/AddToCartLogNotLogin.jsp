<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Not Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

</head>
<body>
<script>
    Swal.fire({

        icon: 'success',
        title: '<span style="font-size: 24px;">Vui lòng đăng nhập tài khoản để có thể mua hàng</span>',
        showConfirmButton: false, // Ẩn nút OK
        timer: 1500, // Thời gian hiển thị thông báo (miligiây)

    }).then(() => {

        window.location.href = '/KhachHang/loginViewDangNhap';

    });
</script>
</body>
</html>


