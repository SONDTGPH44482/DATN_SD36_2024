<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<section class="related-product-area section_gap_bottom">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 text-center">
                <div class="section-title">
                    <h1 style="">Deals of the Week</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="row">
                    <c:forEach var="listGiay" items="${listPage}">
                        <c:if test="${listGiay.trangThai == 1}">
                            <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}">
                                            <img src="/upload/${listGiay.image.get(0).link}" alt="" style="width: 100px;height: 70px;margin-top: 15px">
                                        </a>
                                        <div class="desc">
                                            <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}" class="title" style="overflow: hidden;  text-overflow: ellipsis;margin-top: 20px">${listGiay.tenGiayTheThao}</a>
                                            <div class="price">
                                                <h6>
                                                    <fmt:formatNumber type="" value="${listGiay.giaBan}" pattern="#,##0.###" /> VNĐ
                                                </h6>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ctg-right">
                    <a href="#" target="_blank">
                        <img class="img-fluid d-block mx-auto" src="../../../../../../resources/img/category/c5.jpg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>



