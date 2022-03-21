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
                    <span uk-icon="icon: pencil; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Quản lý sản phẩm</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large">
            <a class="uk-button uk-button-danger uk-float-right" href="#add-form-canvas" uk-toggle>
                <span uk-icon="plus"></span>
                Thêm sản phẩm
            </a>
            <div class="uk-width-1-1 uk-flex uk-flex-center">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                        <tr>
                            <th>PID</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Title</th>
                            <th>Đơn giá</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody uk-scrollspy="target: > tr; cls: uk-animation-slide-top; delay: 100">
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td class="uk-width-small"><span class="uk-text-primary">${p.id}</span></td>
                                <td><img class="uk-preserve-width" src="${p.image}" width="50" height="50" alt=""></td>
                                <td><a class="uk-link-reset" href="product?p=${p.id}" uk-toggle="target: #product-detail">${p.name}</a></td>
                                <td><span>${p.title}</span></td>
                                <td><span class="uk-text-primary uk-text-bolder">${p.price}</span> $</td>
                                <td>
                                    <div>
                                        <a class="uk-button uk-button-secondary" href="prodmgr?action=edit&id=${p.id}">
                                            <span uk-icon="pencil"></span>
                                        </a>
                                        <a class="uk-button uk-button-danger" href="prodmgr?action=remove&id=${p.id}">
                                            <span uk-icon="trash"></span>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="add-form-canvas" uk-modal>
            <form class="uk-modal-dialog" action="create-product" method="post">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Thêm sản phẩm</h2>
                </div>
                <div class="uk-modal-body">
                    <div class="uk-form-horizontal">
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label uk-text-bolder">Tên sản phẩm</label>
                            <div class="uk-form-controls">
                                <input name="name" type="text" class="uk-input uk-width-medium uk-text-bolder uk-text-primary">
                            </div>
                        </div>
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label">Danh mục</label>
                            <div class="uk-form-controls">
                                <select class="uk-select uk-width-medium" name="category">
                                    <c:forEach items="${listCC}" var="c">
                                        <option>${c.cid} - ${c.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label">Link hình ảnh</label>
                            <div class="uk-form-controls">
                                <input name="image" type="text" class="uk-input uk-width-medium">
                            </div>
                        </div>
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label">Giá tiền</label>
                            <div class="uk-form-controls">
                                <input name="price" type="number" class="uk-input uk-width-medium">
                                <strong>$</strong>
                            </div>
                        </div>
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label">Title</label>
                            <div class="uk-form-controls">
                                <input name="title" type="text" class="uk-input uk-width-medium">
                            </div>
                        </div>
                        <div class="uk-margin-small-bottom">
                            <label class="uk-form-label">Mô tả</label>
                            <div class="uk-form-controls">
                                <input name="description" type="text" class="uk-input uk-width-medium">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="uk-modal-footer uk-text-right">
                    <div class="uk-flex uk-flex-inline">
                        <button class="uk-button uk-button-default uk-modal-close" type="button">Huỷ</button>
                        <button class="uk-button uk-button-primary uk-margin-small-left" type="submit">Tạo sản phẩm</button>
                    </div>
                </div>
            </form>
        </section>
        
        <script>
            
        </script>
        
    </body>
</html>
