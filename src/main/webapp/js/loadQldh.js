function createOrderHTML(product , orderDetail , isPayProduct = false) {
    return `
    <div class="order-card">
      <div class="order-header">
 
        <div>Mã đơn: <strong># ${orderDetail.productID || "DHXXX"}</strong></div>
        <div class="order-status status-shipping">Đang xử lý</div>
      </div>
      <div class="order-item"><img src="${product.image}" alt="${product.name}" style="height:80px;vertical-align:middle;"> <strong>${product.name}</strong></div>
      <div class="order-item">📄 Mô tả: ${product.detail || "Không có mô tả"}</div>
      <div class="order-item">🛒 Số lượng: ${isPayProduct ? (product.count || "N/A") : product.count}</div>
      <div class="order-item">💵 Giá: ${product.price ? product.price + "đ" : "N/A"}</div>
      <div class="btn-group">
        <button class="btn-like" onclick="wishlist(this)">❤️ Yêu thích</button>
       <button class="btn-cancel" onclick="removeOrderProduct('${orderDetail.productID}', event)">❌ Hủy đơn</button>
        <button class="btn-toggle" onclick="toggleDetails(this)">Xem chi tiết</button>
      </div>
      <div class="order-details">
      
        📅 Ngày đặt: ${orderDetail.date || "10/04/2025"}<br>
        💳 Phương thức thanh toán: "COD"<br>
       📍  Địa chỉ: ${orderDetail.address || "Chưa có địa chỉ"}
     
      </div>
    </div>`;
}

function removeOrderProduct(productId, event) {
    event.preventDefault(); // Ngừng hành động mặc định (reload trang)
    fetch(  "cancelOrder?id="+productId)
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.text(); // hoặc .json() nếu trả về JSON
        })
        .then(data => {
            console.log("Dữ liệu từ servlet:", data);
            // xử lý dữ liệu hoặc hiển thị
        })
        .catch(error => {
            console.error("Lỗi khi fetch servlet:", error);
        });


}
function wishlist(productID, event) {
    event.preventDefault();
    var btn = event.target;
    btn.classList.toggle("liked");
    btn.textContent = btn.classList.contains("liked") ? "💖 Đã yêu thích" : "❤️ Yêu thích";

    fetch("wishlist?id=" + productID, {
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

function toggleDetails(button) {
    const details = button.closest('.order-card').querySelector('.order-details');
    const isVisible = details.style.display === "block";
    details.style.display = isVisible ? "none" : "block";
    button.textContent = isVisible ? "Xem chi tiết" : "Ẩn chi tiết";

}

