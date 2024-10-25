<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!doctype html>
<html lang="en">
<head>
    <title>Chương trình giảm giá</title>
    <style>
        
        .label{
            margin-bottom: 10px;
        }
        
    </style>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>
<div class="container">
    <section>
      <div class="btn-back">
        <button class="btn btn-primary" onclick="goBack()" style="font-size: 18px;margin-top: 20px;">
          <i class="fa fa-angle-double-left"> Quay lại</i>
        </button>
      </div>
    </section>
    <h1 style="line-height: 100px; text-align: center; color: red">
        Chương trình giảm giá hóa đơn
    </h1>
    <div>
        

        <%--@elvariable id="ctggHD" type=""--%>
        <sf:form
                modelAttribute="ctggHD"
                action="${action}"
                method="POST"
                enctype="multipart/form-data"
        >
            <div class="row">
                <div class="col-6 label">
                    <label class="label" style="color: black;font-weight: bold;font-size: 17px">Tên chương trình giảm giá <span style="color: red">*</span></label>
                    <sf:input path="tenChuongTrinh"  cssClass="form-control ten"/>
                    <div>
                        <span id="error-ten" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label" style="font-size: 17px;font-weight: bold;color: black">Giá trị giảm &lt;= 50 (%) <span style="color: red">*</span></label>
                    <sf:input
                            path="phanTramGiam"
                            type="number"
                            cssClass="form-control"
                            min="0"
                            max="50"
                            value=" "
                            id="phanTramGiam"

                    />
                    <div>
                        <span id="error-phanTramGiam" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6 label">
                    <label class="label" style="color: black;font-weight: bold;font-size: 17px">Số lượng sản phẩm <span style="color: red">*</span></label>
                    <sf:input
                            path="soLuongSanPham"
                            type="number"
                            cssClass="form-control input-number"
                            min="0"
                            value=" "
                            id="soLuong"
                    />
                    <div>
                        <span id="error-soLuong" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label" style="color: black;font-size: 17px;font-weight: bold">Tổng tiền hóa đơn từ <span style="color: red">*</span></label>
                    <sf:input
                            path="soTienHoaDon"
                            type="number"
                            cssClass="form-control input-number"
                            min="0"

                            id="tongTien"
                    />
                    <!-- <sf:input
                            path="soTienHoaDon"
                            type="number"
                            cssClass="form-control input-number"
                            min="0"
                            id="tongTien"
                    /> -->
                    <div>
                        <span id="error-tongTien" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label" style="color: black;font-weight: bold;font-size: 17px">Ngày bắt đầu <span style="color: red">*</span></label>
                    <sf:input path="ngayBatDau" cssClass="form-control" id="ngayBatDau" type="date"/>
                    <div>
                        <span id="error-ngayBatDau" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label" style="font-size: 17px; font-weight: bold;color: black">Ngày kết thúc <span style="color: red">*</span></label>
                    <sf:input path="ngayKetThuc" cssClass="form-control" id="ngayKetThuc" type="date"/>
                    <div>
                        <span id="error-ngayKetThuc" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
            </div>
            <br>
            <div class="row" style="display:none">
                <div class="col-6">
                    <label class="label" >Ngày tạo</label>
                    <sf:input path="ngayTao" cssClass="form-control" cssStyle="background-color: #e5e5e5" type="date" readonly="true" />
                </div>
                <div class="col-6">
                    <label class="label">Ngày sửa</label>
                    <sf:input path="ngaySua" cssClass="form-control" cssStyle="background-color: #e5e5e5" type="date" readonly="true" />
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-6">
                    <label class="label" style="color: black;font-weight: bold;font-size: 17px">Ghi chú <span style="color: red">*</span></label>
                    <sf:textarea path="ghiChu" cssClass="form-control ghiChu" rows="4"></sf:textarea>
                    <div>
                        <span id="error-GhiChu" style="color: red; margin-top: 10px"></span>
                    </div>
                </div>
                <div class="col-6">
                    <label class="label" style="color: black;font-size: 17px;font-weight: bold">Trạng thái <span style="color: red">*</span></label>
                    <div style="margin-top: 8px">
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio1" value="1"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio1">Kích hoạt</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio2" value="0"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio2">Chưa kích hoạt</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <sf:radiobutton class="form-check-input" path="trangThai" id="inlineRadio3" value="-1"></sf:radiobutton>
                            <label class="form-check-label" for="inlineRadio2">Hết hạn</label>
                        </div>
                    </div>
                </div>
            </div>
            <p style="text-align: right">
                <button type="submit"  style="margin-right: 0px;" class="btn btn-primary update">${button}</button>
            </p>
        </sf:form>

    </div>


<%--     <c:if test="${button=='Thêm'}">--%>
<%--        <hr>    --%>
<%--        <div>--%>
<%--            <h4>Thêm bằng file excel</h4>--%>
<%--            <form  action="importExcel" method="post" enctype="multipart/form-data">--%>
<%--                <input type="file" name="file" accept=".xlsx"  class="form-control">--%>

<%--                <button class="btn btn-primary" style="margin-top: 10px">Import</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--     </c:if>   --%>

</div>

<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>

  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    var ghiChu = document.getElementsByClassName('ghiChu')[0];
    var ten = document.getElementsByClassName('ten')[0];
    var ngayBatDau = document.getElementById('ngayBatDau');
    var ngayKetThuc = document.getElementById('ngayKetThuc');
    var soLuong = document.getElementById('soLuong');
    var tongTien = document.getElementById('tongTien');
    var phanTramGiam = document.getElementById('phanTramGiam');

    var error_ten = document.getElementById('error-ten');
    var error_ghiChu = document.getElementById('error-GhiChu');
    var error_ngayBatDau = document.getElementById('error-ngayBatDau');
    var error_ngayKetThuc = document.getElementById('error-ngayKetThuc');
    var error_soLuong = document.getElementById('error-soLuong');
    var error_tongTien = document.getElementById('error-tongTien');
    var error_phanTramGiam = document.getElementById('error-phanTramGiam');

    if(soLuong.value==0){
        soLuong.value = "";
    }
    
    if(phanTramGiam.value==0){
        phanTramGiam.value = "";
    }

    function focusInput(){

        ghiChu.addEventListener("focus", function() {
            error_ghiChu.innerHTML="";
        });
        ten.addEventListener("focus", function() {
            error_ten.innerHTML="";
        });

        ngayBatDau.addEventListener("focus", function() {
            error_ngayBatDau.innerHTML="";

        });

        ngayKetThuc.addEventListener("focus", function() {
            error_ngayKetThuc.innerHTML="";
        });

        soLuong.addEventListener("focus", function() {
            error_soLuong.innerHTML="";
            
        });

        tongTien.addEventListener("focus", function() {
            error_tongTien.innerHTML="";
        });

        phanTramGiam.addEventListener("focus", function() {
            error_phanTramGiam.innerHTML="";
        });
    }
    focusInput();

    function validateInput() {
        var btnSua = document.getElementsByClassName('update')[0];
        btnSua.onclick = function (){
            var tenChuongTrinh = ten.value.trim().length;
            var ghi_Chu = ghiChu.value.trim().length;
            var nBatDau = ngayBatDau.value;
            var nKetThuc = ngayKetThuc.value;
            var sl = soLuong.value;
            var tt = tongTien.value;
            var ptg = phanTramGiam.value; 
            
            var now = new Date(Date.now()).toISOString().slice(0, 10);
            var inputDate = new Date(nBatDau);
            var inputDate2 = new Date(nKetThuc);
            

            console.log(nBatDau + "\n----------------\n"+nKetThuc);
            var confirmUpdate = confirm('Bạn chắc chắn muốn ${button} không?');

            if (!confirmUpdate) {
                console.log('ten: ', tenChuongTrinh);
                console.log('ghi chu: ', ghi_Chu);
                if(nBatDau<Date.now()){
                    console.log("CÓ nhỏ hơn");
                } else {
                    console.log("Không nhé");
                }
                

                return false;
            } else {
                   var checkValidate = true;
                    
                    if(tenChuongTrinh<1){
                        error_ten.innerHTML = "Không để trống";
                        checkValidate = false;
                    } 
                    if(ptg<=0||ptg>50){
                        error_phanTramGiam.innerHTML = "Giá trị giảm phải lớn hơn 0 và nhỏ hơn 51";
                        checkValidate = false;
                    } 
                    if(sl<=0){
                        error_soLuong.innerHTML = "Số lượng phải lớn hơn 0";
                        checkValidate = false;
                    }
                    if(tt<=0){
                        error_tongTien.innerHTML = "Tổng tiển hóa đơn phải lớn hơn 0";
                        checkValidate = false;
                    }


                    if(!nBatDau){
                        error_ngayBatDau.innerHTML = "Nhập ngày bắt đầu";
                        checkValidate = false;
                    } else {
                        // chưa fix xong
                        if (nBatDau<now) {
                            error_ngayBatDau.innerHTML = "Ngày bắt đầu phải lớn hơn hoặc bằng ngày hiện tại";
                            checkValidate = false;
                        } 
                    }
                    
                    if(!nKetThuc){
                        error_ngayKetThuc.innerHTML = "Nhập ngày kết thúc";
                        checkValidate = false;
                    } else {
                        if (nKetThuc<now) {
                            error_ngayKetThuc.innerHTML = "Ngày kết thúc phải lớn hơn hoặc bằng ngày hiện tại";
                            checkValidate = false;
                        } else if (nKetThuc<nBatDau) {
                            error_ngayKetThuc.innerHTML = "Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu";
                            checkValidate = false;
                        } 
                    }
            
                    if(ghi_Chu<1){
                        error_ghiChu.innerHTML = "Không để trống";
                        checkValidate = false;
                    }
                // }
                    
            
                    
                return checkValidate;
            }
        }
    }
    
    
    validateInput();
    
    function goBack() {
        window.history.back();
    }
    
</script>
</body>
</html>