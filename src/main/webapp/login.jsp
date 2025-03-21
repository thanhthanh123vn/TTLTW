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
			  id="register-form" onsubmit="return validateForm()">


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



			<button  type="submit" class="form-submit">Đăng Nhập</button>
			<a id="quenmk" href="index/forgot-pass.jsp">Quên mật khẩu</a>
			<p>Hoặc đăng nhập bằng</p>
			<div class="login-alt">

				<a  href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,email&client_id=1486223125654432&redirect_uri=http://localhost:8080/WebMyPham__/login">
				<img
						src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png"
						alt="Facebook"></a>
				<a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
&redirect_uri=http://localhost:8080/WebMyPham__/loginGoogle
&response_type=code
&client_id=834631603807-ep2tbokt3a5qt1tpgdttlqr6mdnldgk3.apps.googleusercontent.com
&approval_prompt=force">
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


<%
	String errorMessage = (String) session.getAttribute("errorMessage");
	if (errorMessage == null) {
		errorMessage = ""; // Hoặc một giá trị mặc định nếu chưa đăng nhập
	}
%>

<script>
	window.onload = function() {
		// Lấy phần tử alert-warning và button cảnh báo
		const alertDiv = document.querySelector('.alert-warning');
		const alertButton = document.getElementById('alertButton');
		const errorMessage = "${errorMessage}";
		console.log(errorMessage);

		// Kiểm tra nếu có thông báo lỗi, hiển thị cảnh báo
		if (errorMessage!=="" && alertDiv) {
			alertDiv.style.display = "block"; // Hiển thị cảnh báo
			alertButton.textContent = errorMessage; // Đặt nội dung lỗi vào nút button

			// Sau 5 giây, ẩn cảnh báo đi
			setTimeout(function() {
				alertDiv.style.display = "none";
			}, 5000); // 5000ms = 5 giây
		}

		// Điều hướng đến trang 'forgot-passwxord.html' khi người dùng bấm vào 'quenmk'
		const quenMk = document.getElementById('quenmk');
		if (quenMk) {
			quenMk.onclick = function() {
				window.location.href = '../startbootstrap-sb-admin-2-gh-pages/forgot-password.html';
			};
		}
	};
</script>
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId      : 'YOUR_APP_ID', // Thay YOUR_APP_ID bằng App ID của bạn
			cookie     : true,
			xfbml      : true,
			version    : 'v18.0' // Phiên bản API mới nhất
		});

		FB.AppEvents.logPageView();
	};

	(function(d, s, id){
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {return;}
		js = d.createElement(s); js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
</body>

</html>