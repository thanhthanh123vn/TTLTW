<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sign In</title>
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="css/signUp.css">
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body, html {
			font-family: Arial, sans-serif;
			background: linear-gradient(135deg, #8a2be2, #87ceeb);
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}

		.container {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 1200px;
			padding: 20px;
		}

		p, a {
			margin-top: 20px;
			font-size: 14px;
			line-height: 20px;
			font-weight: 700;
			font-style: oblique;
		}

		a:hover {
			color: #23df12;
			text-decoration: none;
			cursor: pointer;
		}

		.login-alt {
			display: flex;
			justify-content: center;
			gap: 20px;
			margin: 20px 0;
		}

		.login-alt img {
			width: 40px;
			height: 40px;
			cursor: pointer;
			transition: transform 0.3s ease;
		}

		.login-alt img:hover {
			transform: scale(1.1);
			background-color: aqua;
		}

		.sign-up {
			color: gray;
			margin-top: 20px;
			font-size: 15px;
		}

		.sign-up a {
			text-decoration: none;
			color: #6A006A;
			font-weight: bold;
		}

		.sign-up a:hover {
			text-decoration: underline;
		}
	</style>
</head>

<body>

<div class="container">
	<div class="form-sign">

		<form action="LoginHandle" method="POST" class="form"
			  id="register-form">


			<h3 class="heading">Đăng Nhập❤️</h3>

			<div class="spacer"></div>
			<div class="alert alert-warning alert-dismissible"
				 style="display: none;">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<button id="alertButton" class="btn btn-warning">This
					alert box could indicate a warning that might need attention.</button>
			</div>

			<div class="form-group">
				<label for="fullname" value="${username}" class="form-label">Tên
					đầy đủ</label> <input id="fullname" name="username" type="text"
										  rules="required" placeholder="VD: Nguyễn Thạnh"
										  class="form-control"> <span class="form-message"></span>
			</div>


			<div class="form-group">
				<label for="password" value="${password}" class="form-label">Mật
					khẩu</label> <input id="password" name="password" rules="required|min:6"
										type="password" placeholder="Nhập mật khẩu" class="form-control">
				<span class="form-message"></span>
			</div>
			<!-- Google reCAPTCHA -->
           <%--local host--%>
<%--			<div class="g-recaptcha" data-sitekey="6Lccm1MrAAAAAPUFwXHYvK6OjWGHKMnE6RUseH8q"></div>	--%>
<%--			deloy--%>
			<div class="g-recaptcha" data-sitekey="6Lc7tFMrAAAAALLBkfhRv7rqtFp88H1O63PQ_SAj"></div>

			<button  type="submit" class="form-submit" >Đăng Nhập</button>
			<a id="quenmk" href="index/forgot-pass.jsp">Quên mật khẩu</a>
			<p>Hoặc đăng nhập bằng</p>
			<div class="login-alt">

				<a  href="login-facebook">
				<img
						src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png"
						alt="Facebook"></a>
				<a  href="loginGoogle">
				<img
					src="https://img.icons8.com/ios-filled/50/000000/google-logo.png"
					alt="Google"></a>
			</div>
			<p class="sign-up">
				Bạn chưa có tài khoản? <a href="signUp.jsp">Đăng ký</a>
			</p>
		</form>
	</div>
</div>

<script src="js/validatorSignUp.js"></script>
<!-- Thêm script reCAPTCHA -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<%
	String errorMessage = (request.getAttribute("errorMessage") !=null ) ? request.getAttribute("errorMessage").toString() : "";

	int failedAttempts = 0; // Mặc định là 0 nếu chưa có trong session
	if (session.getAttribute("failedAttempts") != null) {
		try {
			failedAttempts = Integer.parseInt(session.getAttribute("failedAttempts").toString());
		} catch (NumberFormatException e) {
			failedAttempts = 0; // Nếu có lỗi chuyển đổi, giữ giá trị mặc định
		}
	}
%>



<script>
	window.onload = function() {
		var lockTime = 0;
		const alertDiv = document.querySelector('.alert-warning');
		const alertButton = document.getElementById('alertButton');
		const errorMessage = "<%= errorMessage %>";
		var failedAttempts = parseInt("<%= failedAttempts %>", 10) || 0;
		const password = document.getElementById("password");
		const username = document.getElementById("fullname");

		console.log("Số lần nhập sai:", failedAttempts);

		// Xác định thời gian khóa dựa vào số lần nhập sai
		if (failedAttempts >= 5 && failedAttempts < 10) {
			lockTime = 60000; // 1 phút
		} else if (failedAttempts >= 10 && failedAttempts < 15) {
			lockTime = 300000; // 5 phút
		} else if (failedAttempts >= 15) {
			lockTime = 3600000; // 1 giờ
		}

		// Nếu số lần nhập sai vượt ngưỡng, khóa input ngay lập tức
		if (lockTime > 0) {
			console.log("Tài khoản bị khóa trong:", lockTime / 1000, "giây");

			// Khóa input ngay lập tức
			password.disabled = true;
			username.disabled = true;

			// Hiển thị cảnh báo ngay lập tức
			alertDiv.style.display = "block";
			alertButton.innerText = `Tài khoản bị khóa do nhập sai ${failedAttempts} lần. Vui lòng thử lại sau!`+lockTime/60000;

			// Mở khóa sau lockTime
			setTimeout(() => {
				password.disabled = false;
				username.disabled = false;
				alertButton.innerText = "Bạn có thể thử lại ngay bây giờ!";
			}, lockTime);
		} else {
			// Hiển thị thông báo lỗi nếu có
			if (errorMessage !== "" && alertDiv) {
				alertDiv.style.display = "block";
				alertButton.textContent = errorMessage;

				setTimeout(() => {
					alertDiv.style.display = "none";
				}, 5000); // 5 giây
			}
		}



	// Điều hướng đến trang 'forgot-passwxord.html' khi người dùng bấm vào 'quenmk'
		const quenMk = document.getElementById('quenmk');
		if (quenMk) {
			quenMk.onclick = function () {
				window.location.href = '../startbootstrap-sb-admin-2-gh-pages/forgot-password.html';
			};
		}
	};
</script>


</body>

</html>