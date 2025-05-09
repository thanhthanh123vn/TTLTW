function validatePhone(phone) {
    // Kiểm tra số điện thoại Việt Nam (bắt đầu bằng 0 và có 10 số)
    const phoneRegex = /^0[0-9]{9}$/;
    return phoneRegex.test(phone);
}

function showPhoneError(message) {
    const phoneInput = document.getElementById("phone");
    const formMessage = phoneInput.nextElementSibling;
    formMessage.textContent = message;
    formMessage.style.color = "red";
    phoneInput.style.borderColor = "red";
}

function clearPhoneError() {
    const phoneInput = document.getElementById("phone");
    const formMessage = phoneInput.nextElementSibling;
    formMessage.textContent = "";
    phoneInput.style.borderColor = "";
}

function addAddressUser() {
    const fullName = document.getElementById("fullname").value;
    const phone = document.getElementById("phone").value;
    const city = document.getElementById("city").value;
    const district = document.getElementById("district").value;
    const address = document.getElementById("address").value;
    const number_hours = document.getElementById("number-hours").value;


    clearPhoneError(); // Clear any previous error
    if (!validatePhone(phone)) {
        showPhoneError("Số điện thoại không hợp lệ!");
        return;
    }

    var UserAddress = {
        userName: fullName,
        phone: phone,
        address: number_hours + " , " + address + " , " + district + " , " + city
    };

    if (fullName && phone && city && district && address) {
        fetch("http://localhost:8080/WebMyPham__/AddAddressUser", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(UserAddress)
        }).then(response => {
            if (response.ok) {
                alert("Địa chỉ người dùng đã được thêm thành công!");
                window.location.href = "http://localhost:8080/WebMyPham__/AddAddressUser";
            } else {
                response.text().then(text => {
                    console.error("Lỗi:", response.status, text);
                    alert("Lỗi khi thêm địa chỉ người dùng: " + text);
                });
            }
        }).catch(error => {
            console.error("Lỗi:", error);
            alert("Lỗi khi thêm địa chỉ người dùng.");
        });
    } else {
        alert("Vui lòng nhập đầy đủ thông tin");
    }
}
