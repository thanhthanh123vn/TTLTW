// Hiển thị danh sách người dùng
let userInfs = [];

async function displayUsers() {
    const userBody = document.getElementById("userBody");
    userBody.innerHTML = "";

    try {
        const response = await fetch("http://localhost:8080/WebMyPham__/listUserInf");
        if (!response.ok) throw new Error("Không thể tải danh sách người dùng.");

        userInfs = await response.json();

        const modifiedUsers = userInfs.map((user, index) => ({
            userName: user.userName,
            role: user.role,
            address: user.address,
            imageURL: `<img src="${user.imageURL}" alt="${user.userName}" width="50">`,
            email: user.email,
            phone: user.phone,
            action: `<td style="display: flex; justify-content: space-around; text-align: center;">
                        <button onclick="editUser(${index})">Sửa</button>
                        <button style="margin-left: 10px" onclick="deleteUser(${index})">Xóa</button>
                    </td>`
        }));

        if ($.fn.DataTable.isDataTable('#userTable')) {
            const table = $('#userTable').DataTable();
            table.clear();
            table.rows.add(modifiedUsers).draw();
        } else {
            $('#userTable').DataTable({
                data: modifiedUsers,
                columns: [
                    { data: 'userName' },
                    { data: 'role' },
                    { data: 'address' },
                    { data: 'imageURL' },
                    { data: 'email' },
                    { data: 'phone' },
                    { data: 'action' }
                ]
            });
        }
    } catch (error) {
        console.error("Lỗi:", error);
    }

}

$(document).ready(function () {
    displayUsers();

    $("#list-header").on({
        mouseenter: function () {
            $(this).css("background-color", "lightgray");
        },
        mouseleave: function () {
            $(this).css("background-color", "lightblue");
        },
    });
});

// Hiển thị modal thêm người dùng
function showAddModal() {
    document.getElementById("modalTitle").innerText = "Thêm Người Dùng";
    document.getElementById("userModal").dataset.index = "";
    document.getElementById("userName").value = "";
    document.getElementById("role").value = "";
    document.getElementById("password").value = "";
    document.getElementById("address").value = "";
    document.getElementById("imageURL").value = "";
    document.getElementById("email").value = "";
    document.getElementById("phone").value = "";
    document.getElementById("userModal").style.display = "block";
}

// Hiển thị modal sửa người dùng
function editUser(index) {
    const user = userInfs[index];
    document.getElementById("modalTitle").innerText = "Sửa Người Dùng";
    document.getElementById("userModal").dataset.index = index;
    document.getElementById("userName").value = user.userName;
    document.getElementById("role").value = user.role;
    document.getElementById("address").value = user.address;
    document.getElementById("imageURL").value = user.imageURL;
    document.getElementById("email").value = user.email;
    document.getElementById("phone").value = user.phone;
    document.getElementById("userModal").style.display = "block";
}

// Lưu người dùng (thêm hoặc sửa)
function saveUser() {
    const userName = document.getElementById("userName").value;
    const role = document.getElementById("role").value;
     const password =  document.getElementById("password").value ;
    const address = document.getElementById("address").value;
    const imageURL = document.getElementById("imageURL").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;

    const user = { userName, role,password, address, imageURL, email, phone };
    const index = document.getElementById("userModal").dataset.index;
    const isEdit = index !== undefined && index !== '';
    const url = isEdit ? "http://localhost:8080/WebMyPham__/EditUser?action" : "http://localhost:8080/WebMyPham__/AddUser";

    fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(user)
    })
        .then(response => {
            if (!response.ok) throw new Error("Lỗi khi thêm hoặc sửa người dùng.");
            alert("Người dùng đã được thêm hoặc sửa thành công!");
            if (isEdit) userInfs[index] = user;
            else userInfs.push(user);
            hideModal();
            displayUsers();
        })
        .catch(error => {
            console.error("Lỗi:", error);
            alert("Đã xảy ra lỗi khi thêm hoặc sửa người dùng.");
        });
}

// Xóa người dùng
function deleteUser(index) {
    const user = userInfs[index];
    if (!confirm("Bạn có chắc chắn muốn xóa người dùng này?")) return;

    fetch("http://localhost:8080/WebMyPham__/removeUser", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(user)
    })
        .then(response => {
            if (!response.ok) throw new Error("Lỗi khi xóa người dùng.");
            alert("Người dùng đã bị xóa.");
            userInfs.splice(index, 1);
            displayUsers();
        })
        .catch(error => {
            console.error("Lỗi:", error);
            alert("Đã xảy ra lỗi khi xóa người dùng.");
        });
}

// Tìm kiếm người dùng
async function searchUserInf() {
    const keyword = document.getElementById("search").value;

    try {
        const response = await fetch(`http://localhost:8080/WebMyPham__/searchUserInf?username=${encodeURIComponent(keyword)}`);
        if (!response.ok) throw new Error("Không tìm thấy thông tin người dùng.");

        const searchUserInf = await response.json();

        const modifiedUsers = searchUserInf.map((user, index) => ({
            userName: user.userName,
            role: user.role,
            address: user.address,
            imageURL: `<img src="${user.imageURL}" alt="${user.userName}" width="50">`,
            email: user.email,
            phone: user.phone,
            action: `<td style="display: flex; justify-content: space-around; text-align: center;">
                        <button onclick="editUser(${index})">Sửa</button>
                        <button style="margin-left: 10px" onclick="deleteUser(${index})">Xóa</button>
                    </td>`
        }));

        const table = $('#userTable').DataTable();
        table.clear();
        table.rows.add(modifiedUsers).draw();
    } catch (error) {
        console.error("Lỗi:", error);
    }
}

// Ẩn modal
function hideModal() {
    document.getElementById("userModal").style.display = "none";
    delete document.getElementById("userModal").dataset.index;
}
