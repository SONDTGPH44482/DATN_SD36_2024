<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
<head>
  <title>Chương trình giảm giá sản phẩm</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />

  <style>

    /** {*/
    /*  font-family: "Times New Roman", Times, serif;*/
    /*  font-size: 20px;*/
    /*}*/

    body {
      width: 100%;
      background-color: rgb(238, 238, 238);
    }

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

    #allProducts {
      display: flex;
      justify-content: space-between;

    }

    #allProducts > div {
      margin-top: 20px;
      margin-bottom: 20px;
      margin-right: 20px;
    }

    .toast-body {
      display: flex;
      justify-content: space-between;
      border-bottom: solid 1px rgb(255, 69, 69);
      border-radius: 8px;
    }


  </style>

</head>
<body>
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

<div class="container">

  <section style="width: 100%">
    <div class="btn-back">
      <button class="btn btn-primary" onclick="goBack()" style="font-size: 18px;margin-top: 20px;margin-left: 5px">
        <i class="fa fa-angle-double-left"> Quay lại</i>
      </button>
    </div>
  </section>
  <br>
  <section style="width: 100%">
    <br>
    <h4 style="color: black;font-weight: bold;font-size: 25px">Chi tiết chương trình giảm giá sản phẩm</h4>
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
          <b style="color: black">Từ </b> ${ctggSP.ngayBatDau} <b style="color: black"> đến </b> ${ctggSP.ngayKetThuc}
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
      <div>
        <h5><b style="color: black;font-weight: bold">Các sản phẩm đã áp dụng chương trình giảm giá</b></h5>
      </div>
      <div>

        <button class="btn btn-success" id="btnApply" onclick="add()">Bỏ áp dụng</button>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
          <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">

            <div class="toast-body">

              <span style="color:black"><i class="fa fa-exclamation-circle" style="color: #fd3535;"></i>  <span style="color: black">Không có dữ liệu</span></span>
              <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
          </div>
        </div>
      </div>

    </div>
    <table class="table table-light table-hover">
      <thead>
      <th></th>
      <th>STT</th>
      <th style="display: none;"></th>
      <th>Tên giày thể thao</th>
      <th>Giá bán</th>
      <th>Số tiền được giảm</th>
      <th>Trạng thái</th>
      </thead>
      <tbody>
      <c:if test="${f:length(list)==0}">
        <span>Không có dữ liệu</span>
      </c:if>
      <c:if test="${f:length(list)!=0}">
        <c:forEach items="${list}" var="gg" varStatus="status">
          <tr id="${status.index+1}">
            <td>
              <p style="text-align: center;">
                <input type="checkbox" onclick="addProducts('${status.index+1}')"
                       class="form-check-input checkbox">
              </p>
            </td>
            <td>${status.index+1}</td>
            <td style="display: none;">${gg.giayTheThao.id}</td>
            <td style="text-align: left; max-width: 230px">
                ${gg.giayTheThao.tenGiayTheThao}
            </td>
            <td>

                  <fmt:formatNumber type="" value="${gg.giayTheThao.giaBan}" pattern="#,##0.###" /> VNĐ

            </td>
            <td>

                  <fmt:formatNumber type="" value="${gg.soTienDaGiam}" pattern="#,##0.###" /> VNĐ

            </td>
            <td>${gg.trangThai==1?'Đang áp dụng':'Chưa áp dụng'}</td>
          </tr>
        </c:forEach>
      </c:if>
      </tbody>
    </table>
  </section>


</div>

<script>
  var listID = [];

  function addProducts(id) {
    var row = document.getElementById(id);
    var idProduct = row.getElementsByTagName("td")[2].innerText;

    var isCheck = row.getElementsByTagName("td")[0].querySelector("input[type=checkbox]");
    if (isCheck.checked) {
      listID.push(idProduct);
      console.log(listID.length);
      // renderProducts(product);
    } else {
      var index = listID.indexOf(idProduct);
      if (index != -1) {
        listID.splice(index, 1);
      }
      console.log(listID.length);
    }


  }

  function add() {
    if (listID.length > 0) {
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "${pageContext.request.contextPath}/chuongTrinhGiamGia/sanPham/unapply?id=${id}");
      xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      xhr.send(JSON.stringify(listID));
      alert("Successfully");
      location.reload();


    } else {
      const toastTrigger = document.getElementById('btnApply')
      const toastLiveExample = document.getElementById('liveToast')

      if (toastTrigger) {
        const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
        // toastTrigger.addEventListener('click', () => {
        toastBootstrap.show()
        // })
      }
      console.log("Hãy chọn 1 sản phẩm để áp dụng");
    }
  }

  function goBack() {
    window.history.back();
  }
</script>

<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</body>
</html>