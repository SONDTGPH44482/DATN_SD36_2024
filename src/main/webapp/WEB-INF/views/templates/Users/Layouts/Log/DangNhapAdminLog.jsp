<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Log đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>

</head>
<body>
<script>

    Swal.fire({
        icon: 'success',
        title: 'Đăng nhập thành công!',
        showConfirmButton: false, // Ẩn nút OK
        timer: 1300, // Thời gian hiển thị thông báo (miligiây)

    }).then(() => {

        window.location.href = '/TrangChu/Admin/home';

    });

</script>
</body>
</html>


