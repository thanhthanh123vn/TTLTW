function createProductHTML(product, isPayProduct = false) {
    return `
                <div class="cart-item">
                    <div class="product-info">
                        <img src="${product.image}" alt="${product.name}">
                        <div class="product-details">
                            <h3 class="nameProduct">${product.name}</h3>
                            <p class="detailProduct">${product.detail || "Không có mô tả"}</p>
                            <span class="priceProduct">${product.price ? product.price + "đ" : "N/A"}</span>
                            <div class="actions">
                              <a   style="cursor: pointer;" onclick="wishlist('${product.id}' ,event)">Yêu thích</a> |

                              <a href="#" onclick="removeOrderProduct('${product.id}', event)">Hủy Đặt Hàng</a>

                            </div>
                            <div class="promotion">Tặng ngay phần quà khi mua tại cửa hàng còn quà</div>
                       <div class="promotion quantityProduct">Số lượng: ${isPayProduct ? (product.quantity || "N/A") : product.count}</div>
                        </div>
                    </div>
                </div>
            `;
}
function removeOrderProduct(productId, event) {
    event.preventDefault(); // Ngừng hành động mặc định (reload trang)
    window.location.href = "http://localhost:8080/WebMyPham__/cancelOrder?id=" + productId;
}
function wishlist(productID,event) {
    fetch("http://localhost:8080/WebMyPham__/wishlist?id=" + productID, {
        method: "POST"
    })
        .then(response => {
            if (response.ok) {
               alert("Yêu cầu đã được xử lý thành công");
            } else {
                alert("Đã xảy ra lỗi khi gửi yêu cầu");
            }
        })
        .catch(error => {
            console.log("Lỗi mạng:", error);
        });
}
