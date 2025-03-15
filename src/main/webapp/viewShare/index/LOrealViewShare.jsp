<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/13/2025
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




      <div id="information">
            <p><span class="font-bold">${products.name}</span> là dòng sản phẩm <a href="#">tẩy
              trang</a> dạng nước đến từ <a href="#">thương hiệu ${product.brand}</a>, được ứng dụng công
              nghệ
              Micellar
              dịu nhẹ giúp làm
              sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da
              thông
              thoáng,
              mềm
              mượt mà không hề khô căng.</p>
            <img src="https://media.hasaki.vn/wysiwyg/nhphuong/PhuongSmall/nuoc-tay-trang-l-oreal-3-in-1.jpg"
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

            <h4>2. ${products.name} Micellar Water 3-in-1 Refreshing Even For Sensitive Skin (Xanh dương nhạt)</h4>
            <strong>Thành phần chính:</strong>
            <ul>
              <li>Nước khoáng lấy từ những ngọn núi ở Pháp: làm dịu và giúp làn da trông tươi tắn lên sau khi tẩy trang.</li>
            </ul>
            <strong>Thành phần đầy đủ:</strong>
            <ul>
              <li>Aqua / Water, Hexylene Glycol, Glycerin, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, BHT, Polyaminopropyl Biguanide</li>
            </ul>

            <h4>3. ${products.name} Micellar Water 3-in-1 Moisturizing Even For Sensitive Skin (Hồng)</h4>
            <strong>Thành phần chính:</strong>
            <ul>
              <li>Chiết xuất hoa hồng Pháp: cân bằng độ ẩm & làm mềm mịn da, làn da vẫn đủ độ ẩm sau khi tẩy trang.</li>
            </ul>
            <strong>Thành phần đầy đủ:</strong>
            <ul>
              <li>Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT, Polyaminopropyl Biguanide</li>
            </ul>

            <h4>4. ${products.name} Revitalift Crystal Purifying Micellar Water (Trắng)</h4>
            <strong>Thành phần chính:</strong>
            <ul>
              <li>Công nghệ micelles: hoạt động như một nam châm làm sạch, loại bỏ 5 loại tạp chất có trên da bạn hằng ngày, giúp lỗ chân lông thoáng sạch.</li>
              <li>Glycerin: giúp cấp nước và giữ độ ẩm cho da, phục hồi và duy trì vẻ ngoài khỏe khoắn.</li>
            </ul>
            <strong>Thành phần đầy đủ:</strong>
            <ul>
              <li>Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT, Polyaminopropyl Biguanide</li>
            </ul>

            <h4>5. ${products.name} Revitalift Hyaluronic Acid Hydrating Micellar Water (Tím)</h4>
            <strong>Thành phần chính:</strong>
            <ul>
              <li>Hyaluronic Acid: giúp làm dịu và cấp ẩm da căng mọng từ bên trong, nuôi dưỡng da khỏe mạnh và sáng bóng.</li>
            </ul>
            <strong>Thành phần đầy đủ:</strong>
            <ul>
              <li>Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT, Polyaminopropyl Biguanide</li>
            </ul>
          </div>
          <div id="use">
            <h3>Hướng dẫn sử dụng</h3>
            <ul>
              <li>Lắc đều sản phẩm Nước Tẩy Trang ${products.name} trước khi sử dụng.</li>
              <li>Đổ nước tẩy trang thấm ướt vừa đủ lên miếng bông tẩy trang.</li>
              <li>Nhẹ nhàng lau lên mặt, mắt và môi theo chuyển động tròn.
                <br> (Riêng đối với vùng mắt, bạn hãy giữ miếng bông tẩy trang trên mắt vài giây để nước tẩy trang thấm sâu và cuốn đi lớp make-up dễ dàng hơn).
              </li>
              <li>Sử dụng để tẩy trang nhanh (không cần rửa lại với nước) khi bận rộn hoặc ở những nơi thiếu nước: khi đi du lịch, đi spa, đi gym, v.v...</li>
              <li>Khuyến khích sử dụng quy trình chăm sóc da hoàn chỉnh để có hiệu quả dưỡng da tốt nhất (Nước tẩy trang - Sữa rửa mặt - Nước hoa hồng - Kem dưỡng).</li>
            </ul>
          </div>
          <div id="Evaluate">
            <h3>Đánh giá</h3>
            <p>Đánh giá trung bình: <strong>4.7</strong></p>
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
            <a  class="submit-review" onclick="sendComment()"  style="
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

          <%--            <div class="answer">--%>
<%--              <p><strong>Hasaki - 02/12/2024</strong></p>--%>
<%--              <p>Dạ giá sản phẩm tại các cửa hàng thuộc hệ thống Hasaki...</p>--%>
<%--              <p><span>Thích 0</span></p>--%>
<%--            </div>--%>

<%--            <div class="question">--%>
<%--              <p><strong>Khánh Lâm - 28/11/2024</strong></p>--%>
<%--              <p>Da dầu chọn nắp nào ạ?</p>--%>
<%--              <p><span>Thích 1</span> - <a href="#">Trả lời</a></p>--%>
<%--            </div>--%>

<%--            <div class="answer">--%>
<%--              <p><strong>Hasaki - 28/11/2024</strong></p>--%>
<%--              <p>Hasaki xin chào, để tiện hỗ trợ hơn...</p>--%>
<%--              <p><span>Thích 1</span></p>--%>
<%--            </div>--%>
          </div>

    </div>
