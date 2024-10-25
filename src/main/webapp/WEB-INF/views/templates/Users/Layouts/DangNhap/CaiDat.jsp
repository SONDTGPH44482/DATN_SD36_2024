<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link href="/css/KhachHang/TrangChuDetailGiayTheThao.css" rel="stylesheet">
    <script src="path/to/jquery.min.js"></script>
    <script src="path/to/magnific-popup.js"></script>
    <script src="path/to/your-custom-js-file.js"></script>

    <style>
        .custom-file-upload {
            border: 2px dashed #cacaca;
            border-radius: 50% 50% 50%;
            background-color: rgba(255, 255, 255, 1);
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 170px;
            width: 190px;
        }

        .custom-file-upload .icon {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .custom-file-upload .icon img {
            max-height: 100%;
            max-width: 100%;
            border-radius: 50%;
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

        #preview-image {
            max-height: 100%;
            max-width: 100%;
        }
    </style>

</head>
<body>

<%--   Header--%>
<%@ include file="../../Layouts/Index/_Header_No_Register.jsp" %>


<div class="container" style="margin-top: 120px">
    <form action="${pageContext.request.contextPath}/TrangChu/ThongTinCaNhan/Luu" method="post" enctype="multipart/form-data">
         <div class="row" style="margin-top: 150px">
                <div class="col-3" style="">
                    <label style="margin-top: 60px" class="custom-file-upload" for="file">
                        <div class="icon">
                            <img style="max-height: 100%;max-width: 100%" id="preview-image" src="${pageContext.request.contextPath}/upload/${khachHang.link}" alt="Image">
                        </div>
                        <div class="text">
                            <span>Chọn ảnh</span>
                        </div>
                        <input type="file" id="file" name="file" onchange="previewImage()">
                    </label>
                </div>
                <div class="col-9" style="">
                    <div class="row">
                            <div class="col-12">
                                <h3 style="color: black;text-align: center;margin-bottom: 30px">Thông tin cá nhân</h3>
                            </div>
                            <div class="col-6">
                                <label for="email" style="color: black">
                                    Email
                                    <span style="color: red">*</span>
                                </label>
                                <input class="form-control" type="text" id="email" name="email" value="${khachHang.email}" disabled/>
                                <div class="thongBao" style="color: red">
                                    ${erCheckTrongEmail}
                                    ${erMail}
                                    ${erCheckEmailSo}
                                    ${erCheckEmail}
                                    ${erCheckTrungEmailKhachHang}
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="matKhau" style="color: black">
                                    Mật khẩu
                                    <span style="color: red">*</span>
                                </label>
                                <input class="form-control" type="password" id="matKhau" name="matKhau" value="${khachHang.matKhau}"/>
                                <div class="thongBao" style="color: red">
                                    ${erCheckPassWordNull}
                                    ${erCheckMatKhauLenght}
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="tenKhachHang" style="color: black;margin-top: 20px">
                                    Tên chủ tài khoản:
                                    <span style="color: red">*</span>
                                </label>
                                <input class="form-control" type="text" id="tenKhachHang" name="tenKhachHang" value="${khachHang.tenKhachHang}" />
                                <div class="thongBao" style="color: red">
                                    ${erCheckTenKhachHang}
                                    ${erCheckTen}
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="soDienThoai" style="color: black;margin-top: 20px">
                                    Số điện thoại:
                                    <span style="color: red">*</span>
                                </label>
                                <input class="form-control" type="text" id="soDienThoai" name="soDienThoai" value="${khachHang.soDienThoai}" />
                                <div class="thongBao" style="color: red">
                                    ${erCheckSoDienThoai}
                                    ${erLogSoDienThoaiNumber}
                                    ${erCheckSoDienThoaiString}
                                    ${erCheckSoDienThoaiNumer}
                                </div>
                            </div>
                        <div class="col-12">
                            <label for="diaChi" style="margin-top: 20px;margin-bottom: 1px;color: black">
                                Địa chỉ
                                <span style="color: red">*</span>
                            </label>
                            <br>
                            <textarea rows="5" cols="52" name="diaChi" id="diaChi">${khachHang.diaChi}</textarea>
                            <div class="thongBao" style="color: red">
                                ${erCheckDiaChi}
                                ${erCheckDiaChiSo}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                <button style="margin-top: 40px;margin-left: 15px" type="submit" class="btn btn-primary">Lưu</button>
                            </div>

                        </div>

                    </div>
                </div>
         </div>
    </form>
</div>

<%--Mã js cho chọn ảnh--%>

<script>
    function previewImage() {
        var preview = document.getElementById('preview-image');
        var fileInput = document.getElementById('file');
        var file = fileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "image.jpg"; // Ảnh mẫu
        }
    }

    function updateImage(updatedImageUrl) {
        // Thêm tham số ngẫu nhiên để tránh lưu trữ cache
        var randomParam = Date.now();
        updatedImageUrl += "?random=" + randomParam;

        // Cập nhật nguồn ảnh
        document.getElementById('preview-image').src = updatedImageUrl;

        console.log("Ảnh đã được cập nhật!");
    }

    function submitForm() {
        // Bạn có thể cần thêm logic ở đây để xử lý việc gửi biểu mẫu qua AJAX hoặc gửi thông thường

        // Ví dụ: Giả sử bạn sử dụng AJAX để gửi biểu mẫu
        $.ajax({
            url: "${pageContext.request.contextPath}/TrangChu/ThongTinCaNhan/Luu",
            type: "POST",
            data: new FormData($("#yourFormId")[0]),
            processData: false,
            contentType: false,
            success: function (data) {
                // Giả sử dữ liệu chứa URL ảnh đã cập nhật
                var updatedImageUrl = data.updatedImageUrl;

                // Gọi hàm để cập nhật ảnh
                updateImage(updatedImageUrl);
            },
            error: function () {
                // Xử lý lỗi nếu cần
            }
        });
    }

</script>

</body>
</html>

