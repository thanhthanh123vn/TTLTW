
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nthanh Header</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clinicDeals.css">

</head>

<body>

<div id="web-service">
  <jsp:include page="/header.jsp"/>
  <div id="session-body">
    <div class="container">
      <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ ></a>
        <a id="choose-item1" href="#">TTT Clinic Deals</a>
      </div>
      <div class="inforDeals"><img
              src="https://media.hcdn.vn/hsk/campaign/landing-page/baner_bottom_landing_page_triet_long.jpg">
      </div>
      <div class="inforRegister">
        <h2>CHỐT NGAY ƯU ĐÃI</h2>
        <span>CHỈ TỪ <strong>100K</strong></span>
        <form>
          <input type="text" placeholder="Họ và tên">
          <input type="text" placeholder="Số điện thoại">
          <select>
            <option>Dịch vụ muốn làm</option>
            <!-- Thêm các lựa chọn khác ở đây -->
          </select>
          <select>
            <option>Chọn tỉnh thành</option>
            <!-- Thêm các lựa chọn khác ở đây -->
          </select>
          <select>
            <option>Chi nhánh gần bạn nhất</option>
            <!-- Thêm các lựa chọn khác ở đây -->
          </select>
          <button type="submit">ĐĂNG KÝ NGAY</button>
        </form>
        <div class="countdown">
          <div><span>00</span> Ngày</div>
          <div><span>01</span> Giờ</div>
          <div><span>19</span> Phút</div>
          <div><span>53</span> Giây</div>
        </div>
      </div>
      <div class="commit">
        <div class="commit-item">
          <img src="https://media.hcdn.vn/hsk/campaign/landing-page/icon-slogan-triet-long-1.png" alt="No extra fees">
          <p>Cam kết không phát sinh chi phí</p>
        </div>
        <div class="commit-item">
          <img src="https://media.hcdn.vn/hsk/campaign/landing-page/icon-slogan-triet-long-2.png" alt="Safe and Effective">
          <p>An toàn - Hiệu quả</p>
        </div>
        <div class="commit-item">
          <img src="https://media.hcdn.vn/hsk/campaign/landing-page/icon-slogan-triet-long-3.png" alt="Convenient branches">
          <p>Thuận tiện với chi nhánh trên toàn quốc</p>
        </div>
      </div>


      <div class="consultation">
        <div class="consultation-item">
          <p>Tư vấn</p>
          <div class="phone-consultation">
            <img src="https://media.hcdn.vn/hsk/campaign/landing-page/btn_04.png" alt="Phone">
            <span>1800 6324</span>
            <p>Phím 2</p>
          </div>
        </div>
        <div class="consultation-item">
          <p>Tư vấn</p>
          <div class="chat-consultation">
            <img src="https://media.hcdn.vn/hsk/campaign/landing-page/btn_03.png" alt="Chat">
            <span>Chat ngay</span>
          </div>
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