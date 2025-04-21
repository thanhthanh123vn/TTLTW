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

<body>
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
                                <li class="custom-font-size">
                                    <span class="color-orange">★★★★★ </span>
                                    <a href="#">294 đánh giá</a>
                                    <a href="#">| 955 Hỏi đáp</a>
                                    <a href="#">| Mã sản phẩm: ${product.barcode}</a>
                                </li>
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
                <div class="main-infor-detail">

                    <div class="choose-detail">
                        <ul>
                            <li><a href="#">Thông tin</a></li>
                            <li><a href="#">Thông số</a></li>
                            <li><a href="#">Thành phần</a></li>
                            <li><a href="#">Cách dùng</a></li>
                            <li><a href="#">Đánh giá</a></li>
                            <li><a href="#">Hỏi </a></li>
                        </ul>
                    </div>

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
window.location.href = "http://localhost:8080/WebMyPham__/payProduct?productId="+productId;

}
        function  sendComment(){
            const product = <%=productJson%>;
            var id = product.id;
            const comment = document.getElementById("rating_content").value;

            window.location.href = "http://localhost:8080/WebMyPham__/sendComment?productID=" + id+"&comment="+comment;

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