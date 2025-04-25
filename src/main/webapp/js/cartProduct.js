function removeProduct(productId, event) {
    if (event) {
        event.preventDefault(); // Chỉ ngăn hành động mặc định nếu có event
    }


    const xhr = new XMLHttpRequest();
    xhr.open("GET", `removeProductFromCart?productId=${productId}`, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                const productElement = document.getElementById(`product-${productId}`);
                if (productElement) {
                    productElement.remove();
                }
            } else {
                alert("Lỗi khi xóa sản phẩm khỏi giỏ hàng.");
            }
        }
    };

    xhr.send();
}
function updateProductQuantity(productId, quantity) {
    quantity = parseInt(quantity); // hoặc Number(quantity)
    if (quantity === 0) {
        console.log("Quantity is 0, calling removeProduct");
        removeProduct(productId);
    } else {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", `UpdateCart?productId=${productId}&quantity=${quantity}`, true);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    console.log("Updated product quantity");
                } else {
                    alert("Lỗi khi cập nhật số lượng sản phẩm trong giỏ hàng.");
                }
            }
        };

        xhr.send();
    }
}

function  checkProductInvaild(){
    const totalPrice = document.querySelector(".totalPrice").value;
    console.log(totalPrice);
    // if(totalPrice){
        window.location.href = `index/payAddress.jsp`;

    // }else {
    //     alert("Bạn chưa mua đơn hàng nào");
    // }


}
