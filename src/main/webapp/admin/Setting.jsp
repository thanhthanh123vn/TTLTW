<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/2/2025
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> <%-- Changed prefix from f to fmt --%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cài Đặt - Quản Lý Kho</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .main-content {
            padding: 20px;
        }
        .settings-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h3 class="text-white text-center mb-4">Quản Lý Kho</h3>
            <a href="Home.html"><i class="fas fa-home"></i> Trang Chủ</a>
            <a href="ManageProduct.html"><i class="fas fa-boxes"></i> Sản Phẩm</a>
            <a href="ImportProduct.html"><i class="fas fa-truck"></i> Nhập Kho</a>
            <a href="ExportProduct.html"><i class="fas fa-shopping-cart"></i> Xuất Kho</a>
            <a href="Report.html"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
            <a href="Settings.html" class="active"><i class="fas fa-cog"></i> Cài Đặt</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <h2 class="mb-4">Cài Đặt Hệ Thống</h2>

            <!-- General Settings -->
            <div class="settings-card">
                <h4 class="mb-3">Cài Đặt Chung</h4>
                <form>
                    <div class="mb-3">
                        <label for="systemName" class="form-label">Tên Hệ Thống</label>
                        <input type="text" class="form-control" id="systemName" value="Hệ Thống Quản Lý Kho">
                    </div>
                    <div class="mb-3">
                        <label for="currency" class="form-label">Đơn Vị Tiền Tệ</label>
                        <input type="text" class="form-control" id="currency" value="VNĐ">
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
                </form>
            </div>

            <!-- User Management (Placeholder) -->
            <div class="settings-card">
                <h4 class="mb-3">Quản Lý Người Dùng</h4>
                <p>Quản lý tài khoản người dùng, phân quyền truy cập.</p>
                <a href="#" class="btn btn-secondary disabled"><i class="fas fa-users"></i> Đi đến Quản lý Người dùng</a>
            </div>

            <!-- Backup & Restore (Placeholder) -->
            <div class="settings-card">
                <h4 class="mb-3">Sao Lưu & Phục Hồi</h4>
                <p>Tùy chọn sao lưu dữ liệu kho và phục hồi từ bản sao lưu.</p>
                <button class="btn btn-secondary disabled"><i class="fas fa-database"></i> Thực hiện Sao Lưu</button>
                <button class="btn btn-secondary disabled"><i class="fas fa-upload"></i> Phục hồi Dữ liệu</button>
            </div>

            <!-- System Preferences (Placeholder) -->
            <div class="settings-card">
                <h4 class="mb-3">Tùy Chọn Hệ Thống</h4>
                <p>Cấu hình các tùy chọn nâng cao của hệ thống.</p>
                <button class="btn btn-secondary disabled"><i class="fas fa-sliders-h"></i> Cấu hình</button>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>