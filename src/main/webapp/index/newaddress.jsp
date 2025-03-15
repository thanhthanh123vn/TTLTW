<%@ page import="object.User" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 10:07 PM
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
    <link rel="icon" href="${pageContext.request.contextPath}/image/logo.png" type="image/x-icon">
    <link rel="stylesheet" href=${pageContext.request.contextPath}/css/newaddress.css">


</head>

<body>
<div id="web-service">
  <jsp:include page="${pageContext.request.contextPath}/header.jsp"/>
    <div id="session-body">
        <div class="container">
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
                        <a href="qliUser.html" class="item_menu_profile active">Quản lý tài
                            khoản</a>
                        <a href="accumulationOfP.html" class="item_menu_profile ">TTT tích
                            điểm</a>
                        <a href="inforUser.html" class="item_menu_profile ">Thông tin tài
                            khoản</a>
                        <a href="qldonhang.html" class="item_menu_profile ">Đơn hàng
                            của tôi</a>
                        <a href="myBooking.html" class="item_menu_profile ">Booking của tôi</a>
                        <a href="#" class="item_menu_profile ">Sổ địa chỉ
                            nhận hàng</a>
                        <a href="spyt.html" class="item_menu_profile ">Danh sách yêu thích</a>
                        <a href="redeemProduct.html" class="item_menu_profile ">Mua lại</a>
                        <a href="q&a.html" class="item_menu_profile ">Hỏi đáp</a>
                    </div>
                </div>
            </div>
            <div class="body-right">
                <div class="content-right">
                    <div class="content-box">
                        <div class="content-title">
                            <h5 class="dsyt">Danh sách yêu thích</h5>
                        </div>
                    </div>
                    <div class="colums">
                        <div class="col-left">
                            <form action="" method="post" class="form" id="">
                                <div class="form-group">
                                    <label for="fullname" class="form-label">Tên</label>
                                    <input type="text" name="name" id="name" rules="required" placeholder="Nhập họ tên" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="text" name="phone" id="phone" relus="required" placeholder="Nhập số điện thoại" class="form-control">
                                </div>
                            </form>
                        </div>
                        <div class="col-right">
                            <div class="row-label">
                                <form class="form-group">
                                    <label for="tinh-thanh" class="form-label1">Tỉnh/Thành phố</label>
                                    <div class="box-1 province_box"><select id="province" class="form-control">
                                        <option value="0">Vui lòng chọn tỉnh/ thành phố</option>
                                        <option value="512">Hồ Chí Minh</option><option value="513">Hà Nội</option><option value="641">Đồng Nai</option><option value="633">Bình Dương</option><option value="626">Bà Rịa Vũng Tàu</option><option value="624">Cần Thơ</option><option value="655">Kiên Giang</option><option value="680">Tiền Giang</option><option value="514">Đà Nẵng</option><option value="638">Đắk Lắk</option><option value="631">Bến Tre</option><option value="679">Thừa Thiên Huế</option><option value="681">Trà Vinh</option><option value="654">Khánh Hòa</option><option value="642">Đồng Tháp</option><option value="629">Bạc Liêu</option><option value="625">An Giang</option><option value="658">Lâm Đồng</option><option value="635">Bình Thuận</option><option value="683">Vĩnh Long</option><option value="661">Long An</option><option value="675">Tây Ninh</option><option value="636">Cà Mau</option><option value="643">Gia Lai</option><option value="649">Hải Phòng</option><option value="634">Bình Phước</option><option value="663">Nghệ An</option><option value="632">Bình Định</option><option value="678">Thanh Hóa</option><option value="665">Ninh Thuận</option><option value="670">Quảng Ngãi</option><option value="667">Phú Yên</option><option value="677">Thái Nguyên</option><option value="673">Sóc Trăng</option><option value="630">Bắc Ninh</option><option value="669">Quảng Nam</option><option value="656">Kon Tum</option><option value="647">Hà Tĩnh</option><option value="650">Hậu Giang</option><option value="672">Quảng Trị</option><option value="639">Đắk Nông</option><option value="668">Quảng Bình</option></select>
                                    </div>
                                    <label for="tinh-thanh" class="form-label1">Quận/ Huyện</label>
                                    <div class="box-1 district_box"><select id="district" class="form-control">
                                        <option value="0">Vui lòng chọn quận/huyện</option>

                                    </select>
                                    </div>
                                    <label for="tinh-thanh" class="form-label1">Phường/ Xã</label>
                                    <div class="box-1 district_box"><select id="district" class="form-control">
                                        <option value="0">Vui lòng chọn phường/xã</option>
                                    </select>
                                    </div>
                                </form>
                                <form class="form-group">
                                    <label for="address" class="form-label1">Địa chỉ nhận hàng</label>
                                    <input type="text" name="address" id="address" relus="required" placeholder="Số nhà + tên đường" class="form-control">
                                </form>
                                <div class="btn-icon">
                                    <button class="btn-1" id="cancel">Hủy</button>
                                    <button class="btn-2">Cập nhật</button>
                                </div>
                            </div>
                        </div>
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
    document.getElementById("cancel").onclick = function () {
        window.location.href = "addressbook.jsp";
    };
</script>
</body>

</html>