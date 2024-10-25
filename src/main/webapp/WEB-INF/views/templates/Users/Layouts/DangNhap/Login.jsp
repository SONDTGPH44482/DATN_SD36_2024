<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login khách hàng</title>
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
            <div class="login100-pic js-tilt" data-tilt>
                <img src="/images/img-01.jpg" alt="IMG">
            </div>

            <frm:form modelAttribute="khachHang"
                      action="${pageContext.request.contextPath}/KhachHang/loginViewDangNhap"
                      method="POST" class="login100-form validate-form">

                    <div class="row">
                        <div class="col-12">
                            <h6 style="margin-left: 10px;margin-bottom: 10px;color: red">${message}</h6>
                            <h5 style="margin-left: 10px;margin-bottom: 10px;color: red">${messageLogout}</h5>
                        </div>
                    </div>
					<span class="login100-form-title" style="color: black; font-size: 30px; font-weight: bold" >
                        Đăng nhập
					</span>
                <div class="wrap-input100 validate-input" data-validate = "....@email.com">
                    <frm:input path="email" class="input100" type="text" name="email" placeholder="Email" style="font-weight: bold; font-size: 15px"/>

                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Input type number or String">
                    <frm:input path="matKhau" class="input100" type="password" name="pass" placeholder="Password" style="font-weight: bold; font-size: 15px"/>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
                    </span>
                </div>

                <br>
                <div class="label" style="color: red; font-size: 15px">
                        ${erLogLogin}
                        ${KhachHangNull}
                </div>

                <div class="container-login100-form-btn">
                    <button type="submit" class="login100-form-btn">
                        Login
                    </button>
                </div>

                <div class="text-center p-t-12">
						<span class="txt1">
						</span>
                    <a class="txt2" href="/KhachHang/viewQuenMatKhau/2">
                        <u style="font-size: 16px;color: black">
                            Quên mật khẩu
                        </u>
                    </a>
                </div>
                    <br>
                    <a class="txt2" href="/KhachHang/view-createDanngKy">
                        <span style="color: black;font-size: 17px">
                                                            Đăng ký tài khoản
                        </span>
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
            </frm:form>
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
<script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src="/js/main.js"></script>



</body>
</html>