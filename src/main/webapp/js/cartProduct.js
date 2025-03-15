async function removeProduct(productId) {
    // Gọi đến backend để xóa sản phẩm
    const response = await fetch(`removeProductFromCart?productId=${productId}`, {
        method: 'GET'
    });

    if (response.ok) {
        // Cập nhật giao diện sau khi xóa sản phẩm thành công
        document.location.reload(true);
    } else {
        alert("Lỗi khi xóa sản phẩm khỏi giỏ hàng.");
    }
}


async function updateProductQuantity(productId, quantity) {
    const response = await fetch(`UpdateCart?productId=${productId}&quantity=${quantity}`, {
        method: 'GET'
    });

    if (response.ok) {
        // Cập nhật giao diện sau khi cập nhật số lượng sản phẩm thành công
        document.location.reload(true);
    } else {
        alert("Lỗi khi cập nhật số lượng sản phẩm trong giỏ hàng.");
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
