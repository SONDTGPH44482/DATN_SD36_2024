<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông tin tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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


<%@ include file="../../Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>

<div class="container">
    <form action="${pageContext.request.contextPath}/TrangChu/Admin/ThongTinCaNhan/Luu" method="post" enctype="multipart/form-data">
        <div class="row" style="margin-top: 70px">
            <div class="col-3">
                <label style="margin-top: 60px" class="custom-file-upload" for="file">
                    <div class="icon">
                        <img style="max-height: 100%;max-width: 100%" id="preview-image" src="${pageContext.request.contextPath}/upload/${user.link}" alt="Image">
                    </div>
                    <div class="text">
                        <span>Chọn ảnh</span>
                    </div>
                    <input type="file" id="file" name="file" onchange="previewImage()">
                </label>
            </div>
            <div class="col-9">
                <div class="row">
                    <div class="col-9">
                        <h3 style="color: black;text-align: center;margin-bottom: 30px">Thông tin cá nhân</h3>
                    </div>
                    <div class="row">
                        <div class="col-5">
                            <label for="email" style="color: black">
                                Email
                                <span style="color: red">*</span>
                            </label>
                            <input class="form-control" type="text" id="email" name="email" value="${user.email}" disabled/>
                        </div>
                        <div class="col-5">
                            <label for="matKhau" style="color: black">
                                Mật khẩu
                                <span style="color: red">*</span>
                            </label>
                            <input class="form-control" type="password" id="matKhau" name="matKhau" value="${user.matKhau}" />
                            <div class="thongBao" style="color: red">
                                ${erCheckMatKhauNull}
                                ${erCheckMatKhauLenght}
                            </div>
                        </div>
                        <div class="col-5">
                            <label for="tenUser" style="color: black;margin-top: 20px">
                                Tên chủ tài khoản:
                                <span style="color: red">*</span>
                            </label>
                            <input class="form-control" type="text" id="tenUser" name="tenUser" value="${user.tenUser}" />
                            <div class="thongBao" style="color: red">
                                ${erCheckTenUser}
                                ${erCheckTen}
                            </div>
                        </div>
                        <div class="col-5">
                            <label for="soDienThoai" style="color: black;margin-top: 20px">
                                Số điện thoại:
                                <span style="color: red">*</span>
                            </label>
                            <input class="form-control" type="text" id="soDienThoai" name="soDienThoai" value="${user.soDienThoai}" />
                            <div class="thongBao" style="color: red">
                                ${erCheckSoDienThoai}
                                ${erCheckSoDienThoaiNumer}
                                ${erCheckSoDienThoaiString}
                                ${erLogSoDienThoaiNumber}
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="diaChi" style="margin-top: 20px;margin-bottom: 1px;color: black">
                            Địa chỉ
                            <span style="color: red">*</span>
                        </label>
                        <br>
                        <textarea rows="5" cols="97" name="diaChi" id="diaChi">${user.diaChi}</textarea>
                        <div class="thongBao" style="color: red">
                            ${erCheckDiaChi}
                            ${erCheckDiaChiSo}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button style="margin-top: 40px;margin-left: 15px;margin-bottom: 30px" type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../../Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>


<%--Định dạng tiền--%>

<script>

    function formatGiaBan() {
        var giaBanInput = document.getElementById("giaBan");
        var giaBanValue = giaBanInput.value;

        // Loại bỏ dấu phẩy và khoảng trắng (nếu có)
        var giaBanFormatted = giaBanValue.replace(/,/g, '').replace(/\s/g, '');

        // Kiểm tra xem giá trị là một số
        if (!isNaN(giaBanFormatted)) {
            // Định dạng giá trị thành chuỗi có dấu phẩy
            var formattedValue = giaBanFormatted.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Cập nhật giá trị trên trường nhập
            giaBanInput.value = formattedValue;
        }
    }

</script>

<%--mã js cho chọn ảnh--%>

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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>