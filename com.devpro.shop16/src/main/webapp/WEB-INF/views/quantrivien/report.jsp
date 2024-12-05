<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Thống kê</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Include CSS files -->
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/css.jsp"></jsp:include>
    <style>

        .chart-container {
            width: 100%;
            height: 400px;
            margin-bottom: 50px;
        }

    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="page-container">
    <!-- Include sidebar -->
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/sidebar.jsp"></jsp:include>

    <div class="main-content">
        <!-- Include header -->
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/header.jsp"></jsp:include>
        <!-- Include title -->
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/title.jsp"></jsp:include>
        <div class="main-content-inner">
            <!-- Your statistics content goes here -->
            <div class="card mt-5">

                <div class="card-body">
                    <h4 class="header-title">Thống kê</h4>
                    <form class="list" action="${base}/admin/report" method="get">
                        <div class="main-content-inner">
                            <div class="card-body">
                                <div>
                                    <h5>Tổng số lượng sản phẩm hiện tại</h5>
                                    <canvas id="productChart" width="400" height="200"></canvas>
                                </div>
                                <div>
                                    <h5>Tổng số đơn hàng</h5>
                                    <canvas id="orderChart" width="400" height="200"></canvas>
                                </div>
                                <div>
                                    <h5>Tổng số lượng sản phẩm đã bán</h5>
                                    <canvas id="soldProductChart" width="400" height="200"></canvas>
                                </div>
                                <div>
                                    <h5>Tổng doanh thu</h5>
                                    <canvas id="revenueChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Lấy dữ liệu thống kê từ server-side template engine
                        const productWithPaging = ${productWithPaging};
                        const orderWithPaging = ${orderWithPaging};
                        const saleOrderWithPaging = ${saleOrderWithPaging};
                        const saleOrderWithPagings = ${saleOrderWithPagings};
                        <%--const productWithPaging = parseInt(${productWithPaging});--%>
                        <%--const orderWithPaging = parseInt(${orderWithPaging});--%>
                        <%--const saleOrderWithPaging = parseInt(${saleOrderWithPaging});--%>
                        <%--const saleOrderWithPagings = parseInt(${saleOrderWithPagings});--%>

                        // Tạo biểu đồ cho tổng số lượng sản phẩm hiện tại
                        const ctxProduct = document.getElementById('productChart');
                        new Chart(ctxProduct, {
                            type: 'bar',
                            data: {
                                labels: ['Số lượng sản phẩm hiện tại'],
                                datasets: [{
                                    label: 'Số lượng',
                                    data: [productWithPaging],
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        // ticks: {
                                        //     precision: 0,
                                        //     stepSize: 1,
                                        //     callback: function(value) {
                                        //         if (Number.isInteger(value)) {
                                        //             return value;
                                        //         }
                                        //     }
                                        // }
                                    }
                                }
                            }
                        });

                        // Tạo biểu đồ cho tổng số đơn hàng
                        const ctxOrder = document.getElementById('orderChart').getContext('2d');
                        new Chart(ctxOrder, {
                            type: 'bar',
                            data: {
                                labels: ['Số đơn hàng'],
                                datasets: [{
                                    label: 'Số đơn hàng',
                                    data: [orderWithPaging],
                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                    borderColor: 'rgba(54, 162, 235, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        ticks: {
                                            precision: 0,
                                            stepSize: 1,
                                            callback: function (value) {
                                                if (Number.isInteger(value)) {
                                                    return value;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        });

                        // Tạo biểu đồ cho tổng số lượng sản phẩm đã bán
                        const ctxSoldProduct = document.getElementById('soldProductChart').getContext('2d');
                        new Chart(ctxSoldProduct, {
                            type: 'bar',
                            data: {
                                labels: ['Số lượng sản phẩm đã bán'],
                                datasets: [{
                                    label: 'Số lượng đã bán',
                                    data: [saleOrderWithPaging],
                                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                    borderColor: 'rgba(255, 206, 86, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        ticks: {
                                            precision: 0,
                                            stepSize: 1,
                                            callback: function (value) {
                                                if (Number.isInteger(value)) {
                                                    return value;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        });

                        // Tạo biểu đồ cho tổng doanh thu
                        const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
                        new Chart(ctxRevenue, {
                            type: 'bar',
                            data: {
                                labels: ['Doanh thu'],
                                datasets: [{
                                    label: 'Doanh thu',
                                    data: [saleOrderWithPagings],
                                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                                    borderColor: 'rgba(153, 102, 255, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        ticks: {
                                            precision: 0,
                                            stepSize: 1,
                                            callback: function (value) {
                                                if (Number.isInteger(value)) {
                                                    return value;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        });
                    });
                </script>
            </div>
        </div>
    </div>

    <!-- Include footer -->
</div>

<!-- Include offset area -->
<jsp:include page="/WEB-INF/views/quantrivien/layouts/offset.jsp"></jsp:include>
<!-- Include JS files -->
<jsp:include page="/WEB-INF/views/quantrivien/layouts/js.jsp"></jsp:include>
<!-- Include internal JavaScript -->

</body>
</html>
