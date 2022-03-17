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
                    <span uk-icon="icon: cart; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Giỏ hàng của bạn</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large">
            <div class="uk-width-1-1 uk-flex uk-flex-center">
                <c:if test="${sessionScope.acc == null}">
                    <div class="uk-width-1-2 uk-alert-danger uk-padding-large">  
                        <h1 class="uk-text-danger">
                            <span uk-icon="icon: warning; ratio: 2"></span>
                            <span class="uk-margin-small-left">
                                Không tìm thấy giỏ hàng
                            </span>
                        </h1>
                        <p>
                            Bạn cần thực hiện đăng nhập trước khi có thể xem được giỏ hàng
                        </p>
                    </div>
                    <script>
                        window.onload = () => {
                            document.getElementById('btn-login').click();
                        }
                    </script>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <div class="uk-width-1-1">
                        <h1>${sessionScope.acc}</h1>
                    </div>
                    <c:forEach items="${c}" var="item">
                        <span>${item.name}</span>
                    </c:forEach>
                </c:if>
            </div>
        </section>

        <c:if test="${sessionScope.acc != null}">
            <section class="uk-position-fixed uk-position-bottom uk-width-1-1 bg-red fg-white uk-padding-small">
                <div class="uk-flex uk-flex-right uk-flex-middle uk-margin-right">
                    <div class="uk-flex uk-flex-bottom">
                        <span class="uk-margin-right">Tổng số tiền cần thanh toán: </span>
                        <strong><h1 id="amount" class="uk-padding-remove-vertical uk-margin-remove-vertical fg-white">${ 400 }</h1></strong>
                        <span class="uk-margin-small-left">$</span>
                    </div>
                    <hr class="uk-divider-vertical" style="background: white; margin-left: 50px; margin-right: 50px;">
                    <div>
                        <form action="OrderController" method="post">
                            <button name="checkout" type="button" class="uk-button uk-button-danger btn-red uk-width-medium uk-padding-small">
                                <p class="uk-width-1-1 uk-padding-remove uk-margin-remove uk-flex uk-flex-center uk-flex-middle">
                                    <span uk-icon="icon: credit-card; ratio: 1.5" class="uk-margin-right"></span>
                                    Thanh toán
                                </p>
                            </button>
                        </form>
                    </div>
                </div>
            </section>
        </c:if>
    </body>
</html>
