<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/16/2025
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nthanh Header</title>
  <link rel="icon" href="../image/logo.png" type="image/x-icon">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/saleEndMonth.css">

</head>

<body>
<div id="web-service">
  <jsp:include page="/header.jsp"/>

  <div id="session-body">
    <div class="container">
      <div class="flash-deal-header">
        <div class="flash-title">⚡ FLASH DEAL</div>
        <div class="flash-time">
          <span>00:00 Đang diễn ra</span>
          <span>Kết thúc trong 11:30:02</span>
          <span>22:00 Siêu sale</span>
        </div>
      </div>
      <div class="product-categories">
        <button class="category active">Tất cả</button>
        <button class="category">Sức Khỏe - Làm Đẹp</button>
        <button class="category">Hasaki Clinic & Spa</button>
        <button class="category">Mỹ phẩm High-end</button>
      </div>
      <div class="product-grid">
        <div class="product-card">
          <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-phan-phu-carslan-dang-nen-vo-den-mau-tim-8g-1723260149_img_300x300_b798dd_fit_center.jpg"
               alt="Product 1">
          <div class="product-info">
            <h3 class="product-title">Carslan</h3>
            <p class="product-description">Phấn Phủ Carslan Dạng Nén Vỏ Đen...</p>
            <p class="product-price">230.000 đ <span class="discount">57%</span></p>
            <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
          </div>
        </div>
        <div class="product-card">
          <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-422208973-1696326099_img_300x300_b798dd_fit_center.png"
               alt="Product 2">
          <div class="product-info">
            <h3 class="product-title">Carslan</h3>
            <p class="product-description">Phấn Phủ Carslan Dạng Nén Vỏ Đen...</p>
            <p class="product-price">230.000 đ <span class="discount">57%</span></p>
            <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
          </div>
        </div>
        <div class="product-card">
          <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-205100137-1695896128_img_300x300_b798dd_fit_center.png"
               alt="Product 3">
          <div class="product-info">
            <h3 class="product-title">Carslan</h3>
            <p class="product-description">Phấn Phủ Carslan Dạng Nén Vỏ Đen...</p>
            <p class="product-price">230.000 đ <span class="discount">57%</span></p>
            <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
          </div>
        </div>
        <div class="product-card">
          <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-253900006-1695973833_img_300x300_b798dd_fit_center.jpg"
               alt="Product 4">
          <div class="product-info">
            <h3 class="product-title">Carslan</h3>
            <p class="product-description">Phấn Phủ Carslan Dạng Nén Vỏ Đen...</p>
            <p class="product-price">230.000 đ <span class="discount">57%</span></p>
            <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
          </div>
        </div>
        <div class="product-card">
          <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-318900012-1730367448_img_300x300_b798dd_fit_center.jpg"
               alt="Product 5">
          <div class="product-info">
            <h3 class="product-title">Carslan</h3>
            <p class="product-description">Phấn Phủ Carslan Dạng Nén Vỏ Đen...</p>
            <p class="product-price">230.000 đ <span class="discount">57%</span></p>
            <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/footer.jsp"/>
</div>
<script src="../js/alert.js">

</script>


<script src="../js/searchProduct.js"></script>

<script src="../js/updateUserMain.js"></script>
<script src="../js/main.js"></script>
<script>
  // Function to toggle chat box visibility
  function signUp() {
    var email = document.getElementById("input-email").value;
    console.log(email);
    localStorage.setItem("email", email);
    window.location.href = "signUp.html";


  }

  function toggleChat() {
    var chatBox = document.getElementById("chatBox");
    if (chatBox.style.display === "none" || chatBox.style.display === "") {
      chatBox.style.display = "flex";
    } else {
      chatBox.style.display = "none";
    }
  }

</script>

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


</body>

</html>