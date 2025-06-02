<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo - Quản Lý Kho</title>
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
        .report-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .chart-container {
            position: relative;
            height: 300px;
            margin-bottom: 20px;
        }
        .report-summary {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .summary-item {
            text-align: center;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            flex: 1;
            margin: 0 10px;
        }
        .summary-item h3 {
            font-size: 1.5rem;
            margin-bottom: 5px;
        }
        .summary-item p {
            color: #6c757d;
            margin: 0;
        }
        .trend-up {
            color: #28a745;
        }
        .trend-down {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <h3 class="text-white text-center mb-4">Quản Lý Kho</h3>
                <a href="Home.jsp"><i class="fas fa-home"></i> Trang Chủ</a>
                <a href="ManageProduct.html"><i class="fas fa-boxes"></i> Sản Phẩm</a>
                <a href="ImportProduct.jsp"><i class="fas fa-truck"></i> Nhập Kho</a>
                <a href="ExportProduct.jsp"><i class="fas fa-shopping-cart"></i> Xuất Kho</a>
                <a href="Report.jsp" class="active"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
                <a href="Setting.jsp"><i class="fas fa-cog"></i> Cài Đặt</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <h2 class="mb-4">Báo Cáo</h2>

                <!-- Date Range Filter -->
                <div class="report-card mb-4">
                    <div class="row align-items-center">
                        <div class="col-md-4">
                            <label class="form-label">Khoảng Thời Gian</label>
                            <select class="form-select">
                                <option value="today">Hôm nay</option>
                                <option value="week">Tuần này</option>
                                <option value="month" selected>Tháng này</option>
                                <option value="quarter">Quý này</option>
                                <option value="year">Năm nay</option>
                                <option value="custom">Tùy chỉnh</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Từ Ngày</label>
                            <input type="date" class="form-control" value="2024-03-01">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Đến Ngày</label>
                            <input type="date" class="form-control" value="2024-03-15">
                        </div>
                    </div>
                </div>

                <!-- Summary Cards -->
                <div class="report-summary">
                    <div class="summary-item">
                        <h3>125,000,000đ</h3>
                        <p>Tổng Giá Trị Kho</p>
                        <small class="trend-up"><i class="fas fa-arrow-up"></i> 5.2% so với tháng trước</small>
                    </div>
                    <div class="summary-item">
                        <h3>45</h3>
                        <p>Số Đơn Nhập</p>
                        <small class="trend-up"><i class="fas fa-arrow-up"></i> 12.5% so với tháng trước</small>
                    </div>
                    <div class="summary-item">
                        <h3>32</h3>
                        <p>Số Đơn Xuất</p>
                        <small class="trend-down"><i class="fas fa-arrow-down"></i> 3.2% so với tháng trước</small>
                    </div>
                    <div class="summary-item">
                        <h3>1,234</h3>
                        <p>Tổng Sản Phẩm</p>
                        <small class="trend-up"><i class="fas fa-arrow-up"></i> 8.7% so với tháng trước</small>
                    </div>
                </div>

                <!-- Charts -->
                <div class="row">
                    <!-- Inventory Value Trend -->
                    <div class="col-md-6">
                        <div class="report-card">
                            <h4 class="mb-3">Xu Hướng Giá Trị Kho</h4>
                            <div class="chart-container">
                                <canvas id="inventoryValueChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Product Category Distribution -->
                    <div class="col-md-6">
                        <div class="report-card">
                            <h4 class="mb-3">Phân Bố Sản Phẩm Theo Loại</h4>
                            <div class="chart-container">
                                <canvas id="categoryDistributionChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Products and Low Stock -->
                <div class="row">
                    <!-- Top Products -->
                    <div class="col-md-6">
                        <div class="report-card">
                            <h4 class="mb-3">Sản Phẩm Bán Chạy</h4>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Số Lượng Xuất</th>
                                            <th>Doanh Thu</th>
                                            <th>Tăng Trưởng</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Low Stock Alert -->
                    <div class="col-md-6">
                        <div class="report-card">
                            <h4 class="mb-3">Cảnh Báo Tồn Kho</h4>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Tồn Kho</th>
                                            <th>Mức Tối Thiểu</th>
                                            <th>Trạng Thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>

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
        // Function to load report data
        function loadReportData(period = 'month') {
            fetch('${pageContext.request.contextPath}/GetReportData?period=' + period)
                .then(response => response.json())
                .then(data => {
                    // Update summary cards
                    const summary = data.summary;
                    document.querySelector('.summary-item:nth-child(1) h3').textContent = formatCurrency(summary.totalInventoryValue);
                    document.querySelector('.summary-item:nth-child(2) h3').textContent = summary.importCount;
                    document.querySelector('.summary-item:nth-child(3) h3').textContent = summary.exportCount;
                    document.querySelector('.summary-item:nth-child(4) h3').textContent = summary.totalProducts;

                    // Update trends
                    updateTrendElement(0, summary.importTrend);
                    updateTrendElement(1, summary.exportTrend);
                    updateTrendElement(2, summary.inventoryTrend);

                    // Update inventory trend chart
                    updateInventoryTrendChart(data.inventoryTrend);

                    // Update category distribution chart
                    updateCategoryDistributionChart(data.categoryDistribution);

                    // Update top products table
                    updateTopProductsTable(data.topProducts);

                    // Update low stock alerts
                    updateLowStockTable(data.lowStockAlerts);
                })
                .catch(error => {
                    console.error('Error loading report data:', error);
                    alert('Có lỗi xảy ra khi tải dữ liệu báo cáo!');
                });
        }

        // Helper function to update trend elements
        function updateTrendElement(index, trend) {
            const trendElement = document.querySelectorAll('.summary-item small')[index];
            const isPositive = trend >= 0;
            trendElement.className = isPositive ? 'trend-up' : 'trend-down';
            trendElement.innerHTML = '<i class="fas fa-arrow-' + (isPositive ? 'up' : 'down') + '"></i> ' + 
                Math.abs(trend).toFixed(1) + '% so với tháng trước';
        }

        // Function to update inventory trend chart
        function updateInventoryTrendChart(trendData) {
            const labels = trendData.map(point => formatDate(point.date));
            const values = trendData.map(point => point.value);

            if (window.inventoryChart) {
                window.inventoryChart.destroy();
            }

            const ctx = document.getElementById('inventoryValueChart').getContext('2d');
            window.inventoryChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Giá trị kho',
                        data: values,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function(value) {
                                    return formatCurrency(value);
                                }
                            }
                        }
                    }
                }
            });
        }

        // Function to update category distribution chart
        function updateCategoryDistributionChart(distribution) {
            const labels = Object.keys(distribution);
            const values = Object.values(distribution);

            if (window.categoryChart) {
                window.categoryChart.destroy();
            }

            const ctx = document.getElementById('categoryDistributionChart').getContext('2d');
            window.categoryChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [{
                        data: values,
                        backgroundColor: [
                            'rgb(54, 162, 235)',
                            'rgb(255, 99, 132)',
                            'rgb(75, 192, 192)',
                            'rgb(255, 206, 86)'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        }

        // Function to update top products table
        function updateTopProductsTable(products) {
            const tbody = document.querySelector('.table-responsive:first-of-type tbody');
            tbody.innerHTML = '';

            products.forEach(product => {
                const row = document.createElement('tr');
                row.innerHTML = 
                    '<td>' + product.name + '</td>' +
                    '<td>' + product.exportQuantity + '</td>' +
                    '<td>' + formatCurrency(product.revenue) + '</td>' +
                    '<td><span class="' + (product.growth >= 0 ? 'trend-up' : 'trend-down') + '">' +
                    (product.growth >= 0 ? '+' : '') + product.growth + '%</span></td>';
                tbody.appendChild(row);
            });
        }

        // Function to update low stock alerts
        function updateLowStockTable(alerts) {
            const tbody = document.querySelector('.table-responsive:last-of-type tbody');
            tbody.innerHTML = '';

            alerts.forEach(alert => {
                const row = document.createElement('tr');
                row.innerHTML = 
                    '<td>' + alert.name + '</td>' +
                    '<td>' + alert.currentStock + '</td>' +
                    '<td>' + alert.minimumStock + '</td>' +
                    '<td><span class="badge ' + (alert.status === 'critical' ? 'bg-danger' : 'bg-warning') + '">' + 
                    (alert.status === 'critical' ? 'Cần bổ sung' : 'Sắp hết') + '</span></td>';
                tbody.appendChild(row);
            });
        }

        // Helper function to format currency
        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }

        // Helper function to format date
        function formatDate(dateString) {
            const date = new Date(dateString);
            return date.toLocaleDateString('vi-VN', {
                day: '2-digit',
                month: '2-digit'
            });
        }

        // Event listener for period select
        document.querySelector('select').addEventListener('change', function(e) {
            loadReportData(e.target.value);
        });

        // Initial load
        document.addEventListener('DOMContentLoaded', function() {
            loadReportData();
        });
    </script>
</body>
</html> 