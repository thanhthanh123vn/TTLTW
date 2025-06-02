<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="object.Product" %>
<%@ page import="gson.GsonUtil" %>
<%@ page import="object.cart.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="object.cart.ProductCart" %>
<%@ page import="object.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.OrderDetail" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/8/2025
  Time: 9:03 PM
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/qldonhang.css">
    <link rel="icon" href="../image/logo.png" type="image/x-icon">
    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>




        h2 {
            text-align: center;
            color: #0f172a;
        }

        .order-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .order-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 20px;
            transition: 0.3s ease;
            position: relative;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .order-code {
            font-weight: bold;
            color: #1e293b;
        }

        .order-status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
        }

        .status-delivered { background: #dcfce7; color: #16a34a; }
        .status-shipping { background: #e0f2fe; color: #0284c7; }
        .status-pending { background: #fef9c3; color: #ca8a04; }

        .order-info {
            margin-bottom: 10px;
        }

        .order-info span {
            display: inline-block;
            margin-right: 15px;
        }

        .btn-toggle, .btn-like, .btn-cancel {
            border: none;
            border-radius: 8px;
            padding: 8px 14px;
            margin-right: 10px;
            cursor: pointer;
            font-weight: 500;
        }

        .btn-toggle {
            background: #2563eb;
            color: white;
        }

        .btn-toggle:hover {
            background: #1e40af;
        }

        .btn-like {
            background: #f472b6;
            color: white;
        }

        .btn-like.liked {
            background: #be185d;
        }

        .btn-cancel {
            background: #f87171;
            color: white;
        }

        .btn-cancel:hover {
            background: #b91c1c;
        }

        .order-details {
            display: none;
            background: #f8fafc;
            padding: 10px 15px;
            border-radius: 8px;
            margin-top: 10px;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .total-amount {
            font-weight: bold;
            color: #0f172a;
            margin-top: 5px;
        }

        .btn-group {
            margin-top: 10px;
        }


        .order-card {
            background: #fff;
            border-radius: 12px;
            padding: 16px 24px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            font-family: 'Segoe UI', sans-serif;
            position: relative;
            transition: all 0.3s ease;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 16px;
        }

        .order-status {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .status-shipping {
            background-color: #e0f0ff;
            color: #007bff;
        }

        .order-item {
            margin: 6px 0;
            font-size: 15px;
        }

        .order-item img {
            margin-right: 8px;
            border-radius: 6px;
        }

        .btn-group {
            margin-top: 12px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn-group button {
            padding: 6px 12px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.2s ease-in-out;
        }

        .btn-toggle {
            background-color: #007bff;
            color: #fff;
        }

        .btn-like {
            background-color: #ff69b4;
            color: white;
        }

        .btn-cancel {
            background-color: #f44336;
            color: white;
        }

        .btn-group button:hover {
            opacity: 0.9;
        }

        .order-details {
            display: none;
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }
        .order-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 10px 0;
        }

        .order-desc {
            margin: 8px 0;
            font-size: 15px;
            color: #334155;
        }

        .order-info p {
            margin: 4px 0;
            font-size: 15px;
        }

        .order-details p {
            margin: 4px 0;
            line-height: 1.5;
        }

        .order-header span {
            font-size: 16px;
        }

        .order-status {
            min-width: 100px;
            text-align: center;
        }

        .map-container {
            display: none;
            margin-top: 15px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .map-container.active {
            display: block;
        }

        #map {
            width: 100%;
            height: 300px;
        }

        .track-delivery-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 10px;
        }

        .track-delivery-btn:hover {
            background-color: #45a049;
        }

    </style>


</head>

<body>
<div id="web-service">
    <jsp:include page="../header.jsp"/>

    <h2>Đơn hàng của bạn</h2>
    <div id="productContainer" class="order-container">




  
    </div>



</div>
<jsp:include page="../footer.jsp"/>


<script src="${pageContext.request.contextPath}/js/loadQldh.js"></script>
<script src="${pageContext.request.contextPath}/js/updateUserMain.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/searchProduct.js"></script>
<%
    // Lấy thông tin từ session
    User user = (User) session.getAttribute("user");
    String username = (user != null) ? user.getFullName() : "";

    // Lấy dữ liệu đơn hàng
    object.Order order = (object.Order) session.getAttribute("order");
    List<OrderDetail> orderDetails = (List<OrderDetail>) session.getAttribute("orderDetails");
    List<Product> productsToOrder = (List<Product>) session.getAttribute("productsToOrder");
    String trackingNumber = (String) session.getAttribute("trackingNumber");
    String action = (String) session.getAttribute("action");
    Integer shipFee = (Integer) session.getAttribute("shipFee")!=null ? (Integer) session.getAttribute("shipFee"):0;

    // Chuyển đổi dữ liệu sang JSON
    Gson gson = new GsonUtil().getGson();
    String orderJson = (order != null) ? gson.toJson(order) : "null";
    String orderDetailsJson = (orderDetails != null) ? gson.toJson(orderDetails) : "[]";
    String productsToOrderJson = (productsToOrder != null) ? gson.toJson(productsToOrder) : "[]";
%>

<script>
    // Truyền dữ liệu từ JSP sang JavaScript
    const orderData = {
        order: <%= orderJson %>,
        orderDetails: <%= orderDetailsJson %>,
        productsToOrder: <%= productsToOrderJson %>,
        trackingNumber: "<%= trackingNumber %>",
        action: "<%= action %>",
        shipFee: <%= shipFee%>
    };
</script>

<div id="productContainer" class="order-container">
    <!-- Orders will be loaded here -->
</div>

<script src="${pageContext.request.contextPath}/js/loadQldh.js"></script>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        const productContainer = document.getElementById("productContainer");

        // Kiểm tra dữ liệu đơn hàng
        if (orderData.action === "success" && orderData.productsToOrder.length > 0) {
            // Tạo HTML cho mỗi sản phẩm trong đơn hàng
            orderData.productsToOrder.forEach((product, index) => {
                const orderDetail = orderData.orderDetails[index];
                productContainer.innerHTML += createOrderHTML(product, orderDetail, orderData.trackingNumber,orderData.shipFee);
            });
        } else {
            productContainer.innerHTML = "<p>Không có đơn hàng nào được tìm thấy.</p>";
        }
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
        fetch("LogoutServlet", {
            method: "POST"
        })
            .then(response => {
                if (response.ok) {
                    console.log("Đăng xuất thành công");
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
    function initMap(orderId) {
        // Lấy địa chỉ giao hàng từ orderDetails
        const orderDetails = orderData.orderDetails;
        const orderDetail = orderDetails.find(detail => detail.productID === orderId);

        if (!orderDetail) {
            alert('Không tìm thấy thông tin địa chỉ giao hàng');
            return;
        }

        // Tạo instance geocoder
        const geocoder = new google.maps.Geocoder();
        const address = orderDetail.address;

        // Chuyển đổi địa chỉ thành tọa độ
        geocoder.geocode({ address: address }, (results, status) => {
            if (status === 'OK') {
                const location = results[0].geometry.location;
                const map = new google.maps.Map(
                    document.getElementById(`map-${orderId}-container`),
                    {
                        zoom: 15,
                        center: location,
                        mapTypeControl: true,
                        streetViewControl: true,
                        fullscreenControl: true,
                        zoomControl: true,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
                );

                const marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    title: 'Địa điểm giao hàng',
                    animation: google.maps.Animation.DROP
                });

                const infoWindow = new google.maps.InfoWindow({
                    content: `<div style="padding: 10px;">
                        <h4 style="margin: 0 0 5px 0;">Địa chỉ giao hàng:</h4>
                        <p style="margin: 0;">${address}</p>
                    </div>`
                });

                marker.addListener('click', () => {
                    infoWindow.open(map, marker);
                });
            } else {
                console.error('Không thể tìm thấy địa chỉ trên bản đồ: ' + status);
                alert('Không thể tìm thấy địa chỉ giao hàng trên bản đồ. Vui lòng kiểm tra lại địa chỉ.');
            }
        });
    }
</script>

<script>
    // Khởi tạo bản đồ với OpenStreetMap
    document.addEventListener("DOMContentLoaded", function() {
        if (orderData.orderDetails && orderData.orderDetails.length > 0) {
            const firstOrderDetail = orderData.orderDetails[0];
            const address = firstOrderDetail.address;

            if (address) {
                fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address))
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.length > 0) {
                            const lat = data[0].lat;
                            const lon = data[0].lon;

                            const map = L.map('osm-map').setView([lat, lon], 15);
                            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                attribution: '© OpenStreetMap contributors'
                            }).addTo(map);

                            L.marker([lat, lon]).addTo(map)
                                .bindPopup('Địa điểm giao hàng:<br>' + address)
                                .openPopup();
                        } else {
                            console.log('Không tìm thấy địa chỉ trên bản đồ!');
                        }
                    })
                    .catch(error => console.error('Lỗi khi tìm kiếm địa chỉ:', error));
            }
        }
    });
</script>

</body>
</html>