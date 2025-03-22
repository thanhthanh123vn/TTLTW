/**
 * 
 */
// validator.js

let attemptCount = 0;
const maxAttempts = 5;
const lockTime = 60000; // 1 phút
document.addEventListener("DOMContentLoaded", function () {
    let codeInput = document.getElementById("codeInput");
    if (codeInput) {
        codeInput.addEventListener("blur", verifyCode);
    }
});
async function verifyCode() {
    console.log("Sự kiện onblur đã chạy!");
    let codeInput = document.getElementById("codeInput");
    let button = document.getElementById("verifyUserName");
    let message = document.querySelector(".form-message");

    if (codeInput.value.length !== 6) {
        message.innerText = "Mã xác thực phải có 6 số!";
        return;
    }

    try {
        let response = await fetch("http://localhost:8080/WebMyPham__/verycode?code=" + codeInput.value);
        let result = await response.json();

        if (result.status === "success") {
            message.innerText = "Mã xác thực đúng!";
        } else {
            attemptCount++;
            message.innerText = "Mã xác thực sai!";

            if (attemptCount >= maxAttempts) {
                codeInput.disabled = true;
                button.disabled = true;
                message.innerText = "Bạn đã nhập quá số lần cho phép! Vui lòng thử lại sau 1 phút.";

                setTimeout(() => {
                    attemptCount = 0;
                    codeInput.disabled = false;
                    button.disabled = false;
                    message.innerText = "";
                }, lockTime);
            }
        }
    } catch (error) {
        console.error("Lỗi khi xác thực mã:", error);
        message.innerText = "Lỗi kết nối đến server!";
    }
}


function getCode() {
    alert("Mã xác thực đã được gửi!");
}
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