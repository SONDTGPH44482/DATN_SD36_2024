<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>

    .pagination .page-item.disabled a{

        background-color: red;
    }

     .single-product {
         display: inline-block; /* Hiển thị sản phẩm cùng một hàng */
         margin: 10px; /* Độ lề giữa các sản phẩm */
         vertical-align: top; /* Hiển thị sản phẩm ở phía trên của dòng */
     }

</style>

<section class="owl-carousel active-product-area section_gap">
    <!-- single product slide -->

    <div class="single-product-slider">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <h1 style="">Giầy thể thao</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                            dolore
                            magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                    <%--                Todo code list giầy thể thao--%>
                    <c:forEach var="listGiay" items="${listPage}">
                        <c:if test="${listGiay.trangThai == 1}">
                            <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}">
                                <div class="col-lg-3 col-md-6">
                                    <div class="single-product">
                                        <img class="img-fluid" style="height: 200px" src="/upload/${listGiay.image.get(0).link}" alt="">
                                        <div class="product-details">
                                            <h6 style="text-align: center">${listGiay.tenGiayTheThao}</h6>
                                            <div class="price">
                                                <h6 style="text-align: center">

                                                    <span style="color: red"> Đ </span>
                                                    <fmt:formatNumber type="" value="${listGiay.giaBan}" pattern="#,##0.###" /> VNĐ

                                                </h6>
                                            </div>
                                            <div class="prd-bottom">

                                                <a href="" class="social-info">
                                                    <span class="ti-bag"></span>
                                                    <p class="hover-text">add to bag</p>
                                                </a>
                                                <a href="" class="social-info">
                                                    <span class="lnr lnr-heart"></span>
                                                    <p class="hover-text">Wishlist</p>
                                                </a>
                                                <a href="" class="social-info">
                                                    <span class="lnr lnr-sync"></span>
                                                    <p class="hover-text">compare</p>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}" class="social-info">
                                                    <span class="lnr lnr-move"></span>
                                                    <p class="hover-text">view more</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                <%--                Todo code phân trang giầy thể thao--%>
                            <div class="row">
                                <div class="col-12">
                                    <ul class="pagination" style="margin-left: 400px; ">
                                        <br>
                                        <c:choose>
                                            <c:when test="${currentPage > 1}">
                                                <li class="page-item">
                                                    <a href="/TrangChu/listGiayTheThao?pageNum=${currentPage - 1}" class="page-link" style="border: 1px solid red;width: 100px">Previous</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Ẩn nút "Previous" khi trang hiện tại là trang đầu tiên -->
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach var="pageNumber" items="${pageNumbers}">
                                            <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">
                                                <a href="/TrangChu/listGiayTheThao?pageNum=${pageNumber}" class="page-link">${pageNumber}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${currentPage < totalPage}">
                                            <li class="page-item">
                                                <a href="/TrangChu/listGiayTheThao?pageNum=${currentPage + 1}" class="page-link" style="border: 1px solid red; width: 50px">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>


                <%--                Todo code giầy thể thao sale cho khách hàng--%>
<%--                    Trường hợp sale vẫn đang đúng--%>

                    <div class="col-12" style="text-align: center;margin-top: 60px; margin-bottom: 80px">
                        <h3 style="color: black" style="margin-bottom: 100px;margin-top: 100px;text-align: center">SALE</h3>
                    </div>
                    <c:forEach var="listSale"  items="${listSale}">
                        <c:if test="${listSale.trangThai == 1 && listSale.chuongTrinhGiamGiaGiayTheThao.trangThai ==1}">
                            <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listSale.giayTheThao.id}">                                    <div class="col-lg-3 col-md-6">
                                        <div class="single-product">
                                            <img class="img-fluid" style="height: 200px" src="/upload/${listSale.giayTheThao.image.get(0).link}" alt="">
                                            <div class="product-details">
                                                <h6 style="text-align: center">${listSale.giayTheThao.tenGiayTheThao}</h6>
                                                <div class="price">
                                                    <h6 style="text-align: center">
                                                        <span style="color: red"> Đ </span>
                                                        <del>
                                                            <fmt:formatNumber type="" value="${listSale.giayTheThao.giaBan}" pattern="#,##0.###" /> VNĐ
                                                        </del>
                                                        <fmt:formatNumber type="" value="${listSale.giayTheThao.giaBan * (100 - listSale.chuongTrinhGiamGiaGiayTheThao.phanTramGiam)/100}" pattern="#,##0.###" /> VNĐ

                                                    </h6>
                                                </div>
                                                <div class="prd-bottom">

                                                    <a href="" class="social-info">
                                                        <span class="ti-bag"></span>
                                                        <p class="hover-text">add to bag</p>
                                                    </a>
                                                    <a href="" class="social-info">
                                                        <span class="lnr lnr-heart"></span>
                                                        <p class="hover-text">Wishlist</p>
                                                    </a>
                                                    <a href="" class="social-info">
                                                        <span class="lnr lnr-sync"></span>
                                                        <p class="hover-text">compare</p>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/GiayTheThao/detailThongTinGiayTheThao/${listGiay.id}" class="social-info">
                                                        <span class="lnr lnr-move"></span>
                                                        <p class="hover-text">view more</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:if>
                        </c:forEach>






            </div>
        </div>
    </div>

</section>