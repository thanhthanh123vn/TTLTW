<%@ page import="object.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="object.Product" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/6/2025
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            color: #555;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }
        .product-list {
            width: 100%;
            border-collapse: collapse;
        }
        .product-list th, .product-list td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .product-list th {
            background-color: #f0f0f0;
            color: #333;
        }
        .total {
            text-align: right;
            font-weight: bold;
        }
        .total span {
            color: #d9534f;
        }
        .print-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .print-button:hover {
            background-color: #4cae4c;
        }
    </style>
    <script>
        function printPage() {
            window.print();
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Chi tiết đơn hàng</h1>
    <div class="section">
        <%  OrderDetail od = (OrderDetail) request.getAttribute("orderDt");%>
        <h2>Thông tin người nhận</h2>
        <p>Người nhận: <%= od.getRecipientName() %></p>
        <p>Điện thoại: <%= od.getPhoneNumber() %></p>
        <p>Địa chỉ: <%= od.getAddress() %></p>
    </div>
    <div class="section">
        <h2>Danh sách sản phẩm</h2>
        <table class="product-list">
            <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");

                int totalQuantity = 0;
                double totalPrice = 0;
                for (Product product : productList) {
                    totalQuantity += od.getTotalQuantity();
                    totalPrice += od.getTotalPrice() ;
            %>
            <tr>
                <td><%= product.getName() %></td>

                <td><%= od.getTotalQuantity() %></td>
                <td><%= String.format("%.2f", product.getPrice()) %> đ</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <p class="total">Tổng SL: <%= totalQuantity %> - Tổng tiền: <span><%= String.format("%.2f", totalPrice) %> đ</span></p>
        <button class="print-button" onclick="printPage()">Print</button>
    </div>
</div>
</body>
</html>
