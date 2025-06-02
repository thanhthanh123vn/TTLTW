function createOrderHTML(product, orderDetail, trackingNumber,shipFee) {
    // Định dạng ngày tháng
    const formatDate = (dateStr) => {
        if (!dateStr) return "Chưa có ngày";
        const date = new Date(dateStr);
        return date.toLocaleDateString('vi-VN');
    };

    // Định dạng tiền tệ
    const formatPrice = (price) => {
        price_Ship = price+shipFee;
        if (!price_Ship) return "Chưa có giá";
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(price_Ship);
    };

    return `
    <div class="order-card">
        <div class="order-header">
            <div>Mã đơn: <strong>#${orderDetail?.productID || "DHXXX"}</strong></div>
            <div class="order-status status-shipping">Đang xử lý</div>
        </div>
        
        <div class="order-info">
            <div class="order-item">
                <img src="${product.image}" alt="${product.name}" style="height:80px;vertical-align:middle;">
                <div class="product-info">
                    <strong>${product.name}</strong>
                    <p class="product-detail">${product.detail || "Không có mô tả"}</p>
                </div>
            </div>
            
            <div class="order-summary">
                <div class="order-item">
                    <span class="icon">🛒</span>
                    <span class="label">Số lượng:</span>
                    <span class="value">${product.quantity || "N/A"}</span>
                </div>
                <div class="order-item">
                    <span class="icon">💵</span>
                    <span class="label">Đơn giá:</span>
                    
                    <span class="value">${formatPrice(product.price)}</span>
                </div>
                <div class="order-item">
                    <span class="icon">💰</span>
                    <span class="label">Thành tiền:</span>
                    <span class="value">${formatPrice(product.price * product.quantity)}</span>
                </div>
            </div>
        </div>

        <div class="btn-group">
            <button class="btn-like" onclick="wishlist('${product.id}', event)">
                ❤️ Yêu thích
            </button>
            <button class="btn-cancel" onclick="removeOrderProduct('${orderDetail?.productID}', event)">
                ❌ Hủy đơn
            </button>
            <button class="btn-toggle" onclick="toggleDetails(this)">
                Xem chi tiết
            </button>
        </div>

        <div class="order-details">
            <div class="detail-item">
                <span class="icon">📅</span>
                <span class="label">Ngày đặt:</span>
                <span class="value">${formatDate(orderDetail?.date)}</span>
            </div>
            <div class="detail-item">
                <span class="icon">💳</span>
                <span class="label">Phương thức thanh toán:</span>
                <span class="value">${orderDetail?.methodPay || "COD"}</span>
            </div>
            <div class="detail-item">
                <span class="icon">📍</span>
                <span class="label">Địa chỉ:</span>
                <span class="value">${orderDetail?.address || "Chưa có địa chỉ"}</span>
            </div>
            ${trackingNumber ? `
            <div class="detail-item">
                <span class="icon">📦</span>
                <span class="label">Mã vận đơn:</span>
                <span class="value">${trackingNumber}</span>
            </div>
            ` : ''}
        </div>
    </div>`;
}

function removeOrderProduct(productId, event) {
    event.preventDefault();
    if (!confirm("Bạn có chắc chắn muốn hủy đơn hàng này?")) {
        return;
    }

    fetch("cancelOrder?id=" + productId)
        .then(response => {
            if (!response.ok) {
                throw new Error("Không thể kết nối đến máy chủ");
            }
            return response.text();
        })
        .then(data => {
            alert("Đã hủy đơn hàng thành công");
            const orderCard = event.target.closest('.order-card');
            orderCard.remove();
        })
        .catch(error => {
            console.error("Lỗi khi hủy đơn hàng:", error);
            alert("Có lỗi xảy ra khi hủy đơn hàng");
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
                alert("Đã thêm vào danh sách yêu thích");
            } else {
                alert("Có lỗi xảy ra khi thêm vào yêu thích");
            }
        })
        .catch(error => {
            console.log("Lỗi mạng:", error);
            alert("Không thể kết nối đến máy chủ");
        });
}

function toggleDetails(button) {
    const details = button.closest('.order-card').querySelector('.order-details');
    const isVisible = details.style.display === "block";
    details.style.display = isVisible ? "none" : "block";
    button.textContent = isVisible ? "Xem chi tiết" : "Ẩn chi tiết";
}