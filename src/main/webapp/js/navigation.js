const ngaySelect = document.getElementById('date');
const thangSelect = document.getElementById('month');
const namSelect = document.getElementById('year');

// Thêm các tùy chọn ngày
for(let i = 1; i <= 31; i++) {
    let option = document.createElement('option');
    option.value = i;
    option.text = i;
    ngaySelect.appendChild(option);
}

// Thêm các tùy chọn tháng
for(let i = 1; i <= 12; i++) {
    let option = document.createElement('option');
    option.value = i;
    option.text = 'Tháng ' + i;
    thangSelect.appendChild(option);
}

// Thêm các tùy chọn năm
const currentYear = new Date().getFullYear();
for(let i = currentYear; i >= 1900; i--) {
    let option = document.createElement('option');
    option.value = i;
    option.text = i;
    namSelect.appendChild(option);
}

// Chờ DOM hoàn tất tải rồi gán giá trị ngày
document.addEventListener("DOMContentLoaded", function() {
    // Kiểm tra xem dateBTh có phải là chuỗi không
    if (typeof dateBTh === 'string') {
        // Tách chuỗi date thành các thành phần ngày, tháng, năm
        let dateBT = dateBTh.split("-");
        ngaySelect.value = parseInt(dateBT[2]); // Ngày
        thangSelect.value = parseInt(dateBT[1]); // Tháng
        namSelect.value = parseInt(dateBT[0]); // Năm
    } else {
        console.error("dateBTh không phải là một chuỗi");
    }

    // Gán giá trị vào checkbox với id tương ứng 'malle'
    document.getElementById(malle).checked = true;
});
