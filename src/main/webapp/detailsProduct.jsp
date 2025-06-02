<%@ page import="object.ProductDetail" %>
<%@ page import="object.Product" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="gson.GsonUtil" %>
<%@ page import="object.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nthanh Header</title>
    <link rel="stylesheet" href="app.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detailProduct.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #F2F1F6;
        }


        .font-size {
            font-size: 14px;
        }


         .hover-orange-active {
             border: 2px solid orange;
             border-radius: 5px; /* Thêm độ cong cho viền nếu cần */
             padding: 5px; /* Đảm bảo viền không đè lên nội dung */
         }


    </style>

</head>

<body class="dark-mode">
<div id="web-service">
    <jsp:include page="header.jsp"/>
    <div class="session-body">
        <div class="containers">
            <div class="slection-product">

                <!-- Sidebar -->
                <div id="list-search-alpha">
                    <ul>
                        <li><a href="#">Trang chủ <i class="fa-solid fa-chevron-right"></i> </a></li>
                        <li><a href="#"> Sức Khỏe - Làm Đẹp<i class="fa-solid fa-chevron-right"></i> </a></li>
                        <li><a href="#"> Chăm Sóc Da Mặt <i class="fa-solid fa-chevron-right"> </i></a></li>
                        <li><a href="#"> Làm Sạch Da <i class="fa-solid fa-chevron-right"></i> </a></li>
                        <li><a href="#"> Tẩy Trang Mặt <i class="fa-solid fa-chevron-right"></i> </a></li>
                        <li><a href="#"> Nước Tẩy Trang L'Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp 400ml </a></li>

                    </ul>
                </div>
                <div class="synthetic"> <!--tổng hợp 2 bên-->
                    <div class="product-detail"> <!--bao quanh chi tiết-->
                        <div class="image-product"> <!--chi tiết ảnh bên trái-->
                            <div class="container-image"> <!--list ảnh scroll-->
                                <c:forEach var="image" items="${listImage}">
                                    <div class="image-item">
                                        <img src="${image}" alt="Image" onclick="selectImage(this.src)">
                                    </div>
                                </c:forEach>

                            </div>
                            <img id="display-combobox"
                                 src="${products.image}">
                        </div>
                        <div class="infor-product">
                            <ul>
                                <li>
                                    <a href="#">
                                <span class="color-orange italic-bold">N<i
                                        class="fa-regular fa-circle-check"></i>WFree</span>
                                        <span class="green bold name-product">${products.name}</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="product-title">${products.detail}</a>
                                </li>
                                <li class="special-item"><a href="#">Số công bố với Bộ Y Tế : 71846/18/CBMP-QLD</a></li>
                                <li>
                                    <a href="#" class="price color-orange"><i
                                            class="fa-solid fa-money-check-dollar"></i>${products.price}
                                        ₫</a>
                                    <span class="vat-text">(Đã bao gồm VAT)</span>
                                </li>

                                <li><span class="color-orange">Tặng ngay phần quà khi mua tại cửa hàng còn quà</span>
                                </li>
                                <li class="title">Dung Tich:</li>
                                <ul class="inline-list">
                                    <%
                                        ProductDetail volume = (ProductDetail) request.getAttribute("product");
                                        String[] volumes = volume.getVolume().split(" ");%>

                                    <li><a href="#" class="hover-orange" onclick="hoverOrange()"><%=volumes[0]%>
                                    </a></li>
                                    <li><a href="#" class="hover-orange"  onclick="hoverOrange()"><%=volumes[1]%>
                                    </a></li>
                                    <li><a href="#"  class="hover-orange" onclick="hoverOrange()"><%=volumes[2]%>
                                    </a></li>


                                </ul>
                                <li class="title">Công dụng: <span class="useed"></span></li>
                                <div id="image-used">
                                    <!-- <img src="" alt="Ảnh Công Dụng"> -->
                                </div>
                                <a class="quantity"  >Số lượng :
                                    <input   style="width: 40px; color: #333333;" type="number" value="1" name="quantity" min="1"
                                            style=" width: 30px;">
                                </a>
                                <li>
                                    <a href="#" style="font-size: 16px;">
                                <span class="color-orange italic-bold">N<i
                                        class="fa-regular fa-circle-check font-size"></i>WFree</span>
                                        Giao Nhanh Miễn Phí 2H tại 222 Chi Nhánh: </a>
                                </li>
                                <li style="font-size: 16px;">Bạn muốn nhận hàng trước <span class="color-orange font-size">10h</span> ngày mai.
                                    Đặt hàng
                                    trước
                                    <span class="color-orange font-size">24h</span> và chọn giao hàng <span
                                            class="color-orange font-size">2h</span>
                                    ở
                                    bước
                                    thanh toán.
                                    <a href="#"> Xem chi tiết</a>
                                </li>
                                <ul style="margin: 0;padding: 0;">
                                    <li style="display: flex; gap: 10px; justify-content: space-around; margin-right: 20px;">
                                        <button type="button" class="button-light-green">
                                            <i class="fa-solid fa-location-dot"></i> 224/224 Chi Nhánh Còn sản phẩm
                                        </button>
                                        <button type="button" class="button-dark-green" id="card-product">
                                            <i class="fa-sharp fa-solid fa-cart-shopping"></i> GIỎ HÀNG
                                        </button>


                                        <button type="button" class="button-orange" onclick="payProductDetail(${products.id})">
                                            <span class="size-end" >Mua ngay NowFree 2H</span>
                                        </button>
                                    </li>
                                </ul>
                            </ul>
                        </div>
                    </div>

                    <div class="your-infor">
                        <ul>
                            <li class="green">- MIỄN PHÍ VẬN CHUYỂN -</li>
                            <li>
                                <img class="info-image" src="https://hasaki.vn/images/graphics/delivery-120-minutes.png"
                                     alt="">
                                Giao Nhanh Miễn Phí 2H tại 224 Chi Nhánh.
                                <span class="style-bold">Trễ tặng 100K</span>
                            </li>
                            <li>
                                <img class="info-image" src="https://hasaki.vn/images/graphics/img_quality_3.png"
                                     alt="">
                                Hasaki đền bù <span class="style-bold">100%</span> + hãng đền bù <span
                                    class="style-bold">100%</span>
                                nếu phát hiện hàng giả
                            </li>
                            <li>
                                <img class="info-image" src="https://hasaki.vn/images/graphics/img_quality_2.png"
                                     alt="">
                                <span class="style-bold">Giao Hàng Miễn Phí</span> (từ 90K tại 54 Tỉnh Thành trừ huyện,
                                toàn
                                Quốc từ
                                249K)
                            </li>
                            <li>
                                <img class="info-image" src="https://hasaki.vn/images/graphics/img_quality_2.png"
                                     alt="">
                                Đổi trả trong <span class="style-bold">30 ngày</span>.
                            </li>
                        </ul>
                    </div>
                </div>


                <!-- ==== BẮT ĐẦU ĐOẠN HIỂN THỊ ĐÁNH GIÁ ==== -->
                <div class="review-section">
                    <h3>Đánh giá sản phẩm</h3>
                    
                    <!-- Hiển thị thông báo thành công/lỗi -->
                    <c:if test="${not empty sessionScope.successMsg}">
                        <div class="alert alert-success">
                            ${sessionScope.successMsg}
                            <% session.removeAttribute("successMsg"); %>
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.errorMsg}">
                        <div class="alert alert-danger">
                            ${sessionScope.errorMsg}
                            <% session.removeAttribute("errorMsg"); %>
                        </div>
                    </c:if>

                    <!-- Form đánh giá -->
                    <c:if test="${canReview}">
                        <div class="review-form">
                            <form action="submitReview" method="post">
                                <input type="hidden" name="productId" value="${products.id}" />
                                <div class="rating-select">
                                    <label for="rating">Chọn số sao:</label>
                                    <select name="rating" id="rating" required>
                                        <option value="5">★★★★★ Rất tốt</option>
                                        <option value="4">★★★★☆ Tốt</option>
                                        <option value="3">★★★☆☆ Bình thường</option>
                                        <option value="2">★★☆☆☆ Không tốt</option>
                                        <option value="1">★☆☆☆☆ Rất không tốt</option>
                                    </select>
                                </div>
                                <div class="comment-input">
                                    <textarea name="comment" placeholder="Viết nhận xét của bạn về sản phẩm..." 
                                              rows="3" style="width: 100%;" required></textarea>
                                </div>
                                <button type="submit" class="submit-review">Gửi đánh giá</button>
                            </form>
                        </div>
                    </c:if>

                    <!-- Hiển thị danh sách đánh giá -->
                    <div class="reviews-list">
                        <c:choose>
                            <c:when test="${not empty reviews}">
                                <c:forEach var="review" items="${reviews}">
                                    <div class="review-item">
                                        <div class="review-header">
                                            <div class="review-user">
                                                <i class="fas fa-user-circle"></i>
                                                <span class="username">${review.username}</span>
                                            </div>
                                            <div class="review-stars">
                                                <c:forEach begin="1" end="${review.rating}">
                                                    <i class="fas fa-star" style="color: #ffc107;"></i>
                                                </c:forEach>
                                                <c:forEach begin="${review.rating + 1}" end="5">
                                                    <i class="far fa-star" style="color: #ffc107;"></i>
                                                </c:forEach>
                                            </div>
                                            <div class="review-date">
                                                <i class="far fa-clock"></i>
                                                <f:formatDate value="${review.reviewDate}" pattern="dd/MM/yyyy HH:mm"/>
                                            </div>
                                        </div>
                                        <div class="review-comment">
                                            ${review.comment}
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="no-reviews">Chưa có đánh giá nào cho sản phẩm này.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!-- ==== KẾT THÚC ĐOẠN HIỂN THỊ ĐÁNH GIÁ ==== -->

                <!-- ==== BẮT ĐẦU ĐOẠN HIỂN THỊ COMMENT ==== -->
                <div class="comment-section">
                    <h3>Bình luận sản phẩm</h3>
                    
                    <!-- Form bình luận -->
                    <c:if test="${not empty sessionScope.user}">
                        <div class="comment-form">
                            <form action="submitComment" method="post">
                                <input type="hidden" name="productId" value="${products.id}" />
                                <div class="comment-input">
                                    <textarea name="content" placeholder="Viết bình luận của bạn về sản phẩm..." 
                                              rows="3" style="width: 100%;" required></textarea>
                                </div>
                                <button type="submit" class="submit-comment">Gửi bình luận</button>
                            </form>
                        </div>
                    </c:if>

                    <!-- Hiển thị danh sách bình luận -->
                    <div class="comments-list">
                        <c:choose>
                            <c:when test="${not empty comments}">
                                <c:forEach var="comment" items="${comments}">
                                    <div class="comment-item">
                                        <div class="comment-header">
                                            <div class="comment-user">
                                                <i class="fas fa-user-circle"></i>
                                                <span class="username">${comment.username}</span>
                                            </div>
                                            <div class="comment-date">
                                                <i class="far fa-clock"></i>
                                                ${comment.createdAt}
                                            </div>
                                        </div>
                                        <div class="comment-content">
                                            ${comment.content}
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="no-comments">Chưa có bình luận nào cho sản phẩm này.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!-- ==== KẾT THÚC ĐOẠN HIỂN THỊ COMMENT ==== -->

                <style>
                .review-section {
                    width: 964px;
                    margin: 20px 43px;
                    padding: 20px;
                    background: #fff;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }

                .review-form {
                    margin-bottom: 30px;
                    padding: 20px;
                    background: #f8f9fa;
                    border-radius: 8px;
                }

                .rating-select {
                    margin-bottom: 15px;
                }

                .rating-select select {
                    padding: 8px;
                    border-radius: 4px;
                    border: 1px solid #ddd;
                }

                .comment-input textarea {
                    padding: 10px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    resize: vertical;
                }

                .submit-review {
                    background: #ff6b00;
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background 0.3s;
                }

                .submit-review:hover {
                    background: #e65c00;
                }

                .review-item {
                    border-bottom: 1px solid #eee;
                    padding: 15px 0;
                }

                .review-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                }

                .review-user {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .review-stars {
                    color: #ffc107;
                }

                .review-date {
                    color: #666;
                    font-size: 0.9em;
                }

                .review-comment {
                    color: #333;
                    line-height: 1.5;
                }

                .alert {
                    padding: 15px;
                    margin-bottom: 20px;
                    border-radius: 4px;
                }

                .alert-success {
                    background: #d4edda;
                    color: #155724;
                    border: 1px solid #c3e6cb;
                }

                .alert-danger {
                    background: #f8d7da;
                    color: #721c24;
                    border: 1px solid #f5c6cb;
                }

                .no-reviews {
                    text-align: center;
                    color: #666;
                    font-style: italic;
                }

                .comment-section {
                    width: 964px;
                    margin: 20px 43px;
                    padding: 20px;
                    background: #fff;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }

                .comment-form {
                    margin-bottom: 30px;
                    padding: 20px;
                    background: #f8f9fa;
                    border-radius: 8px;
                }

                .comment-input textarea {
                    padding: 10px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    resize: vertical;
                    margin-bottom: 10px;
                }

                .submit-comment {
                    background: #28a745;
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background 0.3s;
                }

                .submit-comment:hover {
                    background: #218838;
                }

                .comment-item {
                    border-bottom: 1px solid #eee;
                    padding: 15px 0;
                }

                .comment-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                }

                .comment-user {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .comment-date {
                    color: #666;
                    font-size: 0.9em;
                }

                .comment-content {
                    color: #333;
                    line-height: 1.5;
                }

                .no-comments {
                    text-align: center;
                    color: #666;
                    font-style: italic;
                }
                </style>

                <div class="main-infor-detail">
                    <c:choose>
                        <c:when test="${products.name == 'LOreal'}">
                            <jsp:include page="viewShare/index/LOrealViewShare.jsp" />
                        </c:when>
                        <c:when test="${products.name == 'Klairs'}">
                            <jsp:include page="viewShare/index/KlairsViewShare.jsp" />
                        </c:when>
                        <c:when test="${products.name == 'CeraVe'}">
                            <jsp:include page="viewShare/index/CeraVeViewShare.jsp" />
                        </c:when>
                        <c:when test="${products.name == 'Anessa'}">
                            <jsp:include page="viewShare/index/AnessaViewShare.jsp" />
                        </c:when>
                        <c:when test="${products.name == 'La Roche-Posay'}">
                            <jsp:include page="viewShare/index/LaRoche-Posay.jsp" />
                        </c:when>
                        <c:otherwise>
                            <p>Sản phẩm không xác định.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

            <div class="view-product" style="width: 1200px; margin-left: auto; margin-right: auto;">
            <div class="view-product-header">
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

<script src="js/detailProduct.js"></script>
<script src="js/searchProduct.js"></script>
<script src="js/updateUserMain.js"></script>
<script src="js/main.js"></script>
<script src="js/addCartProduct.js"></script>
<%

    // Lấy username từ session
    User user = (User) session.getAttribute("user");

    String username = user.getFullName();


    // Nếu cưa đăng nhập, gán giá trị rỗng
    if (username == null) {
        username = "";
    }
 Product product = (Product) request.getAttribute("products");
    String productJson = new GsonUtil().getGson().toJson(product);
%>
<script>


        function hoverOrange(event) {
        // Xóa lớp 'hover-orange-active' khỏi tất cả các thẻ có class 'hover-orange'
        document.querySelectorAll('.hover-orange').forEach(el => el.classList.remove('hover-orange-active'));

        // Thêm lớp 'hover-orange-active' vào thẻ được click
        event.target.classList.add('hover-orange-active');
    }

function categorySearch() {

const searchInput = document.getElementById("searchInput").value;
console.log(searchInput)
window.location.href = `danh-muc?name=` + searchInput;


}
function payProductDetail(productId) {
window.location.href = "payProduct?productId="+productId;

}
        function  sendComment(){
            const product = <%=productJson%>;
            var id = product.id;
            const comment = document.getElementById("rating_content").value;

            window.location.href = "sendComment?productID=" + id+"&comment="+comment;

        }
        function redirectToProductDetails(id) {
            // Chuyển hướng đến Servlet với ID sản phẩm

            window.location.href = `productDetail?id=` + id
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




<script>
    const  productCart =  <%=productJson%>;


    function selectImage(imageSrc) {
        console.log(imageSrc);
        const displayedImage = document.getElementById('display-combobox');
        displayedImage.src = imageSrc;
        displayedImage.style.display = 'block'; // Hiển thị hình ảnh đã chọn
    }

    var cardProduct = document.getElementById('card-product');
    cardProduct.onclick = function () {
        increaseCartCount()
    }


    function increaseCartCount() {
        // Lấy phần tử có class 'cart-count'
        const cartCountElement = document.querySelector('.cart-count');

        const info = document.querySelector('.infor-product');
        var image = "https://media.hcdn.vn/catalog/product/f/a/facebook-dynamic-205100137-1695896128.png";
        var name = info.querySelector('.name-product')?.textContent.trim() || '';
        var detail = info.querySelector('.product-title')?.textContent.trim() || '';
        var price = info.querySelector('.price')?.textContent.trim() || '';


        var product = <%=productJson%>
            console.log(product);

        const quantityInput = document.querySelector('input[name="quantity"]');
        var quantity = quantityInput.value;


        product.quantity = quantity;
        alert(product.quantity);

        if (cartCountElement) {
            // Lấy giá trị hiện tại và chuyển thành số nguyên
            let currentCount = parseInt(cartCountElement.textContent);

            // Kiểm tra nếu currentCount là số, nếu không gán mặc định là 0
            if (isNaN(currentCount)) {
                currentCount = 0;
            }

            // Tăng giá trị lên 1 và cập nhật lại nội dung
            cartCountElement.textContent = currentCount + 1;
            addCart(product);


        } else {
            console.log("Không tìm thấy phần tử có class 'cart-count'");
        }
    }
</script>

</body>

</html>