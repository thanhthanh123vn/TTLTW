const cart = JSON.parse(topayCartProduct); // Chuyển đổi JSON thành đối tượng JavaScript

    const contentList = document.querySelector("#content-list"); // Lấy thẻ chứa danh sách sản phẩm
if (cart && Array.isArray(cart)) {

    cart.forEach(product => {
        // Tạo HTML cho từng sản phẩm
        const cartItemHTML = `
            <div class="cart-item">
                <div class="product-info">
                    <img src="${product.image}" alt="${product.name}">
                    <div class="product-details">
                        <h3 class="nameProduct">${product.name}</h3>
                        <p class="detailProduct">${product.description}</p>
                        <span class="priceProduct">${product.price} VNĐ</span>
                        <div class="actions">
                            <a href="#">Yêu thích</a> | <a href="#">Hủy Đặt Hàng</a>
                        </div>
                        <div class="promotion">Tặng ngay phần quà khi mua tại cửa hàng còn quà</div>
                        <div class="quantityProduct">Số lượng: ${product.quantity}</div>
                    </div>
                </div>
            </div>
        `;

        // Chèn HTML vào danh sách
        contentList.insertAdjacentHTML('beforeend', cartItemHTML);
    });
}
const  product =  JSON.parse(topayProduct);
if(product){
    const cartItemHTML = `
            <div class="cart-item">
                <div class="product-info">
                    <img src="${product.image}" alt="${product.name}">
                    <div class="product-details">
                        <h3 class="nameProduct">${product.name}</h3>
                        <p class="detailProduct">${product.description}</p>
                        <span class="priceProduct">${product.price} VNĐ</span>
                        <div class="actions">
                            <a href="#">Yêu thích</a> | <a href="#">Hủy Đặt Hàng</a>
                        </div>
                        <div class="promotion">Tặng ngay phần quà khi mua tại cửa hàng còn quà</div>
                        <div class="quantityProduct">Số lượng: ${product.quantity}</div>
                    </div>
                </div>
            </div>
        `;
}


