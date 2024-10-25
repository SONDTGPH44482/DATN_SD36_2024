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

        .btn-function {
            display: flex;
            text-align: right;
            margin: 20px;
            justify-content: space-between;
        }

        /* filter */
        .filter {
            margin-top: 20px;
        }

        .filter > div {
            width: auto;
            height: auto;
            margin-left: 30px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 1px 1px 5px rgb(151, 151, 151);
            padding: 20px;
        }

        /* search-input */
        .label-filter {
            font-weight: 500;
        }

        #search-input {
            border: none;
            outline: none;
            padding: 0;
            padding-bottom: 6px;
            border-radius: 0%;
            border-bottom: 1px solid rgb(104, 104, 104);
        }

        #search-input:focus {
            outline: none;
            box-shadow: none;
        }

        #quality-row {
            display: flex;
            justify-content: space-between;
        }

        .title {
            font-size: large;
        }
    </style>
</head>

<body>
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>

<div class="container">
    <section>
        <div>
            <div class="btn-function">
                <div>
                    <button
                            class="btn btn-primary"
                            onclick="goBack()"
                            style="font-size: 20px;"
                    ><i class="fa fa-angle-double-left"> Quay lại</i></button
                    >
                </div>
                <div>
                    <h3 style="color: red;font-weight: bold; float: right">Lịch sử</h3>
                </div>

            </div>
            <table class="table table-hover table-light" style="border: 1px solid red;width: 100%">
                <thead>
                <th>STT</th>
                <th>Tên chương trình</th>
                <th>Giá trị giảm(%)</th>
                <!-- <th>Số lượng</th> -->
                <th>Thời gian áp dụng</th>
                <th>Hình thức</th>
                <th>Trạng thái</th>
                <th>Chức năng</th>
                </thead>
                <tbody>


                <c:if test="${f:length(list.getContent())==0}">
                    <span>Không có dữ liệu</span>
                </c:if>
                <c:if test="${f:length(list.getContent())!=0}">
                    <c:forEach
                            items="${list.getContent()}"
                            var="gg"
                            varStatus="status"
                    >
                        <tr class="${gg.id}">
                            <td>${status.index+1}</td>
                            <td style="text-align: left; max-width: 230px">
                                    ${gg.tenChuongTrinh}
                            </td>
                            <td>${gg.phanTramGiam}</td>
                            <td><b>Từ:</b> ${gg.ngayBatDau} <br><b>Đến:</b> ${gg.ngayKetThuc}</td>
                            <td>Giảm giá hóa đơn</td>
                            <td>Hết hạn</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/detail?id=${gg.id}"
                                   class="btn btn-primary">Chi tiết</a>
                                <a
                                        href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${link}/updateForm?id=${gg.id}"
                                        class="btn btn-success"
                                >Sửa</a
                                >
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>


                </tbody>
            </table>
            <ul class="pagination" style="margin-left: 500px">
                <c:forEach begin="1" end="${list.getTotalPages()}" var="i">
                    <li class="page-item">
                        <a
                                href="${pageContext.request.contextPath}/chuongTrinhGiamGia/${read}page=${i}"
                                class="page-link"
                        >${i}</a
                        >
                    </li>
                </c:forEach>
            </ul>
        </div>


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
