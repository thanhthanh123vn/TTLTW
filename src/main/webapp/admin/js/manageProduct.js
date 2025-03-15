// Declare products array to hold the data
var products = [];
var table;

// Fetch and display the products
async function displayProducts() {
    const productBody = document.getElementById("productBody");
    productBody.innerHTML = "";
    try {
        const response = await fetch(`http://localhost:8080/WebMyPham__/listProducts`); // Adjust URL to your backend endpoint
        if (!response.ok) {
            throw new Error("Không thể tải danh sách sản phẩm.");
        }
        const productData = await response.json();
        products = productData; // Assign data to products

        const modifiedProduct = products.map((eachProduct, index) => ({
            id:eachProduct.id,
            name: eachProduct.name,
            category_id: eachProduct.category_id,
            price: eachProduct.price.toString() + "đ",
            quantity: eachProduct.quantity,
            detail: eachProduct.detail,
            image: `<img src="${eachProduct.image}" alt="${eachProduct.name}" width="50">`,
            action: `<div style="display: flex; justify-content: space-around; text-align: center;">
                        <button onClick="editProduct(${index})">Sửa</button>
                        <button style="margin-left:10px;" onClick="deleteProduct(${index})">Xóa</button>
                     </div>`
        }));

        // Initialize or refresh DataTable
        if ($.fn.DataTable.isDataTable('#productTables')) {
            table.clear();
            table.rows.add(modifiedProduct).draw(); // Add new data and redraw table
        } else {
            table = $('#productTables').DataTable({
                data: modifiedProduct,
                columns: [
                    {data: 'id'},
                    { data: 'name' },
                    { data: 'category_id' },
                    { data: 'price' },
                    { data: 'quantity' },
                    { data: 'detail' },
                    { data: 'image' },
                    { data: 'action' }
                ],
                destroy: true
            });
        }
    } catch (error) {
        console.error("Lỗi:", error);
        alert("Không thể tải danh sách sản phẩm.");
    }
}

// Show Add Product Modal
function showAddProductModal() {
    document.getElementById("modalTitle").innerText = "Thêm Sản Phẩm";
    resetModalFields();
    document.getElementById("productModal").style.display = "block";
}

// Show Edit Product Modal
function editProduct(index) {
    const product = products[index];
    document.getElementById("modalTitle").innerText = "Sửa Sản Phẩm";
    document.getElementById("id").value = product.id;
    document.getElementById("productName").value = product.name;
    document.getElementById("imageURL").value = product.image;
    document.getElementById("price").value = product.price;
    document.getElementById("description").value = product.detail;
    document.getElementById("category").value = product.category_id;
    document.getElementById("stock").value = product.quantity;
    document.getElementById("productModal").style.display = "block";

    // Store the index for later use
    document.getElementById("productModal").dataset.index = index;
}

// Save Product (Add or Edit)
function saveProduct() {
    const id = document.getElementById("id").value;
    const name = document.getElementById("productName").value;
    const image = document.getElementById("imageURL").value;
    const price = parseFloat(document.getElementById("price").value);
    const description = document.getElementById("description").value;
    const stock = parseInt(document.getElementById("stock").value);
    const category = parseInt(document.getElementById("category").value);

    const product = { id,name, image, price, detail: description, quantity: stock, category_id: category };

    const index = document.getElementById("productModal").dataset.index;
    const url = index !== undefined ? "http://localhost:8080/WebMyPham__/EditProduct" : "http://localhost:8080/WebMyPham__/AddProduct";

    fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(product)
    }).then(response => {
        if (!response.ok) {
            return response.text().then(text => { throw new Error(text); });
        }
        alert("Sản phẩm đã được thêm hoặc sửa thành công!");
        displayProducts(); // Refresh products after saving
    }).catch(error => {
        console.error("Lỗi:", error);
        alert("Đã xảy ra lỗi khi thêm hoặc sửa sản phẩm: " + error.message);
    }).finally(() => {
        hideModal();
    });
}

// Delete Product
function deleteProduct(index) {
    if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
        const product = products[index];
        fetch("http://localhost:8080/WebMyPham__/removeProduct", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(product)
        }).then(response => {
            if (!response.ok) {
                throw new Error("Lỗi khi xóa sản phẩm.");
            }
            alert("Sản phẩm đã được xóa thành công!");
            displayProducts();
        }).catch(error => {
            console.error("Lỗi:", error);
            alert("Đã xảy ra lỗi khi xóa sản phẩm.");
        });
    }
}

// Reset Modal Fields
function resetModalFields() {
    document.getElementById("id").value = "";
    document.getElementById("productName").value = "";
    document.getElementById("imageURL").value = "";
    document.getElementById("price").value = "";
    document.getElementById("description").value = "";
    document.getElementById("category").value = "";
    document.getElementById("stock").value = "";
    delete document.getElementById("productModal").dataset.index;
}

// Hide Modal
function hideModal() {
    document.getElementById("productModal").style.display = "none";
    resetModalFields();
}

// Initialize on Page Load
$(document).ready(function () {
    displayProducts();

    $("#list-header").on({
        mouseenter: function () {
            $(this).css("background-color", "lightgray");
        },
        mouseleave: function () {
            $(this).css("background-color", "lightblue");
        },
    });
});
// Thêm một hàng mới vào bảng
function addUserRow() {
    const tableBody = document.getElementById("userTable").querySelector("tbody");
    const newRow = tableBody.insertRow();

    newRow.innerHTML = `
        <td><input type="text" name="id" placeholder="Nhập Tên"></td>
        <td><input type="text" name="name" placeholder="Nhập Mã danh mục"></td>
        <td><input type="email" name="email" placeholder="Nhập giá"></td>
        <td><input type="text" name="phone" placeholder="Nhập Tồn kho:"></td>
         <td><input type="text" name="phone" placeholder="Nhập Mô tả:"></td>
        <td><input type="text" name="phone" placeholder="Nhập URL ảnh:"></td>
        <td><button onclick="deleteUserRow(this)">Xóa</button></td>
    `;
}

// Xóa một hàng
function deleteUserRow(button) {
    const row = button.parentElement.parentElement;
    row.remove();
}

// Lưu tất cả người dùng
function saveUsers() {
    const tableBody = document.getElementById("userTable").querySelector("tbody");
    const rows = tableBody.querySelectorAll("tr");

    const users = [];
    rows.forEach((row) => {
        const id = row.querySelector('input[name="id"]').value.trim();
        const name = row.querySelector('input[name="name"]').value.trim();
        const email = row.querySelector('input[name="email"]').value.trim();
        const phone = row.querySelector('input[name="phone"]').value.trim();

        if (id && name && email && phone) {
            users.push({ id, name, email, phone });
        }
    });

    if (users.length === 0) {
        alert("Không có dữ liệu hợp lệ để lưu!");
        return;
    }

    console.log("Danh sách người dùng được lưu:", users);

    //Gửi danh sách người dùng đến server (nếu cần)
    fetch('/save-users', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(users),
    }).then(response => response.json())
      .then(data => alert("Lưu thành công!"))
      .catch(err => alert("Lỗi khi lưu người dùng: " + err));

    alert("Lưu thành công!");
    tableBody.innerHTML = ""; // Xóa bảng sau khi lưu
}
