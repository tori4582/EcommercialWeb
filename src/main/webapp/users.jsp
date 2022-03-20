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
                    <span uk-icon="icon: users; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                    <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">Quản lý người dùng</h1>
                </div>
            </div>
        </section>

        <section class="uk-section-default uk-padding-large">
            <div class="uk-width-2-3 uk-flex uk-flex-center">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                        <tr>
                            <th>UID</th>
                            <th>Tên tài khoản</th>
                            <th>Phân quyền Admin</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody uk-scrollspy="target: > tr; cls: uk-animation-slide-top; delay: 100">
                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td><span class="uk-text-primary">${u.id}</span></td>
                                <td><span class="uk-text-bolder">${u.user}</span></td>
                                <td>
                                    <c:if test="${u.isAdmin == 1 && u.isSell == 1}">
                                        <span class="uk-text-success" uk-icon="check"></span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${u.id != currentUserId}">
                                    <a class="uk-button uk-button-danger" href="users?uid=${u.id}&action=remove">
                                        <span uk-icon="trash"></span>
                                    </a> 
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <section>
            <ul class="uk-pagination uk-flex-center" uk-margin>
                <li><a href="#"><span uk-pagination-previous></span></a></li>
                <li><a href="#">1</a></li>
                <li class="uk-disabled"><span>...</span></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li class="uk-active"><span>7</span></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#">10</a></li>
                <li class="uk-disabled"><span>...</span></li>
                <li><a href="#">20</a></li>
                <li><a href="#"><span uk-pagination-next></span></a></li>
            </ul>
        </section>

        <c:if test="${specificProduct != null}">
            <div id="product-detail" class="uk-flex-top" uk-modal>
                <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">

                    <button class="uk-modal-close-default" type="button" uk-close></button>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                </div>
            </div>
        </c:if>

    </body>
</html>
