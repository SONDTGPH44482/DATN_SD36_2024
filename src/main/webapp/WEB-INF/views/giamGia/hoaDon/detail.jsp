<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chương trình giảm giá hóa đơn</title>
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

        .btn-back {
            padding: 10px;
        }
    </style>
</head>

<body>
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

<div class="container">
    <section>
        <div class="btn-back">
            <button class="btn btn-primary" onclick="goBack()">
                <i class="fa fa-angle-double-left"> Quay lại</i>
            </button>
        </div>
    </section>
    <section>
        <br>
        <h4 style="color: black;font-weight: bold;font-size: 25px">Chi tiết chương trình giảm giá hóa đơn</h4>
        <br>
        <div class="info">
            <div class="row row-info">
                <div class="col-2">
                    <label class="label name" style="color: black;font-weight: bold;font-size: 17px">Tên chương trình:</label>
                </div>
                <div class="col-10">${ctggHD.tenChuongTrinh}</div>
            </div>
            <div class="row row-info">
                <div class="col-2">
                    <label class="label name" style="color: black;font-weight: bold;font-size: 17px">Giá trị giảm:</label>
                </div>
                <div class="col-10">${ctggHD.phanTramGiam} %</div>
            </div>
            <div class="row row-info">
                <div class="col-2">
                    <label class="label name" style="color: black;font-weight: bold;font-size: 17px">Số lượng sản phẩm:</label>
                </div>
                <div class="col-10">${ctggHD.soLuongSanPham}</div>
            </div>
            <div class="row row-info">
                <div class="col-2">
                    <label class="label name" style="color: black;font-weight: bold;font-size: 17px">Tổng tiền từ:</label>
                </div>
                <div class="col-10">${ctggHD.soTienHoaDon} VNĐ</div>
            </div>
            <div class="row row-info">
                <div class="col-2">
                    <label class="label name" style="color: black;font-weight: bold;font-size: 17px">Thời gian áp dụng:</label>
                </div>
                <div class="col-10">
                    <b style="color: black;font-weight: bold;font-size: 17px">Từ</b> ${ctggHD.ngayBatDau} <b style="color: black;font-weight: bold;font-size: 17px">đến </b> ${ctggHD.ngayKetThuc}
                </div>
            </div>
            <div class="row row-info">
                <div class="col-2"><label class="label name" style="color: black;font-weight: bold;font-size: 17px">Trạng thái:</label></div>
                <div class="col-10">
                    ${ctggHD.trangThai==1?'Kích hoạt':ctggHD.trangThai==-1?'Hết hạn':'Chưa áp dụng'}
                </div>
            </div>
            <div class="row row-info">
                <div class="col-2"><label class="label name" style="color: black;font-weight: bold;font-size: 17px">Ghi chú:</label></div>
                <div class="col-10"><p style="width: 80%">${ctggHD.ghiChu}</p></div>
            </div>
            <div class="row row-info">
                <div class="col-2"><label class="label name" style="color: black;font-weight: bold;font-size: 17px">Ngày tạo:</label></div>
                <div class="col-10">${ctggHD.ngayTao}</div>
            </div>
            <div class="row row-info">
                <div class="col-2"><label class="label name" style="color: black;font-weight: bold;font-size: 17px">Ngày sửa:</label></div>
                <div class="col-10">${ctggHD.ngaySua}</div>
            </div>
        </div>
    </section>
    <section>
      <br>
        <h4 style="color: black;font-size: 25px; font-weight: bold">Các hóa đơn đã áp dụng chương trình giảm giá</h4>
      <br>
      <table class="table table-light table-hover">
            <thead>
            <th>STT</th>
            <th>Tên khách hàng</th>
            <th>User</th>
            <th>Số tiền đã giảm</th>
            <th>Thành tiền</th>
            <th>Ngày tạo</th>
            <th>Ngày thanh toán</th>
            <th>Ghi chú</th>
            <th>Trạng thái</th>
            </thead>
            <tbody>
            <c:if test="${f:length(list)==0}">
                <span>Không có dữ liệu</span>
            </c:if>
            <c:if test="${f:length(list)!=0}">
                <c:forEach items="${list}" var="gg" varStatus="status">
                    <tr>
                        <td>${status.index+1}</td>
                        <td style="text-align: left; max-width: 230px">
                                ${gg.hd.khachHang.tenKhachHang}
                        </td>
                        <td>${gg.hd.user.tenUser}</td>
                        <td>${gg.soTienDaGiam}</td>
                        <td>${gg.hd.thanhTien}</td>
                        <td>${gg.hd.ngayTao}</td>
                        <td>${gg.hd.ngayThanhToan}</td>
                        <td>${gg.hd.ghiChu}</td>
                        <td>${gg.hd.trangThai==4?"Đã Thanh Toán":"Chưa thanh toán"}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </section>

</div>


<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>
<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
