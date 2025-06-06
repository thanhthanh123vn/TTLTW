<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 12/7/2024
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>


<div id="session-footer">
    <div class="container">
        <footer>

            <div id="chat-icon">
                <div class="chat-box-icon" id="chat-box-icon">
                    <img src="https://wsc.hasaki.vn/assets/customer_icons/appIcon.svg"
                         style="width: 60px;" alt="Chat Icon" onclick="toggleChat()">
                </div>
                <div class="chat-box" id="chatBox" style="display: none;">
                    <div class="chat-header">
                        <div class="chat-title">
                            <img src="https://wsc.hasaki.vn/assets/customer_icons/appIcon.svg" alt="Chat Icon" style="width: 30px;">
                            <span>TTT Chat Support</span>
                        </div>
                        <button class="close-chat" onclick="toggleChat()">×</button>
                    </div>
                    <div class="chat-content">
                        <div id="chatMessages">
                            <div class="message bot">
                                Xin chào! Tôi là trợ lý ảo của TTT. Tôi có thể giúp gì cho bạn?
                            </div>
                        </div>
                    </div>
                    <div class="chat-input">
                        <textarea id="messageBox" placeholder="Nhập tin nhắn của bạn..." rows="1"></textarea>
                        <button class="send-message" onclick="sendMessage()">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="footer-top">
                <div class="footer-info">
                    <div class="footer-header">
                        <div class="info-item">
                            <img src="https://media.hcdn.vn/hsk/icons/icon_footer_1.png"
                                 alt="Thanh toán khi nhận hàng">
                            <p>Thanh toán </br>khi nhận hàng</p>
                        </div>
                        <div class="info-item">
                            <img src="https://media.hcdn.vn/hsk/icons/icon_footer_2.png"
                                 alt="Giao nhanh miễn phí 2H">
                            <p>Giao nhanh</br> miễn phí 2H</p>
                        </div>
                        <div class="info-item">
                            <img src="https://media.hcdn.vn/hsk/icons/icon_footer_3_200x200.png"
                                 alt="30 ngày đổi trả miễn phí">
                            <p>30 ngày đổi trả</br> miễn phí</p>
                        </div>
                        <div class="info-item">
                            <img src="https://media.hcdn.vn/hsk/icons/icon_footer_4.png"
                                 alt="Thương hiệu uy tín">
                            <p>Thương hiệu uy tín </br>theo yêu cầu</p>
                        </div>
                        <div class="contact-item">
                            <div class="icon">
                                <img src="/image/icons_hotline_kn.png"
                                     alt="Khiếu nại, Góp ý">
                                <p style="width: 80%;"> Khiếu nại, Góp ý</p>
                            </div>
                            <button>1800 6310</button>
                        </div>
                        <div class="contact-item">
                            <div class="icon">
                                <img src="https://hasaki.vn/v3/images/icons/icons_hotline_tv.svg"
                                     alt="Khiếu nại, Góp ý">
                                <p> Tư Vấn</p>
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
                                        src="https://chiaki.vn/frontend/images/icon-social/facebook.png"
                                        alt="Facebook"></a>
                                <a><img src="https://chiaki.vn/frontend/images/icon-social/twitter.png"
                                        alt="Twitter."></a>
                                <a><img src="https://chiaki.vn/frontend/images/icon-social/youtube.png"
                                        alt="Youtube"></a>

                            </div>
                            <div class="payment-methods">
                                <h3>Thanh Toán</h3>

                                <img src="https://chiaki.vn/frontend/images/payment-method/visa.svg" alt="Visa">
                                <img src="https://chiaki.vn/frontend/images/payment-method/mastercard.svg" alt="ATM">
                            </div>

                        </div>
                        <div class="promo-section">
                            <h3>CẬP NHẬT THÔNG TIN KHUYẾN MÃI</h3>
                            <div class="promo-input">
                                <input type="email" placeholder="email của bạn" id="input-email">
                                <button onclick="signUp()">Đăng ký</button>
                            </div>
                            <div class="promo-download">
                                <img src="${pageContext.request.contextPath}/images/qrcode.png" alt="QR code">
                                <div class="app-links">
                                    <img src="https://chiaki.vn/frontend/images/logo-appstore.png"
                                         alt="App Store">
                                    <img src="https://chiaki.vn/frontend/images/logo-googleplay.png"
                                         alt="Google Play">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="session-info">
                    <div class="about-section">
                        <h2>TTT.VN - CHẤT LƯỢNG THẬT - GIÁ TRỊ THẬT</h2>
                        <p>TTT.vn là hệ thống cửa hàng mỹ phẩm chính hãng và dịch vụ chăm sóc sắc đẹp
                            chuyên sâu
                            với hệ thống cửa hàng trải dài trên toàn quốc; và hiện đang là đối tác phân
                            phối
                            chiến
                            lược tại thị trường Việt Nam của hàng loạt thương hiệu lớn như: <span
                                    class="highlight">La Roche-Posay, Eucerin, L'oreal, Bioderma, Klairs, Naris
                                    Cosmetics, Maybelline, Vichy, Skin1004, Cocoon, Australis, Cetaphil, Anessa, SVR,
                                    Paula's Choice, Some By Mi, B.O.M, Vaseline, Sunplay, Hada Labo, Selsun, Blossom,
                                    Acnes, Rohto, Silky Girl, Lancôme, Narciso Rodriguez, Senka, Naruko, Angel's Liquid,
                                    DHC, Simple, Bio-essence, Tsubaki, 3CE, BNBG, Laneige, Vacosi, Lemonade, Hatomugi,
                                    Avène, Silcot, Neutrogena, Garnier, Mediheal, Timeless, Curél,...</span></p>

                        <p>Với phương châm "<span
                                class="highlight">Chất lượng thật - Giá trị thật</span>",
                            TTT.vn luôn nỗ lực không ngừng nhằm nâng cao chất lượng sản phẩm & dịch vụ
                            để khách
                            hàng có được những trải nghiệm mua sắm tốt nhất...</p>

                        <p>TTT.vn sở hữu đa dạng các mặt hàng từ cao cấp đến bình dân, đáp ứng mọi nhu
                            cầu của
                            khách hàng. Đặc biệt, tại Hasaki.vn luôn có đầy đủ mẫu thử của mỗi sản phẩm
                            và nhân
                            viên
                            tư vấn, giúp khách hàng dễ dàng chọn lựa và tăng trải nghiệm mua sắm.</p>

                        <p>Đối với khách hàng online, Hasaki.vn áp dụng GIAO NHANH 2H MIỄN PHÍ cho <span
                                class="highlight">đơn hàng từ 90.000đ</span> tại các khu vực: Hồ Chí
                            Minh - Hà
                            Nội -
                            Hải Phòng - Pleiku - Cà Mau - Tây Ninh - Long An - Vĩnh Long...</p>

                        <p>Ngoài ra, Hasaki.vn còn có app Hasaki cung cấp cho khách hàng trải nghiệm mua
                            sắm
                            online
                            nhanh chóng, tiện lợi cùng nhiều khuyến mãi hấp dẫn. Không chỉ vậy, khách
                            hàng còn
                            được
                            giảm ngay 5% khi nhập mã HASAKIAPP cho đơn hàng đầu tiên trên ứng dụng. Tải
                            ngay APP
                            Hasaki cho hệ điều hành IOS <a href="#">tại đây</a>, phiên bản cho hệ điều
                            hành
                            Android
                            <a href="#">tại đây</a>.</p>
                    </div>

                    <div class="info-section">
                        <div class="certification">
                            <h3>Được chứng nhận</h3>
                            <img src="https://hasaki.vn/images/graphics/bocongthuong_small.png"
                                 alt="Đã thông báo Bộ Công Thương">
                            <p>Bản quyền © 2016 Hasaki.vn<br>Công Ty cổ phần HASAKI BEAUTY & CLINIC<br>Giấy
                                chứng
                                nhận Đăng ký Kinh doanh số 0313612829 do Sở Kế hoạch và Đầu tư Thành phố
                                Hồ Chí
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
                        <p>Trang Điểm Cao Cấp | Chăm Sóc Da Mặt Cao Cấp | Chăm Sóc Tóc Cao Cấp | Gội
                            đầu</p>
                    </div>

                    <div class="category-column">
                        <h3>Nước Hoa</h3>
                        <p>Nước Hoa Nữ | Nước Hoa Nam | Xịt Thơm Toàn Thân</p>
                    </div>

                    <div class="category-column">
                        <h3>Chăm Sóc Răng Miệng</h3>
                        <p>Bàn Chải Đánh Răng | Kem Đánh Răng | Nước Súc Miệng | Tăm Nước | Chỉ Nha Khoa
                            | Xịt
                            Thơm
                            Miệng</p>
                    </div>

                    <div class="category-column">
                        <h3>Thực Phẩm Chức Năng</h3>
                        <p>Hỗ Trợ Tiêu Hoá | Hỗ Trợ Tim Mạch | Hỗ Trợ Sức Khỏe | Bổ Gan | Giải Rượu |
                            Dầu Cá |
                            Bổ
                            Mắt | Hoạt Huyết | Dưỡng Não</p>
                    </div>

                    <div class="category-column">
                        <h3>Chăm Sóc Cá Nhân</h3>
                        <p>Băng Vệ Sinh | Khăn Giấy | Khăn Ướt | Khử Mùi | Làm Thơm Phòng | Dao Cạo Râu
                            | Bọt
                            Cạo
                            Râu | Miếng Dán Nóng | Máy Xông Hơi...</p>
                    </div>

                    <div class="category-column">
                        <h3>Chăm Sóc Da Mặt</h3>
                        <p>Tẩy Trang Mặt | Sữa Rửa Mặt | Tẩy Tế Bào Chết Da Mặt | Toner | Nước Cân Bằng
                            Da |
                            Serum |
                            Tinh Chất...</p>
                    </div>

                    <div class="category-column">
                        <h3>Trang Điểm</h3>
                        <p>Kem Lót | Kem Nền | Phấn Nền | Phấn Nước Cushion | Che Khuyết Điểm | Má Hồng
                            | Phấn
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
                        <p>Băng Dán Cá Nhân | Chống Muỗi | Khẩu Trang | Mặt Nạ Xông Hơi | Miếng Dán
                            Nóng</p>
                    </div>

                    <div class="category-column">
                        <h3>Vấn Đề Về Da</h3>
                        <p>Da Dầu | Lỗ Chân Lông To | Da Khô | Mất Nước | Da Mụn | Da Nhạy Cảm | Kích
                            Ứng |
                            Thâm...</p>
                    </div>

                    <div class="category-column">
                        <h3>Chăm Sóc Tóc Và Da Đầu</h3>
                        <p>Dầu Gội | Dầu Xả | Dầu Gội Khô | Dầu Gội Xả 2in1 | Bộ Gội Xả | Tẩy Tế Bào
                            Chết Da
                            Đầu...</p>
                    </div>

                    <div class="category-column">
                        <h3>Hỗ Trợ Làm Đẹp</h3>
                        <p>Đặc Trị Làm Đẹp Da | Làm Đẹp Tóc | Hỗ Trợ Giảm Cân | Vitamin và Khoáng
                            Chất</p>
                    </div>
                </div>
            </div>

            <style>
                #chat-icon {
                    position: fixed;
                    bottom: 20px;
                    right: 20px;
                    z-index: 1000;
                }

                .chat-box-icon {
                    cursor: pointer;
                    transition: transform 0.3s ease;
                }

                .chat-box-icon:hover {
                    transform: scale(1.1);
                }

                .chat-box {
                    position: fixed;
                    bottom: 100px;
                    right: 20px;
                    width: 350px;
                    height: 500px;
                    background: white;
                    border-radius: 10px;
                    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                    display: flex;
                    flex-direction: column;
                    overflow: hidden;
                }

                .chat-header {
                    background: #ff6b00;
                    color: white;
                    padding: 15px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .chat-title {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    font-weight: bold;
                }

                .close-chat {
                    background: none;
                    border: none;
                    color: white;
                    font-size: 24px;
                    cursor: pointer;
                    padding: 0;
                    line-height: 1;
                }

                .chat-content {
                    flex: 1;
                    padding: 15px;
                    overflow-y: auto;
                    background: #f5f5f5;
                }

                .message {
                    margin-bottom: 15px;
                    max-width: 80%;
                    padding: 10px 15px;
                    border-radius: 15px;
                    position: relative;
                    word-wrap: break-word;
                }

                .message.user {
                    background: #ff6b00;
                    color: white;
                    margin-left: auto;
                    border-bottom-right-radius: 5px;
                }

                .message.bot {
                    background: white;
                    color: #333;
                    margin-right: auto;
                    border-bottom-left-radius: 5px;
                    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                }

                .chat-input {
                    padding: 15px;
                    background: white;
                    border-top: 1px solid #eee;
                    display: flex;
                    gap: 10px;
                }

                .chat-input textarea {
                    flex: 1;
                    border: 1px solid #ddd;
                    border-radius: 20px;
                    padding: 10px 15px;
                    resize: none;
                    outline: none;
                    font-family: inherit;
                }

                .chat-input textarea:focus {
                    border-color: #ff6b00;
                }

                .send-message {
                    background: #ff6b00;
                    color: white;
                    border: none;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    transition: background 0.3s;
                }

                .send-message:hover {
                    background: #e65c00;
                }

                /* Custom scrollbar */
                .chat-content::-webkit-scrollbar {
                    width: 6px;
                }

                .chat-content::-webkit-scrollbar-track {
                    background: #f1f1f1;
                }

                .chat-content::-webkit-scrollbar-thumb {
                    background: #888;
                    border-radius: 3px;
                }

                .chat-content::-webkit-scrollbar-thumb:hover {
                    background: #555;
                }
            </style>

            <script>
                function toggleChat() {
                    const chatBox = document.getElementById('chatBox');
                    chatBox.style.display = chatBox.style.display === 'none' ? 'block' : 'none';
                }

                // Tự động điều chỉnh chiều cao của textarea
                document.getElementById('messageBox').addEventListener('input', function() {
                    this.style.height = 'auto';
                    this.style.height = (this.scrollHeight) + 'px';
                });

                // Gửi tin nhắn khi nhấn Enter
                document.getElementById('messageBox').addEventListener('keypress', function(e) {
                    if (e.key === 'Enter' && !e.shiftKey) {
                        e.preventDefault();
                        sendMessage();
                    }
                });

                async function sendMessage() {
                    const inputText = document.getElementById('messageBox').value.trim();
                    if (!inputText) return;

                    addMessage(inputText, 'user');
                    document.getElementById('messageBox').value = '';
                    document.getElementById('messageBox').style.height = 'auto';

                    const apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDqkvQg4pbbQ8hhWEg28jYyo00e8H80PVY';
                    const payload = {
                        contents: [{ role: 'user', parts: [{ text: inputText }] }],
                        generationConfig: {
                            temperature: 1,
                            topK: 40,
                            topP: 0.95,
                            maxOutputTokens: 1024
                        }
                    };

                    try {
                        const response = await fetch(apiUrl, {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify(payload)
                        });

                        const data = await response.json();
                        const botReply = data.candidates?.[0]?.content?.parts?.[0]?.text || "⚠️ Không nhận được phản hồi từ Gemini.";
                        addMessage(botReply, 'bot');

                    } catch (error) {
                        console.error("Lỗi gửi yêu cầu:", error);
                        addMessage("❌ Đã xảy ra lỗi khi kết nối API.", 'bot');
                    }
                }

                function addMessage(text, sender) {
                    const messageEl = document.createElement('div');
                    messageEl.className = `message ${sender}`;
                    messageEl.innerText = text;

                    const chatMessages = document.getElementById('chatMessages');
                    chatMessages.appendChild(messageEl);
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                }
            </script>

        </footer>
    </div>
</div>
