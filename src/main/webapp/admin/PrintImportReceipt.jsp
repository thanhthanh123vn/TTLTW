<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Phiếu Nhập Kho</title>
    <style>
        body {
            font-family: 'DejaVu Sans', sans-serif;
            margin: 20px;
            line-height: 1.6;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .header,
        .footer {
            text-align: center;
            margin-bottom: 20px;
        }
        .details,
        .products {
            margin-bottom: 20px;
        }
        .details table,
        .products table {
            width: 100%;
            border-collapse: collapse;
        }
        .details th,
        .details td,
        .products th,
        .products td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .products th {
            background-color: #f2f2f2;
        }
        .total {
            text-align: right;
            font-weight: bold;
            margin-top: 20px;
        }
        .signature {
            margin-top: 50px;
            display: flex;
            justify-content: space-around;
        }
        .signature div {
            text-align: center;
        }
        /* Print specific styles */
        @media print {
            body {
                margin: 0;
                padding: 0;
            }
            .container {
                width: 100%;
                margin: 0;
            }
            .header,
            .footer {
                margin-bottom: 10px;
            }
            .details,
            .products {
                margin-bottom: 10px;
            }
            .details table,
            .products table {
                border: none;
            }
            .details th,
            .details td,
            .products th,
            .products td {
                 border: 1px solid #ddd;
            }
             .products th {
                background-color: #f2f2f2 !important;
                -webkit-print-color-adjust: exact;
            }
            .total {
                margin-top: 10px;
            }
            .signature {
                margin-top: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>PHIẾU NHẬP KHO</h2>
            <p>Mã phiếu: NK<fmt:formatNumber value="${receipt.id}" pattern="000"/></p>
            <p>Ngày nhập: <fmt:formatDate value="${receipt.importDate}" pattern="dd/MM/yyyy"/></p>
        </div>

        <div class="details">
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

        <div class="details">
            <h3>Thông tin phiếu nhập</h3>
             <table>
                <tr>
                    <th>Ghi chú</th>
                    <td>${receipt.note}</td>
                </tr>
            </table>
        </div>

        <div class="products">
            <h3>Danh sách sản phẩm</h3>
            <table>
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
                            <td>${detail.productName}</td> <%-- Assuming you add productName to ImportReceiptDetail --%>
                            <td>${detail.quantity}</td>
                            <td><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/></td>
                            <td><fmt:formatNumber value="${detail.quantity * detail.price}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="total">
            Tổng tiền: <fmt:formatNumber value="${receipt.totalAmount}" type="currency" currencySymbol="đ" groupingUsed="true" maxFractionDigits="0"/>
        </div>

         <div class="signature">
            <div>
                <h4>Người lập phiếu</h4>
                <p>(Ký, ghi rõ họ tên)</p>
                <br><br>
                 <%-- Assuming you have user info in session --%>
            </div>
             <div>
                <h4>Người nhận hàng</h4>
                <p>(Ký, ghi rõ họ tên)</p>
                 <br><br>
            </div>
            <div>
                <h4>Kế toán</h4>
                <p>(Ký, ghi rõ họ tên)</p>
                 <br><br>
            </div>
        </div>

        <div class="footer">
            <p>Xin cảm ơn!</p>
        </div>
    </div>
</body>
</html> 