<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 3/28/2025
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%
  String token = request.getParameter("token");
  if (token == null || token.isEmpty()) {
    response.sendRedirect("error.jsp"); // Chuyển hướng nếu không có token
    return;
  }
  token = URLDecoder.decode(token, "UTF-8"); // Giải mã token nếu cần
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đặt lại mật khẩu</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #667eea, #764ba2);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      width: 350px;
      text-align: center;
    }

    h2 {
      margin-bottom: 10px;
      color: #333;
    }

    p {
      font-size: 14px;
      color: #666;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: bold;
      color: #333;
      text-align: left;
    }

    input {
      padding: 10px;
      width: 100%;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
    }

    input:focus {
      border-color: #667eea;
      outline: none;
    }

    button {
      background: #667eea;
      color: white;
      border: none;
      padding: 12px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #764ba2;
    }

  </style>
</head>
<body>


<form action="${pageContext.request.contextPath}/resetPassword" method="post">
  <h2>Đặt lại mật khẩu</h2>
  <p>Vui lòng nhập mật khẩu mới cho tài khoản của bạn.</p>
  <input type="hidden" name="token" value="<%= token %>">

  <label for="password">Mật khẩu mới:</label>
  <input type="password" id="password" name="password" required>

  <label for="confirmPassword">Xác nhận mật khẩu:</label>
  <input type="password" id="confirmPassword" name="confirmPassword" required>

  <button type="submit">Đặt lại mật khẩu</button>
</form>
</body>
</html>
