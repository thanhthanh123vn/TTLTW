<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhập Kho - Quản Lý Kho</title>
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
        .import-form {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .import-history {
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
        .remove-product {
            color: #dc3545;
            cursor: pointer;
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
            <a href="admin/ImportProduct.jsp"><i class="fas fa-truck"></i> Nhập Kho</a>
            <a href="#"><i class="fas fa-shopping-cart"></i> Xuất Kho</a>
            <a href="#"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
            <a href="#"><i class="fas fa-cog"></i> Cài Đặt</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <h2 class="mb-4">Nhập Kho</h2>

            <!-- Import Form -->
            <div class="import-form">
                <h4 class="mb-3">Thông Tin Nhập Kho</h4>
                <form id="importForm">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Mã Đơn Nhập</label>
                            <input type="text" class="form-control" value="NK001" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Ngày Nhập</label>
                            <input type="date" class="form-control" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Nhà Cung Cấp</label>
                            <select class="form-select" required>
                                <option value="">Chọn nhà cung cấp</option>
                                <option value="1">Công ty TNHH ABC</option>
                                <option value="2">Công ty XYZ</option>
                                <option value="3">Công ty DEF</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Ghi Chú</label>
                            <input type="text" class="form-control" placeholder="Nhập ghi chú nếu có">
                        </div>
                    </div>

                    <h5 class="mt-4 mb-3">Danh Sách Sản Phẩm</h5>
                    <div id="productList">
                        <!-- Product items will be added here -->
                        <div class="product-item">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <label class="form-label">Sản Phẩm</label>
                                    <select class="form-select product-select" required onchange="updatePrice(this)">
                                        <option value="">Chọn sản phẩm</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label">Số Lượng</label>
                                    <input type="number" class="form-control quantity-input" required min="1" onchange="calculateTotal(this)">
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label">Đơn Giá</label>
                                    <input type="number" class="form-control price-input" required readonly>
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
                                <input type="text" class="form-control" value="0 VNĐ" readonly>
                            </div>
                        </div>
                        <div class="col-md-6 text-end">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Lưu Phiếu Nhập
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Import History -->
            <div class="import-history">
                <h4 class="mb-3">Lịch Sử Nhập Kho</h4>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Mã Đơn</th>
                            <th>Ngày Nhập</th>
                            <th>Nhà Cung Cấp</th>
                            <th>Số Sản Phẩm</th>
                            <th>Tổng Tiền</th>
                            <th>Trạng Thái</th>
                            <th>Thao Tác</th>
                        </tr>
                        </thead>
                        <tbody id="importHistoryTable">
                            <!-- Data will be loaded here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Function to fetch products from server
    function fetchProducts() {
        fetch('${pageContext.request.contextPath}/ImportProduct')
            .then(response => response.json())
            .then(products => {
                const productSelects = document.querySelectorAll('.product-select');
                productSelects.forEach(select => {
                    // Clear existing options except the first one
                    while (select.options.length > 1) {
                        select.remove(1);
                    }

                    // Add new options
                    products.forEach(product => {
                        const option = document.createElement('option');
                        option.value = product.id;
                        option.textContent = product.name;
                        option.dataset.price = product.price;
                        select.appendChild(option);
                    });
                });
            })
            .catch(error => console.error('Error fetching products:', error));
    }

    // Function to add new product item
    function addProductItem() {
        const productList = document.getElementById('productList');
        const newItem = document.createElement('div');
        newItem.className = 'product-item';
        newItem.innerHTML = `
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <label class="form-label">Sản Phẩm</label>
                        <select class="form-select product-select" required onchange="updatePrice(this)">
                            <option value="">Chọn sản phẩm</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Số Lượng</label>
                        <input type="number" class="form-control quantity-input" required min="1" onchange="calculateTotal(this)">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Đơn Giá</label>
                        <input type="number" class="form-control price-input" required readonly>
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
        fetchProducts(); // Fetch products for the new select
    }

    // Function to update price when product is selected
    function updatePrice(select) {
        const row = select.closest('.row');
        const priceInput = row.querySelector('.price-input');
        const selectedOption = select.options[select.selectedIndex];
        if (selectedOption.value) {
            priceInput.value = selectedOption.dataset.price;
            calculateTotal(row.querySelector('.quantity-input'));
        } else {
            priceInput.value = '';
            row.querySelector('.total-input').value = '';
        }
    }

    // Function to calculate total
    function calculateTotal(input) {
        const row = input.closest('.row');
        const quantity = Number(input.value) || 0;
        const price = Number(row.querySelector('.price-input').value) || 0;
        const total = quantity * price;
        row.querySelector('.total-input').value = total.toLocaleString('vi-VN') + ' VNĐ';
        updateGrandTotal();
    }

    // Function to update grand total
    function updateGrandTotal() {
        const totals = document.querySelectorAll('.total-input');
        let grandTotal = 0;
        totals.forEach(input => {
            const value = input.value.replace(/[^\d.]/g, '');
            grandTotal += Number(value) || 0;
        });
        document.querySelector('input[value="0 VNĐ"]').value = grandTotal.toLocaleString('vi-VN') + ' VNĐ';
    }

    // Function to remove product item
    function removeProductItem(button) {
        const productItem = button.closest('.product-item');
        productItem.remove();
        updateGrandTotal();
    }

    // Function to load import history
    function loadImportHistory() {
        fetch('${pageContext.request.contextPath}/GetImportHistory')
            .then(response => response.json())
            .then(data => {
                const tbody = document.getElementById('importHistoryTable');
                tbody.innerHTML = ''; // Clear existing rows
                
                data.forEach(receipt => {
                    const row = document.createElement('tr');
                    row.innerHTML = '' +
                        '<td>' + receipt.receiptCode + '</td>' +
                        '<td>' + formatDate(receipt.importDate) + '</td>' +
                        '<td>' + receipt.supplierName + '</td>' +
                        '<td>' + receipt.totalProducts + '</td>' +
                        '<td>' + formatCurrency(receipt.totalAmount) + '</td>' +
                        '<td><span class="badge bg-success">Hoàn thành</span></td>' +
                        '<td>' +
                            '<button class="btn btn-sm btn-info" onclick="viewReceipt(' + receipt.id + ')">' +
                                '<i class="fas fa-eye"></i>' +
                            '</button>' +
                            '<button class="btn btn-sm btn-primary" onclick="printReceipt(' + receipt.id + ')">' +
                                '<i class="fas fa-print"></i>' +
                            '</button>' +
                        '</td>';
                    tbody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error loading import history:', error);
                alert('Đã xảy ra lỗi khi tải lịch sử nhập kho');
            });
    }
    // Function to handle form submission
    function handleSubmit(event) {
        event.preventDefault();

        // Get form data
        const receiptCode = document.querySelector('input[value="NK001"]').value;
        const importDate = document.querySelector('input[type="date"]').value;
        const supplierId = document.querySelector('select.form-select').value;
        const note = document.querySelector('input[placeholder="Nhập ghi chú nếu có"]').value;
        const totalAmountStr = document.querySelector('input[value="0 VNĐ"]').value.replace(/[^\\d.]/g, '');
        const totalAmount = Number(totalAmountStr);

        // Get all product items
        const productItems = document.querySelectorAll('.product-item');
        const details = [];

        productItems.forEach(item => {
            const productSelect = item.querySelector('.product-select');
            const quantityInput = item.querySelector('.quantity-input');
            const priceInput = item.querySelector('.price-input');

            if (productSelect.value && quantityInput.value && priceInput.value) {
                const quantity = Number(quantityInput.value);
                const price = Number(priceInput.value);

                if (!isNaN(quantity) && !isNaN(price)) {
                    details.push({
                        productId: Number(productSelect.value),
                        quantity: quantity,
                        price: price
                    });
                }
            }
        });

        // Validate form
        if (!importDate) {
            alert('Vui lòng chọn ngày nhập');
            return;
        }

        if (!supplierId) {
            alert('Vui lòng chọn nhà cung cấp');
            return;
        }

        if (details.length === 0) {
            alert('Vui lòng thêm ít nhất một sản phẩm');
            return;
        }

        // Prepare data for submission
        const formData = {
            receiptCode: receiptCode,
            importDate: importDate,
            supplierId: Number(supplierId),
            note: note,
            totalAmount: totalAmount,
            details: details
        };

        // Send data to server
        fetch('${pageContext.request.contextPath}/SaveImportReceipt', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                    // Clear form or redirect
                    window.location.reload();
                } else {
                    alert('Lỗi: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Đã xảy ra lỗi khi lưu phiếu nhập');
            });
    }
    // Function to format date
    function formatDate(dateString) {
        const date = new Date(dateString);
        return date.toLocaleDateString('vi-VN');
    }

    // Function to format currency
    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN') + 'đ';
    }

    // Function to view receipt details
    function viewReceipt(receiptId) {
        window.location.href = '${pageContext.request.contextPath}/ViewImportReceipt?id=' + receiptId;
    }

    // Function to print receipt
    function printReceipt(receiptId) {
        window.open('${pageContext.request.contextPath}/PrintImportReceipt?id=' + receiptId, '_blank');
    }

    // Initialize products and load import history when page loads
    document.addEventListener('DOMContentLoaded', function() {
        fetchProducts();
        loadImportHistory();
    });

    // Add form submit event listener
    document.getElementById('importForm').addEventListener('submit', handleSubmit);

    // Add event listener for the "Thêm Sản Phẩm" button
    document.getElementById('addProductBtn').addEventListener('click', addProductItem);

    // Use event delegation for dynamically added "Xóa" buttons
    document.getElementById('productList').addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-product-btn') || event.target.closest('.remove-product-btn')) {
            const button = event.target.closest('.remove-product-btn');
            removeProductItem(button);
        }
    });

</script>
</body>
</html> 