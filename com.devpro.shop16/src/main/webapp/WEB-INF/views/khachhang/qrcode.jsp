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
    <title>Fashion Msic</title>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${base}/css/contact.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <style>
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 80vh;
            text-align: center;
        }

        .qr-code {
            margin-bottom: 20px;
            margin-top: 30px;
        }

        .confirm-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .confirm-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<main class="container">
    <%--    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>--%>

    <%--    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>--%>
    <div class="center-content">
        <form class="list" action="${base }/qrcode" method="get">
            <div class="qr-code">
                <!-- Giả sử mã QR là một hình ảnh, bạn có thể thay đổi URL tới hình ảnh của mã QR của bạn -->
                <img src="${base}/img/qr.png" alt="QR Code" style="width: 50%;">
                <p>Tổng số tiền của đơn hàng: ${totalPrice}</p>
            </div>
        </form>
        <button class="confirm-button" onclick="confirmPayment()">Xác nhận đã thanh toán</button>
    </div>

    <%--close content --%>
    <%--    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>--%>

</main>

</body>
<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">
    function confirmPayment() {
        alert("Thanh toán thành công!");
        window.location.href = "${base}/home";
    }
</script>
</script>
</html>