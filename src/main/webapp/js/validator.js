/**
 * 
 */// xác nhận thông tin 
function Validator(formSelector, option) {
    // xác nhận có onSubmit() hay không 
    if (!option) {
        option = {};
    }
    
    // lấy phần tử cha của element 
    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }
    
    // chứa các rule fullname và email 
    var formRules = {
        fullname: 'required',
        email: 'required|email',
        password: 'required|min:6',
        'confirm-password': 'required|min:6|match:password',
    };
    
    var validatorRules = {
        required: function (value) {
            return value ? undefined : 'Vui lòng nhập trường này';
        },
        email: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : 'Vui lòng nhập email';
        },
        min: function (min) {
            return function (value) {
                return value.length >= min ? undefined : `Vui lòng nhập ít nhất ${min} kí tự`;
            };
        },
        max: function (max) {
            return function (value) {
                return value.length <= max ? undefined : `Vui lòng nhập tối đa ${max} kí tự`;
            };
        },
        match: function (matchField) {
            return function (value) {
                const matchValue = document.querySelector(`[name=${matchField}]`).value;
                return value === matchValue ? undefined : 'Mật khẩu không khớp';
            };
        }
    };

    var formElement = document.querySelector(formSelector);
    
    if (formElement) {
        var inputs = formElement.querySelectorAll('[name][rules]');
        var isSubmitting = false;

        for (var input of inputs) {
            var rules = input.getAttribute('rules').split('|');
            for (var rule of rules) {
                var isRuleHasValue = rule.includes(':');
                var ruleFunc;

                if (isRuleHasValue) {
                    var ruleInfo = rule.split(':');
                    rule = ruleInfo[0];
                    ruleFunc = validatorRules[rule](ruleInfo[1]);
                } else {
                    ruleFunc = validatorRules[rule];
                }

                if (Array.isArray(formRules[input.name])) {
                    formRules[input.name].push(ruleFunc);
                } else {
                    formRules[input.name] = [ruleFunc];
                }
            }
            input.onblur = handleValidate;
            input.oninput = handleClearError;
        }

        function handleValidate(event) {
            var rules = formRules[event.target.name];
            var errorMessage;
            rules.find(function (rule) {
                errorMessage = rule(event.target.value);
                return errorMessage;
            });

            if (errorMessage) {
                var formGroup = getParent(event.target, '.form-group');
                if (formGroup) {
                    var formMessage = formGroup.querySelector('.form-message');
                    formGroup.classList.add('invalid');
                    if (formMessage) {
                        formMessage.innerText = errorMessage;
                    }
                }
            }
            return !errorMessage;
        }

        function handleClearError(event) {
            var formGroup = getParent(event.target, '.form-group');
            if (formGroup.classList.contains('invalid')) {
                formGroup.classList.remove('invalid');
                var formMessage = formGroup.querySelector('.form-message');
                if (formMessage) {
                    formMessage.innerText = '';
                }
            }
        }

        formElement.onsubmit = function (event) {
            event.preventDefault();

            if (isSubmitting) return; // Ngăn không cho nhấn submit nhiều lần
            isSubmitting = true; // Đánh dấu là đang submit

            var inputs = formElement.querySelectorAll('[name][rules]');
            var isValid = true;
            for (var input of inputs) {
                if (!handleValidate({ target: input })) {
                    isValid = false;
                }
            }

            if (isValid) {
                if (typeof option.onSubmit === 'function') {
                    event.preventDefault(); // Ngăn gửi form để lưu dữ liệu trước
                    const tagData = document.getElementById("fullname").value;    
                    localStorage.setItem("tagData", tagData);
        
                 
                    option.onSubmit();
                }
            }

            isSubmitting = false; // Đánh dấu là đã hoàn tất submit
        }
    }
}
let tagData;
function saveData() {
    // Lấy nội dung của tag dựa vào id hoặc tên thẻ (tag name)
     tagData = document.getElementById("fullname").innerText;
    // Lưu vào localStorage hoặc sessionStorage

    

    localStorage.setItem("tagData", tagData);
    alert("Dữ liệu đã được lưu!");
}

function loadData() {

    const loginHoverDiv = document.querySelector(".login-hover");

    if (loginHoverDiv) {
        // Tạo khối .account-menu
        const accountMenuDiv = document.createElement("div");
        accountMenuDiv.classList.add("account-menu");

        // Tạo nút button "Chào Nguyễn Văn ▼"
        const accountButton = document.createElement("button");
        accountButton.classList.add("account-button");
        accountButton.textContent = "Chào "+tagData;
        
        // Tạo khối .dropdown-content
        const dropdownContentDiv = document.createElement("div");
        dropdownContentDiv.classList.add("dropdown-content");

        // Mảng chứa dữ liệu các mục trong menu
        const menuItems = [
            { href: "#", iconClass: "fas fa-user", text: "Tài khoản của bạn" },
            { href: "#", iconClass: "fas fa-box", text: "Quản lý đơn hàng" },
            { href: "#", iconClass: "fas fa-heart", text: "Sản phẩm yêu thích" },
            { href: "#", iconClass: "fas fa-map-marker-alt", text: "Địa chỉ giao hàng" },
            { href: "#", iconClass: "fas fa-sign-out-alt", text: "Thoát" }
        ];


        menuItems.forEach(item => {
            const link = document.createElement("a");
            link.href = item.href;
            link.className = item.className;  // Gán class cho thẻ <a>
        
            const icon = document.createElement("i");
            icon.className = item.iconClass; // Gán class cho thẻ <i>
        
            link.appendChild(icon);
            link.appendChild(document.createTextNode(" " + item.text));
            dropdownContentDiv.appendChild(link);
        });
        
     

        // Thêm button và dropdown-content vào account-menu
        accountMenuDiv.appendChild(accountButton);
        accountMenuDiv.appendChild(dropdownContentDiv);

        // Thêm account-menu vào login-hover
        loginHoverDiv.appendChild(accountMenuDiv);
    } else {
        console.error("Không tìm thấy phần tử có class 'login-hover'");
    }
}