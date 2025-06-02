<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">


                    <div id="information">
                        <p><span class="font-bold">Nước hoa hồng ${products.name}</span> là dòng sản phẩm <a href="#">
                            toner</a> được <a href="#"> thương hiệu ${product.brand}</a> thiết kế chuyên biệt dành cho
                            làn
                            da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên
                            da, nước hoa hồng Klairs sẽ giúp cân bằng độ pH và cấp ẩm cho làn da hiệu quả, hỗ trợ cho
                            các bước skincare tiếp theo đạt hiệu quả tối ưu.</p>
                        <img src="https://media.hcdn.vn/wysiwyg/kimhuy/nuoc-hoa-hong-klairs-danh-cho-da-nhay-cam-180ml-3.gif"
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
                                <td>${product.brand != null ? product.brand : ''}</td>
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
                        <h4>1.Nước Hoa Hồng ${products.name} Klairs Dành Cho Da Nhạy Cảm 180ml</h4>
                        <strong>Thành phần chính:</strong>
                        <ul>
                            <li>Sodium Hyaluronate, β-glucan: Giúp da được cấp ẩm tức thì và giữ ẩm cho da.
                            </li>
                            <li>Chiết xuất rau má: Giúp làm dịu da, giảm mẫn đỏ, sưng viêm và hồi phục da.
                            </li>
                            <li>Lipidure: Dưỡng ẩm sâu và hình thành hàng rào bảo vệ da.
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
                                Dulcis (Orange) Peel Oil, Cananga Odorata Flower Oil, Copper Tripeptide-1
                            </li>
                        </ul>
                        <h4>2.Nước Hoa Hồng ${products.name} Không Mùi Cho Da Nhạy Cảm 180ml</h4>
                        <strong>Thành phần chính:</strong>
                        <ul>
                            <li>Sodium Hyaluronate, β-glucan: Giúp da được cấp ẩm tức thì và giữ ẩm cho da.
                            </li>
                            <li>Chiết xuất rau má: Giúp làm dịu da, giảm mẫn đỏ, sưng viêm và hồi phục da.
                            </li>
                            <li>Lipidure: Dưỡng ẩm sâu và hình thành hàng rào bảo vệ da.
                            </li>
                            <li>Đặc biệt sản phẩm hoàn toàn không mùi, không chứa hương liệu, phù hợp với những làn da
                                nhạy cảm về hương liệu.
                            </li>

                        </ul>
                        <strong>Thành phần đầy đủ:</strong>
                        <ul>
                            <li>Water, Butylene Glycol, Dimethyl Sulfone, Betaine, Caprylic/Capric Triglyceride, Natto
                                Gum, Sodium Hyaluronate, Disodium EDTA, Centella Asiatica Extract, Glycyrrhiza Glabra
                                (Licorice) Root Extract, Polyquaternium-51, Chlorphenesin, Tocopheryl Acetate, Carbomer,
                                Panthenol, Arginine, Luffa Cylindrica Fruit/Leaf/Stem Extract, Beta-Glucan, Althaea
                                Rosea Flower Extract, Aloe Barbadensis Leaf Extract, Hydroxyethylcellulose, Portulaca,
                                Oleracea Extract, Lysine HCL, Proline, Sodium Ascorbyl Phosphate, Acetyl Methionine,
                                Theanine, Copper Tripeptide-1.
                            </li>
                        </ul>
                    </div>
                    <div id="use">
                        <h3>Hướng dẫn sử dụng</h3>
                        <ul>
                            <li>Sau bước làm sạch da, cho một lượng toner vừa đủ ra tay hoặc bông tẩy trang và thoa đều lên da mặt theo chiều vòng tròn.
                            </li>
                            <li>Vỗ hoặc mát-xa nhẹ nhàng để toner thẩm thấu hết vào da.
                            </li>
                            <li>Tiếp tục với các bước chăm sóc tiếp theo như serum, kem dưỡng.
                            </li>
                            <li>Sử dụng mỗi ngày 2 lần vào buổi sáng và tối.
                            </li>
                        </ul>
                    </div>
                    <div id="Q&A" style="margin-left: 4%">
                        <h3>Hỏi đáp</h3>
                        <textarea class="form-control" id="rating_content" name="rating_content" placeholder="Nhập mô tả tại đây"></textarea>
                        <a href="#" onclick="sendComment()"  class="submit-review" style="
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
