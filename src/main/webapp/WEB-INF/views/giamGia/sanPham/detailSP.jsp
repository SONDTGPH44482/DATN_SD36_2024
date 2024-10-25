<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="f"
uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chương trình giảm giá cho sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>

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
        margin-top: 20px;
        margin-bottom: 20px;
        margin-right: 20px;
      }
      .toast-body{
        display: flex;
        justify-content: space-between;
        border-bottom: solid 1px rgb(255, 69, 69);
        border-radius: 8px;
      }
      
    </style>
  </head>

  <body>
<%--  <%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

  <div class="container">
    <section>
      <div class="btn-back">
        <button class="btn btn-primary" onclick="goBack()" style="font-size: 18px;margin-top: 20px;">
          <i class="fa fa-angle-double-left"> Quay lại</i>
        </button>
      </div>
    </section>
    <section>
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
            <b style="color: black">Từ</b> ${ctggSP.ngayBatDau} <b style="color: black"> đến </b> ${ctggSP.ngayKetThuc}
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
    <section>
      <div id="allProducts">
        <div >
          <h5><b style="color: black">Các sản phẩm đã áp dụng chương trình giảm giá</b></h5>
        </div>
        <div>


          <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">

              <div class="toast-body">

                <span><i class="fa fa-exclamation-circle" style="color: #fd3535;"></i>  Không có dữ liệu</span>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
            </div>
          </div>
        </div>

      </div>
      <table class="table table-light table-hover">
        <thead>

        <th>STT</th>
        <th style="display: none;"></th>
        <th>Tên giày</th>
        <th>Giá bán</th>
        <th>Số tiền đã giảm</th>
        <th>Trạng thái</th>
        </thead>
        <tbody>
        <c:if test="${f:length(list)==0}">
          <span>Không có dữ liệu</span>
        </c:if>
        <c:if test="${f:length(list)!=0}">
          <c:forEach items="${list}" var="gg" varStatus="status">
            <tr id="${status.index+1}">

              <td>${status.index+1}</td>
              <td style="display: none;">${gg.giayTheThao.id}</td>
              <td style="text-align: left; max-width: 230px">
                  ${gg.giayTheThao.tenGiayTheThao}
              </td>
              <td>${gg.giayTheThao.giaBan}</td>
              <td>${gg.soTienDaGiam}</td>
              <td>${gg.trangThai==1?'Đang áp dụng':'Chưa áp dụng'}</td>
            </tr>
          </c:forEach>
        </c:if>
        </tbody>
      </table>
    </section>
  </div>


<%--  <%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>
    <script>
        function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
