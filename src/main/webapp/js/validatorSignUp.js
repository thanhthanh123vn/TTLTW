/**
 * 
 */
// validator.js
function validateForm() {
    const email = document.getElementById("email");
    const code = document.querySelector(".codeRegister");
    const password = document.getElementById("password");
    const username = document.getElementById("fullname");
    const form = document.getElementsByClassName("form-message");
    let isValid = true;

    // Xác thực email
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email.value)) {
		email.style.border = "1px solid red";
        displayError(email, "Email không hợp lệ");
        isValid = false;
    } else {
        clearError(email);
    }

    // Kiểm tra mã xác thực 6 số
    const codePattern = /^\d{6}$/;
    if (!codePattern.test(code.value)) {
		code.style.border = "1px solid red";
        displayError(code, "Mã xác thực phải là 6 chữ số");
        isValid = false;
    } else {
        clearError(code);
    }

    // Kiểm tra mật khẩu
    if (password.value.length < 6 || password.value.length > 32) {
		password.style.border = "1px solid red";
        displayError(password, "Mật khẩu phải từ 6 đến 32 ký tự");
        isValid = false;
    } else {
        clearError(password);
    }

    // Kiểm tra họ tên
    if (username.value.trim() === "") {
		username.style.border = "1px solid red";
        displayError(username, "Họ tên không được để trống");
        isValid = false;
    } else {
        clearError(username);
    }

    return isValid;
}

function displayError(element, message) {
    const errorElement = element.parentElement.querySelector(".form-message");
    if (errorElement) {
	
        errorElement.textContent = message; // Hiển thị thông báo lỗi
        element.classList.add("is-invalid"); // Thêm class cho input để báo lỗi
    }
}

function clearError(element) {
    const errorElement = element.parentElement.querySelector(".form-message");
    if (errorElement) {
        errorElement.textContent = ""; // Xóa thông báo lỗi
        element.classList.remove("is-invalid"); // Bỏ class báo lỗi
    }
}