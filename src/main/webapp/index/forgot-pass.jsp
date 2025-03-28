<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
         html {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, purple, blue);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 600px;
            height: 400px;
            padding: 20px;
            background: white;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-message {
            color: red;
            font-size: 12px;
        }
        .form-submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <form id="forgot-password-form" action="http://localhost:8080/WebMyPham__/sendEmailActivity" method="POST">

        <h3 class="heading">Quên mật khẩu?</h3>
        <div class="spacer"></div>

        <div class="form-group">
            <label for="username" class="form-label">Tên tài khoản</label>
            <input style="width: 130%;" id="username" name="username" type="text" rules="required" placeholder="VD: Nguyễn Thạnh" class="form-control">
            <span class="form-message"></span>
        </div>

        <div class="form-group">
            <label for="email" class="form-label">Địa chỉ Email</label>
            <input style="width: 130%;"  id="email" name="email" type="email" rules="required|email" placeholder="Nhập địa chỉ Email..." class="form-control">
            <span class="form-message"></span>
        </div>

        <button   class="form-submit" style="margin-left: 20px;">Đặt lại mật khẩu</button>
    </form>
</div>

<%--<script src="${pageContext.request.contextPath}/js/validatorForgotPass.js"></script>--%>
</body>
</html>

