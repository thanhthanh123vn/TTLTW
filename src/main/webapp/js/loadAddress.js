const citySelect = document.getElementById('city');
const districtSelect = document.getElementById('district');
const addressSelect = document.getElementById('address');

// Hàm lấy danh sách tỉnh/thành phố
async function loadProvinces() {
    try {
        const response = await fetch('https://provinces.open-api.vn/api/');
        if (!response.ok) throw new Error('Không thể tải danh sách tỉnh/thành phố');

        const provinces = await response.json();
        citySelect.innerHTML = '<option value="">Chọn tỉnh/thành phố</option>';

        provinces.forEach(province => {
            const option = document.createElement('option');
            option.value = province.code;
            option.textContent = province.name;
            citySelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải tỉnh/thành phố:', error);
        showAlert('Không thể tải danh sách tỉnh/thành phố', 'danger');
    }
}

// Hàm lấy danh sách quận/huyện
async function loadDistricts(provinceCode) {
    try {
        const response = await fetch(`https://provinces.open-api.vn/api/p/${provinceCode}?depth=2`);
        if (!response.ok) throw new Error('Không thể tải danh sách quận/huyện');

        const data = await response.json();
        districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';

        data.districts.forEach(district => {
            const option = document.createElement('option');
            option.value = district.code;
            option.textContent = district.name;
            districtSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải quận/huyện:', error);
        showAlert('Không thể tải danh sách quận/huyện', 'danger');
    }
}

// Hàm lấy danh sách phường/xã
async function loadWards(districtCode) {
    try {
        const response = await fetch(`https://provinces.open-api.vn/api/d/${districtCode}?depth=2`);
        if (!response.ok) throw new Error('Không thể tải danh sách phường/xã');

        const data = await response.json();
        addressSelect.innerHTML = '<option value="">Chọn phường/xã</option>';

        data.wards.forEach(ward => {
            const option = document.createElement('option');
            option.value = ward.code;
            option.textContent = ward.name;
            addressSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Lỗi khi tải phường/xã:', error);
        showAlert('Không thể tải danh sách phường/xã', 'danger');
    }
}

// Event listeners
citySelect.addEventListener('change', function() {
    const selectedProvinceCode = this.value;
    if (selectedProvinceCode) {
        loadDistricts(selectedProvinceCode);
        addressSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    } else {
        districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
        addressSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    }
});

districtSelect.addEventListener('change', function() {
    const selectedDistrictCode = this.value;
    if (selectedDistrictCode) {
        loadWards(selectedDistrictCode);
    } else {
        addressSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    }
});

// Hàm hiển thị thông báo
function showAlert(message, type) {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
    alertDiv.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

    document.querySelector('.container').insertAdjacentElement('afterbegin', alertDiv);

    setTimeout(() => {
        alertDiv.remove();
    }, 3000);
}

// Hàm lấy địa chỉ đầy đủ
function getFullAddress() {
    const province = citySelect.options[citySelect.selectedIndex].text;
    const district = districtSelect.options[districtSelect.selectedIndex].text;
    const ward = addressSelect.options[addressSelect.selectedIndex].text;
    const numberHours = document.getElementById('number-hours').value;

    return {
        province,
        district,
        ward,
        numberHours
    };
}

// Hàm tiếp tục
function continueToNext() {
    const fullname = document.getElementById('fullname').value;
    const phone = document.getElementById('phone').value;
    const address = getFullAddress();

    if (!fullname || !phone || !address.province || !address.district) {
        showAlert('Vui lòng nhập đầy đủ thông tin', 'warning');
        return;
    }

    const addressData = {
        fullname,
        phone,
        address
    };

    localStorage.setItem('address', JSON.stringify(addressData));
    window.location.href = 'deliveryAdd.jsp';
}

// Hàm kiểm tra người dùng
function checkUser() {
    const user = JSON.parse(localStorage.getItem('user'));
    if (!user) {
        window.location.href = 'login.jsp';
    } else {
        window.location.href = 'cartProduct.jsp';
    }
}

// Hàm reset form
function resetForm() {
    window.location.href = 'cartProduct.jsp';
}

// Khởi tạo
document.addEventListener('DOMContentLoaded', () => {
    loadProvinces();

    // Thêm sự kiện cho các nút
    const buttonHome = document.getElementById('buttonhome');
    const buttonCity = document.getElementById('buttonCity');

    if (buttonHome && buttonCity) {
        buttonHome.addEventListener('click', () => {
            buttonHome.classList.add('btn-selected');
            buttonCity.classList.remove('btn-selected');
        });

        buttonCity.addEventListener('click', () => {
            buttonCity.classList.add('btn-selected');
            buttonHome.classList.remove('btn-selected');
        });
    }
});