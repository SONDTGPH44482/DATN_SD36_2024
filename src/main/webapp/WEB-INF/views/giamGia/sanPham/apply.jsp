<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="f"
uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chương trình giảm giá cho sản phẩm</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <style>
      /** {*/
      /*  font-family: "Times New Roman", Times, serif;*/
      /*  font-size: 20px;*/
      /*}*/
      /*body {*/
      /*  width: 100%;*/
      /*  background-color: rgb(238, 238, 238);*/
      /*}*/
      .info {
        width: auto;
        height: auto;
        background-color: #ffffff;
        border-radius: 5px;
        box-shadow: 1px 1px 5px rgb(151, 151, 151);
        padding: 20px;
      }
      .name {
        font-weight: bold;
      }
      .row-info {
        width: 90%;
        margin-left: 50px;
      }
      h4 {
        font-weight: bold;
        line-height: 80px;
      }
      .checkbox {
            width: 22px;
            height: 22px;
            margin-left: 0px;
      }
      #allProducts{
          display: flex;
          justify-content: space-between;
      }
      #allProducts>div{
        margin-bottom: 20px;
        margin-right: 20px;
      }
    </style>
  </head>

  <body>
<%--  <%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

  <div class="container">
    <section style="width: 100%">
      <div class="btn-back">
        <button class="btn btn-primary" onclick="goBack()" style="font-size: 18px;margin-top: 20px;">
          <i class="fa fa-angle-double-left"> Quay lại</i>
        </button>
      </div>
    </section>
    <br>
    <section class="container-fluid">
      <br>
      <h4 style="color: black;font-weight: bold">Chi tiết chương trình giảm giá sản phẩm</h4>
      <br>
      <div class="info">
        <div class="row row-info">
          <div class="col-2">
            <label class="label name" style="color: black">Tên chương trình:</label>
          </div>
          <div class="col-10">${ctggSP.tenChuongTrinh}</div>
        </div>
        <div class="row row-info">
          <div class="col-2">
            <label class="label name" style="color: black">Giá trị giảm:</label>
          </div>
          <div class="col-10">${ctggSP.phanTramGiam} %</div>
        </div>
        <div class="row row-info">
          <div class="col-2">
            <label class="label name" style="color: black">Thời gian áp dụng:</label>
          </div>
          <div class="col-10">
            <b style="color: black">Từ </b> ${ctggSP.ngayBatDau} <b style="color: black"> đến</b> ${ctggSP.ngayKetThuc}
          </div>
        </div>
        <div class="row row-info">
          <div class="col-2"><label class="label name" style="color: black">Trạng thái:</label></div>
          <div class="col-10">
            ${ctggSP.trangThai==1?'Kích hoạt':'Chưa áp dụng'}
          </div>
        </div>
        <div class="row row-info">
          <div class="col-2"><label class="label name" style="color: black">Ghi chú:</label></div>
          <div class="col-10"><p style="width: 80%">${ctggSP.ghiChu}</p></div>
        </div>
        <div class="row row-info">
          <div class="col-2"><label class="label name" style="color: black">Ngày tạo:</label></div>
          <div class="col-10">${ctggSP.ngayTao}</div>
        </div>
        <div class="row row-info">
          <div class="col-2"><label class="label name" style="color: black">Ngày sửa:</label></div>
          <div class="col-10">${ctggSP.ngaySua}</div>
        </div>
      </div>
    </section>
    <hr>
    <div id="allProducts">
      <div style="margin-left: 20px;">
        <h5><b style="color: black">Các sản phẩm chưa áp dụng</b></h5>
      </div>
      <div>

        <button class="btn btn-success" onclick="add()">Áp dụng</button>

      </div>

    </div>
    <section class="container-fluid">

      <table class="table table-light table-hover">
        <thead>
        <th></th>
        <th>STT</th>
        <th style="display: none;"></th>
        <th>Tên giày thể thao</th>
        <th>Giá bán</th>
        <th>Mô tả</th>
        <th>Trạng thái</th>
        </thead>
        <tbody>
        <c:if test="${f:length(list)==0}">
          <span>Không có dữ liệu</span>
        </c:if>
        <c:if test="${f:length(list)!=0}">
          <c:forEach items="${list}" var="gtt" varStatus="status">
            <tr  id="${status.index+1}">
              <td>
                <p style="text-align: center;">
                  <input type="checkbox" onclick="addProducts('${status.index+1}')" class="form-check-input checkbox" >
                </p>
              </td>
              <td>${status.index+1}</td>
              <td style="display: none;">${gtt.id}</td>
              <td style="text-align: left; max-width: 230px">
                  ${gtt.tenGiayTheThao}
              </td>
              <td>${gtt.giaBan}</td>
              <td>
                <c:choose>
                  <c:when test="${not empty gtt.moTa}">${gtt.moTa}</c:when>
                  <c:otherwise>N/A</c:otherwise>
                </c:choose>
              </td>
              <td>${gtt.trangThai==0 ? 'Đã kích hoạt': 'Chưa kích hoạt'}</td>

            </tr>
          </c:forEach>
        </c:if>
        </tbody>
      </table>
    </section>

  </div>


<%--  <%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>

<script>
      
  var listID = [];
  function addProducts(id) {
    var row = document.getElementById(id);
    var stt = row.getElementsByTagName("td")[1].innerText;
    var idProduct = row.getElementsByTagName("td")[2].innerText;
    var name = row.getElementsByTagName("td")[3].innerText;
    var gia = row.getElementsByTagName("td")[4].innerText;
    var moTa = row.getElementsByTagName("td")[5].innerText;
    var product = {stt: stt, name: name, gia: gia, moTa: moTa};
    
    
    
    var isCheck = row.getElementsByTagName("td")[0].querySelector("input[type=checkbox]");
    if(isCheck.checked){
      listID.push(idProduct);
      console.log(listID.length);
        // renderProducts(product);
    } else {
        var index = listID.indexOf(idProduct);
        if(index != -1){
          listID.splice(index, 1);
        }
        console.log(listID.length);
    }
    

    
    }

    function add() {
      if(listID.length>0){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/chuongTrinhGiamGia/sanPham/apply?id=${id}");
        xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
        xhr.send(JSON.stringify(listID));
        alert("Successfully");
        location.reload();
      } else {
        alert("Hãy chọn 1 sản phẩm để áp dụng");
      }
    }
    
    function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
