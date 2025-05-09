<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Cửa Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/htch.css">
    <link rel="icon" href="image/logo.png" type="image/x-icon">
</head>
<body>
<div id="support-center">
    <header class="with-comom" id="wrapper-header">
        <div class="container">
            <div class="logo">
                <img src="images/logo.png" alt="NThanh.vn">
                <div class="logo-text">
                    <h3>TTT.vn</h3>
                    <span>Chất lượng thật - Giá trị thật</span>
                </div>
            </div>
            <div class="columns">
                <div class="logo-right">
                    <a href="/lien-he.html">Gửi yêu cầu</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                </div>
            </div>
        </div>
    </header>
    <div class="with-comom" id="block_banner_page">
        <div class="container">
            <div class="block-banner-support with-comom">
                <h1 class="slogan text-center">Xin chào! Chúng tôi có thể giúp gì cho bạn?</h1>
                <div class="w-100 center mb-3">
                    <div class="block-search-support">
                        <form action="https://hasaki.vn/catalogsearch/result/">
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
    <div class="container">
        <div class="break with-comom">
            <a href="${pageContext.request.contextPath}/products">Trang chủ</a>
            <a href="main.html" class="active">Hệ Thống Cửa Hàng TTT Trên Toàn Quốc</a>
        </div>
    </div>
    <div class="main-page with-comom">
        <div class="row">
            <div class="col-lg-2 col-md-3 hiden-xs hiden-sm">
                <div class="menu-col-left with-comom block-menu-col-left">
                    <div class="block-menu-col-left with-comom">
                        <div class="item-menu-support">
                            <span div class="item-menu icon-1"></span>
                            <a href="/taikhoan.html">Tài khoản</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-8"></span>
                            <a href="/dat-hang.html">Đặt hàng</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-2"></span>
                            <a href="/quy-cach-dong-goi.html">Quy cách đóng gói</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-3"></span>
                            <a href="/van-chuyen-24h.html">Vận chuyển</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-4"></span>
                            <a href="/phi-van-chuyen-24h.html">Phí vận chuyểnn</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-5"></span>
                            <a href="/doi-tra-hoan-tirn.html">Đổi trả hoàn tiền</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-6"></span>
                            <a href="/dich-vu-Spa.html">Dịch vụ Spa</a>
                        </div>
                        <div class="item-menu-support">
                            <span div class="item-menu icon-8"></span>
                            <a href="/viec-lam.html">Tuyển dụng</a>
                        </div>
                    </div>
                    <div class="bloack-info with-comom ">
                        <h2 class="title-support with-comom ">Thông tin hỗ trợ</h2>
                        <div class="=item-menu-support">
                            <a href="/gioi-thieu.html">Giới thiệu TTT</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/lien-he.html">Liên hệ</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/he-thong-cua-hang.html">Hệ thống cửa hàng TTT trên toàn quốc</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/huong-dan-dat-hang.html">Hướng dẫn đặt hàng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/huong-dan-dat-hang-24h.html">Hướng dẫn đặt hàng 24H</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/phuong-thuc-thanh-toan.html">Phương thức thanh toán</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/quy-trinh-giao-hang.html">Chính sách vận chuyển giao hàng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/tri-an-khach-hang.html">Khách hàng thân thiết</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/tich-diem-doi-qua.html">Tích điểm đổi quà</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/huong-dan-doi-qua.html">Hướng dẫn đổi quà</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/chuong-trinh-tang-qua-tri-an-khach-hang.html">Hướng dẫn nhận quà tri ân khách
                                hàng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/the-qua-tang-mobil-git.html">Thẻ quà tặng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/phieu-mua-hang.html">Phiếu mua hàng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/dieu-khoan-su-dung.html">Điều khoản sử dụng</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/chinh-sach-bao-mat.html">Chính sách bảo mật</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/chinh-sach-cookie.html">Chính sách cookiet</a>
                        </div>
                        <div class="=item-menu-support">
                            <a href="/quy-dinh-giao-dich.html">Quy định giao dịch</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="body-center">
                <div id="page-hethong" class="with-comom-a">
                    <div class="banner-hethong with-comom space-bottom-20">
                        <img src="	https://hotro.hasaki.vn/files/banner/banner-he-thong-cua-hang-hasaki-17102024-v2.jpg"
                             alt="" width="1040" height="300">
                    </div>
                    <div class="block-search-hethong width-common space-bottom-20">
                        <div class="row">
                            <div class="box-1 province_box"><select id="province" class="form-control">
                                <option value="0">Chọn tỉnh/thành phố</option>
                                <option value="512">Hồ Chí Minh</option>
                                <option value="513">Hà Nội</option>
                                <option value="641">Đồng Nai</option>
                                <option value="633">Bình Dương</option>
                                <option value="626">Bà Rịa Vũng Tàu</option>
                                <option value="624">Cần Thơ</option>
                                <option value="655">Kiên Giang</option>
                                <option value="680">Tiền Giang</option>
                                <option value="514">Đà Nẵng</option>
                                <option value="638">Đắk Lắk</option>
                                <option value="631">Bến Tre</option>
                                <option value="679">Thừa Thiên Huế</option>
                                <option value="681">Trà Vinh</option>
                                <option value="654">Khánh Hòa</option>
                                <option value="642">Đồng Tháp</option>
                                <option value="629">Bạc Liêu</option>
                                <option value="625">An Giang</option>
                                <option value="658">Lâm Đồng</option>
                                <option value="635">Bình Thuận</option>
                                <option value="683">Vĩnh Long</option>
                                <option value="661">Long An</option>
                                <option value="675">Tây Ninh</option>
                                <option value="636">Cà Mau</option>
                                <option value="643">Gia Lai</option>
                                <option value="649">Hải Phòng</option>
                                <option value="634">Bình Phước</option>
                                <option value="663">Nghệ An</option>
                                <option value="632">Bình Định</option>
                                <option value="678">Thanh Hóa</option>
                                <option value="665">Ninh Thuận</option>
                                <option value="670">Quảng Ngãi</option>
                                <option value="667">Phú Yên</option>
                                <option value="677">Thái Nguyên</option>
                                <option value="673">Sóc Trăng</option>
                                <option value="630">Bắc Ninh</option>
                                <option value="669">Quảng Nam</option>
                                <option value="656">Kon Tum</option>
                                <option value="647">Hà Tĩnh</option>
                                <option value="650">Hậu Giang</option>
                                <option value="672">Quảng Trị</option>
                                <option value="639">Đắk Nông</option>
                                <option value="668">Quảng Bình</option>
                            </select>
                            </div>
                            <div class="box-1 district_box"><select id="district" class="form-control">
                                <option value="0">Chọn quận/huyện</option>
                            </select>
                            </div>
                            <div class="col-lg-4 is_spa_box"><select id="is_spa" class="form-control">
                                <option value="0">Tất cả chi nhánh Hasaki</option>
                                <option value="1">Chi nhánh có Clinic &amp; Spa</option>
                            </select>
                            </div>
                        </div>
                    </div>
                    <div id="block-hethong-v2" class="width_common space_bottom_20">
                        <div class="row">
                            <div class="col-lg-11 col-sm-6 col-xs-12 stores_box">
                                <div class="hethong_col_left width_common">
                                    <div class="title_hethong_coleft width_common"><img
                                            src="https://hotro.hasaki.vn	https://hotro.hasaki.vn/images/graphics/icon_map_maker.svg"
                                            alt=""> <span id="total_store">Có 103 cửa hàng TTT trên toàn quốc</span>
                                    </div>
                                    <div class="list_search_hethong width_common">
                                        <div class="item_search_hethong width_common relative">
                                            <div class="title_item_thethong">
                                                CN 1: 71 Hoàng Hoa Thám, P.13, Q.Tân Bình, TP.HCM <span
                                                    class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                        SPA)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 2: 555 Đường 3 Tháng 2, P.8, Q.10, TP.HCM <span class="txt_color_2"
                                                                                           style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 3: 176 Phan Đăng Lưu, P.3, Q.Phú Nhuận, TP.HCM <span class="txt_color_2"
                                                                                                style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 4: 94 Lê Văn Việt, P.Hiệp Phú, Q.9, TP.HCM <span class="txt_color_2"
                                                                                            style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 5: 119-121 Nguyễn Gia Trí (D2 cũ), P.25, Q.Bình Thạnh, TP.HCM <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 6: 657B Quang Trung, P.11, Q.Gò Vấp, TP.HCM <span class="txt_color_2"
                                                                                             style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 7: 468A Nguyễn Thị Thập, P.Tân Quy, Q.7, TP.HCM <span class="txt_color_2"
                                                                                                 style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 8: 447 Phan Văn Trị, P.5, Q.Gò Vấp, TP.HCM
                                        <span class="txt_color_2"
                                              style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 9: 6M-6M1 Nguyễn Ảnh Thủ, P.Trung Mỹ Tây, Q.12, TP.HCM <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 10: 304 Lê Văn Quới, P.Bình Hưng Hoà A, Q.Bình Tân, TP.HCM<span class="txt_color_2"
                                                                                                           style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 11: 104A Lê Trọng Tấn, P.Tây Thạnh, Q.Tân Phú, TP.HCM<span class="txt_color_2"
                                                                                                      style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 12: 141A-143 Nguyễn Trãi, P.2, Q.5, TP.HCM <span class="txt_color_2"
                                                                                            style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 13: 81 Hồ Tùng Mậu, P.Bến Nghé, Q.1, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 14: 48 Lê Văn Sỹ, P.11, Q.Phú Nhuận, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 15: 15 Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 16: 182 Cầu Giấy, P.Quan Hoa, Q.Cầu Giấy, Hà Nội <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 17: 94 Đường Hậu Giang, P.6, Q.6, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 18: 223 Đường Khánh Hội, P.3, Q.4, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 20: 50 Phạm Văn Chiêu, P.8, Q.Gò Vấp, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 21: 220 Tân Hương, P.Tân Quý, Q.Tân Phú, TP.HCM <span class="txt_color_2"
                                                                                                 style="font-weight: 700;">(Có CLINIC &amp; SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 22: 109 Đường Nguyễn Duy Trinh, P.Bình Trưng Tây, Q.2, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 23: 28 Phan Huy Ích, P.15, Q.Tân Bình, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 24: 441 Quốc Lộ 50, Xã Bình Hưng, H.Bình Chánh, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 25: 56 Nguyễn Thị Tú, P.Bình Hưng Hoà B, Q.Bình Tân, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 26: 631 Tỉnh Lộ 10, Khu Phố 2, P.Bình Trị Đông B, Q.Bình Tân, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 27: 36A/5 Nguyễn Ảnh Thủ, Khu phố 2, P.Hiệp Thành, Q.12, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 28 : 256 Đỗ Xuân Hợp, Khu phố 4, P.Phước Long A, Q.9, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 29: 420 Huỳnh Tấn Phát, P.Bình Thuận, Q.7, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 30: 36/6 Phan Văn Hớn, Bà Điểm, Hóc Môn, Tp. Hồ Chí Minh, Xã Bà Điểm,
                                        H.Hóc Môn, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 31: 133 Hiệp Bình, KP 7, P.Hiệp Bình Chánh, Q.Thủ Đức, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 32: 694 Âu Cơ, P.14, Q.Tân Bình, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 33: 1519-1521 Phạm Văn Thuận, P.Thống Nhất, Thành Phố Biên Hòa, Đồng Nai
                                        <span class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 34: 202-204 Nguyễn An Ninh, Khu phố Bình Minh 2, P.Dĩ An, Thị xã Dĩ An,
                                        Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 35: 402 Lê Đức Thọ, P.6, Q.Gò Vấp, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 36: 1261 Phạm Hùng, ấp 4A, Xã Bình Hưng, H.Bình Chánh, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 37: 177 Ba Cu, P.4, Thành Phố Vũng Tàu, Bà Rịa Vũng Tàu <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 38: 189-197 đường 30 Tháng 4, P.Xuân Khánh, Q.Ninh Kiều, Cần Thơ <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 39: 219 Yersin, P.Phú Cường, Thành Phố Thủ Dầu Một, Bình Dương <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 40: 311 Tây Thạnh, P.Tây Thạnh, Q.Tân Phú, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 41: 695 Phạm Văn Thuận, P.Tam Hiệp, Thành Phố Biên Hòa, Đồng Nai
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 42: 11A Cách Mạng Tháng Tám, Tổ 13, Khu phố Chợ, P.Lái Thiêu, Thị xã
                                        Thuận An, Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 43: 136/7 Phan Trung, Khu phố 7, P.Tân Tiến, Thành Phố Biên Hòa, Đồng Nai
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 44: 59/1A-59/1B Quang Trung, Khu phố 8, Thị trấn Hóc Môn, H.Hóc Môn,
                                        TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 45: 582 Nguyễn Ái Quốc, P.Hố Nai, Thành Phố Biên Hòa, Đồng Nai
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 46: 28-30 Lê Trọng Tấn, P.An Bình, Thị xã Dĩ An, Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 47: 167 Nguyễn Xí, P.26, Q.Bình Thạnh, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 48: 407 Nguyễn Trung Trực, P.Vĩnh Lạc, Thành Phố Rạch Giá, Kiên Giang
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 49: 194 Ấp Bắc, P.5, Thành Phố Mỹ Tho, Tiền Giang
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 50: 296-298 Lãnh Binh Thăng, P.11, Q.11, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 51: 393 Lê Duẩn, P.Tân Chính, Q.Thanh Khê, Đà Nẵng <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 52: 274 Xô Viết Nghệ Tĩnh, P.21, Q.Bình Thạnh, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 53: 96-98-100 Yjút, P.Thống Nhất, Thành Phố Buôn Ma Thuột, Đắk Lắk
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 54: 75C Đại lộ Đồng Khởi, P.Phú Khương, Thành Phố Bến Tre, Bến Tre
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 55: 76 Bà Triệu, P.Phú Hội, Thành Phố Huế, Thừa Thiên Huế
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 56: 38-40 Phạm Thái Bường, Khóm 1, P.3, Thành Phố Trà Vinh, Trà Vinh
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 57: 58 Lý Thánh Tôn, P.Phương Sài, Thành Phố Nha Trang, Khánh Hòa
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 58: 96 Nguyễn Huệ, P.2, Thành Phố Cao Lãnh, Đồng Tháp
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 59: 238 Trần Phú, P.7, Thành Phố Bạc Liêu, Bạc Liêu
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 60: 1395 Trần Hưng Đạo, P.Mỹ Long, Thành Phố Long Xuyên, An Giang
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 61: 1-3 Hai Bà Trưng, P.6, Thành Phố Đà Lạt, Lâm Đồng <span
                                            class="txt_color_2" style="font-weight: 700;">(Có CLINIC &amp;
                                                SPA)</span>
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 62: 401 Trần Hưng Đạo, P.Bình Hưng, Thành Phố Phan Thiết, Bình Thuận
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 63: 168 Trưng Nữ Vương, P.1, Thành Phố Vĩnh Long, Vĩnh Long
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 64: 12 Nguyễn Đình Chiểu, P.1, Thành Phố Tân An, Long An
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 65: 499-501 Cách Mạng Tháng Tám, P.3, Thành Phố Tây Ninh, Tây Ninh
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 66: 261 Lê Quang Định, P.7, Q.Bình Thạnh, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 67: 197-199 Trần Hưng Đạo, P.5, Thành Phố Cà Mau, Cà Mau
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 68: 7A/2B Tỉnh lộ 43, P.Bình Hòa, Thị xã Thuận An, Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 70: 30-30B Phan Đình Phùng, P.Tây Sơn, Thành Phố Pleiku, Gia Lai
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 71: 31-33 Phổ Quang, P.2, Q.Tân Bình, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 72: 113C-113D Lương Khánh Thiện, P.Cầu Đất, Q.Ngô Quyền, Hải Phòng
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 73: 723 Cách Mạng Tháng Tám, P.6, Q.Tân Bình, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 74: 513 Phú Riềng Đỏ, P.Tân Xuân, Thị Xã Đồng Xoài, Bình Phước
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 75: 217 Nguyễn Văn Cừ, P.Hưng Bình, Thành Phố Vinh, Nghệ An
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 76: 39 Nguyễn Văn Tăng, P.Long Thạnh Mỹ, Q.9, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 77: 232A Phan Bội Châu, P.Trần Hưng Đạo, Thành Phố Quy Nhơn, Bình Định
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 78: 137 Nguyễn Trãi, P.Tân Sơn, Thành Phố Thanh Hóa, Thanh Hóa
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 79: 112 Trần Não, P.An Khánh, Q.2, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 80: 25-25B Nguyễn Trãi, P.Tân An, Q.Ninh Kiều, Cần Thơ
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 81: 1134 Kha Vạn Cân, P.Linh Chiểu, Q.Thủ Đức, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 82: 219 Nguyễn Thị Thập, P.Tân Phú, Q.7, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 83: 594 Nguyễn Văn Cừ, P.Gia Thụy, Q.Long Biên, Hà Nội
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 84: 40 Bạch Mai, P.Cầu Dền, Q.Hai Bà Trưng, Hà Nội
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 85: 1207 Nguyễn Duy Trinh, P.Long Trường, Q.9, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 86: 4 Đường 30/4, P.Phú Hòa, Thành Phố Thủ Dầu Một, Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 87: 517 Phú Lợi, P.Phú Lợi, Thành Phố Thủ Dầu Một, Bình Dương
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 88: 246 Dương Bá Trạc, P.2, Q.8, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 89: 350 Tân Sơn Nhì, P.Tân Sơn Nhì, Q.Tân Phú, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 90: 588 Lũy Bán Bích, P.Hòa Thạnh, Q.Tân Phú, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 91: 182 Thạch Lam, P.Phú Thạnh, Q.Tân Phú, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 92: 182 Trần Hưng Đạo, P.An Nghiệp, Q.Ninh Kiều, Cần Thơ
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 93: 58 Hùng Vương, P.Thới Bình, Q.Ninh Kiều, Cần Thơ
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 94: 392 Nguyễn Văn Quá, P.Đông Hưng Thuận, Q.12, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 95: 68 Bùi Văn Hòa, P.Long Bình Tân, Thành Phố Biên Hòa, Đồng Nai
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 96: 63 - 65 Lê Hồng Phong, P.1, Thành phố Bảo Lộc, Lâm Đồng
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 97: 953 (số cũ 91/4) Hà Huy Giáp, P.Thạnh Xuân, Q.12, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 98: 146 Hùng Vương, P.Phú Nhuận, Thành Phố Huế, Thừa Thiên Huế
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 99: 726 Huỳnh Tấn Phát, P.Tân Phú, Q.7, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 100: 304 Thống Nhất, P.16, Q.Gò Vấp, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 101: 363-365A Tô Ngọc Vân, P.Linh Đông, Q.Thủ Đức, TP.HCM
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 102: 562-564 Thống Nhất, P.Đạo Long, Thành Phố Phan Rang, Ninh Thuận
                                    </div>
                                </div>
                                <div class="item_search_hethong width_common relative">
                                    <div class="title_item_thethong">
                                        CN 103: 34 ĐT746, P.Tân Phước Khánh, Thị xã Tân Uyên, Bình Dương
                                    </div>
                                </div>
                            </div>
                            <div class="ggmap">
                                <img
                                        src="https://news.khangz.com/wp-content/uploads/2023/04/Google-Maps-kh%C3%B4ng-chi-duong-1-thumb.jpg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="rows">
            <div class="row-left">
                <img
                        src="data:image/jpeg;base64,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"></a>
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
                                <h4>VỀ HASAKI.VN</h4>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Phiếu mua hàng</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Giới thiệu Hasaki.vn</a>
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
                                <a href="" class="txt-link">Hasaki Clinic & Spa</a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="txt-link">Hasaki cẩm nang</a>
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