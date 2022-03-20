<%-- 
    Document   : product-list
    Created on : 13 Mar 2022, 2:42:44 pm
    Author     : hungt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section>
    <div class="uk-panel uk-padding bg-red">
        <div class="uk-width-1-1">
            <span uk-icon="icon: album; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
            <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Featured Products</h1>
        </div>
    </div>
    <div id="featured-products-container" class="uk-section uk-position-relative" uk-slider>
        <ul class="uk-slider-items uk-width-1-1 uk-grid">
            <c:forEach items="${products}" var="p">
                <li class="uk-card uk-card-default uk-slider-item uk-margin-small uk-width-medium uk-padding-small uk-position-relative uk-box-shadow-large">
                    <div class="uk-card-media-top">
                        <img src="${p.image}" alt="">
                    </div>
                    <hr>
                    <div class="uk-card-body uk-padding-small">
                        <a href="product/?p=${p.id}"><h3 class="uk-card-title">${p.name}</h3></a>
                    </div>
                    <div class="uk-margin-small uk-padding-small"></div>
                    <div class="uk-position-bottom uk-width-1-1">
                        <div class="uk-width-1-1 uk-flex uk-flex-middle uk-flex-right uk-padding">
                            <h4 class="uk-text-bolder uk-text-primary uk-margin-remove">${p.price}</h4> $
                        </div>
                        <a href="add?p=${p.id}"><button class="uk-button uk-button-danger uk-width-1-1 uk-flex uk-flex-center uk-padding-small">Mua ngay</button></a>
                    </div>
                <li>
            </c:forEach>
        </ul>
        <a class="uk-position-center-left uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>
    <div class="uk-flex uk-flex-center uk-width-1-1 uk-padding-large uk-padding-remove-top">
        <button id="showall" onclick="location.href = 'products'" class="uk-button uk-button-danger bg-red fg-white uk-width-1-5 uk-padding-small">
            <span class="uk-text-center uk-width-1-1">Xem tất cả sản phẩm</span>
        </button>
    </div>
</section>