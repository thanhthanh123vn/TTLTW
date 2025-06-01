<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Phiếu Nhập Kho - NK<fmt:formatNumber value="${receipt.id}" pattern="000"/></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        padding: 20px;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2, h3 {
        color: #333;
    }
    .detail-section {
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 1px solid #eee;
    }
    .detail-section table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
     .detail-section table th,
     .detail-section table td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .detail-section table th {
        width: 30%;
        font-weight: bold;
    }
    .products-table th,
    .products-table td {
        text-align: left;
        padding: 8px;
        border: 1px solid #ddd;
    }
    .products-table th {
        background-color: #f2f2f2;
    }
    .total-amount {
        text-align: right;
        font-size: 1.2em;
        font-weight: bold;
        margin-top: 20px;
    }
     .back-link {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
    }
</style>
</head>
<body>

    <div class="container">
        <div class="header text-center">
            <h2>Chi Tiết Phiếu Nhập Kho</h2>
            <p>Mã phiếu: NK<fmt:formatNumber value="${receipt.id}" pattern="000"/></p>
            <p>Ngày nhập: <fmt:formatDate value="${receipt.importDate}" pattern="dd/MM/yyyy HH:mm"/></p>
        </div>

        <div class="detail-section">
            <h3>Thông tin nhà cung cấp</h3>
            <table>
                <tr>
                    <th>Tên nhà cung cấp</th>
                    <td>${supplier.name}</td>
                </tr>
                <tr>
                    <th>Địa chỉ</th>
                    <td>${supplier.address}</td>
                </tr>
                <tr>
                    <th>Điện thoại</th>
                    <td>${supplier.phone}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${supplier.email}</td>
                </tr>
            </table>
        </div>

         <div class="detail-section">
            <h3>Thông tin phiếu nhập</h3>
             <table>
                 <tr>
                     <th>Ghi chú</th>
                     <td>${receipt.note}</td>
                 </tr>
             </table>
         </div>

        <div class="products-section detail-section">
            <h3>Danh sách sản phẩm</h3>
            <table class="products-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="detail" items="${details}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${detail.productName}</td>
                            <td>${detail.quantity}</td>
                            <td><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/></td>
                            <td><fmt:formatNumber value="${detail.quantity * detail.price}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="total-amount">
            Tổng tiền: <fmt:formatNumber value="${receipt.totalAmount}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/>
        </div>
        
        <a href="${pageContext.request.contextPath}/admin/ImportProduct.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Quay lại Lịch sử Nhập Kho
        </a>

    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 