<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="f"
                                                                         uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
        #success{

            display: flex;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
    </style>
</head>

<body class="container-fluid">
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>--%>
    <div>
        <a
                href="${pageContext.request.contextPath}/chuongTrinhGiamGia/hoaDon"
                style="color: black"
        ><i class="fa fa-angle-double-left"> Quay lại</i></a
        >
    </div>
    <div id="success">
        <h3>Thêm thành công</h3>
    </div>
<%--<%@ include file="../../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>
</body>
</html>
