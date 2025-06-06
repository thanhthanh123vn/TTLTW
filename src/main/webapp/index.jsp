<%@ page import="object.User" %>
<%@page import="java.io.Console" %>
<%@ page import="java.util.List" %>
<%@ page import="object.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web Mỹ Phẩm</title>


    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    

    <%-- Link đến file CSS giao diện tối --%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dark-theme.css">--%>

</head>
<body class="dark-mode">
<div id="web-service">

    <jsp:include page="header.jsp"/>
    <div id="session-body">
        <div class="container">
            <!-- Sidebar -->
            <div class="banner">
                <div class="banner-top">
                    <img src="https://media.hcdn.vn/hsk/1731489338homedmp1311.jpg" alt="Product Image">
                    <div class="price"><span class="old-price">268K</span> <span class="discount">127K</span></div>

                    <div class="gift">🎁 50K</div>
                </div>
                <div class="banner-top">
                    <img src="https://media.hcdn.vn/hsk/1731299749hasaki-hasaki-sieu-sale-1111-mua-1-tang-1-home-banner-desktop.jpg"
                         alt="Product Image">
                    <div class="price"><span class="old-price">298K</span> <span class="discount">194K</span></div>

                    <div class="gift">🎁 50K</div>
                </div>
                <div class="banner-top">
                    <img src="https://media.hcdn.vn/hsk/1721200384nowfree-3-846x250.jpg" alt="Product Image">
                    <div class="price"><span class="old-price">288K</span> <span class="discount">216K</span></div>

                    <div class="gift">🎁 50K</div>
                </div>
            </div>
            <div class="icons">
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}/index/saleEndMonth.jsp">
                        <img src="https://media.hcdn.vn/hsk/icon/black-friday_2024.png" alt="Black Friday"/>
                        <p>Sale Cuối Tháng</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}/index/ship2H.jsp">
                        <img src="https://media.hcdn.vn/hsk/icon/hsk-icon-nowfree-v2.png" alt="Giao 2H"/>
                        <p>Giao 2H</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}/index/perFume.jsp">
                        <img src="https://media.hcdn.vn/hsk/icon/hsk-icon-perfume-v2.png" alt="Nước Hoa Chính Hãng"/>
                        <p>Nước Hoa Chính Hãng</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}/index/clinic&spa.jsp">
                        <img src="https://media.hcdn.vn/hsk/icon/hasaki-clinic.png" alt="Clinic & S.P.A"/>
                        <p>Clinic & S.P.A</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}/index/clinicDeals.jsp">
                        <img src="https://media.hcdn.vn/hsk/icon/hsk-icon-clinic-deals-v2.png" alt="Clinic Deals"/>
                        <p>Clinic Deals</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}">
                        <img src="https://media.hcdn.vn/hsk/icon/hsk-icon-mua-la-co-qua.png" alt="Mua Là Có Quà"/>
                        <p>Mua Là Có Quà</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}">
                        <img src="https://media.hcdn.vn/hsk/icon/hasaki-dat-hen.png" alt="Đặt hẹn"/>
                        <p>Đặt hẹn</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="${pageContext.request.contextPath}">
                        <img src="https://media.hcdn.vn/hsk/icon/hasaki-cam-nang.png" alt="Cẩm nang"/>
                        <p>Cẩm nang</p>
                    </a>
                </div>
            </div>
            <div class="FlashSale">
                <div class="flash-deals-header">
                    <span>Flash Deals</span>
                    <div class="timer">
                        <span class="timer-day"></span>
                    </div>
                </div>

                <div class="products" id="productSlider">
                    <!-- Các sản phẩm sẽ được chèn vào đây -->

                </div>
                <div class="directPage">
                    <button class="prevCategory prev" style="     border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="prevFlashSaleSlide()">&#10094;
                    </button>
                    <button class="nextCategory next" style="border: 2px;
                            border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="nextFlashSaleSlide()">&#10095;
                    </button>
                </div>
            </div>
            <div class="list-product">
                <div class="list-header">
                    <span>Danh Mục Sản Phẩm</span>
                </div>
                <!-- Lặp qua danh sách các sản phẩm -->
                <div class="products2 category-product" id="category-product">
                    <!-- Danh mục sản phẩm sẽ được tải vào đây -->
                </div>

                <div class="directPage">
                    <button class="prevCategory prev" style="     border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="prevCategorySlide()">&#10094;
                    </button>
                    <button class="nextCategory next" style="    border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="nextCategorySlide()">&#10095;
                    </button>
                </div>
            </div>
            <!-- Form thêm sản phẩm mới -->


            <div class="brand-section">
                <div class="brand-header">
                    <span>Thương hiệu</span>
                </div>
                <div class="brand-list">


                </div>
                <div class="directPage">
                    <button class="prevBrand prev" style=" padding: 10px 12px;     border: 2px;
    border-radius: 2px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="prevBrandSlide()">&#10094;
                    </button>
                    <button class="nextBrand next" style="     border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="nextBrandSlide()">&#10095;
                    </button>
                </div>
            </div>
            <div class="product-carousel">
                <div class="product-carousel-header">Sản phẩm nổi bật</div>
                <div class="product-cards">
                    <div class="product-card">

                    </div>
                </div>

                <div class="directPage">
                    <button class="prevCategory prev" style="     border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="prevHotPSlide()">&#10094;
                    </button>
                    <button class="nextCategory next" style="border: 2px;
    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"
                            onclick="nextHotPSlide()">&#10095;
                    </button>
                </div>
            </div>


            <div class="top-search-section">
                <div class="top-search-header">Top Tìm Kiếm</div>
                <div class="top-search-list">
                    <c:forEach var="topP" items="${topProduct}">
                        <div class="top-search-item" onclick="redirectToDetails('${topP.name}')">
                            <img src="${topP.image}" alt="${topP.name}">
                            <div class="item-info">
                                <p class="item-title">${topP.name}</p>
                                <p class="item-count">${topP.quantity} sản phẩm</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>


            <div class="product-listing">
                <c:forEach var="product" items="${products}">
                    <div class="product" onclick="redirectToProductDetails('${product.id}')">
                        <img src="${product.image}" alt="${product.name}">
                        <h4>${product.name}</h4>
                        <div class="vn_names">${product.detail}</div>
                        <div style="display: flex; justify-content: space-between;">
                            <p>${product.price}</p>
                            <p style="text-decoration: line-through;">300.000đ</p>
                        </div>
                        <button class="btn-buy">Buy Now</button>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${currentPage < totalPages}">
                <div class="load-more-container" style="text-align: center; margin: 20px 0;">
                    <button id="loadMoreBtn" class="load-more-btn" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
                        Xem thêm
                    </button>
                </div>
            </c:if>

            <div class="view-product" style="width: 1200px; margin: 15px 0 0 0; margin-left: auto; margin-right: auto;">
                <div class="view-product-header" style="margin-top: 15px; margin-bottom: 15px;">
                    <span>Sản phẩm đã xem</span>
                </div>
                <div class="view-product-list">
                    <c:if test="${not empty sessionScope.viewedList}">

                        <c:forEach var="product" items="${sessionScope.viewedList}">
                            <div class="item-view-products" onclick="redirectToProductDetails('${product.id}')">
                                <img class="logo" src="${product.image}" alt="${product.name}">

                                </img>

                                <p class="item-name">${product.name}</p>

                            </div>

                        </c:forEach>
                    </c:if>


                </div>
                <%--            <div class="directPage">--%>
                <%--                <button class="prevViewProduct prev" style=" padding: 10px 12px;     border: 2px;--%>
                <%--    border-radius: 2px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"--%>
                <%--                        onclick="prevBrandSlide()">&#10094;--%>
                <%--                </button>--%>
                <%--                <button class="nextViewProduct next" style="     border: 2px;--%>
                <%--    border-radius: 2px;padding: 10px 12px; cursor: pointer; background-color:gray ; border: 2px; border-radius: 2px;"--%>
                <%--                        onclick="nextBrandSlide()">&#10095;--%>
                <%--                </button>--%>
                <%--            </div>--%>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>


    <%--<script>--%>
    <%--    function  categorySearch(){--%>

    <%--        const searchInput = document.getElementById("searchInput").value;--%>
    <%--        console.log(searchInput)--%>
    <%--     window.location.href =`danh-muc?name=`+searchInput;--%>


    <%--    }--%>

    <%--</script>--%>

    <script>
        function categorySearch() {

            const searchInput = document.getElementById("searchInput").value;
            console.log(searchInput)
            window.location.href = `danh-muc?name=` + searchInput;


        }

    </script>


    <script>
        // Lấy phần tử hiển thị thời gian
        var timerDay = document.querySelector('.timer-day');

        // Thời gian kết thúc khuyến mãi (1 ngày từ thời điểm hiện tại)
        var endTime = new Date();
        endTime.setDate(endTime.getDate() + 1); // Thêm 1 ngày

        function updateTimer() {
            var now = new Date();
            var remainingTime = endTime - now;

            if (remainingTime <= 0) {
                timerDay.innerHTML = "Khuyến mãi đã kết thúc!";
                clearInterval(timerInterval); // Dừng cập nhật
                return;
            }

            var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

            timerDay.innerHTML = hours + ":" + minutes + ":" + seconds;
        }

        // Cập nhật thời gian mỗi giây
        var timerInterval = setInterval(updateTimer, 1000);

        // Hiển thị lần đầu
        updateTimer();

    </script>

    <script src="js/main.js"></script>
    <script src="js/searchProduct.js"></script>
    <script src="js/updateUserMain.js"></script>
    <script src="js/displayAllProduct.js"></script>

    <script>
        function redirectToDetails(name) {
            // Chuyển hướng đến Servlet với ID sản phẩm

            window.location.href = `danh-muc?name=` + name
        }

        function redirectToProductDetails(id) {
            // Chuyển hướng đến Servlet với ID sản phẩm

            window.location.href = `productDetail?id=` + id
        }


    </script>
        <script>
            // Initialize pagination variables
            var pagination = {
                currentPage: parseInt('${currentPage}'),
                totalPages: parseInt('${totalPages}')
            };

            // Add click event listener to load more button
            document.getElementById('loadMoreBtn')?.addEventListener('click', function() {
                if (pagination.currentPage < pagination.totalPages) {
                    console.log("Lazy Loadin");
                    pagination.currentPage++;
                    loadMoreProducts();
                }
            });

            // Function to load more products
            function loadMoreProducts() {
                fetch('${pageContext.request.contextPath}/products?page=' + pagination.currentPage)
                    .then(response => response.text())
                    .then(html => {
                        const parser = new DOMParser();
                        const doc = parser.parseFromString(html, 'text/html');
                        const newProducts = doc.querySelector('.product-listing').innerHTML;

                        document.querySelector('.product-listing').innerHTML += newProducts;

                        if (pagination.currentPage >= pagination.totalPages) {
                            document.querySelector('.load-more-container').style.display = 'none';
                        }
                    })
                    .catch(error => console.error('Error loading more products:', error));
            }
        </script>


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
                        window.location.href = "products";
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


        <% String searchProducts = (String) request.getAttribute("products");
%>

    <script>

        const searchProducts = "<%= searchProducts %>";
    </script>



</body>
</html>