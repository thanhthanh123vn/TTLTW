<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="object.User" %>
<%@ page import="object.Product" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web Mỹ Phẩm</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="css/searchProduct.css">
</head>
<body>
<div id="web-service">
    <jsp:include page="header.jsp"/>


    <div id="session-body">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3>Categories</h3>
                <ul>
                    <li><a>Sức Khỏe - Làm Đẹp</a></li>
                    <li><a>Clinic & Spa</a></li>
                    <li><a>Thương Hiệu</a></li>
                </ul>

                <h3>Khoảng Giá</h3>
                <div class="price-filter">
                    <div class="space-price">
                        <input type="text" placeholder="Từ" id="toPrice">
                        <input type="text" placeholder="Đến" id="fromPrice">
                    </div>
                    <button onclick="searchProdcutToPrice()">Áp Dụng</button>
                </div>
                <h3>Thương Hiệu</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox" value="L'Oreal"
                    >L'Oreal</li>
                    <li><input type="checkbox" class="item-checkbox" value="Klairs">
                        Klairs</li>
                    <li><input type="checkbox" class="item-checkbox" value="CeraVe">
                        CeraVe</li>
                    <li><input type="checkbox" class="item-checkbox" value="La Roche-Posay">
                        La Roche-Posay</li>
                    <li><input type="checkbox" class="item-checkbox" value="Anessa">
                        Anessa</li>
                    <li><input type="checkbox" class="item-checkbox" value="Vichy">
                        Vichy</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Laneige</li>
                </ul>
                <h3>Tình Trạng Tóc</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Tóc
                        Dầu Bết</li>
                    <li><input type="checkbox" class="item-checkbox"> Tóc
                        Rối và Khô</li>
                    <li><input type="checkbox" class="item-checkbox"> Tóc
                        dễ gãy rụng, mỏng và xẹp</li>
                    <li><input type="checkbox" class="item-checkbox"> Tóc
                        khô xơ và hư tổn</li>
                </ul>
                <h3>Dung Tích</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox">
                        Fullsize</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Combo</li>
                    <li><input type="checkbox" class="item-checkbox"> Bộ
                        1 cây</li>
                    <li><input type="checkbox" class="item-checkbox"> Bộ
                        1 cây</li>
                    <li><input type="checkbox" class="item-checkbox">
                        25ml</li>
                    <li><input type="checkbox" class="item-checkbox">
                        100ml</li>
                    <li><input type="checkbox" class="item-checkbox"> 30
                        viên</li>
                    <li><input type="checkbox" class="item-checkbox"> Bộ
                        3 cây</li>
                </ul>
                <h3>TThành phần nổi bật</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox">
                        Chống nắng vật lý lai hoá học</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Niacinamide (Vitamin B3)</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Panthenol (Vitamin B5)</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Hyaluronic Acid</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Glutathione</li>
                    <li><input type="checkbox" class="item-checkbox"> Dầu
                        Argan</li>
                </ul>
                <h3>Loại da</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Da
                        thường/Mọi loại da</li>
                    <li><input type="checkbox" class="item-checkbox"> Da
                        dầu/Hỗn hợp dầu</li>
                    <li><input type="checkbox" class="item-checkbox"> Da
                        nhạy cảm</li>
                    <li><input type="checkbox" class="item-checkbox"> Da
                        khô/Hỗn hợp khô</li>
                    <li><input type="checkbox" class="item-checkbox"> Da
                        mụn</li>
                </ul>
                <h3>Công dụng chính</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox">
                        Dưỡng ẩm và cấp nước</li>
                    <li><input type="checkbox" class="item-checkbox"> Làm
                        sáng và đều màu da</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Kiểm soát dầu</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Nâng tông da</li>
                    <li><input type="checkbox" class="item-checkbox"> Làm
                        dịu da</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Giúp tóc vào nếp suôn mượt</li>
                </ul>
                <h3>Tông màu</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Cam</li>
                    <li><input type="checkbox" class="item-checkbox"> Nâu</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Hồng</li>
                    <li><input type="checkbox" class="item-checkbox"> Đỏ</li>
                </ul>
                <h3>TLoại sản phẩm</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Kem
                        chống nắng</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Serum / Tinh chất</li>
                    <li><input type="checkbox" class="item-checkbox"> Mặt
                        nạ giấy</li>
                    <li><input type="checkbox" class="item-checkbox"> Son
                        kem</li>
                    <li><input type="checkbox" class="item-checkbox"> Sữa
                        rửa mặt</li>
                    <li><input type="checkbox" class="item-checkbox"> Kem
                        dưỡng ẩm</li>
                    <li><input type="checkbox" class="item-checkbox"> Sữa
                        tắm</li>
                </ul>
                <h3>Giới tính</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Nam
                        và Nữ</li>
                    <li><input type="checkbox" class="item-checkbox"> Nữ</li>

                </ul>
                <h3>ĐẶC TÍNH</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox">
                        Chống nắng phổ rộng</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Dạng lì</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Thuần chay (vegan)</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Không paraben</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Lông chải mềm</li>
                    <li><input type="checkbox" class="item-checkbox"> Có
                        mùi hương</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Không màu</li>
                </ul>
                <h3>Xuất xứ thương hiệu</h3>
                <ul>
                    <li><input type="checkbox" class="item-checkbox"> Hàn
                        Quốc</li>
                    <li><input type="checkbox" class="item-checkbox"> Mỹ</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Việt Nam</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Nhật Bản</li>
                    <li><input type="checkbox" class="item-checkbox">
                        Pháp</li>
                    <li><input type="checkbox" class="item-checkbox"> Anh</li>
                    <li><input type="checkbox" class="item-checkbox"> Đức</li>
                </ul>
            </div>
             <div class="product-listing">
                <c:if test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <div class="product redirectToDetails"  data-product-id="${product.id}">
                        <img src="${product.image}" alt="${product.name}">
                        <h4>${product.name}</h4>
                        <div class="vn_names">${product.detail}</div>
                        <p>${product.price}</p>
                        <button class="btn-buy">Buy Now</button>
                    </div>

                </c:forEach>
                </c:if>
                <c:if test="${empty products}">
                    <p>Không tìm thấy sản phẩm</p>
                </c:if>
            </div>
        </div>
    </div>

        <jsp:include page="footer.jsp" />
        </div>



<script>
    function  categorySearch(){

        const searchInput = document.getElementById("searchInput").value;
        console.log(searchInput)
        window.location.href =`danh-muc?name=`+searchInput;


    }

</script>

<%

    // Lấy username từ session
    User user = (User) session.getAttribute("user");



    String username = user.getFullName();
    System.out.println(username + " jahdJSPSEA");



    // Nếu chưa đăng nhập, gán giá trị rỗng
    if (username == null) {
        username = "";
    }
%>



<script src="js/main.js"></script>
<script src="js/searchProduct.js">


</script>
<script src="js/searchBrands.js"></script>
<script src="js/updateUserMain.js">
</script>
<script>


    document.querySelectorAll('.redirectToDetails').forEach(item => {
        item.addEventListener('click', function() {
            var productId = this.getAttribute('data-product-id');
            window.location.href = 'productDetail?id=' + productId;
        });
    });



</script>
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
</script>
<% String searchProducts = (String)request.getAttribute("products");
%>

<script>

    const searchProducts = "<%= searchProducts %>";
</script>







</body>
</html>