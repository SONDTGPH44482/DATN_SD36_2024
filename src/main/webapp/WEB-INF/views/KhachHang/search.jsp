<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<br>
<form:form modelAttribute="searchKH" method="post" action="/KhachHang/list">
    <p>
            <%--        <lable>--%>
            <%--            Search:--%>
            <%--        </lable>--%>
        <form:input path="keyword"/>
        <button class="btn btn-primary" type="submit">Search</button>
        <a href="${pageContext.request.contextPath}/KhachHang/list">
            <button class="btn btn-primary">Back</button>
        </a>
    </p>
    <%--    <p>--%>
    <%--        <form:select path="tenKhachHang" onchange="getTen(this.value)">--%>
    <%--        <form:option value="">-------</form:option>--%>
    <%--            <form:options  items="${listPage}" itemValue="tenKhachHang" itemLabel="tenKhachHang"/>--%>
    <%--        </form:select>--%>
    <%--    <div id="tenHang"></div>--%>
    <%--    </p>--%>
</form:form>
<script>
    <%--var data = {--%>
    <%--    <c:forEach items="${listHang}" var="hang">--%>
    <%--    "${hang.mahang}":"${hang.tenhang}",--%>
    <%--    </c:forEach>--%>
    <%--};--%>

    <%--function getTen(maHangKH) {--%>
    <%--    var textTen = document.getElementById("tenHang");--%>
    <%--    if (maHangKH === "") {--%>
    <%--        textTen.innerText = "";--%>
    <%--    } else {--%>
    <%--        textTen.innerText = data[maHangKH];--%>
    <%--    }--%>

    <%--}--%>
</script>