<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update dữ liệu giầy thể thao</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="/css/GiayTheThao/All_GiayTheThao/update.css" rel="stylesheet">

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
</head>
<body>

<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>

<section class="scrollable-list" style="width: 100%; max-height: 700px; overflow-y: auto; overflow-x: hidden">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <a href="/GiayTheThao/listGiayTheThao" style="text-decoration: none">
                    <button style="margin-bottom: 30px;" type="submit" class="btn btn-primary">Back</button>
                </a>
            </div>
<%--            <div class="col-lg-12">--%>
<%--                <marquee>--%>
<%--                    <h5 style="font-size: 50px; font-weight: bold; font-family: Brush Script MT ; color: #b1dfbb;">--%>
<%--                        Hãy tiếp tục cập nhật thêm thông tin của giầy thể thao ! để giầy thể thao được kích hoạt.--%>
<%--                    </h5>--%>
<%--                </marquee>--%>
<%--            </div>--%>
        </div>


        <h3 style="text-align: center; color: black; margin-bottom: 50px; margin-top: 5px">Update dữ liệu giầy thể thao</h3>
        <h4 style="color: red; font-weight: bold;font-size: 20px; margin-bottom: 30px">${messDoneUpdate}</h4>
        <form action="/GiayTheThao/update/${giayTheThao.id}" method="POST">

            <input type="text" hidden name="id" value="${giayTheThao.id}">

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label >Form </label>
                    <span style="color: red">*</span>
                    <select class="form-control" name="form.id">
                        <c:forEach items="${form}" var="form">
                            <option ${giayTheThao.form.id == form.id ? 'selected' :''} value="${form.id}">${form.tenForm}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label >Công dụng</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="congDung.id">
                        <c:forEach items="${congDung}" var="congDung">
                            <option ${giayTheThao.congDung.id == congDung.id ? 'selected': ''}  value="${congDung.id}">${congDung.tenCongDung}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Chất liệu </label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="chatLieu.id">
                        <c:forEach items="${chatLieu}" var="chatLieu">
                            <option ${giayTheThao.chatLieu.id == chatLieu.id ? 'selected' : ''}  value="${chatLieu.id}">${chatLieu.tenChatLieu}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label >Hướng dẫn bảo quản </label>
                    <span style="color: red">*</span>
                    <select class="form-control" name="huongDanBaoQuan.id">
                        <c:forEach items="${huongDanBaoQuan}" var="huongDanBaoQuan">
                            <option ${giayTheThao.huongDanBaoQuan.id == huongDanBaoQuan.id ? 'selected' : ''} value="${huongDanBaoQuan.id}">${huongDanBaoQuan.tenHuongDanBaoQuan}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label >Lót giầy</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="lotGiay.id">
                        <c:forEach items="${lotGiay}" var="lotGiay">
                            <option ${giayTheThao.lotGiay.id == lotGiay.id ? 'selected' : ''}  value="${lotGiay.id}">${lotGiay.tenLotGiay}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Cổ giầy</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="coGiay.id">
                        <c:forEach items="${coGiay}" var="coGiay">
                            <option ${giayTheThao.coGiay.id == coGiay.id ? 'selected' : ''} value="${coGiay.id}">${coGiay.tenCoGiay}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label >Đế giầy</label>
                    <span style="color: red">*</span>
                    <select class="form-control" name="deGiay.id">
                        <c:forEach items="${deGiay}" var="deGiay">
                            <option ${giayTheThao.deGiay.id == deGiay.id ? 'selected' : ''} value="${deGiay.id}">${deGiay.tenDeGiay}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label >Dây giày</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="dayGiay.id">
                        <c:forEach items="${dayGiay}" var="dayGiay">
                            <option ${giayTheThao.dayGiay.id == dayGiay.id ? 'selected' : ''} value="${dayGiay.id}">${dayGiay.tenDayGiay}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label >Trọng lượng</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="trongLuong.id">
                        <c:forEach items="${trongLuong}" var="trongLuong">
                            <option ${giayTheThao.trongLuong.id == trongLuong.id ? 'selected' : ''} value="${trongLuong.id}">${trongLuong.tenTrongLuong}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Thương hiệu </label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="thuongHieu.id">
                        <c:forEach items="${thuongHieu}" var="thuongHieu">
                            <option ${giayTheThao.thuongHieu.id == thuongHieu.id ? 'selected' : ''} value="${thuongHieu.id}">${thuongHieu.tenThuongHieu}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Kiểu buộc </label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="kieuBuoc.id">
                        <c:forEach items="${kieuBuoc}" var="kieuBuoc">
                            <option ${giayTheThao.kieuBuoc.id == kieuBuoc.id ? 'selected' : ''} value="${kieuBuoc.id}">${kieuBuoc.tenKieuBuoc}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Đinh tán giầy</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="dinhTanGiay.id">
                        <c:forEach items="${dinhTanGiay}" var="dinhTanGiay">
                            <option ${giayTheThao.dinhTanGiay.id == dinhTanGiay.id ? 'selected' : ''} value="${dinhTanGiay.id}">${dinhTanGiay.tenDinhTanGiay}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Tên giầy thể thao</label>
                    <span style="color: red">*</span>
                    <input type="text" class="form-control"  placeholder="Tên giầy thể thao" name="tenGiayTheThao" value="${giayTheThao.tenGiayTheThao}">
                    <div class="er">
                        <label style="color: red">${erTenGiayTheThaoIsEmty}</label>
                        <label style="color: red">${erCheckTenGiayTheThaoSo}</label>
                        <label style="color: red">${erCheckTenGiayTheThaoTrung}</label>
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label>Giá bán : VNĐ</label>
                    <span style="color: red">*</span>
                    <input id="giaBan" onblur="formatGiaBan()" type="text" class="form-control"  placeholder="Giá bán" name="giaBan" value="${giayTheThao.giaBan}">
                    <div class="er">
                        <label style="color: red">${erCheckGiaBanNumber}</label>
                        <label style="color: red">${erCheckGiaBanSoConertString}</label>
                        <label style="color: red">${erCheckGiaBanIsEmtry}</label>
                    </div>
                </div>

<%--                <div class="form-group col-md-4">--%>
<%--                    <label style="margin-left: 30px">Giới tính :</label>--%>
<%--                    <div class="gioiTinh" style="margin-top: 7px; margin-left: 50px">--%>
<%--                        <input class="form-check-input" type="radio" name="gioiTinh" id="inlineRadio1" value="Nam" ${giayTheThao.gioiTinh == "Nam" ? "checked" : ""} >--%>
<%--                        <label style="color: black; margin-right: 40px" class="form-check-label" for="inlineRadio1">Nam</label>--%>
<%--                        <input class="form-check-input" type="radio" name="gioiTinh" id="inlineRadio2" value="Nữ" ${giayTheThao.gioiTinh == "Nữ" ? "checked" : ""}>--%>
<%--                        <label style="color: black" class="form-check-label" for="inlineRadio2">Nữ</label>--%>
<%--                    </div>--%>

<%--                </div>--%>

            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label>Mô tả</label>
                    <textarea style="height: 100px" type="text" class="form-control"  placeholder="Mô tả" name="moTa">${giayTheThao.moTa}</textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>

    <%-- Create vào chi tiết sản phẩm--%>
    <div class="container">
        <h3 style="text-align: center;color: black; margin-top: 40px; margin-bottom: 30px">Create giầy thể thao chi tiết (Màu sắc , Kích cỡ, Số lượng)</h3>
        <div class="mess">
            <label style="color: red">${erCheckGiayTheThaoCongDon}</label>
            <label style="color: red">${messageDoneGiayTheThaoChiTiet}</label>
        </div>
        <form action="/GiayTheThao/createGiayTheThaoChiTiet" method="POST">
            <input type="text" hidden name="giayTheThao.id" value="${giayTheThao.id}">
            <input type="text" hidden name="id" value="${giayTheThao.id}">
            <input type="text" class="form-control" hidden name="id" value="${giayTheThaoChiTiet.id}">
            <input type="text" class="form-control" hidden name="giayTheThaoChiTietId" value="${giayTheThaoChiTiet.id}">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label >Màu Sắc</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="mauSac.id">
                        <c:forEach items="${mauSac}" var="mauSac">
                            <option ${giayTheThaoChiTiet.mauSac.id == mauSac.id?'selected':''} value="${mauSac.id}">${mauSac.tenMauSac}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label >Size</label>
                    <span style="color: red">*</span>
                    <select  class="form-control" name="size.id">
                        <c:forEach items="${size}" var="size">
                            <option ${giayTheThaoChiTiet.size.id==size.id ?'selected':''} value="${size.id}">${size.size}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label >Số Lượng</label>
                <span style="color: red">*</span>
                <input type="text" class="form-control" name="soLuong" value="${giayTheThaoChiTiet.soLuong}">
                <div class="er">
                    <label style="color: red">${erCheckSoLuongIsEmtry}</label>
                    <label style="color: red">${erCheckSoLuongNumber}</label>
                    <label style="color: red">${erCheckSoLuongString}</label>
                    <label style="color: red">${erCheckDuLieu}</label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Xác nhận</button>
        </form>
        <br>
        <br>
        <%--     Detail thông tin giầy thể thao chi tiết--%>
        <div class="scrollable-list" style="width: 100%; max-height: 300px; overflow-y: auto; overflow-x: hidden">
            <table  class="data-table" style="width: 100%; margin: 20px;">
                <th scope="col" style="text-align: center; color: black; font-size: 20px">STT</th>
                <th scope="col" style="text-align: center; color: black; font-size: 20px">Giầy thể thao</th>
                <th scope="col" style="text-align: center; color: black; font-size: 20px">Size</th>
                <th scope="col" style="text-align: center;color: black; font-size: 20px">Màu Sắc</th>
                <th scope="col" style="text-align: center;color: black; font-size: 20px">Số Lượng</th>
                <th scope="col" style="text-align: center;color: black; font-size: 20px">Chức năng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${giayTheThaoDetail}" var="giayTheThaoChiTiet" varStatus="i">
                    <tr>
                        <th scope="row" style="text-align: center">${i.index+1}</th>
                        <th scope="row" style="text-align: center">${giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</th>
                        <th style="text-align: center">${giayTheThaoChiTiet.size.size}</th>
                        <th style="text-align: center">${giayTheThaoChiTiet.mauSac.tenMauSac}</th>
                        <th style="text-align: center">${giayTheThaoChiTiet.soLuong}</th>
                        <th style="text-align: center">

                            <a href="/GiayTheThao/update/${giayTheThao.id}?giayTheThaoChiTietId=${giayTheThaoChiTiet.id}">
                                      <button class="btn btn-primary">Update</button>
                            </a>
                            <a href="/GiayTheThao/update/${giayTheThao.id}?giayTheThaoChiTietId=${giayTheThaoChiTiet.id}">
                                <button class="btn btn-primary">Detail</button>
                            </a>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--Create form ảnh--%>
    <div class="container" style="margin-bottom: 40px">
        <h3 style="text-align: center; margin-top: 50px; margin-bottom: 40px; color: black">Thêm Ảnh</h3>
        <span style="color: red">*</span>
        <form action="/GiayTheThao/createImage" enctype="multipart/form-data" method="POST" style="margin-bottom: 50px">
            <input type="text" class="form-control" hidden name="id" value="${giayTheThao.id}">
            <div class="mess">
                <label style="color: red">${messageDeleteAnhDone}</label>
                <label style="color: red">${erCheckImageDone}</label>
                <label class="" style="color: red">${erCheckImageIsEmtry}</label>
                <label class="" style="color: red">${erCheckImageTrung}</label>
                <label class="" style="color: red">${messageDeleteAnhFailed}</label>
            </div>

            <%--        Id ở đây là id của giầy thể thao--%>
            <input type="text" hidden name="giayTheThao.id" value="${giayTheThao.id}"><%--   là tên trong entity model     --%>
            <input type="file" name="url">
            <button style="" type="submit" class="btn btn-primary">Thêm ảnh</button>
            <div class="er">
            </div>
        </form>
        <div class="form-row">

            <c:forEach items="${image}" var="image">
                <div class="form-group col-md-3">
                    <img src="/upload/${image.link}" alt="" style="width: 100%; height: 250px">
                    <a href="/GiayTheThao/Image/delete/${image.id.toString()}?id=${giayTheThao.id.toString()}"
                       class="delete-icon">
                        <i class="fas fa-trash-alt"></i>
                    </a>
                </div>
            </c:forEach>

        </div>
        <div class="">
            <marquee>
                ${messageKichHoatDone}
                ${checkHetAnh}
                ${checkContAnh}
                ${messageDeleteImageErrol}
            </marquee>
        </div>
    </div>

</section>
<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>