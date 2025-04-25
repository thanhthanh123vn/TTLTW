function addCart(product) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "AddCart", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) { // DONE
            if (xhr.status === 200) {
                alert("Sản phẩm đã được thêm vào giỏ hàng thành công!");
            } else {
                alert("Lỗi khi thêm sản phẩm vào giỏ.");
                console.error('Lỗi:', xhr.responseText);
            }
        }
    };

    xhr.send(JSON.stringify(product));
}
