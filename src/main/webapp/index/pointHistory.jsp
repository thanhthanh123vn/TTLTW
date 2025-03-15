<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/16/2025
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn hàng của tôi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pointHis.css">
    <link rel="icon" href="../image/logo.png" type="image/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>
<div id="web-service">
    <header class="header">

        <div class="top-banner">
            <p>22.10 Ưu Đãi Đỉnh Nóc & Giờ Vàng Deal Sốc - Duy Nhất Từ 11h Ngày 22.10 (Áp Dụng Online)</p>
        </div>
        <div class="header-main">
            <div class="logo-left">

                <a href="main.html">
                    <div class="logo">
                        <img src="../image/logo.png" alt="NThanh.vn">
                        <div class="logo-text">
                            <h3>TTT.vn</h3>
                            <span>Chất lượng thật - Giá trị thật</span>
                        </div>
                    </div>
                </a>

                <div class="search-bar">
                    <input type="text" placeholder="Tìm kiếm sản phẩm..." id="search-input">
                    <div class="search-notification">
                        <div class="notification-container">
                            <ul class="notifications">
                                <li>24-26.10 Halloween Cực Chất - Săn Deal Độc Nhất (Online Từ 12H)</li>
                                <li>Khai trương CN224 Q. Bình Tân, TP. HCM | Deal 2K (Chỉ 27/10)</li>
                                <li>Khai trương CN223 TP. Hội An, Quảng Nam | Deal 2K (Chỉ 27/10)</li>
                                <li>Mua Gì Cũng Rẻ - Dưới 99K</li>
                                <li>Giảm 200K/Gói Triệt Lông Diode Laser Cho HSSV Nữ</li>
                            </ul>
                        </div>


                        <!-- Phần danh mục và thương hiệu -->
                        <div class="category-brand-container">
                            <div class="category-title">
                                <span>Nước Hoa</span>
                            </div>

                            <div class="categories">
                                <div class="category-item">Trang Điểm Mặt</div>
                                <div class="category-item">Trang Điểm Môi</div>
                                <div class="category-item">Mặt Nạ</div>
                                <div class="category-item">Sữa Tắm</div>
                                <div class="category-item">Bộ Trang Điểm</div>
                                <div class="category-item">Vấn Đề Về Da</div>
                            </div>

                            <div class="brands">
                                <img src="https://media.hcdn.vn/brand/1593168007the-coc_img_150x75_766519_fit_center.jpg"
                                     alt="L'Oreal">
                                <img src="https://media.hcdn.vn//hsk/brandnaris-cosmetics-logo1716963318_img_150x75_766519_fit_center.jpg"
                                     alt="Skin Aqua">
                                <img src="https://media.hcdn.vn/hsk/brand/Sunplay-Skin-Aqua1662624548_img_150x75_766519_fit_center.jpg"
                                     alt="Eucerin">
                                <img src="https://media.hcdn.vn/hsk/brand/Sunplay-Skin-Aqua1662624548_img_150x75_766519_fit_center.jpg"
                                     alt="Klairs">
                                <img src="https://media.hcdn.vn//hsk/brandEucerin-logo1690282206_img_150x75_766519_fit_center.jpg"
                                     alt="Garnier">
                                <img src="https://media.hcdn.vn//hsk/brandSkin10041678681869_img_150x75_766519_fit_center.jpg"
                                     alt="Skin1004">
                                <img src="https://media.hcdn.vn/brand/1661766124cetaphil_img_150x75_766519_fit_center.jpg"
                                     alt="Judydoll">
                                <img src="https://media.hcdn.vn//hsk/brandHada-labo-logo1690282339_img_150x75_766519_fit_center.jpg"
                                     alt="Dove">
                            </div>
                        </div>
                    </div>
                    <button type="button" id="find-product">Tìm kiếm</button>
                </div>
            </div>
            <div class="float-right">
                <div class="header-icons">
                    <img src="https://hasaki.vn/images/graphics/icon_header_2.svg">
                    <div class="login-hover">
                        <a href="login.html" target="_blank" class="login">Đăng nhập/
                            <a href="signup.html" target="_blank">Đăng ký </br>Tài khoản &darr;</a>
                            <div class="login-box">
                                <h3>Đăng nhập với</h3>
                                <div class="social-login">
                                    <button class="facebook-login">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
                                             alt="Facebook logo">
                                        Facebook
                                    </button>
                                    <button class="google-login">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png"
                                             alt="Google logo">
                                        Google +
                                    </button>
                                </div>
                                <p>Hoặc đăng nhập với Nthanh.vn</p>
                                <button class="hasaki-login" onclick="window.location.href='login.html'">Đăng
                                    nhập
                                </button>
                                <p>Bạn chưa có tài khoản? <a href="login.html">ĐĂNG KÝ NGAY</a></p>
                            </div>

                        </a>
                    </div>
                    <div class="header-icon-sub">
                        <img src="https://hasaki.vn/images/graphics/icon_header_store.svg">
                        <a href="#" id="htch"> Hệ thống</br> cửa hàng</a>
                    </div>
                    <div class="header-icon-sub">
                        <img src="https://hasaki.vn/images/graphics/icon_header_3.svg">
                        <a href="#" id="htkh"> Hỗ trợ </br>khách hàng</a>
                    </div>
                    <div class="header-icon-sub">
                        <img src="https://hasaki.vn/images/graphics/icon_header_1.svg">

                        <a href="cartProduct.html" class="cart-icon"> Giỏ hàng <span class="cart-count">2</span></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-list-product">
            <nav class="navbar">
                <ul class="nav-menu">
                    <div class="paddig-hover">
                        <li id="sub-menu-hover"><a href="">☰ DANH MỤC</a></li>
                    </div>
                    <div id="sub-menu-web">
                        <div class="col-menu-cap1">
                            <div class="sub-item-menu">
                                <a href="#">Sức Khỏe - Làm Đẹp</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Mỹ Phẩm High-End</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Chăm Sóc Da Mặt</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Trang Điểm</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Chăm Sóc Tóc Và Da Đầu</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Chăm Sóc Cơ Thể</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Chăm Sóc Cá Nhân</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Nước Hoa</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Thực Phẩm Chức Năng</a>
                            </div>
                            <div class="sub-item-menu">
                                <a href="#">Dịch Vụ Trải Nghiệm</a>
                            </div>
                        </div>

                    </div>

                    <li><a href="#">HASAKI DEALS</a></li>
                    <li><a href="#">HOT DEALS</a></li>
                    <li><a href="#">THƯƠNG HIỆU</a></li>
                    <li><a href="#">HÀNG MỚI VỀ</a></li>
                    <li><a href="#">BÁN CHẠY</a></li>
                    <li><a href="#">CLINIC & SPA</a></li>
                </ul>
                <ul class="nav-right">
                    <li><a href="#">Tra cứu đơn hàng</a></li>
                    <li><a href="#">Tải ứng dụng</a></li>
                    <li><a href="#">Chọn khu vực của bạn</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="session">
        <div class="container">
            <div class="contentsss">
                <div class="body-left">
                    <div class="content-left">
                        <div class="content-icon">
                            <div class="avt">
                                <img src="https://hasaki.vn/images/graphics/account-full.svg">
                            </div>
                            <div class="name">
                                <strong>Chào bạn</strong>

                                <a href="https://hasaki.vn/customer/account/edit/">Chỉnh sửa tài khoản</a>
                            </div>
                        </div>
                        <div class="menu_profile">
                            <a href="qliUser.html" class="item_menu_profile ">Quản lý tài
                                khoản</a>
                            <a href="accumulationOfP.html" class="item_menu_profile active">TTT tích
                                điểm</a>
                            <a href="inforUser.html" class="item_menu_profile ">Thông tin tài
                                khoản</a>
                            <a href="qldonhang.html" class="item_menu_profile ">Đơn hàng
                                của tôi</a>
                            <a href="myBooking.html" class="item_menu_profile ">Booking của tôi</a>
                            <a href="#" class="item_menu_profile ">Sổ địa chỉ
                                nhận hàng</a>
                            <a href="spyt.html" class="item_menu_profile ">Danh sách yêu thích</a>
                            <a href="redeemProduct.html" class="item_menu_profile ">Mua lại</a>
                            <a href="q&a.html" class="item_menu_profile ">Hỏi đáp</a>
                        </div>
                    </div>
                </div>
                <div class="container-body-right">
                    <div class="available-Point">
                        <ul>
                            <li><img src="https://hasaki.vn//img/hsk/icon/icon_point.png" alt="xu"></li>
                            <li class="bolded">Điểm Khả Dụng</li>
                            <li id="point-Avai"><strong>0</strong></li>
                        </ul>
                    </div>
                    <div class="content-gifts">
                        <ul class="history-point">
                            <li class="bolded">Lịch sử tích điểm</li>
                            <li id="update-status">Đang được cập nhật</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="session-footer">
        <div class="container">
            <footer>
                <div class="footer-top">
                    <div class="footer-info">
                        <div class="footer-header">
                            <div class="info-item">
                                <img src="https://hasaki.vn/v3/images/icons/icon_footer_1.svg"
                                     alt="Thanh toán khi nhận hàng">
                                <p>Thanh toán </br>khi nhận hàng</p>
                            </div>
                            <div class="info-item">
                                <img src="https://hasaki.vn/v3/images/icons/icon_footer_2.svg"
                                     alt="Giao nhanh miễn phí 2H">
                                <p>Giao nhanh</br> miễn phí 2H</p>
                            </div>
                            <div class="info-item">
                                <img src="https://media.hcdn.vn/hsk/icons/icon_footer_3_200x200.png"
                                     alt="30 ngày đổi trả miễn phí">
                                <p>30 ngày đổi trả</br> miễn phí</p>
                            </div>
                            <div class="info-item">
                                <img src="https://hasaki.vn/v3/images/icons/icon_footer_4.svg"
                                     alt="Thương hiệu uy tín">
                                <p>Thương hiệu uy tín </br>theo yêu cầu</p>
                            </div>
                            <div class="contact-item">
                                <div class="icon">
                                    <img src="https://hasaki.vn/v3/images/icons/icons_hotline_kn.svg"
                                         alt="Khiếu nại, Góp ý">
                                    <p> Khiếu nại, Góp ý</p>
                                </div>
                                <button>1800 6310</button>
                            </div>
                            <div class="contact-item">
                                <div class="icon">
                                    <img src="https://hasaki.vn/v3/images/icons/icons_hotline_tv.svg"
                                         alt="Khiếu nại, Góp ý">
                                    <p> Tư Vấn</a>
                                </div>
                                <button>1800 6324</button>
                            </div>
                            <div class="contact-item">
                                <div class="icon">
                                    <img src="https://hasaki.vn/v3/images/icons/icon_timchinhanh.svg"
                                         alt="Khiếu nại, Góp ý">
                                    <p>Tìm chi nhánh</p>
                                </div>
                                <button>Hệ thống TTT</button>
                            </div>
                        </div>


                        <div class="contact-info">
                            <div class="hotline ">
                                <h3>Hỗ trợ khách hàng</h3>
                                <p>Hotline: <strong>1800 6324</strong> (miễn phí, 08-22h kể cả T7, CN)</p>
                                <p>Gửi câu hỏi thường gặp</p>
                                <p>Gửi yêu cầu hỗ trợ</p>
                                <p>Hướng dẫn đặt hàng</p>
                                <p>Phương thức vận chuyển</p>
                                <p>Chính sách đổi trả</p>
                            </div>
                            <div class="company-info">
                                <h3>Về TTT.vn</h3>
                                <p>Giới thiệu TTT.vn</p>
                                <p>Tuyển dụng</p>
                                <p>Các câu hỏi thường gặp</p>
                                <p>Hướng dẫn sử dụng</p>
                                <p>Liên hệ</p>
                            </div>

                            <div class="social-media">
                                <h3>Hợp tác và liên kết</h3>
                                <p><a href="#">https://TTT.vn/Clinic</a></p>
                                <div class="social-icons">
                                    <a href="https://www.facebook.com/" target="_blank"><img
                                            src="https://hasaki.vn/v3/images/icons/fb.svg" alt="Facebook"></a>
                                    <a><img src="https://hasaki.vn/v3/images/icons/icon_tiktok.svg"
                                            alt="Instagram"></a>
                                    <a><img src="https://hasaki.vn/v3/images/icons/instagram.svg"
                                            alt="TikTok"></a>

                                </div>
                                <div class="payment-methods">
                                    <h3>Thanh Toán</h3>
                                    <img src="https://hasaki.vn/v3/images/icons/mastercard.svg" alt="YouTube">
                                    <img src="https://hasaki.vn/v3/images/icons/visa.svg" alt="Visa">
                                    <img src="https://hasaki.vn/v3/images/icons/atm.svg" alt="ATM">
                                </div>

                            </div>
                            <div class="promo-section">
                                <h3>CẬP NHẬT THÔNG TIN KHUYẾN MÃI</h3>
                                <div class="promo-input">
                                    <input type="email" placeholder="email của bạn">
                                    <button>Đăng ký</button>
                                </div>
                                <div class="promo-download">
                                    <img src="../image/qrcode.png" alt="QR code">
                                    <div class="app-links">
                                        <img src="https://hasaki.vn/v3/images/icons/dl_apple.svg"
                                             alt="App Store">
                                        <img src="https://hasaki.vn/v3/images/icons/dl_google.svg"
                                             alt="Google Play">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="session-info">
                        <div class="about-section">
                            <h2>TTT.VN - CHẤT LƯỢNG THẬT - GIÁ TRỊ THẬT</h2>
                            <p>TTT.vn là hệ thống cửa hàng mỹ phẩm chính hãng và dịch vụ chăm sóc sắc đẹp chuyên
                                sâu
                                với hệ thống cửa hàng trải dài trên toàn quốc; và hiện đang là đối tác phân phối
                                chiến
                                lược tại thị trường Việt Nam của hàng loạt thương hiệu lớn như: <span
                                        class="highlight">La Roche-Posay, Eucerin, L'oreal, Bioderma, Klairs, Naris
                                    Cosmetics, Maybelline, Vichy, Skin1004, Cocoon, Australis, Cetaphil, Anessa,
                                    SVR,
                                    Paula's Choice, Some By Mi, B.O.M, Vaseline, Sunplay, Hada Labo, Selsun,
                                    Blossom,
                                    Acnes, Rohto, Silky Girl, Lancôme, Narciso Rodriguez, Senka, Naruko, Angel's
                                    Liquid,
                                    DHC, Simple, Bio-essence, Tsubaki, 3CE, BNBG, Laneige, Vacosi, Lemonade,
                                    Hatomugi,
                                    Avène, Silcot, Neutrogena, Garnier, Mediheal, Timeless, Curél,...</span></p>

                            <p>Với phương châm "<span class="highlight">Chất lượng thật - Giá trị thật</span>",
                                TTT.vn luôn nỗ lực không ngừng nhằm nâng cao chất lượng sản phẩm & dịch vụ để
                                khách
                                hàng có được những trải nghiệm mua sắm tốt nhất...</p>

                            <p>TTT.vn sở hữu đa dạng các mặt hàng từ cao cấp đến bình dân, đáp ứng mọi nhu cầu
                                của
                                khách hàng. Đặc biệt, tại Hasaki.vn luôn có đầy đủ mẫu thử của mỗi sản phẩm và
                                nhân
                                viên
                                tư vấn, giúp khách hàng dễ dàng chọn lựa và tăng trải nghiệm mua sắm.</p>

                            <p>Đối với khách hàng online, Hasaki.vn áp dụng GIAO NHANH 2H MIỄN PHÍ cho <span
                                    class="highlight">đơn hàng từ 90.000đ</span> tại các khu vực: Hồ Chí Minh -
                                Hà
                                Nội -
                                Hải Phòng - Pleiku - Cà Mau - Tây Ninh - Long An - Vĩnh Long...</p>

                            <p>Ngoài ra, Hasaki.vn còn có app Hasaki cung cấp cho khách hàng trải nghiệm mua sắm
                                online
                                nhanh chóng, tiện lợi cùng nhiều khuyến mãi hấp dẫn. Không chỉ vậy, khách hàng
                                còn
                                được
                                giảm ngay 5% khi nhập mã HASAKIAPP cho đơn hàng đầu tiên trên ứng dụng. Tải ngay
                                APP
                                Hasaki cho hệ điều hành IOS <a href="#">tại đây</a>, phiên bản cho hệ điều hành
                                Android
                                <a href="#">tại đây</a>.
                            </p>
                        </div>

                        <div class="info-section">
                            <div class="certification">
                                <h3>Được chứng nhận</h3>
                                <img src="https://hasaki.vn/images/graphics/bocongthuong_small.png"
                                     alt="Đã thông báo Bộ Công Thương">
                                <p>Bản quyền © 2016 Hasaki.vn<br>Công Ty cổ phần HASAKI BEAUTY & CLINIC<br>Giấy
                                    chứng
                                    nhận Đăng ký Kinh doanh số 0313612829 do Sở Kế hoạch và Đầu tư Thành phố Hồ
                                    Chí
                                    Minh
                                    cấp ngày 13/01/2016</p>
                            </div>
                            <div class="search-tags">
                                <h4>TOP TÌM KIẾM</h4>
                                <div class="tags">
                                    <span>Kem Chống Nắng</span>
                                    <span>Nước Tẩy Trang</span>
                                    <span>Kem Dưỡng Ẩm</span>
                                    <span>Sữa Rửa Mặt</span>
                                    <span>Bông Tẩy Trang</span>
                                    <span>Mặt Nạ</span>
                                    <span>LOREAL</span>
                                    <span>LA ROCHE POSAY</span>
                                    <span>Sữa Rửa Mặt SVR</span>
                                    <span>Son</span>
                                    <span>Kem Đánh Răng Median</span>
                                    <span>Kem Đánh Răng Marvis</span>
                                    <span>VASELINE</span>
                                    <span>Carslan</span>
                                    <span>sữa rửa mặt cetaphil</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="product-categories">
                        <h2>DANH MỤC SẢN PHẨM</h2>

                        <div class="category-column">
                            <h3>Mỹ Phẩm High-End</h3>
                            <p>Trang Điểm Cao Cấp | Chăm Sóc Da Mặt Cao Cấp | Chăm Sóc Tóc Cao Cấp | Gội đầu</p>
                        </div>

                        <div class="category-column">
                            <h3>Nước Hoa</h3>
                            <p>Nước Hoa Nữ | Nước Hoa Nam | Xịt Thơm Toàn Thân</p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Răng Miệng</h3>
                            <p>Bàn Chải Đánh Răng | Kem Đánh Răng | Nước Súc Miệng | Tăm Nước | Chỉ Nha Khoa |
                                Xịt
                                Thơm
                                Miệng</p>
                        </div>

                        <div class="category-column">
                            <h3>Thực Phẩm Chức Năng</h3>
                            <p>Hỗ Trợ Tiêu Hoá | Hỗ Trợ Tim Mạch | Hỗ Trợ Sức Khỏe | Bổ Gan | Giải Rượu | Dầu Cá
                                |
                                Bổ
                                Mắt | Hoạt Huyết | Dưỡng Não</p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Cá Nhân</h3>
                            <p>Băng Vệ Sinh | Khăn Giấy | Khăn Ướt | Khử Mùi | Làm Thơm Phòng | Dao Cạo Râu |
                                Bọt
                                Cạo
                                Râu | Miếng Dán Nóng | Máy Xông Hơi...</p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Da Mặt</h3>
                            <p>Tẩy Trang Mặt | Sữa Rửa Mặt | Tẩy Tế Bào Chết Da Mặt | Toner | Nước Cân Bằng Da |
                                Serum |
                                Tinh Chất...</p>
                        </div>

                        <div class="category-column">
                            <h3>Trang Điểm</h3>
                            <p>Kem Lót | Kem Nền | Phấn Nền | Phấn Nước Cushion | Che Khuyết Điểm | Má Hồng |
                                Phấn
                                Phủ...</p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Cơ Thể</h3>
                            <p>Sữa Tắm | Xà Phòng | Tẩy Tế Bào Chết Body | Dưỡng Thể | Dưỡng Da Tay | Chân |
                                Chống
                                Lão
                                Hóa Cơ Thể</p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Sức Khỏe</h3>
                            <p>Băng Dán Cá Nhân | Chống Muỗi | Khẩu Trang | Mặt Nạ Xông Hơi | Miếng Dán Nóng</p>
                        </div>

                        <div class="category-column">
                            <h3>Vấn Đề Về Da</h3>
                            <p>Da Dầu | Lỗ Chân Lông To | Da Khô | Mất Nước | Da Mụn | Da Nhạy Cảm | Kích Ứng |
                                Thâm...
                            </p>
                        </div>

                        <div class="category-column">
                            <h3>Chăm Sóc Tóc Và Da Đầu</h3>
                            <p>Dầu Gội | Dầu Xả | Dầu Gội Khô | Dầu Gội Xả 2in1 | Bộ Gội Xả | Tẩy Tế Bào Chết Da
                                Đầu...
                            </p>
                        </div>

                        <div class="category-column">
                            <h3>Hỗ Trợ Làm Đẹp</h3>
                            <p>Đặc Trị Làm Đẹp Da | Làm Đẹp Tóc | Hỗ Trợ Giảm Cân | Vitamin và Khoáng Chất</p>
                        </div>
                    </div>

            </footer>
        </div>
    </div>

    <script src="../js/updateUserMain.js"></script>
</body>

</html>