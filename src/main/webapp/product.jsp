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
        <title>Danh mục sản phẩm</title>
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
                    <span uk-icon="icon: table; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Chi tiết sản phẩm</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large uk-width-1-1 uk-flex uk-flex-center">
            <div class="uk-flex uk-width-5-6">
                <div class="uk-width-2-5 uk-box-shadow-large">
                    <img src="${product.image}">
                </div>
                <div class="uk-width-3-5 uk-padding uk-box-shadow-large">
                    <h1>${product.name}</h1>
                    <hr>
                    <div class="uk-padding uk-padding-remove-horizontal">
                        <span>
                            <strong>Kích cỡ: </strong> ${product.title}
                        </span>
                        <p class="uk-text-bolder">Mô tả:</p>
                        <p>${product.description}</p>
                    </div>
                    <div class="uk-padding uk-padding-remove-horizontal">
                        <span class="uk-flex-inline uk-flex uk-flex-middle">
                            <strong class="uk-margin-large-right">Giá sản phẩm: </strong>
                            <h2 class="uk-text-bolder uk-margin-remove-vertical uk-margin-small-right">${product.price}</h2> $</span>
                    </div>
                    <div class="uk-flex-inline">
                            <button class="uk-button" onclick="adjustAmount(-1)">-</button>
                            <input id="amount" class="uk-text uk-width-small" type="number" min="1" max="100" value="1">
                            <button class="uk-button" onclick="adjustAmount(1)">+</button>
                            <a class="uk-margin-large-left" href="add?p=${product.id}">
                                <button class="uk-button uk-button-danger uk-padding-small uk-width-small uk-flex uk-flex-center">
                                    <span class="uk-margin-right" uk-icon="cart"></span>Mua ngay
                                </button>
                            </a>
                    </div>
                    
                </div>
            </div>
        </section>

        <script>
            const adjustAmount = (value) => {
                const input = document.getElementById("amount");
                input.value = parseInt(input.value) + parseInt(value);
            };
        </script>

    </body>
</html>
