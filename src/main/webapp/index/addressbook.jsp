<%@ page import="object.User" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn hàng của tôi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressbook.css">
    <link rel="icon" href="${pageContext.request.contextPath}/image/logo.png" type="image/x-icon">
</head>

<body>
<div id="web-service">
   <jsp:include page="${pageContext.request.contextPath}/header.jsp"/>
    <div id="session-body">
        <div class="container">
            <div class="breadcrumb">
                <a href="main.html">Trang chủ ></a>
                <a href="#">Giỏ hàng</a>
            </div>
            <div class="body-left">
                <div class="content-left">
                    <div class="content-icon">
                        <div class="avt">
                            <img src="https://hasaki.vn/images/graphics/account-full.svg">
                        </div>
                        <div class="name">
                            <strong>Chào bạn</strong>

                            <a href="https://hasaki.vn/customer/account/edit/">Chỉnh sửa tài khoản</a>
                        </div>
                    </div>
                    <div class="menu_profile">
                        <a href="http://localhost:8080/WebMyPham__/index/inforUser.jsp" class="item_menu_profile ">Quản lý tài
                            khoản</a>
                        <a href="https://hasaki.vn/user/loyalty/home" class="item_menu_profile ">Hasaki tích
                            điểm</a>
                        <a href="http://localhost:8080/WebMyPham__/index/inforUser.jsp" class="item_menu_profile active">Thông tin tài
                            khoản</a>
                        <a href="http://localhost:8080/WebMyPham__/index/qldonhang.jsp" class="item_menu_profile ">Đơn hàng
                            của tôi</a>
                        <a href="https://hasaki.vn/bookings/history" class="item_menu_profile ">Booking của tôi</a>
                        <a href="http://localhost:8080/WebMyPham__/index/newaddress.jsp" class="item_menu_profile ">Sửa địa chỉ
                            nhận hàng</a>
                        <a href="https://hasaki.vn/wishlist" class="item_menu_profile ">Danh sách yêu thích</a>
                        <a href="https://hasaki.vn/user/repurchase-products" class="item_menu_profile ">Mua lại</a>
                        <a href="https://hasaki.vn/sales/product/question" class="item_menu_profile ">Hỏi đáp</a>
                    </div>
                </div>
            </div>
            <div class="body-right">
                <div class="content-right">
                    <div class="content-box">
                        <h5 class="title-1">Sổ địa chỉ</h5>
                        <div class="box">
                            <h6 class="title-2">Bạn muốn giao hàng đến địa chỉ khác? </h6>
                            <button id="ids" class="btn-1" >Thêm địa chỉ mới</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
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
    // Gán username từ server vào biến JavaScript
    const username = "<%= username %>";
    console.log(username);

    // Kiểm tra trạng thái đăng nhập và gọi hàm loginUser nếu đã đăng nhập
    if (username && username.trim() !== "") {
        loginUser();
    }

    // Đảm bảo xử lý nút đăng xuất
    document.addEventListener("DOMContentLoaded", () => {
        const logoutButtons = document.querySelectorAll(".logout-account");
        logoutButtons.forEach(button => {
            button.addEventListener("click", () => {
                logoutUser();
            });
        });
    });

    // Hàm xử lý đăng xuất
    function logoutUser() {
        console.log("Đăng xuất...");

        // Gửi yêu cầu đến server để xóa session
        fetch("LogoutServlet", {
            method: "POST"
        })
            .then(response => {
                if (response.ok) {
                    console.log("Đăng xuất thành công");
                    // Chuyển hướng người dùng về trang đăng nhập hoặc trang chủ
                    window.location.href = "index.jsp";
                } else {
                    console.error("Lỗi khi đăng xuất");
                }
            })
            .catch(error => console.error("Lỗi kết nối:", error));
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
    document.getElementById("ids").onclick = function () {
        window.location.href = "${pageContext.request.contextPath}/index/newaddress.jsp";
    };


</script>


</body>

</html>