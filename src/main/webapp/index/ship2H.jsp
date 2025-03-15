<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/14/2025
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nthanh Header</title>
  <link rel="icon" href="../image/logo.png" type="image/x-icon">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ship2H.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>
<div id="web-service">
<jsp:include page="../header.jsp"/>
  <div id="session-body">
    <div class="container">
      <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ ></a>
        <a href="#">Vận chuyển 2H tại Hasaki | TTT.vn</a>
      </div>
      <div class="content-body">
        <div class="content-left">
          <ul>
            <li><i class="fa-solid fa-user-tag"></i> <a href="#">Tài khoản</a></li>
            <li><i class="fa-solid fa-cart-arrow-down"></i> <a href="#">Đặt hàng</a></li>
            <li><i class="fa-solid fa-box-open"></i> <a href="#">Quy cách đóng gói</a></li>
            <li><i class="fa-solid fa-truck"></i> <a href="#">Vận chuyển 2H</a></li>
            <li><i class="fa-solid fa-hand-holding-dollar"></i> <a href="#">Phí vận chuyển</a></li>
            <li><i class="fa-solid fa-rotate"></i> <a href="#">Đổi trả, hoàn tiền</a></li>
            <li><i class="fa-solid fa-hands-bubbles"></i> <a href="#">Dịch vụ Spa</a></li>
            <li><i class="fa-solid fa-book-atlas"></i> <a href="#">Tuyển dụng</a></li>
          </ul>
          <h3>Thông tin hỗ trợ</h3>
          <ul>
            <li><a href="#">Giới thiệu Hasaki</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="#">Hệ thống cửa hàng Hasaki trên toàn quốc</a></li>
            <li><a href="#">Các Kênh Chính Thức Của Hasaki</a></li>
            <li><a href="#">Hướng dẫn đặt hàng</a></li>
            <li><a href="#">Hướng dẫn đặt hàng 2H</a></li>
            <li><a href="#">Phương thức thanh toán</a></li>
            <li><a href="#">Chính sách vận chuyển giao nhận</a></li>
          </ul>
        </div>
        <div class="content-right">
          <div class="content-right-one">
            <ul>
              <li class="accordion">
                <a href="#">Đăng ký thành viên Hasaki như thế nào?</a>
                <div class="panel">
                  <p>Quý khách vui lòng nhấn vào nút <strong>“Đăng nhập/Đăng ký tài khoản”</strong>
                    trên góc phải màn hình sau đó chọn <strong>“Đăng ký/Đăng ký ngay”</strong> (Đối
                    với Desktop) hoặc tại góc trái màn hình, chọn biểu tượng Menu rồi chọn <strong>“Đăng
                      nhập/Đăng ký”</strong> (Đối với Mobile). Vui lòng điền đầy đủ các thông tin
                    được yêu cầu và nhấn nút <strong>“Đăng ký”</strong>. Hệ thống sẽ tự động gửi
                    email thông báo về việc kích hoạt tài khoản đến tài khoản email cá nhân của quý
                    khách. Quý khách vui lòng click vào đường link để được xác nhận đã tạo tài khoản
                    thành công.</p>
                  <p>Trường hợp không nhận được email kích hoạt, quý khách vui lòng kiểm tra kỹ trong
                    hộp thư rác hoặc Spam hoặc liên hệ trực tiếp qua Hotline <strong>1800
                      6324</strong> để được hỗ trợ.</p>
                </div>

              </li>
              <li class="accordion">
                <a href="#">Tại sao tôi không thể đăng nhập vào tài khoản của tôi?</a>
                <div class="panel">
                  <p>Quý khách vui lòng kiểm tra kỹ về kiểu gõ hoặc phím Caps Lock trong quá trình
                    điền thông tin đăng nhập thành viên, trường hợp không thể đăng nhập thành công
                    quý khách vui lòng chọn nút <strong>“Quên mật khẩu”</strong> trên góc phải màn
                    hình và nhập email hoặc số điện thoại đã đăng ký. Hệ thống sẽ tự động gửi một
                    đường dẫn vào email hoặc SMS của quý khách, quý khách vui lòng nhấp vào đường
                    dẫn để tạo lại mật khẩu mới. Sau khi hoàn tất, quý khách có thể đăng nhập vào
                    tài khoản bằng mật khẩu vừa tạo.</p>
                </div>

              </li>
              <li class="accordion">
                <a href="#">Tôi muốn thay đổi thông tin tài khoản thành viên như thế nào?</a>
                <div class="panel">
                  <p>Để thay đổi thông tin cá nhân quý khách vui lòng đăng nhập vào tài khoản của
                    mình, chọn nút “Tài khoản của bạn” rồi chọn vào nút “sửa” để thay đổi thông
                    tin.</p>
                </div>
              </li>
              <li class="accordion">
                <a href="#">Tại sao tôi không thể đăng nhập vào tài khoản của tôi?</a>
                <div class="panel">
                  <p>Đổi điểm lấy quà theo danh sách quà tặng có sẵn với các mức điểm tương ứng, quà
                    sẽ được tặng kèm đơn hàng tiếp theo. <a href="#">Xem thêm hướng dẫn tại đây</a>
                  </p>
                  <p><a href="#">Đăng ký thành viên Hasaki như thế nào?</a></p>
                </div>

              </li>
            </ul>
          </div>
          <div class="content-right-two">
            <ul>
              <li><a href="#">Tại sao tôi không thể đăng nhập vào tài khoản của tôi?</a></li>
              <li><a href="#">Tôi muốn thay đổi thông tin tài khoản thành viên như thế nào?</a></li>
              <li><a href="#">Tôi có thể sử dụng chung tài khoản với người khác được không?</a></li>
              <li><a href="#">Đăng ký thành viên tại Hasaki.vn sẽ giúp ích gì cho tôi?</a></li>
              <li><a href="#">Hasaki có chương trình ưu đãi nào hấp dẫn dành cho khách hàng thân
                thiết?</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
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
<script>
  const accordions = document.querySelectorAll('.accordion');

  accordions.forEach(accordion => {
    accordion.querySelector('a').addEventListener('click', function (e) {
      e.preventDefault(); // Ngừng việc mở liên kết mặc định

      // Mở hoặc đóng phần nội dung khi nhấn vào thẻ
      accordion.classList.toggle('active');
    });
  });

</script>

</body>

</html>

