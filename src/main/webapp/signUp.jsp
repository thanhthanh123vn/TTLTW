<%@ page import="utils.SessionUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
}

.main_content_sub_login {
	width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #ffffff;
	border: 1px solid #e5e5e5;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
}

.form-group {
display:block;
	
	margin-bottom: 15px;
	position: relative;
}

.form-group .parent_code_register {
	display: flex;
	width: 100%;

	flex-direction: row;
	justify-content: space-around;
}

.form-group input[type="text"], .form-group input[type="password"],
	.form-group select {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 3px;
}

.form-group input[type="checkbox"] {
	display: inline-block;
	width: auto;
	margin-right: 5px;
}

.form-group i {
	position: absolute;
	right: 10px;
	top: 12px;
	color: #aaa;
}

.sex {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.row .form-control {
	width: 100px;
}

.radio-inline {
	margin-right: 15px;
}

.radio-inline input {
	margin-right: 5px;
}

.group-birthday {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.group-birthday select {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 3px;
	margin-top: 5px;
}

.checkbox-inline {
	display: inline-block;
	margin-bottom: 10px;
	font-size: 13px;
}

.checkbox-inline input {
	margin-right: 5px;
}

.btn_site_1 {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	color: #fff;
	background-color: #326e51;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.btn_site_1:hover {
	background-color: #285a42;
}

.block_login_fb {
	text-align: center;
	margin-top: 20px;
}

.block_login_fb img {
	width: 150px;
	cursor: pointer;
	margin: 10px;
}

#verifyUserName {
	width: 20%;
	background-color: #d7d7d7;
	border: none;
}

a.txt_color_1 {
	color: #326e51;
	font-weight: bold;
}

a.txt_color_1:hover {
	text-decoration: underline;
}

.space_bottom_10 {
	margin-bottom: 10px;
}
.form-message {
    color: red;
    font-size: 0.9em;
    margin-top: 5px;
}
.is-invalid {
    border-color: red;
}


</style>
</head>
<body>
	<div class="main_content_sub_login">
		<form id="form-head-register" action="${pageContext.request.contextPath}/SignUser" method="post" onsubmit="return validateForm()">

			<div class="alert alert-warning alert-dismissible" id="warningAlert"
				style="display: none;">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong>Cảnh báo!</strong> Hộp cảnh báo này có thể chỉ ra cảnh báo
				Điều đó có thể cần chú ý.
			</div>
			<input name="form_key" type="hidden" value="9lB2QzSyHmzVefcW">
			<div class="block_more_login">
				<div class="space_bottom_10">Đăng ký tài khoản</div>
				<div class="showRegisterMessage text-danger hidden"></div>
				<div class="form-group">
					<div class="relative">
						<input type="text" class="form-control email" name="email"
							id="email" placeholder="Nhập email hoặc số điện thoại">
						<i aria-hidden="true" class="fa fa-envelope-o"></i>
						 <span class="form-message"></span>
					</div>
				</div>

		<div class="form-group ">
					<div class="relative parent_code_register">

						<input autocomplete="off" placeholder="Nhập mã xác thực 6 số"
							   type="text" name="code" title="Code"
							   class="codeRegister input-text" onblur="verifyCode()" id="codeInput">

						<button type="button" id="verifyUserName"
							data-error=".showRegisterMessage">lấy mã</button>
							 <span class="form-message"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="relative">
						<input id="password" autocomplete="off" name="password"
							type="password" placeholder="Nhập mật khẩu từ 6 - 32 ký tự"
							class="form-control"> <i aria-hidden="true"
							class="fa fa-lock"></i>
							 <span class="form-message"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="relative">
						<input id="fullname" name="username" type="text"
							placeholder="Họ tên" class="form-control"
							data-validate="{required:true, 'validate-custom-fullname': true}">
						<i aria-hidden="true" class="fa fa-user"></i>
						
						 <span class="form-message"></span>
					</div>
				</div>

				<div class="form-group row">
					<div class="sex">
						<div class="col-lg-4 col-lg-2">
							<label class="radio-inline"><input name="gender"
								value="0" type="radio">Không xác định </label>
						</div>
						<div class="col-lg-2">
							<label class="radio-inline"><input name="gender"
								value="1" type="radio"> Nam </label>
						</div>

						<div>
							<div class="col-lg-2">
								<label class="radio-inline"><input name="gender"
									value="2" type="radio" checked="checked"> Nữ </label>
							</div>
						</div>
					</div>
					<div class="row group-birthday">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<div class="form-group">
								<select class="form-control" name="popup-date" id="reg-day">
									<option value="">Ngày</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<div class="form-group">
								<select class="form-control" name="popup-month" id="reg-month">
									<option value="">Tháng</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<div class="form-group">
								<select class="form-control" name="popup-year" id="reg-year">
									<option value="">Năm</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option>
									<option value="1959">1959</option>
									<option value="1958">1958</option>
									<option value="1957">1957</option>
									<option value="1956">1956</option>
									<option value="1955">1955</option>
									<option value="1954">1954</option>
									<option value="1953">1953</option>
									<option value="1952">1952</option>
									<option value="1951">1951</option>
									<option value="1950">1950</option>
									<option value="1949">1949</option>
									<option value="1948">1948</option>
									<option value="1947">1947</option>
									<option value="1946">1946</option>
									<option value="1945">1945</option>
									<option value="1944">1944</option>
									<option value="1943">1943</option>
									<option value="1942">1942</option>
									<option value="1941">1941</option>
									<option value="1940">1940</option>
									<option value="1939">1939</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="checkbox-inline"> <input
							name="accept_policy_privacy" value="1" checked="checked"
							type="checkbox" id="reg-policy"> Tôi đã đọc và đồng ý với
							<a href="https://hotro.hasaki.vn/quy-dinh-giao-dich-chung.html"
							style="color: #326e51">Điều kiện giao dịch chung</a> và <a
							href="https://hotro.hasaki.vn/chinh-sach-bao-mat.html"
							style="color: #326e51">Chính sách bảo mật thông tin</a> của
							Hasaki
						</label>
					</div>
					<div class="form-group">
						<label class="checkbox-inline"> <input
							name="is_subscribed" value="1" checked="checked" type="checkbox">
							Nhận thông tin khuyến mãi qua e-mail
						</label>
					</div>
					<div class="clearfix"></div>
					<button class="btn btn_site_1" id="btnRegister">Đăng ký</button>
				</div>
			</div>
		</form>
		<div class="block_login_fb">
			Bạn đã có tài khoản? <a href="../login.jsp"
				class="txt_color_1 text-uppercase popup-login popup-register-dismiss">Đăng
				nhập</a>
			<div class="space_bottom_10">Hoặc đăng nhập với:</div>
			<a class="login-facebook" href="javascript:void(0);"
				data-href="https://hasaki.vn/login-facebook"> <img
				src="https://hasaki.vn/images/graphics/img_login_fb_2.jpg" alt=""
				class="loading" data-was-processed="true">
			</a> &nbsp; <a class="login-google" href="javascript:void(0);"
				data-href="https://hasaki.vn/login-google"> <img
				src="https://hasaki.vn/images/graphics/img_login_gg_2.jpg" alt=""
				class="loading" data-was-processed="true">
			</a>
		</div>

	</div>
	<%
		// Lấy giá trị count từ session (đảm bảo SessionUtil.getValue trả về giá trị hợp lệ)
		int count = Integer.parseInt(SessionUtil.getValue(request, "count_signup").toString());
		int timeOut = 0;
		// Xác định thời gian khóa dựa trên count
		if (count == 5) {
			timeOut = 60000; // 1 phút
		} else if (count == 10) {
			timeOut = 300000; // 5 phút
		} else if (count == 15) {
			timeOut = 3600000; // 1 giờ
		}
	%>
	<script>




			var count = <%= count %>;
			var timeOut = <%= timeOut %>;
			var codeInput = document.getElementById("codeInput");


			if(timeOut > 0){
			codeInput.disabled = true;
			alert("Bạn đã nhập sai quá nhiều lần. Hãy thử lại sau " + (timeOut/60000) + " phút.");

			setTimeout(function(){
			codeInput.disabled = false;
		}, timeOut);
		}


	</script>
	<script>
		document
				.getElementById("verifyUserName")
				.addEventListener(
						"click",
						function() {
							var email = document.getElementById("email").value;
							if (email === "") {
								alert("Vui lòng nhập email.");
								return;
							}

							// Gửi yêu cầu AJAX đến servlet
							var xhr = new XMLHttpRequest();
							xhr.open("POST", "${pageContext.request.contextPath}/SendEmail", true);
							xhr.setRequestHeader("Content-Type",
									"application/x-www-form-urlencoded");
							xhr.onreadystatechange = function() {
								if (xhr.readyState === 4 && xhr.status === 200) {
									if (xhr.responseText === "success") {
										alert("Mã xác nhận đã được gửi đến email của bạn.");
									} else {
										alert("Gửi mã thất bại. Vui lòng thử lại.");
									}
								}
							};
							xhr.send("email=" + encodeURIComponent(email));
						});
	</script>

	<script>
		// Hàm để hiển thị thông báo
		function showWarningAlert() {
			document.getElementById("warningAlert").style.display = "block";
		}



		// Kiểm tra nếu có biến `showAlert` được truyền vào
	<%String showAlert = (String) session.getAttribute("errorMessage");
if (showAlert != null && "true".equals(showAlert)) {%>
		showWarningAlert();
		console.log("Warning");
	<%}%>
		
	</script>
	<script src="${pageContext.request.contextPath}/js/validatorSignUp.js"></script>

	<%
	session.removeAttribute("errorMessage");
	%>

</body>
</html>