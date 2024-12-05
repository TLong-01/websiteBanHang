<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/css.jsp"></jsp:include>
    <style>
        #pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
        }
        #pagination a.active {
            font-weight: bold;
            color: #000;
        }
    </style>

</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<div id="preloader">
    <div class="loader"></div>
</div>
<div class="page-container">
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/sidebar.jsp"></jsp:include>
    <div class="main-content">
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/title.jsp"></jsp:include>
        <form class="list" action="${base }/admin/product" method="get">
            <div class="main-content-inner">

                <div class="card-body"
                     style="display: flex; justify-content: space-between">
                    <div style="display: flex; padding-right: 15px">
                        <input type="hidden" id="page" name="page" class="form-control">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search"
                               value="${searchModel.keyword }"
                               style="margin-right: 5px; height: 46px;">
                        <select class="form-control" name="categoryId" id="categoryId"
                                style="margin-right: 5px; height: 46px;">
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id }">${category.name }</option>
                            </c:forEach>
                        </select>
                        <button type="submit" id="btnSearch" name="btnSearch"
                                value="Search" class="btn btn-flat btn-outline-secondary mb-3">Search
                        </button>
                    </div>
                    <div>
                        <button type="button"
                                class="btn btn-flat btn-outline-secondary mb-3">
                            <a href="${base }/admin/product/add-product"> Thêm mới sản phẩm</a>
                        </button>

                    </div>
                </div>
            </div>

            <div class="single-table"
                 style="margin: 0px 30px; padding-bottom: 15px">
                <div class="table-responsive">
                    <table id="productsTable" class="table text-center">
                        <thead class="text-uppercase bg-primary">
                        <tr class="text-white">
                            <th scope="col">ID</th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Số lượng hiện còn</th>
                            <th scope="col">Avatar</th>
                            <th scope="col">Lựa chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${productsWithPaging.data}" var="product" varStatus="loop">
                            <c:if test="${product.status eq true}">
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${product.title }</td>
                                    <td><fmt:setLocale value="vi_VN" scope="session"/> <fmt:formatNumber
                                            value="${product.price }" type="currency"/></td>
                                    <td>${product.categories.name }</td>

                                    <td>${product.quantity}</td>
                                    <td><img src="${base }/upload/${product.avatar}"
                                             width="100" height="100"></td>
                                    <td><a class="btn btn-primary"
                                           href="${base }/admin/product/add-product/${product.id}"
                                           role="button">Edit</a>
                                        <a class="btn btn-danger" role="button"
                                           href="${base }/delete/${product.id}">Delete</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- Paging -->
            <div id="pagination" class="text-center"></div>
        </form>
    </div>

    <!-- footer area start-->
    <footer>
        <div class="footer-area">
            <p>
                © Copyright 2018. All right reserved. Template by <a
                    href="https://colorlib.com/wp/">Colorlib</a>.
            </p>
        </div>
    </footer>
</div>
<jsp:include page="/WEB-INF/views/quantrivien/layouts/offset.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantrivien/layouts/js.jsp"></jsp:include>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var table = document.getElementById('productsTable');
        var tbody = table.getElementsByTagName('tbody')[0];
        var rows = tbody.getElementsByTagName('tr');
        var perPage = 5;
        var currentPage = 1;
        var totalRows = rows.length;
        var totalPages = Math.ceil(totalRows / perPage);

        function showPage(page) {
            currentPage = page;
            var start = (currentPage - 1) * perPage;
            var end = start + perPage;
            for (var i = 0; i < totalRows; i++) {
                rows[i].style.display = i >= start && i < end ? '' : 'none';
            }
            updatePagination();
        }

        function updatePagination() {
            var pagination = document.getElementById('pagination');
            pagination.innerHTML = '';
            for (var i = 1; i <= totalPages; i++) {
                var link = document.createElement('a');
                link.href = '#';
                link.innerText = i;
                link.className = i === currentPage ? 'active' : '';
                link.onclick = (function(i) {
                    return function(e) {
                        e.preventDefault();
                        showPage(i);
                    }
                })(i);
                pagination.appendChild(link);
            }
        }

        showPage(1);
    });
</script>

</html>
