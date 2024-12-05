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
    <title>User</title>
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
<!-- preloader area start -->
<div id="preloader">
    <div class="loader"></div>
</div>
<div class="page-container">
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/sidebar.jsp"></jsp:include>
    <div class="main-content">
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/title.jsp"></jsp:include>
        <form class="list" action="${base }/admin/order" method="get">
            <div class="main-content-inner">

                <div class="card-body"
                     style="display: flex; justify-content: space-between">
                    <div style="display: flex; padding-right: 15px">
                        <input type="hidden" id="page" name="page" class="form-control">
                        <input type="text" id="keyword" name="keyword"
                               class="form-control" placeholder="Search"
                               value="${searchModel.keyword }"
                               style="margin-right: 5px; height: 46px;">
                        <button type="submit" id="btnSearch" name="btnSearch"
                                value="Search" class="btn btn-flat btn-outline-secondary mb-3">Search
                        </button>
                    </div>
                    <div>
                    </div>

                </div>
            </div>

            <div class="single-table" style="margin: 0px 30px; padding-bottom: 15px">
                <div class="table-responsive">
                    <table id="ordersTable" class="table text-center">
                        <thead class="text-uppercase bg-primary">
                        <tr class="text-white">
                            <th scope="col">ID</th>
                            <th scope="col">Mã đơn</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Phương thức thanh toán</th>
                            <th scope="col">Tổng hóa đơn</th>
                            <th scope="col">Phí ship</th>
                            <th scope="col">Thời gian đặt hàng</th>
                            <th scope="col">Trạng thái đơn hàng</th>
                            <th scope="col">Chi tiết</th>
                            <th scope="col">Hủy đơn</th>
                        </tr>
                        </thead>
                        <tbody id="ordersBody">
                        <c:forEach items="${orderWithPaging.data}" var="orders" varStatus="loop">
                            <c:if test="${orders.status eq true}">
                                <tr data-status="${orders.paymentStatus}">
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${orders.code}</td>
                                    <td>
                                            ${orders.customer_name} <br>
                                            ${orders.customer_phone} <br>
                                            ${orders.customer_address} <br>
                                            ${orders.customer_email} <br>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${orders.paymentType == 1}">
                                                Thanh toán bằng tiền mặt
                                            </c:when>
                                            <c:when test="${orders.paymentType == 2}">
                                                Thanh toán bằng VNPAY
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><fmt:formatNumber value="${orders.totalPrice}" type="currency"
                                                          currencySymbol="₫"/></td>
                                    <td><fmt:formatNumber value="${orders.fee}" type="currency"
                                                          currencySymbol="₫"/></td>
                                    <td>${orders.createdDate}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    style="background-color: transparent; border-color: transparent;">
                                                <c:choose>
                                                    <c:when test="${orders.paymentStatus == 1}">
                                                        <span class="badge badge-danger"
                                                              style="display: inline-block; width: 100%; height: 100%; font-size: 15px;">Chưa xử lý</span>
                                                    </c:when>
                                                    <c:when test="${orders.paymentStatus == 2}">
                                                        <span class="badge badge-warning"
                                                              style="display: inline-block; width: 100%; height: 100%; font-size: 15px;">Đang giao hàng</span>
                                                    </c:when>
                                                    <c:when test="${orders.paymentStatus == 3}">
                                                        <span class="badge badge-success"
                                                              style="display: inline-block; width: 100%; height: 100%; font-size: 15px;">Đã giao hàng</span>
                                                    </c:when>
                                                    <c:when test="${orders.paymentStatus == 4}">
                                                        <span class="badge badge-danger"
                                                              style="display: inline-block; width: 100%; height: 100%; font-size: 15px;">Hủy đơn</span>
                                                    </c:when>
                                                </c:choose>
                                            </button>
                                            <c:if test="${orders.paymentStatus != 4}">
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#"
                                                       onclick="updateStatus(${orders.id}, 1)">Chưa xử lý</a>
                                                    <a class="dropdown-item" href="#"
                                                       onclick="updateStatus(${orders.id}, 2)">Đang giao hàng</a>
                                                    <a class="dropdown-item" href="#"
                                                       onclick="updateStatus(${orders.id}, 3)">Đã giao hàng</a>
                                                </div>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>
                                        <a class="btn" href="${base}/admin/order-product?orderId=${orders.id}"
                                           role="button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <c:if test="${orders.paymentStatus != 4}">
                                            <a class="btn" href="${base }/admin/order-reject/update/${orders.id}"
                                               role="button">
                                                <i class="fas fa-times"></i>
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

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
    <!-- footer area end-->
</div>
<jsp:include page="/WEB-INF/views/quantrivien/layouts/offset.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantrivien/layouts/js.jsp"></jsp:include>
</body>
<script type="text/javascript">


    function updateStatus(orderId, status) {
        let data = {
            saleOrderId: orderId,
            status: status
        };

        $.ajax({
            url: '/admin/order-product/update-status',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                location.reload();
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var table = document.getElementById('ordersTable');
        var tbody = document.getElementById('ordersBody');
        var rows = Array.from(tbody.getElementsByTagName('tr'));
        var perPage = 5;
        var currentPage = 1;
        var totalRows = rows.length;
        var totalPages = Math.ceil(totalRows / perPage);

        function sortRows() {
            rows.sort(function (a, b) {
                var statusA = parseInt(a.getAttribute('data-status'));
                var statusB = parseInt(b.getAttribute('data-status'));
                var dateA = new Date(a.querySelector('td:nth-child(7)').innerText);
                var dateB = new Date(b.querySelector('td:nth-child(7)').innerText);

                if (statusA === statusB) {
                    return dateB - dateA;  // Nếu trạng thái giống nhau, sắp xếp theo ngày mới nhất trước
                } else {
                    return statusA - statusB;  // Sắp xếp theo trạng thái
                }
            });
            rows.forEach(function (row) {
                tbody.appendChild(row);
            });
        }

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
                link.onclick = (function (i) {
                    return function (e) {
                        e.preventDefault();
                        showPage(i);
                    }
                })(i);
                pagination.appendChild(link);
            }
        }

        sortRows();
        showPage(1);
    });

</script>

</html>
