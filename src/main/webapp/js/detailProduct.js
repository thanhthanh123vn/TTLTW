function addCart(product) {



        fetch("AddCart", { // Adjust the URL for product removal
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(product)
        }).then(response => {
            if (response.ok) {
                alert("Sản phẩm đã được thêm vào giỏ hàng thành công!");

            } else {
                alert("Lỗi khi khi thêm  sản phẩm vào giỏ.");
            }
        }).catch(error => {
            console.error("Lỗi:", error);
            alert("Lỗi khi khi thêm  sản phẩm vào giỏ.");
        });

}
