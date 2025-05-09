/**
 * 
 */

/**
 * 
 */

function loginUser() {
	const tagData = username;
	
	console.log(tagData);


	if (tagData) {
		const loginHoverDiv = document.querySelector(".login-hover");

		// for (let sheet of document.styleSheets) {
		//
		// 	for (let i = 0; i < sheet.cssRules.length; i++) {
		// 		const rule = sheet.cssRules[i];
		//
		//
		// 		if (rule.selectorText === ".header-icons .login-hover:hover .login-box") {
		//
		// 			sheet.deleteRule(i);
		// 			break;
		// 		}
		// 	}
		// }

		if (loginHoverDiv) {

			const links = loginHoverDiv.querySelectorAll("a");


			links.forEach(link => link.remove());
		}
		if (loginHoverDiv) {
			// Tạo khối .account-menu

			const accountMenuDiv = document.createElement("div");
			accountMenuDiv.removeAttribute("a");
			accountMenuDiv.classList.add("account-menu");

			// Tạo nút button "Chào [Tên người dùng]"
			const accountButton = document.createElement("button");
			accountButton.classList.add("account-button");
			accountButton.textContent = "Chào " + tagData;

			// Tạo khối .dropdown-content
			const dropdownContentDiv = document.createElement("div");
			dropdownContentDiv.classList.add("dropdown-content");

			// Mảng chứa dữ liệu các mục trong menu
			const menuItems = [
				{ href: "index/inforUser.jsp", className: "account-user account", iconClass: "fas fa-user", text: "Tài khoản của bạn" },
				{ href: "index/Wishlist.jsp", className: "account-user orders-product", iconClass: "fas fa-box", text: "Quản lý đơn hàng" },
				{ href: "", className: "account-user product-like", iconClass: "fas fa-heart", text: "Sản phẩm yêu thích" },
				{ href: "index/addressbook.jsp", className: "account-user address", iconClass: "fas fa-map-marker-alt", text: "Địa chỉ giao hàng" },
				{ href: "#", className: "account-user logout-account", iconClass: "fas fa-sign-out-alt", text: "Thoát" }
			];
			// Tạo các liên kết trong .dropdown-content
			menuItems.forEach(item => {
				const link = document.createElement("a");
				link.href = item.href;

				link.className = item.className;  // Gán class cho thẻ <a>

				const icon = document.createElement("i");
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
}

function toggleChat() {
	var chatBox = document.getElementById("chatBox");
	if (chatBox.style.display === "none" || chatBox.style.display === "") {
		chatBox.style.display = "flex";
	} else {
		chatBox.style.display = "none";
	}
}
