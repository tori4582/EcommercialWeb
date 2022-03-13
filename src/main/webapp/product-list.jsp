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
                <li class="uk-card uk-card-default uk-slider-item uk-margin-small uk-width-medium">
                    <div class="uk-card-media-top">
                        <img src="${p.image}" alt="">
                    </div>
                    <div class="uk-card-body">
                        <h3 class="uk-card-title">${p.name}</h3>
                        <p>${p.title}</p>
                    </div>
                <li>
            </c:forEach>
        </ul>
        <a class="uk-position-center-left uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>
</section>