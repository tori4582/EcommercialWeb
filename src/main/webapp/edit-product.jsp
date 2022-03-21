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
        <title>Chỉnh sửa sản phẩm</title>
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
                    <span uk-icon="icon: pencil; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Chỉnh sửa sản phẩm</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large uk-width-1-1 uk-flex uk-flex-center">
            <div class="uk-flex uk-width-1-2 uk-box-shadow-large uk-padding-large uk-flex uk-flex-center">
                <form action="edit-product-action" method="post">
                    <div class="">
                        <div class="uk-form-horizontal">
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label uk-text-bolder">Tên sản phẩm</label>
                                <div class="uk-form-controls">
                                    <input name="name" type="text" class="uk-input uk-width-medium uk-text-bolder uk-text-primary" value="${p.name}">
                                </div>
                            </div>
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label">Danh mục</label>
                                <div class="uk-form-controls">
                                    <select class="uk-select uk-width-medium" name="category">
                                        <c:forEach items="${listCC}" var="c">

                                            <c:if test="${pcid == c.cid}">
                                                <option class="uk-text-primary uk-text-bolder" selected>${c.cid} - ${c.cname}</option>
                                            </c:if>
                                                
                                            <c:if test="${pcid != c.cid}">
                                                <option>${c.cid} - ${c.cname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label">Link hình ảnh</label>
                                <div class="uk-form-controls">
                                    <input name="image" type="text" class="uk-input uk-width-medium" value="${p.image}">
                                </div>
                            </div>
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label">Giá tiền</label>
                                <div class="uk-form-controls">
                                    <input name="price" type="number" class="uk-input uk-width-medium" value="${p.price}">
                                    <strong>$</strong>
                                </div>
                            </div>
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label">Title</label>
                                <div class="uk-form-controls">
                                    <input name="title" type="text" class="uk-input uk-width-medium" value="${p.title}">
                                </div>
                            </div>
                            <div class="uk-margin-small-bottom">
                                <label class="uk-form-label">Mô tả</label>
                                <div class="uk-form-controls">
                                    <input name="description" type="text" class="uk-input uk-width-medium" value="${p.description}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uk-modal-footer uk-text-right">
                        <div class="uk-flex uk-flex-inline">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Huỷ</button>
                            <button class="uk-button uk-button-primary uk-margin-small-left" type="submit">Sửa thông tin</button>
                        </div>
                    </div>
                </form>

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
