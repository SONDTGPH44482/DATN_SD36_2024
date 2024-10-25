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


</head>
<body>

<%--   Header--%>
<%@ include file="../../Layouts/Index/_Header.jsp" %>
<%@ include file="../Index/_Session1.jsp" %>


<div class="container" style="margin-top: 0px">

    <form method="post">
        <div class="login">
            <h3 style="text-align: center">Quên mật khẩu</h3>
            <br>
            <form method="post">
                <div class="row">
                    <div class="col-9">
                        <div class="row">
                            <div class="col-4">
                                  <h5 style="color: black;margin-top: 10px;margin-left: 50px">
                                      Vui lòng nhập email !
                                      <span style="color:red">
                                      *
                                      </span>
                                  </h5>
                            </div>
                            <div class="col-8">
                                <input class="form-control" type="text" name="email" placeholder="Vui lòng nhập địa chỉ email">
                                <div class="thongBao" style="color: red">
                                    ${loi}
                                    ${loiEmailNull}
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-3">
                        <button class="btn btn-primary" formaction="/KhachHang/QuenMatKhau" style="margin-left: 30px">Gửi mật khẩu mới</button>
                    </div>
                </div>
            </form>
        </div>
    </form>





    <div class="col-12" style="margin-top: 20px">
        <div class="row" style="width: 1160px; margin-top: 65px">
            <div class="col-1">
                <img src="../../../../../../resources/img/banner/banner-img.png" alt=""
                     style="width: 100px; border: 1px solid white; border-radius: 1000px 1500px 700px; margin-top: 22px">
            </div>
            <div class="col-3" style="margin-left: 30px">
                <h4 style="margin-top: 15px">BEE SHOES</h4>
                <a href="https://www.facebook.com/profile.php?id=100032748851883" style="text-decoration: none"
                   aria-label="Facebook" rel="noreferrer" target="_blank">
                    <button style="margin-bottom: 10px; height: 40px" type="submit" class="btn btn">
                        <img src="../../../../../../resources/img/banner/face.png" alt="" style="width: 15px">
                        Chat
                    </button>
                </a>
                <a href="/TrangChu/listGiayTheThao" style="text-decoration: none">
                    <button style="margin-bottom: 10px; height: 40px; margin-left: 10px;" type="submit"
                            class="btn btn">
                        Xem Shop
                    </button>
                </a>
            </div>
            <div class="vertical-line"></div>
            <div class="col-3" style="margin-top: 20px">
                <p>Tổng sản phẩm cửa hàng hoạt động: </p>
                <p>Thời gian phản hồi: 30p</p>
            </div>
            <div class="col-2" style="margin-top: 20px">
                <p>Tỉ lệ phản hồi: 95%</p>
                <p>Tham gia: 10/2023</p>
            </div>
            <div class="col-2" style="margin-top: 20px">
                <p>Người theo dõi: </p>
                <p>Đánh giá: </p>
            </div>
        </div>
    </div>




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

