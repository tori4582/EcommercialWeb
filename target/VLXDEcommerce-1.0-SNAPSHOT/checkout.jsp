<%-- 
    Document   : cart
    Created on : 17 Mar 2022, 3:15:46 am
    Author     : hungt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <!-- UIkit CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/css/uikit.min.css" />
        <link rel="stylesheet" href="./css/styles.css"/>
        <!-- UIkit JS -->
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/js/uikit-icons.min.js"></script>
    </head>
    <body>
        <jsp:include page="menubar.jsp">
            <jsp:param name="cartLength" value="${cartLength}"/>
            <jsp:param name="listCC" value="${listCC}"/>
            <jsp:param name="acc" value="${sessionScope.acc}"/>
        </jsp:include>

        <section class="uk-section-default">
            <div class="uk-section uk-light uk-background-cover" style="background-image: url(https://t4.ftcdn.net/jpg/03/24/94/19/240_F_324941929_9DVxm0eIsy4a1RFrmPnvcjan7Z9Eo3Cn.jpg)">
                <div class="uk-width-1-1">
                    <span uk-icon="icon: credit-card; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Thanh toán</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large">
            <div class="uk-width-1-1 uk-flex uk-flex-center">
                    <div class="uk-width-1-2 uk-alert-danger uk-padding-large">  
                        <h1 class="uk-text-danger">
                            <span uk-icon="icon: check; ratio: 2"></span>
                            <span class="uk-margin-small-left">
                                Đặt hàng thành công
                            </span>
                        </h1>
                        <p>
                            Bạn đã hoàn thành quá trình đặt hàng
                        </p>
                    </div>
        </section>
    </body>
</html>
