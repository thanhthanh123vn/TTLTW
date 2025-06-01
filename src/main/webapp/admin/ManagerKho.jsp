<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/2/2025
  Time: 12:07 AM
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
  <title>Quản Lý Kho</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <!-- DataTables CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
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
    .search-box {
      margin-bottom: 20px;
    }
    .action-buttons .btn {
      margin-right: 5px;
    }
    .status-badge {
      padding: 5px 10px;
      border-radius: 15px;
      font-size: 0.8em;
    }
    .status-in-stock {
      background-color: #28a745;
      color: white;
    }
    .status-low-stock {
      background-color: #ffc107;
      color: black;
    }
    .status-out-of-stock {
      background-color: #dc3545;
      color: white;
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
      <a href="#"><i class="fas fa-shopping-cart"></i> Xuất Kho</a>
      <a href="#"><i class="fas fa-chart-bar"></i> Báo Cáo</a>
      <a href="#"><i class="fas fa-cog"></i> Cài Đặt</a>
    </div>

    <!-- Main Content -->
    <div class="col-md-10 main-content">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Sản Phẩm</h2>
        <%-- Updated onclick to call showAddModal --%>
        <button class="btn btn-primary" onclick="showAddModal()">
          <i class="fas fa-plus"></i> Thêm Sản Phẩm
        </button>
      </div>

      <!-- Search and Filter -->
      <div class="row mb-4">
        <div class="col-md-6">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm..." id="searchInput">
            <button class="btn btn-outline-secondary" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
        <div class="col-md-6">
          <div class="d-flex justify-content-end">
            <select class="form-select w-auto me-2">
              <option value="">Tất cả loại</option>
              <%-- Populate categories from database if available --%>
              <c:if test="${not empty requestScope.categories}">
                <c:forEach var="category" items="${requestScope.categories}">
                  <option value="${category.CategoryID}">${category.CategoryName}</option>
                </c:forEach>
              </c:if>
            </select>
            <select class="form-select w-auto" id="statusFilter">
              <option value="">Tất cả trạng thái</option>
              <option value="Còn hàng">Còn hàng</option>
              <option value="Sắp hết">Sắp hết</option>
              <option value="Hết hàng">Hết hàng</option>
            </select>
          </div>
        </div>
      </div>

      <!-- Products Table -->
      <div class="table-responsive">
        <table class="table table-striped table-hover" id="productTable">
          <thead>
          <tr>
            <th>Mã SP</th>
            <th>Tên Sản Phẩm</th>
            <th>Loại</th>
            <th>Số Lượng</th>
            <th>Đơn Giá</th>
            <th>Trạng Thái</th>
            <th>Ngày Cập Nhật</th>
            <th>Thao Tác</th>
          </tr>
          </thead>
          <tbody id="productTableBody">
          <%-- Loop through the products fetched by the servlet --%>
          <c:forEach var="product" items="${requestScope.products}">
            <tr data-product-id="${product.id}"> <%-- Add data attribute for product ID --%>
              <td>${product.id}</td>
              <td>${product.name}</td>
              <td>${product.categoryName}</td>
              <td>${product.quantity}</td>
                <%-- Using fmt:formatNumber --%>
              <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></td>
              <td>
                  <%-- Display status badge based on quantity --%>
                <c:choose>
                  <c:when test="${product.quantity > 10}"> <%-- Example threshold, adjust as needed --%>
                    <span class="status-badge status-in-stock">Còn hàng</span>
                  </c:when>
                  <c:when test="${product.quantity > 0 && product.quantity <= 10}">
                    <span class="status-badge status-low-stock">Sắp hết</span>
                  </c:when>
                  <c:otherwise>
                    <span class="status-badge status-out-of-stock">Hết hàng</span>
                  </c:otherwise>
                </c:choose>
              </td>
                <%-- Using fmt:formatDate --%>
              <td><fmt:formatDate value="${product.updatedAt}" pattern="yyyy-MM-dd HH:mm"/></td>
              <td class="action-buttons">
                  <%-- Added onclick events --%>
                <button class="btn btn-sm btn-info edit-button" onclick="showEditModal(${product.id})"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger delete-button" onclick="deleteProduct(${product.id})"><i class="fas fa-trash"></i></button>
              </td>
            </tr>
          </c:forEach>
          <%-- Message if no products are available --%>
          <c:if test="${empty requestScope.products}">
            <tr>
              <td colspan="8" class="text-center text-muted">Không có sản phẩm nào trong kho.</td>
            </tr>
          </c:if>
          </tbody>
        </table>
      </div>

      <!-- Pagination -->
      <%-- Pagination logic will need backend implementation to handle different pages --%>
<%--      <nav aria-label="Page navigation" class="mt-4">--%>
<%--        <ul class="pagination justify-content-center">--%>
<%--          <li class="page-item disabled">--%>
<%--            <a class="page-link" href="#" tabindex="-1">Trước</a>--%>
<%--          </li>--%>
<%--          <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--          <li class="page-item">--%>
<%--            <a class="page-link" href="#">Sau</a>--%>
<%--          </li>--%>
<%--        </ul>--%>
<%--      </nav>--%>
    </div>
  </div>
</div>

<!-- Add/Edit Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <%-- Modal title will be updated by JavaScript --%>
        <h5 class="modal-title" id="productModalTitle">Thêm Sản Phẩm Mới</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <%-- Add a hidden input for product ID for editing --%>
        <input type="hidden" id="productId">
        <form id="productForm">
          <div class="mb-3">
            <label class="form-label">Mã Sản Phẩm</label>
            <%-- Made productCode read-only for edits --%>
            <input type="text" class="form-control" id="productCode" required readonly>
          </div>
          <div class="mb-3">
            <label class="form-label">Tên Sản Phẩm</label>
            <input type="text" class="form-control" id="productName" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Loại</label>
            <select class="form-select" id="category" required>
              <option value="">Chọn loại</option>
              <%-- Populate categories from database here as well --%>
              <c:if test="${not empty requestScope.categories}">
                <c:forEach var="category" items="${requestScope.categories}">
                  <option value="${category.CategoryID}">${category.CategoryName}</option>
                </c:forEach>
              </c:if>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">Số Lượng</label>
            <input type="number" class="form-control" id="quantity" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Đơn Giá</label>
            <input type="number" class="form-control" id="price" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Mô Tả</label>
            <textarea class="form-control" id="description" rows="3"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <%-- Updated onclick to call saveProduct --%>
        <button type="button" class="btn btn-primary" id="saveProductButton" onclick="saveProduct()">Lưu</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables JS -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<script>
  // Get the modal element and form inputs
  const productModalElement = document.getElementById('productModal');
  const productModal = new bootstrap.Modal(productModalElement);
  const productModalTitle = document.getElementById('productModalTitle');
  const productIdInput = document.getElementById('productId');
  const productCodeInput = document.getElementById('productCode');
  const productNameInput = document.getElementById('productName');
  const categoryInput = document.getElementById('category');
  const quantityInput = document.getElementById('quantity');
  const priceInput = document.getElementById('price');
  const descriptionInput = document.getElementById('description');
  const saveProductButton = document.getElementById('saveProductButton');
  const productTableBody = document.getElementById('productTableBody'); // Get the table body for potential dynamic updates

  // Initialize DataTables
  $(document).ready( function () {
    var table = $('#productTable').DataTable({
      "pagingType": "full_numbers",
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.11.5/i18n/Vietnamese.json"
      }
    });

    // Add status filter functionality
    $('#statusFilter').on('change', function() {
      var status = $(this).val();
      
      // Custom filtering function for status
      $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
        if (!status) return true; // Show all if no status selected
        
        var rowStatus = $(table.row(dataIndex).node()).find('.status-badge').text().trim();
        return rowStatus === status;
      });
      
      table.draw(); // Redraw the table with the filter
      
      // Remove the custom filter after drawing
      $.fn.dataTable.ext.search.pop();
    });
  } );

  // Function to show the Add Product modal
  function showAddModal() {
    productModalTitle.textContent = 'Thêm Sản Phẩm Mới';
    productIdInput.value = ''; // Clear product ID for add
    productCodeInput.value = '';
    productNameInput.value = '';
    categoryInput.value = '';
    quantityInput.value = '';
    priceInput.value = '';
    descriptionInput.value = '';
    productCodeInput.readOnly = false; // Allow editing code for new product
    saveProductButton.textContent = 'Lưu';
    productModal.show();
  }

  // Function to show the Edit Product modal and fetch data
  function showEditModal(productId) {
    productModalTitle.textContent = 'Chỉnh Sửa Sản Phẩm';
    productIdInput.value = productId; // Set product ID for edit
    productCodeInput.readOnly = true; // Prevent editing code for existing product
    saveProductButton.textContent = 'Cập Nhật';

    // Fetch product details from the server
    fetch('EditProduct?id=' + productId) // Send GET request to EditProductServlet
            .then(response => {
              if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
              }
              return response.json(); // Parse response as JSON
            })
            .then(data => {
              if (data.success) {
                const product = data.product;
                // Populate modal fields with data from the fetched product object
                productCodeInput.value = product.id; // Using ID as code based on schema
                productNameInput.value = product.name;
                categoryInput.value = product.categoryId; // Set select value by categoryId
                quantityInput.value = product.quantity;
                priceInput.value = product.price;
                descriptionInput.value = product.description || ''; // Use empty string if description is null

                productModal.show(); // Show the modal after populating data
              } else {
                alert('Lỗi khi tải thông tin sản phẩm: ' + data.message);
              }
            })
            .catch(error => {
              console.error('Error fetching product details:', error);
              alert('Đã xảy ra lỗi khi liên lạc với máy chủ để tải thông tin sản phẩm.');
            });
  }

  // Function to handle saving/updating a product
  function saveProduct() {
    const productId = productIdInput.value; // Will be empty for new product
    const productCode = productCodeInput.value; // Used as initial ID for new product (adjust if schema requires different code)
    const productName = productNameInput.value;
    const categoryId = categoryInput.value;
    const quantity = quantityInput.value;
    const price = priceInput.value;
    const description = descriptionInput.value;

    // Basic validation
    if (!productName || !categoryId || !quantity || !price) {
      alert('Vui lòng điền đầy đủ thông tin bắt buộc (Tên, Loại, Số lượng, Đơn giá).');
      return;
    }

    const productData = {
      id: productId || null, // Send null for new product
      // code: productCode, // code is not directly used for save/update in the current Servlet logic, using ID
      name: productName,
      categoryId: parseInt(categoryId), // Ensure categoryId is a number
      quantity: parseInt(quantity),   // Ensure quantity is a number
      price: parseFloat(price),       // Ensure price is a number
      description: description
    };

    console.log('Saving product:', productData);

    // Determine endpoint and method based on whether it's an add or update
    const url = 'EditProduct'; // Use the same servlet for add and update
    const method = 'POST'; // Use POST for both add and update

    fetch(url, {
      method: method,
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(productData), // Send data as JSON in the request body
    })
            .then(response => {
              if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
              }
              return response.json(); // Parse response as JSON
            })
            .then(data => {
              if (data.success) {
                alert(productId ? 'Cập nhật sản phẩm thành công!' : 'Thêm sản phẩm thành công!');
                productModal.hide(); // Hide the modal on success
                // Refresh the page to show the updated/added product
                window.location.reload();
              } else {
                alert('Lỗi khi lưu sản phẩm: ' + data.message);
              }
            })
            .catch((error) => {
              console.error('Error:', error);
              alert('Đã xảy ra lỗi khi liên lạc với máy chủ để lưu sản phẩm.');
            });
  }

  // Function to handle deleting a product
  function deleteProduct(productId) {
    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
      console.log('Deleting product with ID:', productId);

      // Send delete request to the server
      fetch('DeleteProduct?id=' + productId, { // Send POST request with ID parameter
        method: 'POST', // Or 'DELETE' if your servlet handles DELETE method
      })
              .then(response => {
                if (!response.ok) {
                  throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json(); // Parse response as JSON
              })
              .then(data => {
                if (data.success) {
                  alert('Xóa sản phẩm thành công!');
                  // Remove the row from the table dynamically without refreshing the page
                  const productRow = document.querySelector(`tr[data-product-id="${productId}"]`);
                  if (productRow) {
                    productTableBody.removeChild(productRow);
                  }
                  // Optionally refresh the page if dynamic removal is complex or fails
                  // window.location.reload();

                } else {
                  alert('Lỗi khi xóa sản phẩm: ' + data.message);
                }
              })
              .catch((error) => {
                console.error('Error:', error);
                alert('Đã xảy ra lỗi khi liên lạc với máy chủ để xóa sản phẩm.');
              });
    }
  }

  // Optional: Populate categories in the modal when it's shown (alternative to populating on page load)
  // productModalElement.addEventListener('show.bs.modal', function () {
  //    // Fetch categories if not already available or if you need to refresh them
  //    // This would involve another AJAX call or ensuring the categories are in requestScope on initial page load
  // });

</script>

<%-- <script src="js/manageProduct.js"></script> --%> <%-- Keep this if you have existing JS for modal/actions --%>
</body>
</html>