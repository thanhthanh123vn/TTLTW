<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hỗ trợ khách hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/htkh.css">

    <link rel="icon" href="../image/logo.png" type="image/x-icon">
</head>

<body>
<div id="supper-center">
    <header class="header" id="wrapper-header">
        <div class="container">
            <a href="main.html">
                <div class="logo">
                    <img src="../image/logofull.png">
                </div>
            </a>
            <div class="columns">
                <div class="logo-right">
                    <a href="/lien-he.html">Gửi yêu cầu</a>
                    <span>|</span>
                    <a href="login.html">Đăng nhập</a>
                </div>
            </div>
        </div>

    </header>
    <div class="header" id="block_banner_page">
        <div class="container">
            <div class="block-banner-support with-comom">
                <h1 class="slogan text-center">Xin chào! Chúng tôi có thể giúp gì cho bạn?</h1>
                <div class="w-100 center mb-3">
                    <div class="block-search-support">
                        <form action="main.html">
                            <input type="text" name="search"
                                   placeholder="Nhập từ khóa để tìm sản phẩm, thương hiệu bạn mong muốn. Ví dụ: TTT">
                            <button class="btn-search">
                                <img src="https://hotro.hasaki.vn/images/graphics/icon_search.svg">
                            </button>
                        </form>
                    </div>
                </div>
                <div class="mt-2">
                    <div class="flex-center">
                        <div class="block-kn">
                                    <span>
                                        <img src="https://hotro.hasaki.vn/images/graphics/icon_block_search_01.svg">
                                        <p>1800 6310 (Khiếu nại, góp ý)</p>
                                    </span>

                        </div>
                        <div class="box-tv">
                                    <span>
                                        <img src="https://hotro.hasaki.vn/images/graphics/icon_block_search_02.svg">
                                        <p>1800 6324 (Tư vấn)</p>
                                    </span>
                        </div>
                        <div class="box-chat">
                                    <span class="sub-chat">
                                        <img src="https://hotro.hasaki.vn/images/graphics/icon_block_search_03.svg">Chat
                                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="session-body" class="main-content">
        <div class="container">

            <div class="rows1">
                <div class="item-logo">
                    <div class="col" onclick="window.location.href='changePwUser.html'">
                        <div class="img-logo">
                            <span class="icon-slogan icon-1">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Tài khoản</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col" onclick="window.location.href='cartProduct.html'">
                        <div class="img-logo">
                            <span class="icon-slogan icon-2">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Đặt hàng</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-3">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Quy cách đóng gói</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-4">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Vận chuyển 24h</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-5">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Phí vận chuyển</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-6">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Đổi trả, hoàn tiền</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-7">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Dịch vụ</div>

                    </div>
                </div>
                <div class="item-logo">
                    <div class="col">
                        <div class="img-logo">
                            <span class="icon-slogan icon-8">&nbsp;</span>
                        </div>
                        <div class="txt-logo">Tuyển dụng</div>

                    </div>
                </div>
            </div>
        </div>


    </div>
    <div id="cauhoi" class="with-comom-1">
        <h1 class="title-content with-comom-1">Câu hỏi thường gặp</h1>
        <div class="list-cauhoi with-comom-1">
            <div class="left">
                <div class="item-cauhoi">
                    <a href="https://hotro.hasaki.vn/tai-khoan.html#div_dang_ky_thanh_vien_hasaki">Đăng ký thành viên
                        TTT như thế nào?</a>
                </div>
                <div class="item-cauhoi">
                    <a href="https://hotro.hasaki.vn/dich-vu-spa.html#div_co_can_dat_lich_truoc">Có cần đặt lịch trước
                        khi đến Sapa không?</a>
                </div>
                <div class="item-cauhoi">
                    <a href="">Tại sao tôi không thể đăng nhập vào tài khoản của tôi?</a>
                </div>
            </div>
            <div class="right">
                <div class="item-cauhoi">
                    <a href="">Có cần đặt lịch trước khi đến spa hay không?</a>
                </div>
                <div class="item-cauhoi">
                    <a href="">Đặt dịch vụ như thế nào?</a>
                </div>
                <div class="item-cauhoi">Khám da tại spa TTT có tốn phí hay không?</div>
            </div>
        </div>
    </div>
    <div id="thongtin-hotro" class="with-comom-1">
        <h1 class="title-content with-comom-1">Thông tin hỗ trợ</h1>
        <div class="list-cauhoi with-comom-1">
            <div class="item-cauhoi">
                <p>Giới thiệu TTT</p>
                <p>Hướng dẫn đặt hàng 2H</p>
                <p>Chính sách vận chuyển giao nhận</p>
            </div>
            <div class="item-cauhoi">
                <p>Khách hàng thân thiết</p>
                <p>Hướng dẫn thanh toán trực tuyến</p>
                <p>Điều khoản sử dụng</p>
            </div>
            <div class="item-cauhoi">
                <p>Hướng dẫn đổi quà</p>
                <p>Thẻ quà tặng Got It</p>
                <p>Chính sách bảo mật</p>
            </div>
            <div class="item-cauhoi">
                <p>Hướng dẫn đặt hàng</p>
                <p>Phiếu mua hàng</p>
                <p>Hướng dẫn tải & sử dụng App TTT</p>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="rows">
            <div class="row-left">
                <img src="data:image/jpeg;base64,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"></a>
            </div>
            <div class="row-right">
                <div class="rows-main">
                    <div class="col-1">
                        <ul class="footer-link">
                            <li>
                                <h4 class="hotro">HỖ TRỢ KHÁCH HÀNG</h4>
                            </li>
                            <li>
                                <span class="txt">Hotline: 1800 1551 (miễn phí)</span>
                                <span class="txt">Mỹ phẩm: 08:00-22:00></span>
                                <span class="txt">Clinic & Spa: 09:00 - 20:00</span>
                            </li>
                            <li class="nav-item">
                                <a href="/tai-khoan.html" class="txt-link">Các câu hỏi thường gặp</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Gửi yêu cầu hỗ trợ</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Hướng dẫn đặt hàng</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Phương thức vận chuyển</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Chính sách đổi trả</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-2">
                        <ul class="footer-link">
                            <li>
                                <h4>VỀ TTT.VN</h4>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Phiếu mua hàng</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Giới thiệu TTT.vn</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Tuyển dụng</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Chính sách bảo mật</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Điều khoản sử dụng</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Liên hệ</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Vị trí cửa hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul class="footer-link">
                            <li>
                                <h4>HỢP TÁC & LIÊN KẾT</h4>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">TTT Clinic & Spa</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">TTT cẩm nang</a>
                            </li>
                        </ul>
                        <ul class="footer-link">
                            <li>
                                <h4>TẢI ỨNG DỤNG</h4>
                            </li>
                            <li>
                                <div class="app">
                                    <div class="qr-code">
                                        <img src="https://hotro.hasaki.vn/images/graphics/QRCode_App.png">
                                    </div>
                                    <div class="qr-app">
                                        <img src="https://hotro.hasaki.vn/images/graphics/img_app_store.jpg">
                                        <img src="https://hotro.hasaki.vn/images/graphics/img_google_play.jpg">
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>