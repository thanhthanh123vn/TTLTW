<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



                    <div id="information">
                        <p><span class="font-bold">Kem chống nắng giúp bảo vệ da khỏi tia UVB & UVA dài và giảm bóng nhờn ${products.name}</span>
                            là kem chống nắng dành cho da dầu phiên bản công thức cải tiến mới đến từ <a href="#">
                                thương hiệu dược mỹ phẩm ${product.brand}</a>
                            , giúp kiểm soát bóng nhờn và bảo vệ da trước tác hại từ ánh nắng & ô nhiễm, ngăn chặn các
                            tác nhân gây lão hóa sớm. Sản phẩm có công thức chống thấm nước thích hợp dùng hằng ngày và
                            cả những hoạt động ngoài trời.</p>
                        <img src="https://media.hcdn.vn/wysiwyg/MaiQuynh/sua-chong-nang-anessa-duong-da-kiem-dau-moi-2024-1.jpg"
                             alt="Ảnh Sản phẩm">
                    </div>
<div id="parameter">
    <h3>Thông số sản phẩm</h3>
    <table>
        <tr>
            <td>Barcode</td>
            <td>${product.barcode != null ? product.barcode : ''}</td>
        </tr>
        <tr>
            <td>Thương Hiệu</td>
            <td>${products.name != null ? products.name : ''}</td>
        </tr>
        <tr>
            <td>Xuất xứ thương hiệu</td>
            <td>${product.brandOrigin != null ? product.brandOrigin : ''}</td>
        </tr>
        <tr>
            <td>Nơi sản xuất</td>
            <td>${product.manufactureLocation != null ? product.manufactureLocation : ''}</td>
        </tr>
        <tr>
            <td>Loại da</td>
            <td>${product.skinSolution != null ? product.skinSolution : ''}</td>
        </tr>
    </table>
</div>

<div id="ingredient">
                        <h3>Thành phần sản phẩm</h3>
                        <ul>
                            <li>XL-PROTECT: màng lọc đã được cấp bằng sáng chế, cung cấp khả năng bảo vệ vượt trội khỏi
                                tia UVA/UVB với quang phổ rộng và giúp ngăn ngừa các tác hại do ô nhiễm và tia hồng
                                ngoại gây ra.
                            </li>
                            <li>Công nghệ AIRLICIUM™: Các hạt phân tử siêu nhỏ với tác dụng thấm hút bã nhờn. Ngay lập
                                tức thẩm thấu vào da và giúp kiểm soát tất cả các nguyên nhân khiến da nhờn bóng (bã
                                nhờn, mồ hôi và độ ẩm).
                            </li>

                        </ul>
                        <strong>Thành phần chính:</strong>
                        <ul>
                            <li>Aqua / Water, Homosalate, Silica, Octocrylene, Ethylhexyl Salicylate, Butyl
                                Methoxydibenzoylmethane, Ethylhexyl Triazone, Bis-Ethylhexyloxyphenol Methoxyphenyl
                                Triazine, Drometrizole Trisiloxane, Aluminum Starch Octenylsuccinate, Glycerin,
                                Pentylene Glycol, Styrene/Acrylates Copolymer, Potassium Cetyl Phosphate, Dimethicone,
                                Perlite, Propylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aluminum
                                Hydroxide, P-Anisic Acid, Caprylyl Glycol, Disodium Edta, Inulin Lauryl Carbamate,
                                Isopropyl Lauroyl Sarcosinate, Peg-8 Laurate, Phenoxyethanol, Scutellaria Baicalensis
                                Extract / Scutellaria Baicalensis Root Extract, Silica Silylate, Stearic Acid, Stearyl
                                Alcohol, Terephthalylidene Dicamphor Sulfonic Acid, Titanium Dioxide, Tocopherol,
                                Triethanolamine, Xanthan Gum, Zinc Gluconate.
                            </li>

                        </ul>
                        <strong>Thành phần đầy đủ:</strong>
                        <ul>
                            <li>Water, Butylene Glycol, Dimethyl Sulfone, Betaine, Caprylic/Capric Triglyceride, Natto
                                Gum, Sodium Hyaluronate, Disodium EDTA, Centella Asiatica Extract, Glycyrrhiza Glabra
                                (Licorice) Root Extract, Polyquaternium-51, Chlorphenesin, Tocopheryl Acetate, Carbomer,
                                Panthenol, Arginine, Luffa Cylindrica Fruit/Leaf/Stem Extract, Beta-Glucan, Althaea
                                Rosea Flower Extract, Aloe Barbadensis Leaf Extract, Hydroxyethylcellulose, Portulaca
                                Oleracea Extract, Lysine HCL, Proline, Sodium Ascorbyl Phosphate, Acetyl Methionine,
                                Theanine, Lavandula Angustifolia (Lavender) Oil, Eucalyptus Globulus Leaf Oil,
                                Pelargonium Graveolens Flower Oil, Citrus Limon (Lemon) Peel Oil, Citrus Aurantium
                                Dulcis (Orange) Peel Oil, Cananga Odorata Flower Oil, Copper Tripeptide-1.
                            </li>
                        </ul>

                    </div>
                    <div id="use">
                        <h3>Hướng dẫn sử dụng</h3>
                        <ul>
                            <li>Thoa kem trước khi tiếp xúc với ánh nắng 20 phút.
                            </li>
                            <li>Vỗ hoặc mát-xa nhẹ nhàng để toner thẩm thấu hết vào da.
                            </li>
                            <li>Lấy một lượng sản phẩm vừa đủ và chấm 5 điểm trên mặt (trán, mũi, cằm và hai bên má) sau
                                đó thoa sản phẩm theo chiều từ trong ra ngoài và trên xuống dưới.
                            </li>
                        </ul>
                    </div>
                    <div id="Evaluate">
                        <h3>Đánh giá</h3>
                        <p>Đánh giá trung bình: <strong>4.8</strong></p>
                        <p>
                            <span>★★★★★</span>
                        </p>
                        <p>294 nhận xét</p>
                        <p>
                            5 sao: <span class="rating-bar five-stars"></span> 228 Rất hài lòng
                        </p>
                        <p>
                            4 sao: <span class="rating-bar four-stars"></span> 55 Hài lòng
                        </p>
                        <p>
                            3 sao: <span class="rating-bar three-stars"></span> 7 Bình thường
                        </p>
                        <p>
                            2 sao: <span class="rating-bar two-stars"></span> 3 Không hài lòng
                        </p>
                        <p>
                            1 sao: <span class="rating-bar one-star"></span> 1 Rất tệ
                        </p>
                        <p>Chia sẻ nhận xét của bạn về sản phẩm này</p>
                        <a href="#" class="submit-review">Viết Bình luận</a>
                    </div>
                    <div id="Q&A" style="margin-left: 4%">
                        <h3>Hỏi đáp</h3>
                        <textarea class="form-control" id="rating_content" name="rating_content" placeholder="Nhập mô tả tại đây"></textarea>
                        <a href="#" onclick="sendComment()" class="submit-review" style="
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background-color: #f48024;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
margin-bottom: 15px;">Gửi</a>

                        <c:forEach var="comment" items="${comments}">
                            <c:if test="${not empty comment.content}">
                                <div class="question">
                                    <p><strong>${sessionScope.user.fullName}</strong></p>
                                    <p>${comment.content}</p>
                                    <p><span>Thích 0</span> - <a href="#">Trả lời</a></p>
                                </div>
                            </c:if>
                        </c:forEach>

<%--                        <div class="answer">--%>
<%--                            <p><strong>Hasaki - 02/12/2024</strong></p>--%>
<%--                            <p>Dạ giá sản phẩm tại các cửa hàng thuộc hệ thống Hasaki...</p>--%>
<%--                            <p><span>Thích 0</span></p>--%>
<%--                        </div>--%>

<%--                        <div class="question">--%>
<%--                            <p><strong>Khánh Lâm - 28/11/2024</strong></p>--%>
<%--                            <p>Da dầu chọn nắp nào ạ?</p>--%>
<%--                            <p><span>Thích 1</span> - <a href="#">Trả lời</a></p>--%>
<%--                        </div>--%>

<%--                        <div class="answer">--%>
<%--                            <p><strong>Hasaki - 28/11/2024</strong></p>--%>
<%--                            <p>Hasaki xin chào, để tiện hỗ trợ hơn...</p>--%>
<%--                            <p><span>Thích 1</span></p>--%>
<%--                        </div>--%>
                    </div>
