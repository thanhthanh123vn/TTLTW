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


        console.log(product);


    // Kiểm tra xem phần tử có tồn tại hay không
    if (cartCountElement) {
        // Lấy giá trị hiện tại và chuyển thành số nguyên
        let currentCount = parseInt(cartCountElement.textContent);

        // Kiểm tra nếu currentCount là số, nếu không gán mặc định là 0
        if (isNaN(currentCount)) {
            currentCount = 0;
        }

        // Tăng giá trị lên 1 và cập nhật lại nội dung
        cartCountElement.textContent = currentCount + 1;
        addCart(productCart);


    } else {
        console.log("Không tìm thấy phần tử có class 'cart-count'");
    }
}