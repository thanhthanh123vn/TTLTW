
const addCart = document.getElementById("card-product");

addCart.onclick =   function addProductCart(product) {
    alert(product);

    var data = {
        action: "add",
        productId: product.id,
        name: product.name,
        detail: product.detail,
        price: product.price,
        quantity: 1,
        image: product.image
    };

    fetch(`cart?action=${encodeURIComponent(data.action)}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    }).then(response => {
        if (response.ok) {
            alert("Đã thêm sản phẩm vào giỏ hàng!");
        } else {
            alert("Lỗi khi thêm sản phẩm.");
        }
    }).catch(error => {
        console.error("Lỗi:", error);
        alert("Đã xảy ra lỗi khi thêm sản phẩm.");
    });
}
