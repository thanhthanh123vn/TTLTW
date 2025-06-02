<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - Quản Lý Kho</title>
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
        .stat-card {
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .stat-card i {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .stat-card h3 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        .stat-card p {
            color: #6c757d;
            margin: 0;
        }
        .chart-container {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .recent-activity {
            max-height: 400px;
            overflow-y: auto;
        }
        .activity-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .activity-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h3 class="text-white text-center mb-4">Quản Lý Kho</h3>
            <a href="KhoManager" class="active"><i class="fas fa-home"></i> Trang Chủ</a>
            <a href="ManagerKho"><i class="fas fa-boxes"></i> Sản Phẩm</a>
            <a href="admin/ImportProduct.jsp"><i class="fas fa-truck"></i> Nhập Kho</a>
            <a href="admin/ExportProduct.jsp"><i class="fas fa-shopping-cart"></i> Xuất Kho</a>
            <a href="admin/Report.jsp"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
            <a href="admin/Setting.jsp"><i class="fas fa-cog"></i> Cài Đặt</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <h2 class="mb-4">Tổng Quan Kho</h2>

            <!-- Statistics Cards -->
            <div class="row">
                <div class="col-md-3">
                    <div class="stat-card bg-primary text-white">
                        <i class="fas fa-boxes"></i>
                        <%-- Display Total Products from request attribute --%>
                        <h3>${requestScope.totalProducts}</h3>
                        <p style="color: white">Tổng Sản Phẩm</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card bg-success text-white">
                        <i class="fas fa-arrow-up"></i>
                        <%-- Display Imported Today from request attribute (will be 0 based on current schema) --%>
                        <h3>${requestScope.importedToday}</h3>
                        <p style="color: white">Nhập Kho Hôm Nay</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card bg-warning text-dark">
                        <i class="fas fa-arrow-down"></i>
                        <%-- Display Exported Today from request attribute --%>
                        <h3>${requestScope.exportedToday}</h3>
                        <p style="color: white">Xuất Kho Hôm Nay</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card bg-danger text-white">
                        <i class="fas fa-exclamation-triangle"></i>
                        <%-- Display Low Stock Count from request attribute --%>
                        <h3>${requestScope.lowStockCount}</h3>
                        <p style="color: white">Sản Phẩm Sắp Hết</p>
                    </div>
                </div>
            </div>

            <!-- Charts and Recent Activity -->
            <div class="row mt-4">
                <!-- Stock Level Chart -->
                <div class="col-md-8">
                    <div class="chart-container">
                        <h4 class="mb-3">Mức Tồn Kho Theo Loại</h4>
                        <canvas id="stockChart"></canvas>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="col-md-4">
                    <div class="chart-container">
                        <h4 class="mb-3">Hoạt Động Gần Đây</h4>
                        <div class="recent-activity">
                            <%-- Loop through Recent Activity from request attribute --%>
                            <c:forEach var="activity" items="${requestScope.recentActivity}">
                                <div class="activity-item">
                                    <small class="text-muted">${activity.time}</small>
                                    <p class="mb-0">${activity.description}</p>
                                </div>
                            </c:forEach>
                            <%-- Message if no recent activity data is available --%>
                            <c:if test="${empty requestScope.recentActivity}">
                                <div class="activity-item">
                                    <p class="mb-0 text-muted">Dữ liệu hoạt động gần đây không có sẵn trong schema.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Low Stock Alert -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="chart-container">
                        <h4 class="mb-3">Cảnh Báo Sắp Hết Hàng</h4>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Mã SP</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Số Lượng</th>
                                    <th>Mức Tồn Kho</th>
                                    <th>Hành Động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%-- Loop through Low Stock Alerts from request attribute --%>
                                <c:forEach var="alert" items="${requestScope.lowStockAlerts}">
                                    <tr>
                                        <td>${alert.code}</td>
                                        <td>${alert.name}</td>
                                        <td>${alert.quantity}</td>
                                        <td>
                                                <%-- Display threshold status --%>
                                            <span class="badge bg-danger">${alert.threshold_status}</span>
                                        </td>
                                        <td><button class="btn btn-sm btn-primary">Nhập thêm</button></td>
                                    </tr>
                                </c:forEach>
                                <%-- Message if no low stock alerts --%>
                                <c:if test="${empty requestScope.lowStockAlerts}">
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">Không có sản phẩm nào sắp hết hàng.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Stock Level Chart
    const ctx = document.getElementById('stockChart').getContext('2d');
    // Get data from request attribute
    // The data is passed as a Map, convert keys and values for Chart.js
    const stockByCategoryData = ${requestScope.stockByCategory}; // This will be a JSON-like structure

    let categories = [];
    let quantities = [];

    // Check if stockByCategoryData is not null or empty before processing
    if (stockByCategoryData) {
        categories = Object.keys(stockByCategoryData);
        quantities = Object.values(stockByCategoryData);
    } else {
        // Handle case where no data is available (e.g., show a message or empty chart)
        console.log("No stock by category data available.");
        // You might want to add code here to display a message on the chart area
    }


    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: categories, // Use categories from database
            datasets: [{
                label: 'Số lượng tồn kho',
                data: quantities, // Use quantities from database
                backgroundColor: [
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(153, 102, 255, 0.8)', // Add more colors if needed
                    'rgba(255, 159, 64, 0.8)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>