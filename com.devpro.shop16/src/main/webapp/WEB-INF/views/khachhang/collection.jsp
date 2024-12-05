<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!--import JSTL-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tất cả sản phẩm</title>
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${base}/css/collection.css">
    <style>
        .pagination {
            display: flex;
            justify-content: center;

        }

        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination a.active {
            background-color: #ff5f17;
            color: white;
            border: 1px solid #ff5f17;
        }

        .pagination a:hover:not(.active) {
            background-color: #ff5f17;
        }
    </style>
</head>
<body>
<main class="container">

    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>
    <!--open header-->
    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>
    <!--close header-->

    <div class="navigation">
        <ul>
            <li><a href="${base }/home">Trang chủ </a></li>

            <li>/</li>

            <li><a href="#">Danh mục</a></li>

            <li>/</li>

            <li>Tất cả sản phẩm</li>
        </ul>
    </div>
    <!-- open content -->
    <div class="content">

        <form class="list" action="${base }/collection" method="get">
            <div class="content-collection">
                <div class="collection-title" style="align-items: center; justify-content: center;">
                    <div class="all-coll">
                        <h2>Tất cả sản phẩm</h2>
                    </div>
                </div>

                <div class="list-product" style="flex-wrap: wrap;">

                    <c:forEach items="${productsWithPaging.data }" var="product">
                        <c:if test="${product.status eq true}">
                            <div class="item" style="margin-left: 52px;">

                                <div class="item-images">
                                    <a href="${base }/product/details/${product.seo}"> <img
                                            src="${base }/upload/${product.avatar}"
                                            width="100%">
                                    </a>
                                </div>
                                <div class="item-content">
                                    <a href="${base }/product/details/${product.seo}">
                                            ${product.title } </a>
                                    <div class="price">
                                        <fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="${product.price}" type="currency"/>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
                <!-- Paging -->

            </div>
        </form>


    </div>
    <!--close content-->

    <!--open footer -->
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <!--close footer-->

</main>
</body>

<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">

</script>
</html>