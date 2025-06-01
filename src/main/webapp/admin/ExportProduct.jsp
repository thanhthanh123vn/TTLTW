<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xuất Kho - Quản Lý Kho</title>
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
        .export-form {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .export-history {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .product-item {
            background: #f8f9fa;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .stock-warning {
            color: #dc3545;
            font-size: 0.8em;
            margin-top: 5px;
        }
        .stock-info {
            font-size: 0.8em;
            color: #6c757d;
            margin-top: 5px;
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
                <a href="#"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
                <a href="#"><i class="fas fa-cog"></i> Cài Đặt</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <h2 class="mb-4">Xuất Kho</h2>

                <!-- Export Form -->
                <div class="export-form">
                    <h4 class="mb-3">Thông Tin Xuất Kho</h4>
                    <form id="exportForm">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Mã Đơn Xuất</label>
                                <input type="text" class="form-control" value="XK001" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Ngày Xuất</label>
                                <input type="date" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Khách Hàng</label>
                                <select class="form-select" required>
                                    <option value="">Chọn khách hàng</option>
                                    <option value="1">Công ty TNHH ABC</option>
                                    <option value="2">Công ty XYZ</option>
                                    <option value="3">Công ty DEF</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Lý Do Xuất</label>
                                <select class="form-select" required>
                                    <option value="">Chọn lý do</option>
                                    <option value="sale">Bán hàng</option>
                                    <option value="transfer">Chuyển kho</option>
                                    <option value="return">Trả hàng</option>
                                    <option value="other">Khác</option>
                                </select>
                            </div>
                        </div>

                        <h5 class="mt-4 mb-3">Danh Sách Sản Phẩm</h5>
                        <div id="productList">
                            <!-- Product items will be added here -->
                            <div class="product-item">
                                <div class="row align-items-center">
                                    <div class="col-md-3">
                                        <label class="form-label">Sản Phẩm</label>
                                        <select class="form-select product-select" required>
                                            <option value="">Chọn sản phẩm</option>
                                            <%-- Product options will be loaded here by JavaScript --%>
                                        </select>
                                        <div class="stock-info">Tồn kho: <span class="stock-count">0</span></div>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="form-label">Số Lượng</label>
                                        <input type="number" class="form-control quantity-input" required min="1">
                                         <div class="stock-warning"></div>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="form-label">Đơn Giá</label>
                                        <input type="number" class="form-control price-input" required min="0">
                                    </div>
                                    <div class="col-md-2">
                                        <label class="form-label">Thành Tiền</label>
                                        <input type="text" class="form-control total-input" readonly>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="form-label">&nbsp;</label>
                                        <button type="button" class="btn btn-danger d-block w-100 remove-product-btn">
                                            <i class="fas fa-trash"></i> Xóa
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="button" class="btn btn-secondary mt-3" id="addProductBtn">
                            <i class="fas fa-plus"></i> Thêm Sản Phẩm
                        </button>

                        <div class="row mt-4">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Tổng Tiền</label>
                                    <input type="text" class="form-control" value="0 VNĐ" readonly id="grandTotalInput">
                                </div>
                            </div>
                            <div class="col-md-6 text-end">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Lưu Phiếu Xuất
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Export History -->
                <div class="export-history">
                    <h4 class="mb-3">Lịch Sử Xuất Kho</h4>
                    <div class="table-responsive">
                        <table class="table" id="exportHistoryTable">
                            <thead>
                                <tr>
                                    <th>Mã Đơn</th>
                                    <th>Ngày Xuất</th>
                                    <th>Khách Hàng</th>
                                    <th>Lý Do</th>
                                    <th>Số Sản Phẩm</th>
                                    <th>Tổng Tiền</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Export history data will be loaded here by JavaScript --%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let allProducts = []; // To store product data including stock

        // Function to fetch products with stock from server
        function fetchProducts() {
             fetch('${pageContext.request.contextPath}/ImportProduct') // You need to create this servlet
                .then(response => response.json())
                .then(products => {
                    allProducts = products; // Store fetched products
                    populateProductSelects(); // Populate existing and future selects
                })
                .catch(error => console.error('Error fetching products:', error));
        }

        // Function to populate product selects with fetched data
        function populateProductSelects() {
            const productSelects = document.querySelectorAll('.product-select');
            productSelects.forEach(select => {
                 // Clear existing options except the first one
                 while (select.options.length > 1) {
                     select.remove(1);
                 }

                 // Add new options from allProducts
                 allProducts.forEach(product => {
                     const option = document.createElement('option');
                     option.value = product.id;
                     option.textContent = product.name; // Assuming product object has a name property
                     option.dataset.stock = product.stockQuantity; // Assuming product object has stockQuantity
                     select.appendChild(option);
                 });
            });
        }

        // Function to add new product item row
        function addProductItem() {
            const productList = document.getElementById('productList');
            const newItem = document.createElement('div');
            newItem.className = 'product-item';
            newItem.innerHTML = `
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <label class="form-label">Sản Phẩm</label>
                        <select class="form-select product-select" required>
                            <option value="">Chọn sản phẩm</option>
                             <%-- Product options will be loaded here by JavaScript --%>
                        </select>
                        <div class="stock-info">Tồn kho: <span class="stock-count">0</span></div>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Số Lượng</label>
                        <input type="number" class="form-control quantity-input" required min="1">
                         <div class="stock-warning"></div>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Đơn Giá</label>
                        <input type="number" class="form-control price-input" required min="0">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Thành Tiền</label>
                        <input type="text" class="form-control total-input" readonly>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">&nbsp;</label>
                        <button type="button" class="btn btn-danger d-block w-100 remove-product-btn">
                            <i class="fas fa-trash"></i> Xóa
                        </button>
                    </div>
                </div>
            `;
            productList.appendChild(newItem);
            populateProductSelects(); // Populate the new select with fetched data
        }

        // Function to remove product item row
        function removeProductItem(button) {
            const productItem = button.closest('.product-item');
            productItem.remove();
            updateGrandTotal(); // Update total after removing item
        }

        // Function to update stock info when product selection changes
        function updateStockInfo(selectElement) {
            const row = selectElement.closest('.row');
            const selectedOption = selectElement.options[selectElement.selectedIndex];
            const stockCountSpan = row.querySelector('.stock-count');

            if (selectedOption.value) {
                 const stock = selectedOption.dataset.stock || 0;
                 stockCountSpan.textContent = stock;

                 // Also clear quantity and recalculate total for this row
                 const quantityInput = row.querySelector('.quantity-input');
                 quantityInput.value = '';
                 calculateTotal(quantityInput); // Recalculate total for this row

                 // Check stock for the cleared quantity (will remove validation message)
                 checkStock(quantityInput);

            } else {
                 stockCountSpan.textContent = '0';

                 // Clear quantity, price and total for this row
                 const quantityInput = row.querySelector('.quantity-input');
                 quantityInput.value = '';
                 const priceInput = row.querySelector('.price-input');
                 priceInput.value = '';
                 const totalInput = row.querySelector('.total-input');
                 totalInput.value = '';

                 // Remove any stock warning
                 const warning = row.querySelector('.stock-warning');
                 if (warning) { warning.textContent = ''; }
                 quantityInput.classList.remove('is-invalid');
                 priceInput.classList.remove('is-invalid');

                 updateGrandTotal(); // Update overall total
            }
        }

        // Function to check if quantity exceeds stock
        function checkStock(quantityInput) {
            const row = quantityInput.closest('.row');
            const selectElement = row.querySelector('.product-select');
             const selectedOption = selectElement.options[selectElement.selectedIndex];
            const stockCount = parseInt(selectedOption.dataset.stock) || 0;
            const quantity = parseInt(quantityInput.value) || 0;
            const warningDiv = row.querySelector('.stock-warning');

            if (quantity > stockCount) {
                quantityInput.classList.add('is-invalid');
                warningDiv.textContent = `Số lượng vượt quá tồn kho (${stockCount})`;
            } else {
                quantityInput.classList.remove('is-invalid');
                warningDiv.textContent = '';
            }
             calculateTotal(quantityInput); // Always recalculate total after quantity change
        }

        // Function to calculate total for a single row and update grand total
        function calculateTotal(inputElement) {
            const row = inputElement.closest('.row');
            const quantity = parseInt(row.querySelector('.quantity-input').value) || 0;
            const price = parseFloat(row.querySelector('.price-input').value) || 0;
            const total = quantity * price;
            row.querySelector('.total-input').value = total.toLocaleString('vi-VN') + ' VNĐ';
            updateGrandTotal();
        }

        // Function to update the grand total for the entire form
        function updateGrandTotal() {
            const totalInputs = document.querySelectorAll('.total-input');
            let grandTotal = 0;
            totalInputs.forEach(input => {
                const value = input.value.replace(/[^\d]/g, ''); // Remove non-digit characters for calculation
                grandTotal += parseFloat(value) || 0;
            });
            document.getElementById('grandTotalInput').value = grandTotal.toLocaleString('vi-VN') + ' VNĐ';
        }

        // Event listener for input changes in quantity and price fields
        document.addEventListener('input', function(e) {
            if (e.target.classList.contains('quantity-input')) {
                 checkStock(e.target);
            }
            if (e.target.classList.contains('quantity-input') || e.target.classList.contains('price-input')) {
                 calculateTotal(e.target);
            }
        });

        // Event listener for product select changes
        document.addEventListener('change', function(e) {
            if (e.target.classList.contains('product-select')) {
                 updateStockInfo(e.target);
            }
        });

        // Use event delegation for dynamically added "Xóa" buttons
        document.getElementById('productList').addEventListener('click', function(event) {
            if (event.target.classList.contains('remove-product-btn') || event.target.closest('.remove-product-btn')) {
                const button = event.target.closest('.remove-product-btn');
                removeProductItem(button);
            } else if (event.target.classList.contains('add-product-btn') || event.target.closest('.add-product-btn')) {
                 // Handle add product button click if needed via delegation (optional here as we have ID)
            }
        });

        // Event listener for the initial "Thêm Sản Phẩm" button
        document.getElementById('addProductBtn').addEventListener('click', addProductItem);

        // Initial fetch products when the page loads
        document.addEventListener('DOMContentLoaded', function() {
            fetchProducts();
            // You will also need a function here to load export history
            // loadExportHistory();
        });

        // Form submission handler
        document.getElementById('exportForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validate form
            if (!validateForm()) {
                return;
            }

            // Collect form data
            const formData = {
                customerId: document.querySelector('select[name="customerId"]').value,
                reason: document.querySelector('select[name="reason"]').value,
                note: document.querySelector('textarea[name="note"]').value,
                totalAmount: parseFloat(document.getElementById('grandTotalInput').value.replace(/[^\d]/g, '')),
                details: []
            };

            // Collect product details
            document.querySelectorAll('.product-item').forEach(item => {
                const productSelect = item.querySelector('.product-select');
                const quantityInput = item.querySelector('.quantity-input');
                const priceInput = item.querySelector('.price-input');
                const totalInput = item.querySelector('.total-input');

                if (productSelect.value && quantityInput.value && priceInput.value) {
                    formData.details.push({
                        productId: parseInt(productSelect.value),
                        quantity: parseInt(quantityInput.value),
                        price: parseFloat(priceInput.value),
                        total: parseFloat(totalInput.value.replace(/[^\d]/g, ''))
                    });
                }
            });

            // Send data to server
            fetch('${pageContext.request.contextPath}/SaveExportReceipt', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Lưu phiếu xuất thành công!');
                    // Clear form
                    document.getElementById('exportForm').reset();
                    // Remove all product items except the first one
                    const productList = document.getElementById('productList');
                    while (productList.children.length > 1) {
                        productList.removeChild(productList.lastChild);
                    }
                    // Reset totals
                    updateGrandTotal();
                    // Reload export history
                    loadExportHistory();
                } else {
                    alert('Lỗi: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Có lỗi xảy ra khi lưu phiếu xuất!');
            });
        });

        // Form validation function
        function validateForm() {
            const customerSelect = document.querySelector('select[name="customerId"]');
            const reasonSelect = document.querySelector('select[name="reason"]');
            const productItems = document.querySelectorAll('.product-item');
            
            if (!customerSelect.value) {
                alert('Vui lòng chọn khách hàng!');
                return false;
            }
            
            if (!reasonSelect.value) {
                alert('Vui lòng chọn lý do xuất!');
                return false;
            }
            
            let hasValidProduct = false;
            productItems.forEach(item => {
                const productSelect = item.querySelector('.product-select');
                const quantityInput = item.querySelector('.quantity-input');
                const priceInput = item.querySelector('.price-input');
                
                if (productSelect.value && quantityInput.value && priceInput.value) {
                    hasValidProduct = true;
                }
            });
            
            if (!hasValidProduct) {
                alert('Vui lòng thêm ít nhất một sản phẩm!');
                return false;
            }
            
            return true;
        }

        // Function to load export history
        function loadExportHistory() {
            fetch('${pageContext.request.contextPath}/GetExportHistory')
                .then(response => response.json())
                .then(data => {
                    const tbody = document.querySelector('#exportHistoryTable tbody');
                    tbody.innerHTML = '';
                    
                    data.forEach(receipt => {
                        const row = document.createElement('tr');
                        const exportDate = new Date(receipt.exportDate);
                        const formattedDate = exportDate.toLocaleDateString('vi-VN', {
                            year: 'numeric',
                            month: '2-digit',
                            day: '2-digit',
                            hour: '2-digit',
                            minute: '2-digit'
                        });
                        
                        // Create cells using string concatenation instead of template literals
                        row.innerHTML = 
                            '<td>XK' + receipt.id + '</td>' +
                            '<td>' + formattedDate + '</td>' +
                            '<td>' + (receipt.customerName || 'N/A') + '</td>' +
                            '<td>' + formatReason(receipt.reason) + '</td>' +
                            '<td>' + (receipt.totalProducts || 0) + '</td>' +
                            '<td>' + formatCurrency(receipt.totalAmount) + '</td>' +
                            '<td><span class="badge bg-success">Hoàn thành</span></td>' +
                            '<td>' +
                                '<div class="btn-group" role="group">' +
                                    '<button type="button" class="btn btn-sm btn-info" onclick="viewReceipt(' + receipt.id + ')" title="Xem chi tiết">' +
                                        '<i class="fas fa-eye"></i>' +
                                    '</button>' +
                                    '<button type="button" class="btn btn-sm btn-primary" onclick="printReceipt(' + receipt.id + ')" title="In phiếu">' +
                                        '<i class="fas fa-print"></i>' +
                                    '</button>' +
                                '</div>' +
                            '</td>';
                        tbody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Error loading export history:', error);
                    const tbody = document.querySelector('#exportHistoryTable tbody');
                    tbody.innerHTML = 
                        '<tr>' +
                            '<td colspan="8" class="text-center text-danger">' +
                                '<i class="fas fa-exclamation-circle"></i> Không thể tải dữ liệu. Vui lòng thử lại sau.' +
                            '</td>' +
                        '</tr>';
                });
        }

        // Helper function to format currency
        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }

        // Helper function to format reason
        function formatReason(reason) {
            const reasons = {
                'sale': 'Bán hàng',
                'transfer': 'Chuyển kho',
                'return': 'Trả hàng',
                'other': 'Khác'
            };
            return reasons[reason] || reason;
        }

        // View receipt function
        function viewReceipt(id) {
            window.location.href = '${pageContext.request.contextPath}/ViewExportReceipt?id=' + id;
        }

        // Print receipt function
        function printReceipt(id) {
            window.open('${pageContext.request.contextPath}/PrintExportReceipt?id=' + id, '_blank');
        }

        // Initial load of export history
        document.addEventListener('DOMContentLoaded', function() {
            fetchProducts();
            loadExportHistory();
        });

    </script>
</body>
</html> 