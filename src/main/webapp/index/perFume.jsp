
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nthanh Header</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/perFume.css">

</head>

<body>
<div id="web-service">
  <jsp:include page="/header.jsp"/>
  <div id="session-body">
    <div class="container">
      <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ ></a>
        <a id="choose-item1" href="#">Sức khỏe làm đẹp</a>
        <a id="choose-item2" href="#">Nước hoa</a>
      </div>
      <div class="brand-container">
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandarmaf-logo-400x2001710813457_img_140x70_45e3de_fit_center.jpg"
               alt="Armaf">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandfoellie-logo1672904733_img_140x70_45e3de_fit_center.jpg"
               alt="Foellie">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn/brand/1537858195laura-anne_img_140x70_45e3de_fit_center.jpg"
               alt="Laura Anne">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandnarciso-rodriguez-logo-400x2001711524035_img_140x70_45e3de_fit_center.png"
               alt="Narciso Rodriguez">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandlancome-logo-400x2001720074411_img_140x70_45e3de_fit_center.jpg"
               alt="Lancome">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandGota-logo1690352264_img_140x70_45e3de_fit_center.jpg"
               alt="Gota">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandysl-logo-400x2001720000097_img_140x70_45e3de_fit_center.jpg"
               alt="Yves Saint Laurent">
        </a>
        <a href="#">
          <img src="https://media.hcdn.vn//hsk/brandVersace-logo-brand1721717456_img_140x70_45e3de_fit_center.jpg"
               alt="Versace">
        </a>
      </div>
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

          <!-- Sản phẩm -->
          <div class="product-card">
            <img src="https://media.hcdn.vn/catalog/product/t/o/top_deal_422209353_09112024-1731382618_img_380x380_64adc6_fit_center.png"
                 alt="Sản phẩm 1">
            <h4>Lancôme</h4>
            <p>Nước Hoa Nữ Lancôme Idôle EDP 50ml</p>
            <div class="price-wrapper">
              <span class="current-price">2.507.000₫</span>
              <span class="old-price">2.950.000₫</span>
              <span class="discount">15%</span>
            </div>
          </div>

          <div class="product-card">
            <img src="https://media.hcdn.vn/catalog/product/t/o/top_deal_422219349_20112024-1732100751_img_380x380_64adc6_fit_center.png"
                 alt="Sản phẩm 2">
            <h4>Narciso Rodriguez</h4>
            <p>Nước Hoa Nữ Narciso Rodriguez For Her EDP 30ml</p>
            <div class="price-wrapper">
              <span class="current-price">1.746.000₫</span>
              <span class="old-price">1.940.000₫</span>
              <span class="discount">10%</span>
            </div>
          </div>

          <div class="product-card">
            <img src="https://media.hcdn.vn/catalog/product/t/o/top_deal_422223584_09112024-1731133809-1732932632_img_380x380_64adc6_fit_center.png"
                 alt="Sản phẩm 3">
            <h4>Yves Saint Laurent</h4>
            <p>Nước Hoa Nữ YSL Libre EDP 50ml</p>
            <div class="price-wrapper">
              <span class="current-price">3.677.000₫</span>
              <span class="old-price">3.870.000₫</span>
              <span class="discount">5%</span>
            </div>
          </div>

          <div class="product-card">
            <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-nuoc-hoa-nu-daisy-dream-edt-30ml-1711765028_img_380x380_64adc6_fit_center.jpg"
                 alt="Sản phẩm 4">
            <h4>Marc Jacobs</h4>
            <p>Nước Hoa Nữ Marc Jacobs Daisy Dream Eau De Toilette 30ml</p>
            <div class="price-wrapper">
              <span class="current-price">1.030.000₫</span>
              <span class="old-price">1.150.000₫</span>
              <span class="discount">10%</span>
            </div>
          </div>

          <div class="product-card">
            <img src="https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-nuoc-hoa-nam-armaf-club-de-nuit-edt-intense-105ml-1725417317_img_380x380_64adc6_fit_center.jpg"
                 alt="Sản phẩm 5">
            <h4>Armaf</h4>
            <p>Nước Hoa Nam Armaf Club De Nuit EDT Intense 105ml</p>
            <div class="price-wrapper">
              <span class="current-price">1.650.000₫</span>
              <span class="old-price">1.800.000₫</span>
              <span class="discount">8%</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
<script src="../js/alert.js">

</script>


<script src="${pageContext.request.contextPath}/js/searchProduct.js"></script>

<script src="${pageContext.request.contextPath}/js/updateUserMain.js"></script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>


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