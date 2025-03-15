let promotions = []; // Biến chứa danh sách promotions

// Hiển thị danh sách promotions
async function displayPromotions() {
    const promotionsBody = document.getElementById("promotionsBody");
    promotionsBody.innerHTML = "";  // Clear previous data


        const response = await fetch("http://localhost:8080/WebMyPham__/lProducts");
        if (!response.ok) throw new Error("Không thể tải danh sách promotions.");

        promotions = await response.json();  // Cập nhật danh sách promotions

        const modifiedPromotions = promotions.map((promotion, index) => ({
            productId: promotion.productId,
            name: promotion.name,
            discountPercentage: promotion.discountPercentage,
            startDate: promotion.startDate || 'N/A',  // Xử lý ngày tháng không hợp lệ
            endDate: promotion.endDate || 'N/A',      // Xử lý ngày tháng không hợp lệ
            action: `<td style="display: flex; justify-content: space-around; text-align: center;">
                        <button onclick="editPromotion(${index})">Sửa</button>
                        <button style="margin-left: 10px" onclick="deletePromotion(${index})">Xóa</button>
                    </td>`
        }));

        // Kiểm tra nếu DataTable đã được khởi tạo
        if ($.fn.DataTable.isDataTable('#userTable')) {
            const table = $('#userTable').DataTable();
            table.clear();
            table.rows.add(modifiedPromotions).draw();
        } else {
            // Khởi tạo DataTable nếu chưa
            $('#userTable').DataTable({
                data: modifiedPromotions,
                columns: [
                    { data: 'productId' },
                    { data: 'name' },
                    { data: 'discountPercentage' },
                    { data: 'startDate' },
                    { data: 'endDate' },
                    { data: 'action' }
                ]
            });
        }

}

// Hiển thị modal thêm promotion
function showAddPromotionModal() {
    document.getElementById("modalTitle").innerText = "Thêm Promotion";
    document.getElementById("promotionsModal").dataset.index = "";
    document.getElementById("userName").value = "";
    document.getElementById("role").value = "";
    document.getElementById("password").value = "";
    document.getElementById("address").value = "";
    document.getElementById("imageURL").value = "";
    document.getElementById("promotionsModal").style.display = "block";
}

// Chỉnh sửa promotion
function editPromotion(index) {
    const promotion = promotions[index];
    document.getElementById("modalTitle").innerText = "Sửa Promotion";
    document.getElementById("promotionsModal").dataset.index = index;
    document.getElementById("userName").value = promotion.productId;
    document.getElementById("role").value = promotion.name;
    document.getElementById("password").value = promotion.discountPercentage;
    document.getElementById("address").value = promotion.startDate;
    document.getElementById("imageURL").value = promotion.endDate;
    document.getElementById("promotionsModal").style.display = "block";
}

// Lưu promotion (thêm hoặc sửa)
function savePromotion() {
    const productId = document.getElementById("userName").value;
    const name = document.getElementById("role").value;
    const discountPercentage = document.getElementById("password").value;
    const startDate = document.getElementById("address").value;
    const endDate = document.getElementById("imageURL").value;

    if (!startDate || !endDate) {
        alert("Vui lòng nhập đầy đủ ngày bắt đầu và ngày kết thúc.");
        return;
    }

    const promotion = { productId, name, discountPercentage, startDate, endDate };
    const index = document.getElementById("promotionsModal").dataset.index;
    const isEdit = index !== undefined && index !== '';
    const url = isEdit
        ? "http://localhost:8080/WebMyPham__/EditPromotion"
        : "http://localhost:8080/WebMyPham__/AddPromotion";

    fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(promotion)
    })
        .then(response => {
            if (!response.ok) throw new Error("Lỗi khi thêm hoặc sửa promotion.");
            alert("Promotion đã được thêm hoặc sửa thành công!");
            if (isEdit) promotions[index] = promotion;
            else promotions.push(promotion);
            hideModal();
            displayPromotions();
        })
        .catch(error => {
            console.error("Lỗi:", error);
            alert("Đã xảy ra lỗi khi thêm hoặc sửa promotion.");
        });
}

// Xóa promotion
function deletePromotion(index) {
    const promotion = promotions[index];
    if (!confirm("Bạn có chắc chắn muốn xóa promotion này?")) return;

    fetch("http://localhost:8080/WebMyPham__/removePromotion", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(promotion)
    })
        .then(response => {
            if (!response.ok) throw new Error("Lỗi khi xóa promotion.");
            alert("Promotion đã bị xóa.");
            promotions.splice(index, 1);
            displayPromotions();
        })
        .catch(error => {
            console.error("Lỗi:", error);
            alert("Đã xảy ra lỗi khi xóa promotion.");
        });
}

// Ẩn modal
function hideModal() {
    document.getElementById("promotionsModal").style.display = "none";
    delete document.getElementById("promotionsModal").dataset.index;
}

$(document).ready(function () {
    displayPromotions();
});
