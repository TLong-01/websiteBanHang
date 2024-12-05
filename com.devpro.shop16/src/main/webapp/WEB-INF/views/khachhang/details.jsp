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
    <title>${product.title }</title>
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="${base}/css/details.css">
    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

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

            <li><a href="#">${product.categories.name }</a></li>

            <li>/</li>

            <li>${product.title }</li>
        </ul>
    </div>
    <div class="content">

        <div class="content-cart">
            <div class="thongtin">
                <div class="tt-title">
                    <h1>${product.title }</h1>
                </div>
                <div class="tt-price">
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${product.price}" type="currency"/>
                </div>


                <div class="tt-cart">
                    <div class="number-product">
                        <button type="button" onclick="updateQuantity(-1)" class="tru">-</button>
                        <strong><span id="quantity">1</span></strong>
                        <button type="button" onclick="updateQuantity(1)" class="cong">+</button>
                    </div>

                    <div class="add">
                        <button type="button" class="add-cart"
                                onclick="javascript:AddToCart('${base }', ${product.id}, quantity);">THÊM
                            VÀO GIỎ
                        </button>
                    </div>
                </div>
                <div class="tt-mota">
                    <h3>Mô tả</h3>
                    <p>${product.details}</p>
                </div>
            </div>
            <div class="sanpham">
                <img src="${base }/upload/${product.avatar}" width="65%">
            </div>
        </div>

        <div class="content-products">
            <div class="products-name">
                <a href="#"> SẢN PHẨM LIÊN QUAN </a>
            </div>
            <div class="list-product">

                <div class="item">

                    <div class="item-images">
                        <a href="#"> <img src="${base }/img/grande-đen.png" width="100%">
                        </a>
                    </div>
                    <div class="item-content">
                        <a href="#"> HOODIE CANVA - BLACK </a>
                        <div class="price">
                            <h4 class="new-price">315,000đ</h4>
                            <h5 class="old-price">420,000đ</h5>
                        </div>
                    </div>
                </div>

                <div class="item">

                    <div class="item-images">
                        <a href="#"> <img src="${base }/img/canva-white.png"
                                          width="100%">
                        </a>
                    </div>
                    <div class="item-content">
                        <a href="#"> HOODIE CANVA - WHITE </a>
                        <div class="price">
                            <h4 class="new-price">315,000đ</h4>
                            <h5 class="old-price">420,000đ</h5>
                        </div>
                    </div>
                </div>

                <div class="item">

                    <div class="item-images">
                        <a href="#"> <img src="${base }/img/thun-đen.png"
                                          width="100%">
                        </a>
                    </div>
                    <div class="item-content">
                        <a href="#"> TYPE - BLACK </a>
                        <div class="price">
                            <h4 class="new-price">208,000đ</h4>
                            <h5 class="old-price">320,000đ</h5>
                        </div>
                    </div>
                </div>

                <div class="item">

                    <div class="item-images">
                        <a href="#"> <img src="${base }/img/leather_trang.png"
                                          width="100%">
                        </a>
                    </div>
                    <div class="item-content">
                        <a href="#"> TYPE </a>
                        <div class="price">
                            <h4 class="new-price">208,000đ</h4>
                            <h5 class="old-price">320,000đ</h5>
                        </div>
                    </div>
                </div>

                <div class="item">

                    <div class="item-images">
                        <a href="#"> <img
                                src="${base }/img/thun-stiches-hinhtheu.png" width="100%">
                        </a>
                    </div>
                    <div class="item-content">
                        <a href="#"> STICHES </a>
                        <div class="price">
                            <h4 class="new-price">195,000đ</h4>
                            <h5 class="old-price">300,000đ</h5>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--close content-->

    <!--open footer -->
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <!--close footer-->

</main>
</body>

<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script>
    let quantity = 1;

    function updateQuantity(change) {
        const quantityElement = document.getElementById('quantity');
        quantity += change;
        if (quantity < 1) {
            quantity = 1;
        }
        quantityElement.textContent = quantity;
    }



</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script >
    function AddToCart(baseUrl, productId, quanlity) {
        let data = {
            productId: productId,
            quanlity: quanlity,
        };

        jQuery.ajax({
            url: baseUrl + "/ajax/addToCart",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),

            dataType: "json",
            success: function(jsonResult) {
                if (jsonResult.code === 200) {
                    toastr.success("Sản phẩm đã được thêm vào giỏ hàng.");
                    $("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
                    $([document.documentElement, document.body]).animate({
                        scrollTop: $("#iconShowTotalItemsInCart").offset().top
                    }, 2000);
                } else if (jsonResult.code === 400) {
                    toastr.error(jsonResult.message);
                }
            },
            error: function(jqXhr, textStatus, errorMessage) {
                toastr.error("Đã có lỗi xảy ra, vui lòng thử lại.");
            }
        });
    }

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
</script>
</html>