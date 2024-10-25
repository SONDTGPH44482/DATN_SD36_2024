<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!doctype html>
<html lang="en">
<head>
    <title>Thương hiệu</title>
    <style>
        .label{
            margin-bottom: 10px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>
<div class="container">
    <h1 style="line-height: 100px; text-align: center; color: red">
        Thương hiệu
    </h1>
    <div>
        <sf:form
                modelAttribute="th"
                action="create"
                method="POST"
                enctype="multipart/form-data"

        >
            <div class="row">
                <div class="col-6 label">
                    <label class="label">Tên thương hiệu</label>
                    <sf:input path="tenThuongHieu" cssClass="form-control ten"/>
<%--                    <div>--%>
<%--                        <sf:errors path="tenThuongHieu" cssStyle="color: red"></sf:errors>--%>
<%--                    </div>--%>
                    <div>
                        <span id="error-ten" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label">Ghi chú </label>
                    <sf:input path="ghiChu" cssClass="form-control ghiChu"/>
                    <div>
                        <span id="error-GhiChu" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label">Ngày tạo</label>
                    <sf:input path="ngayTao" cssClass="form-control" type="date" readonly="true" />
                </div>
                <div class="col-6">
                    <label class="label">Ngày sửa</label>
                    <sf:input path="ngaySua" cssClass="form-control" type="date" readonly="true" />
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label">Trạng thái</label>
                    <div style="margin-top: 8px">
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio1" value="1"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio1">Còn</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio2" value="0"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio2">Hết</label>
                        </div>
                    </div>
                </div>
            </div>
            <p style="text-align: right">
                <button type="submit"style="margin-right: 0px; margin-bottom: 190px" class="btn btn-primary them">Thêm</button>
            </p>

        </sf:form>
    </div>
</div>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    var ghiChu = document.getElementsByClassName('ghiChu')[0];
    var ten = document.getElementsByClassName('ten')[0];
    function focusInput(){

        ghiChu.addEventListener("focus", function() {
            document.getElementById('error-GhiChu').innerHTML="";
        });
        ten.addEventListener("focus", function() {
            document.getElementById('error-ten').innerHTML="";
        });

    }
    focusInput();

    function validateInput() {
        var btnSua = document.getElementsByClassName('them')[0];
        btnSua.onclick = function (){
            var ten = document.getElementsByClassName('ten')[0].value.trim().length;
            var ghiChu = document.getElementsByClassName('ghiChu')[0].value.trim().length;

            var confirmUpdate = confirm('Bạn chắc chắn muốn thêm không?');

            if (!confirmUpdate) {
                console.log('ten: ', ten);
                console.log('ghi chu: ', ghiChu);

                return false;
            } else {
                if(ten<1&&ghiChu<1){
                    document.getElementById('error-GhiChu').innerHTML = "Không để trống";
                    document.getElementById('error-ten').innerHTML = "Không để trống";
                    return false;
                }
                if(ten<1){
                    document.getElementById('error-ten').innerHTML = "Không để trống";
                    return false;
                }
                if(ghiChu<1){
                    document.getElementById('error-GhiChu').innerHTML = "Không để trống";
                    return false;
                }
                return true;
            }
        }

    }
    validateInput();
</script>
</body>
</html>