<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng kí tài khoản</title>
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

    <style>

        /* Ẩn ô input mặc định */
        #fileInput {
            display: none;
        }

        /* Tùy chỉnh nút chọn tệp ảnh */
        .custom-file-upload {
            height: 200px;
            /*width: 300px;*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 20px;
            cursor: pointer;
            border: 2px dashed #cacaca;
            background-color: rgba(255, 255, 255, 1);
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0px 48px 35px -48px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .custom-file-upload .icon {
            display: flex;
            align-items: center;
            justify-content: center;

        }

        .custom-file-upload .icon svg {
            height: 80px;
            fill: rgba(75, 85, 99, 1);

        }

        .custom-file-upload .text {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .custom-file-upload .text span {
            font-weight: 400;
            color: rgba(75, 85, 99, 1);

        }

        .custom-file-upload input {
            display: none;

        }



        .preview-image{

            position: absolute;
            top: 0px;
            width: 100%;
            height: 100%;
            border-radius: 10px 10px 10px;


        }


    </style>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100" style="">
            <%--@elvariable id="khachHang" type=""--%>
            <frm:form cssStyle="width: 520px;"
                      modelAttribute="khachHang"
                      action="${pageContext.request.contextPath}/KhachHang/create"
                      method="post"
                      enctype="multipart/form-data">

                <div class="row" style="width: 800px">

                    <div class="col-3" style="margin-top: 70px">
<%--                        <label for="" class="custom-file-upload" style="width: 200px">--%>
<%--                            <div class="icon">--%>
<%--                                <svg xmlns="http://www.w3.org/2000/svg" fill="" viewBox="0 0 24 24"></svg>--%>
<%--                            </div>--%>
<%--                            <div class="text">--%>
<%--                                <span style="font-size: 13px;color: black">Click to upload image</span>--%>
<%--                            </div>--%>
<%--                            <div style="border: 1px solid red">--%>
<%--                                <input name="link" style="margin-left: 18px" value="" type="file"/>--%>
<%--                            </div>--%>
<%--                        </label>--%>
<%--                     <input name="imageKhachHang" style="margin-left: 18px" value="" type="file"/>--%>

                    </div>

                    <div class="col-9">
                        <h5 style="margin-bottom: 30px; margin-left: 100px; font-weight: bold">Tạo tài khoản</h5>
                        <div class="row">
                            <div class="col-6">
                                <label style="margin-left: 40px">Email <span style="color: red">*</span></label>
                                <frm:input class="form-control" placeholder="Email"
                                           cssStyle="width: 250px; margin-left: 40px; margin-right: 30px" path="email"/>
                                <label style="color: red;margin-left: 35px">${emailNotNull}</label>
                                <label style="color: red;margin-left: 35px">${emailHopLe}</label>
                            </div>
                            <div class="col-6">
                                <label style="margin-left: 40px;">Mật khẩu <span style="color: red">*</span></label>
                                <frm:input class="form-control" type="password" placeholder="Mật khẩu"
                                           cssStyle="width: 250px; margin-left: 30px" path="matKhau"/>
                                <label style="color: red;margin-left: 40px">${matKhauNotNull}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label style="margin-left: 40px; margin-top: 20px">Tên khách hàng <span
                                        style="color: red">*</span></label>
                                <frm:input class="form-control" placeholder="Tên khách hàng"
                                           cssStyle="width: 250px; margin-left: 40px; margin-right: 30px"
                                           path="tenKhachHang"/>
                                <label class="">${tenKhachHangNotNull}</label>
                                <label>${tenKhachHangHopLe}</label>
                            </div>
                            <div class="col-6">
                                <label style="margin-left: 50px; margin-top: 20px; margin-bottom: 20px">Giới
                                    tính</label>
                                <br>
                                <frm:radiobutton path="gioiTinh" value="Nam" checked="checked"
                                                 cssStyle="margin-left: 50px"/>Nam
                                <frm:radiobutton cssStyle="margin-left: 30px" path="gioiTinh" value="Nữ"/>Nữ
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label style="margin-left: 40px; margin-top: 20px">Ngày sinh</label>
                                <frm:input class="form-control" placeholder="Ngày sinh"
                                           cssStyle="width: 250px; margin-left: 40px; margin-right: 30px"
                                           path="ngaySinh"/>
                            </div>
                            <div class="col-6">
                                <label style="margin-left: 40px; margin-top: 20px">Số điện thoại <span
                                        style="color: red">*</span></label>
                                <frm:input class="form-control" placeholder="Số điện thoại"
                                           cssStyle="width: 250px; margin-left: 30px" path="soDienThoai"/>
                                <label class="">${soDienThoaiNotNull}</label>
                                <label>${soDienThoaiHopLe}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label style="margin-left: 40px; margin-top: 20px">Địa chỉ <span
                                        style="color: red">*</span></label>
                                <frm:input class="form-control" placeholder="Địa chỉ" cssStyle="width: 250px; margin-left: 40px" path="diaChi"/>
                                <label style="color: red">${diaChiNotNull}</label>
                            </div>
                        </div>
                    </div>
                    <div class="container-login100-form-btn"
                         style="width: 150px; margin-top: 30px; margin-bottom: 30px; margin-left: 450px">
                        <button type="submit" class="login100-form-btn">
                            Đăng kí
                        </button>
                    </div>
                </div>
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
<script>
    $('.js-tilt').tilt({
        scale: 1.1
    })

//    js cho image
    const fileInput = document.getElementById('fileInput');
    const customFileUpload = document.querySelector('.custom-file-upload');

    fileInput.addEventListener('change', function () {
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                const previewImage = document.createElement('img');
                previewImage.src = e.target.result;
                previewImage.alt = 'Uploaded Image';
                previewImage.classList.add('preview-image');

                // Xóa các hình ảnh xem trước hiện tại (nếu có)
                const existingPreviewImages = customFileUpload.querySelectorAll('.preview-image');
                existingPreviewImages.forEach(img => img.remove());

                customFileUpload.appendChild(previewImage);
            };

            reader.readAsDataURL(file);
        }
    });




</script>
<!--===============================================================================================-->
<script src="/js/main.js"></script>


</body>
</html>