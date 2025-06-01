
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="object.UserInf" %>
<%@ page import="object.User"%>
<%@ page import="object.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<% User user = (User) session.getAttribute("user");
    if (user != null) {



    }%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }


        .bg-blueblue-primary{

            background-color: #2e5f45;
        }
        .badge-danger{
            color: black;

        }
        .btn{
            background-color: #28a745;
            color: white;

        }
        .background-green{
            background-color: #2E5F45;
            color: white;
            font-style: oblique;

        }


        .updateUser {



            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 20px;
            cursor: pointer;
            margin-left: 44%;
            margin-top: 1%;
        }



        header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
        }

        .search-bar input {
            width: 80%;
            padding: 10px;
            margin-top: 10px;
            font-size: 16px;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;

        }

        .product-item {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 200px;
            padding: 15px;
            text-align: center;
            transition: transform 0.3s;
        }

        .product-item:hover {
            transform: scale(1.05);
        }

        .product-item img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .product-item h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .product-item .price {
            font-size: 16px;
            color: #e74c3c;
            margin-bottom: 15px;
        }

        .product-item .add-to-cart {
            background-color:#28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .product-item .add-to-cart:hover {
            background-color: #28a745;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }


        #productModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }

        #ProductModalContent {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #ddd;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        input[type="text"], input[type="email"] {
            width: 95%;
            padding: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 5px 10px;
            margin: 5px;
            cursor: pointer;
        }

        #productModal h3 {
            margin-top: 0;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"], input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        th{
            color: black;
        }



        .updateUser:hover{

            background-color: #00ff40;
            text-decoration:none ;
            color: white;
        }
    </style>

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">
    <base href="${pageContext.request.contextPath}/admin/">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-blueblue-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Bảng điều khiển</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Giao diện
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>Thành Phần</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Thành phần tùy chỉnh:</h6>
                    <a class="collapse-item" href="buttons.html">Buttons</a>
                    <a class="collapse-item" href="cards.html">Cards</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Tiện ích</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Utilities:</h6>
                    <a class="collapse-item" href="utilities-color.html">Màu</a>
                    <a class="collapse-item" href="utilities-border.html">Viền</a>
                    <a class="collapse-item" href="utilities-animation.html">Hiệu ứng</a>
                    <a class="collapse-item" href="utilities-other.html">khác</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Tiện ích bổ sung
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Trang</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Màn hình đăng nhập</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/signUp.jsp">Đăng ký</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/index/forgot-pass.jsp">Quên mật khẩu</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Trang khác:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>

        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Bảng</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Thông tin Bảng</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/table-admin-User">Quản lý người dùng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/table-admin-Product">Quản lý Sản Phẩm</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/order-table">Quản lý đơn hàng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/listPromotions">Quản lý giảm giá</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/LogManager">Quản lý Log</a>

                    <div class="collapse-divider"></div>

                </div>
            </div>

        </li>
        <!-- Nav Item - Charts -->
        <!-- <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Biểu đồ</span></a>
        </li> -->

        <!-- Nav Item - Tables -->



        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>



    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" id="search" onkeydown="searchUserInf()" placeholder="Tìm kiếm..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn" type="button" style="background-color: #28a745; color: white; z-index: 1;">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" onclick="searchUserInf()">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Trung tâm cảnh báo
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">Ngày 10 tháng 10 năm 2024</div>
                                    <span class="font-weight-bold">Báo cáo hàng tháng mới đã sẵn sàng để tải xuống!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">Ngày 27 tháng 10 năm 2024</div>
                                    290,29 đô la đã được gửi vào tài khoản của bạn!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">Ngày 2 tháng 11 năm 2024</div>
                                    Cảnh báo chi tiêu: Chúng tôi nhận thấy mức chi tiêu cao bất thường cho tài khoản của bạn.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Hiển thị tất cả cảnh báo</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Trung tâm tin nhắn
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Xin chào! Tôi tự hỏi liệu bạn có thể giúp tôi giải quyết
                                        vấn đề tôi đang gặp phải không.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58 phút</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                         alt="...">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Tôi có những bức ảnh bạn đã đặt hàng vào tháng trước, bạn muốn chúng được gửi đến bạn bằng cách nào?</div>
                                    <div class="small text-gray-500">Lê Tấn Thành · 1 ngày</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                         alt="...">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Báo cáo tháng trước trông tuyệt vời, tôi rất hài lòng với
                                        tiến độ cho đến nay, hãy tiếp tục làm việc tốt nhé!</div>
                                    <div class="small text-gray-500">Nguyễn Văn Thạnh · 2 ngày</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Tôi có phải là một chú chó ngoan không? Lý do tôi hỏi là vì có người
                                        nói với tôi rằng mọi người đều nói thế với tất cả các chú chó, ngay cả khi chúng không ngoan...</div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Đọc thêm tin nhắn</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= user.getFullName()%></span>

                            <img class="img-profile rounded-circle"
                                 src="img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Hồ sơ
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Cài đặt
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Nhật ký hoạt động
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="http://localhost:8080/WebMyPham__/login.jsp" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->

            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Bảng</h1>

                <div class="card shadow mb-4" style="display: flex; flex-direction: row; align-items: center;
                    text-align: center; justify-content: center; padding: 10px 20px;">

                    <button  onclick="showAddProductModal()" style="margin-right: 20px">Thêm</button>
                    <%--                    <button onclick="showModal()">Thêm Nhiều sản phẩm</button>--%>

                </div>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Bảng Product</h6>
                    </div>
                    <main> <section class="products">
                        <table id="productTables">
                            <thead >
                            <tr id="list-header">
                                <th  scope="col" class="background-green bold "> ID</th>
                                <th  scope="col" class="background-green bold "> Tên sản phẩm</th>
                                <th  scope="col" class="background-green bold" >Mã danh mục</th>
                                <th scope="col" class="background-green bold" > Giá</th>
                                <th scope="col" class="background-green bold" >Tồn kho</th>
                                <th scope="col" class="background-green bold" >Mô tả</th>
                                <th scope="col" class="background-green bold">URL Ảnh</th>
                                <th scope="col" class="background-green bold">Hành động</th>
                            </tr>

                            </thead>
                            <tbody id="productBody">
                            <!-- Dữ liệu người dùng sẽ được thêm vào bằng JavaScript -->
                            </tbody>
                        </table>
                    </section>
                    </main>
                    <div style="display: none">
                        <h3>Thêm nhiều người dùng</h3>
                        <button onclick="addUserRow()">Thêm hàng</button>
                        <button onclick="saveUsers()">Lưu tất cả</button>
                        <table id="userTable" border="1">
                            <thead>
                            <tr>
                                <th>>Tên sản phẩm:</th>
                                <th>Mã danh mục:</th>
                                <th>Giá:</th>
                                <th>Tồn kho:</th>
                                <th>Thao tác</th>
                                <th>URL Ảnh:</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Hàng sẽ được thêm ở đây -->
                            </tbody>
                        </table>
                    </div>

                    <!-- Modal thêm/sửa người dùng -->
                    <div id="productModal"> <div id="ProductModalContent">
                        <span class="close" onclick="hideModal()">&times;</span>

                        <h3 id="modalTitle">Thêm sản phẩm</h3>
                        <%--                        <label>ID:</label>--%>
                        <%--                        <input type="text" id="id">--%>
                        <label>Tên sản phẩm:</label>
                        <input type="text" id="productName">
                        <label>Mã danh mục:</label>
                        <input type="number" id="category">
                        <label>Giá:</label>
                        <input type="number" id="price">
                        <label>Tồn kho:</label>
                        <input type="text" id="stock">
                        <label>Mô tả:</label>
                        <textarea id="description"></textarea>
                        <label>URL Ảnh:</label> <input type="text" id="imageURL">
                        <button onclick="saveProduct()">Lưu</button>
                        <button onclick="hideModal()">Hủy</button>
                    </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->

                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>




            <%--                <% List<Product> products = (List<Product>) request.getAttribute("listProduct");--%>
            <%--        String productToJson =  new Gson().toJson(products);--%>
            <%--    %>--%>
            <script src="js/manageProduct.js">
                <%--const productsJs = <%= productToJson %>;--%>
                <%--console.log(productsJs);--%>
            </script>

            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
            <script>
                // let table = new DataTable('#productTables');
            </script>
            <!-- Page level custom scripts -->
            <script src="js/demo/datatables-demo.js"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

            <script>
                CKEDITOR.replace('description');
            </script>


</body>

</html>