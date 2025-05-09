<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="object.cart.Cart" %>
<%@ page import="object.User" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nthanh Header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartProduct.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">

    <link rel="icon" href="/image/logo.png" type="image/x-icon">

</head>

<body>
<div id="web-service">
    <jsp:include page="header.jsp"/>
    <div class="container">
        <div class="breadcrumb">
            <a href="main.html">Trang chủ ></a>
            <a href="#">Giỏ hàng</a>
        </div>
        <h2>Giỏ hàng <span id="total_Product">${sessionScope.cart.totalProductCart}(Sản phẩm)</span></h2>
        <div class="cart">
            <div class="cart-items">
                <c:forEach var="cartItem" items="${sessionScope.cart.list}">
                    <div class="cart-item">
                        <div class="product-info">
                            <img src="${cartItem.image}" alt="${cartItem.name}">
                            <div class="product-details">
                                <h3>${cartItem.name}</h3>
                                <p>${cartItem.detail}</p>
                                <span>${cartItem.price} <del>229.000 ₫</del></span>
                                <div class="actions">
                                    <a href="wishlist?id="+cartItem.id>Yêu thích</a> | <a href="" onclick="removeProduct(${cartItem.id})">Xóa</a>
                                </div>
                                <div class="promotion">Tặng ngay phần quà khi mua tại cửa hàng còn quà</div>
                            </div>
                        </div>
                        <div class="quantity" >
                            <input type="number" value="${cartItem.count}" name="quantity" min="1"
                                   onchange="updateProductQuantity(${cartItem.id}, this.value)">
                        </div>
                        <div class="total-price">${cartItem.price * cartItem.count}</div>
                    </div>
                </c:forEach>

                <div class="cart-summary cart-vat">
                    <p>Tạm tính: <span>${sessionScope.cart.totalCart}</span></p>
                    <p>(Đã bao gồm VAT)</p>
                    <button id="hang-1" class="checkout-btn order-product" >Tiến hành đặt hàng</button>
                </div>

            </div>

            <div class="cart-summary">
                <h3>Hóa đơn của bạn</h3>
                <p>Tạm tính: <span >${sessionScope.cart.totalCart}</span></p>
                <p>Giảm giá: <span>-0 ₫</span></p>
                <p><strong>Tổng cộng: <span class="totalPrice">${sessionScope.cart.totalCart}đ</span></strong></p>
                <button id="hang-2" class="checkout-btn order-product" >Tiến hành đặt hàng</button>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>
</div>
<script src="${pageContext.request.contextPath}/js/updateUserMain.js"></script>
<%

    // Lấy username từ session
    User user = (User) session.getAttribute("user");

    String username = user.getFullName();


    // Nếu cưa đăng nhập, gán giá trị rỗng
    if (username == null) {
        username = "";
    }
%>
<script>
    const  username = '<%=username%>';
</script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/cartProduct.js"></script>


<script>
    loginUser();
    // Lấy danh sách tất cả các phần tử có class "logout-account"
    var logoutElements = document.getElementsByClassName("logout-account");

    // Thêm sự kiện onclick cho từng phần tử
    Array.from(logoutElements).forEach(element => {
        element.onclick = function () {
            logoutUser();
        };
    });

    var htkh = document.getElementById('htkh');
    htkh.onclick = function () {
        window.location.href = 'htkh.html';
    }

    var htch = document.getElementById('htch');
    htch.onclick = function () {
        window.location.href = 'htch.html';
    }

</script>




<script>
    var hang1 = document.getElementById('hang-1');
    hang1.onclick = function () {
       checkProductInvaild();
    }

    var hang2 = document.getElementById('hang-2');
    hang2.onclick = function() {
        checkProductInvaild();
    }
</script>

</body>
</html>
