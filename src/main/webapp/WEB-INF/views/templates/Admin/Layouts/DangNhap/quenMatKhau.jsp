<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Admin</title>
    <!--===============================================================================================-->
    <link rel="icon" type="/image/png" href="/images/icons/favicon.jpg"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/css/util.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!--===============================================================================================-->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body>

<div class="limiter">
    <div class="container-login100">

        <div class="wrap-login100">
            <div class="text-center">
                        <span class="login100-form-title" style="color: black; font-size: 30px; font-weight: bold">
                        Quên mật khẩu
					</span>
            </div>
            <div class="container" style="border: 1px solid red">

                <div class="row">

                    <div class="col-5" style="border: 1px solid red">
                        <img src="https://airproductionservice.com/wp-content/uploads/2021/05/Login.jpg" alt="IMG"
                             width="300px">
                    </div>
                    <div class="col-7" style="border: 1px solid red">
                        <div class="row">
                            <div class="col-12">
                                <p style="color: black;font-size: 17px">Vui lòng nhập email tạo tài khoản của bạn !</p>
                            </div>
                            <br>
                            <div class="col-12">
                                <form method="post">

                                    <form method="post">

                                        <input class="form-control" type="text" name="email"
                                               placeholder="Vui lòng nhập địa chỉ email!">
                                        <br>
                                        <button class="btn btn-primary" formaction="/Admin/QuenMatKhau"
                                                style="margin-left: 30px">Gửi mật khẩu mới
                                        </button>

                                    </form>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/bootstrap/js/popper.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/tilt/tilt.jquery.min.js"></script>
<script>
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src="/js/main.js"></script>


</body>
</html>