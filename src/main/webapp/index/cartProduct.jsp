<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 12/14/2024
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@ page import="object.cart.Cart" %>
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
  <jsp:include page="../header.jsp"/>
    <div class="container">
        <div class="breadcrumb">
            <a href="main.html">Trang chủ ></a>
            <a href="#">Giỏ hàng</a>
        </div>
        <h2>Giỏ hàng <span id="total_Product">(2 sản phẩm)</span></h2>
        <div class="cart">
            <div class="cart-items">
                <div class="cart-item">
                <c:forEach var="cartItem" items="${sessionScope.cart.list}">
                    <div class="product-info">
                        <img src="https://media.hcdn.vn/catalog/product/p/r/promotions-auto-nuoc-tay-trang-tuoi-mat-l-oreal-3-in-1-danh-cho-da-dau-da-hon-hop-400ml_qo5GfcimUJ2bPNQd_img_80x80_d200c5_fit_center.png"
                             alt="L'OREAL">
                        <div class="product-details">
                            <h3>${cartItem.name}</h3>
                            <p>${cartItem.detail}</p>
                            <span>${cartItem.price} <del>229.000 ₫</del></span>
                            <div class="actions">
                                <a href="#">Yêu thích</a> | <a href="#">Xóa</a>
                            </div>
                            <div class="promotion">Tặng ngay phần quà khi mua tại cửa hàng còn quà</div>
                        </div>
                    </div>
                    <div class="quantity">
                        <input type="number" value="1" min="1">
                    </div>
                    <div class="total-price">${sessionScope.cart.totalCart}</div>
                    </div>

                </c:forEach>

                <div class="cart-summary cart-vat">

                    <p>Tạm tính: <span>${sessionScope.cart.totalCart}</span></p>
                    <p>(Đã bao gồm VAT)</p>

                    <button id="hang-1" class="checkout-btn order-prodcut">Tiến hành đặt hàng</button>
                </div>


            </div>

            <div class="cart-summary">
                <h3>Hóa đơn của bạn</h3>
                <p>Tạm tính: <span>${sessionScope.cart.totalCart}</span></p>
                <p>Giảm giá: <span>-0 ₫</span></p>
                <p><strong>Tổng cộng: <span>${sessionScope.cart.totalCart}</span></strong></p>
                <button id="hang-2" class="checkout-btn order-prodcut">Tiến hành đặt hàng</button>
            </div>
        </div>
    </div>


<jsp:include page="../footer.jsp"/>
</div>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/searchProduct.js"></script>
<script src="${pageContext.request.contextPath}/js/updateUserMain.js"></script>

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
        window.location.href = 'htch.html'
    }


</script>
<script src="../js/detailProduct.js"></script>
<script>

    var cartProduct = localStorage.getItem('cartProduct');
    console.log(cartProduct);
    var productHtml = document.getElementsByClassName('table-container');
    if (cartProduct) {
        cartProduct = JSON.parse(cartProduct);
        cartProduct.foreach((product) => {
            console.log(product);

            var productHtml = `
               <tbody>
    <tr>
        <td>
            <div class="product-row">
                <img src="${product.image}" alt="L'Oreal">

                <div class="product-details">
                        <h4>${product.name}</h3>
                        <p>${product.detail}</p>
                        <div class="action-buttons">
                            <a href="#">♡ Yêu thích</a>
                            <a href="#">✖ Xóa</a>
                        </div>
                        <span class="price">${product.price}</span>
                        <button class="buy-button">Buy Now</button>
                 </div>
            </div>
    </td>
    </tr>
</tbody>
`
            document.getElementsByClassName('table-container').appendChild(productHtml);

        });


    } else {
        cartProduct = [];
    }


</script>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        // Lấy tất cả các nút "Xóa"
        const deleteButtons = document.querySelectorAll('.actions a.delete');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn không cho trang tải lại
                // Lấy phần tử chứa sản phẩm
                const cartItem = this.closest('.cart-item');
                if (cartItem) {
                    // Xóa sản phẩm khỏi giỏ hàng
                    cartItem.remove();
                    updateCartSummary();
                }
            });
        });

        function updateCartSummary() {
            // Tính lại tổng cộng sau khi xóa sản phẩm
            const totalPrices = document.querySelectorAll('.total-price');
            let total = 0;

            totalPrices.forEach(priceElement => {
                const priceText = priceElement.textContent.replace(/[^\d]/g, '');
                total += parseInt(priceText, 10);
            });

            // Cập nhật tổng cộng
            document.querySelector('.cart-summary p strong span').textContent = total.toLocaleString() + " ₫";
        }
    });


</script>
<script>
    var hang = document.getElementById('hang-1');
    hang.onclick = function () {
        window.location.href = 'payAddress.html'
    }

    var hang = document.getElementById('hang-2');
    hang.onclick = function(){
        window.location.href = 'payAddress.html'
    }
</script>


</body>

</html>
