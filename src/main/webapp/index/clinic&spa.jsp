

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nthanh Header</title>
  <link rel="icon" href="../image/logo.png" type="image/x-icon">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clinic&spa.css">

</head>

<body>

<div id="web-service">
  <jsp:include page="/header.jsp"/>
  <div id="session-body">
    <div class="container">
      <div class="breadcrumb">
        <a href="main.html">Trang chủ ></a>
        <a id="choose-item1" href="#">TTT Clinic & Spa</a>
      </div>
      <div class="img-thumbnail"><img src="https://media.hcdn.vn/catalog/category/1320x250-1.jpg" alt="event"></div>
      <div class="content-body">
        <div class="content-body-left">
          <h3>SỨC KHỎE - LÀM ĐẸP</h3>
          <ul class="category-list">
            <li><a href="#">Mỹ Phẩm High-End</a></li>
            <li><a href="#">Chăm Sóc Da Mặt</a></li>
            <li><a href="#">Trang Điểm</a></li>
            <li><a href="#">Chăm Sóc Tóc Và Da Đầu</a></li>
            <li><a href="#">Chăm Sóc Cơ Thể</a></li>
            <li><a href="#">Chăm Sóc Cá Nhân</a></li>
            <li><a href="#">Nước Hoa</a>
              <ul>
                <li><a href="#">Nước Hoa Nữ</a></li>
                <li><a href="#">Nước Hoa Nam</a></li>
                <li><a href="#">Xịt Thơm Toàn Thân</a></li>
                <li><a href="#">Nước Hoa Vùng Kín</a></li>
              </ul>
            </li>
            <li><a href="#">Thực Phẩm Chức Năng</a></li>
            <li><a href="#">Mini / Sample</a></li>
            <li><a href="#">Clearance Sale</a></li>
          </ul>
          <h3>KHOẢNG GIÁ</h3>
          <div class="price-filter">
            <input type="text" placeholder="₫ TỪ">
            <input type="text" placeholder="₫ ĐẾN">
          </div>
          <button class="apply-button">Áp dụng</button>
        </div>
        <div class="content-body-right">
          <!-- Tiêu đề và bộ lọc -->
          <h2>Nước Hoa (216 sản phẩm)</h2>
          <div class="filter-options">
            <button class="filter-button active">Sắp xếp</button>
            <button class="filter-button">Mới nhất</button>
            <button class="filter-button">Bán chạy</button>
            <button class="filter-button">Giá thấp đến cao</button>
            <button class="filter-button">Giá cao đến thấp</button>
          </div>
          <select class="display-count">
            <option>Hiển thị 40</option>
            <option>Hiển thị 20</option>
            <option>Hiển thị 60</option>
          </select>
        </div>
      </div>

    </div>
  </div>
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
<jsp:include page="/footer.jsp"/>

</body>

</html>