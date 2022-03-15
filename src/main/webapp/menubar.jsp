<%--
    Document   : menubar
    Created on : 13 Mar 2022, 1:56:37 am
    Author     : hungt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section>
    <nav id="navbar" class="uk-navbar-container" uk-navbar>
        <div class="uk-navbar-left">
            <ul class="uk-navbar-nav">
                <a id="page-logo" href="/EcommercialWeb/home" class="uk-navbar-item uk-logo uk-margin-medium-left uk-width-small">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" viewBox="0 0 28 34" class="uk-margin-large uk-svg uk-animation-stroke" uk-svg="stroke-animation: true" style="--uk-animation-stroke: 46;">
                        <polygon points="19.1 4.1 13.75 1 8.17 4.45 13.6 7.44 19.1 4.1" fill="#ac171d"></polygon>
                        <path d="M21.67,5.43,16.14,8.77,22.4,12.4v9.52l-8.44,4.76L5.6,21.93V14.55L0,11.7V25.21l13.75,8.08L28,25.21V9.07Z" fill="#ac171df"></path>
                    </svg>
                </a>
            </ul>
            <ul class="uk-navbar-nav">
                <li class="uk-navbar-item">
                    <a href="">
                        Danh mục sản phẩm
                        <span uk-icon="icon: chevron-down">
                    </a>
                    <div class="uk-navbar-dropdown">
                        <ul class="uk-nav uk-navbar-dropdown-nav">
                            <c:forEach items="${listCC}" var="o">
                                <li>
                                    ${o.cname}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>

        <div id="div-search-form" class="uk-navbar-center uk-width-3-5">
            <div class="uk-navbar-item uk-width-1-1">
                <form id="search-form" action="search" method="post" class="uk-form-horizontal uk-width-1-1">
                    <div class="uk-inline uk-width-1-1">
                        <input type="text" class="uk-input uk-width-1-1" placeholder="Bạn muốn tìm sản phẩm gì?">
                            <button type="submit" class="uk-form-icon uk-form-icon-flip" uk-icon="search"></button>
                    </div>
                </form>
            </div>
        </div>

        <div class="uk-navbar-right">
            <ul class="uk-navbar-nav">
                <li class="uk-navbar-item">
                    <a href="">
                        <span uk-icon="icon: bag"></span>
                        <span >Giỏ hàng</span>
                        <span class="uk-navbar-badge uk-badge">${cartLength}</span>
                    </a>
                </li>
                <li class="uk-navbar-item">
                    <button id="btn-login" class="uk-button uk-button-danger">
                        <span uk-icon="icon: user"></span>
                        <span class="uk-margin uk-margin-small-left uk-margin-remove-vertical">Đăng nhập</span>
                    </button>
                </li>
            </ul>
        </div>
    </nav>
</section>
